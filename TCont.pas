unit TCont;

interface

Uses classes, Sysutils, types, Dialogs;

type
  TOneBoxItem = record
    OrdName : string;
    PosCode : string;
    NetEI   : boolean;
    Count   : real;
    //Net     : real;
    //Vol     : real;
    RowInd  : integer;
  end;

  TBoxItems = array of TOneBoxItem;

  TBox = class (TObject)
    private
      FItemCount : integer;
      FItems     : TBoxItems;
      FBoxCount  : integer;
      FGroup     : boolean;
      FBnet      : real;
      FBoxCode   : string;
      FSel       : boolean;
      function CalcNet: real;
      function CalcVol: real;
    public
      Constructor Create;
      Destructor Destroy; override;
      property ItemCount : integer read FItemCount write FItemCount;
      property BoxCount  : integer read FBoxCount write FBoxCount;
      property Group     : boolean read FGroup write FGroup;
      property Sel       : boolean read FSel write FSel;
      property Items   : TBoxItems   read FItems;
      property Net   : real    read CalcNet;
      property Vol   : real    read CalcVol;
      property BNet  : real    read FBNet write FBnet;
      property BoxCode : string read FBoxCode write FBoxCode;
      procedure AddInBox(NewItem: TOneBoxItem);
      procedure DelItem (Ind : integer);
  end;

  TBoxList = array of TBox;

  TContr = class (TObject)
    private
      FBoxCount : integer;
      FBox      : TBoxList;
      FName     : string;
      FMaxVol   : real;
      FMaxNet   : real;
      function GetNet: real;
      function GetNNet: real;
      function GetVol: real;
      function GetTotalBoxCount: integer;
    public
      Constructor Create;
      Destructor Destroy; override;
      property BoxCount : integer read FBoxCount write FBoxCount;
      property Box   : TBoxList   read FBox;
      function NewGroup (BC : integer; Item: TOneBoxItem; Group:boolean; LBI : integer; newCode:string=''): integer;
      function AddBox(Box : TBox):integer;
      property Net:real read GetNet;
      property NNet:real read GetNNet;
      property Vol:real read GetVol;
      property TotBoxCnt: integer read GetTotalBoxCount;
      property Name:string read FName write FName;
      property MaxNet:real read FMaxNet write FMaxNet;
      property MaxVol:real read FMaxVol write FMaxVol;
      procedure DeleteBox(ind:integer);
      function FindByRowInd(ind:integer):Tpoint;
      function SearchBoxGroup(groupCode: string): TBox;
  end;

  TContrs = array of TContr;

  TContLst = class (TObject)
    private
      FCount : integer;
      FCont  : TContrs;
      FLBI   : word;
    public
      Constructor Create;
      Destructor Destroy; override;
      property   Count : integer read FCount write FCount;
      property   LastBoxInd : word read FLBI write FLBI;
      property   Cont   : TContrs   read FCont write FCont;
      function   NewCont(name:string; net,vol : real):integer;
      function   ByName (name:string):TContr;
      function   PosCount(ordname,code : string):real;
      function   FindPos (ordname,code : string):TOneBoxItem;
      procedure  DeletePos(ordname,code : string);
      procedure  DelCont(name : string);
      procedure  DelMod (name : string);
      function   GetNextBoxCode : integer;
      procedure  AddCont(Cnt:TContr);
      function   ByInd(ind :integer):TContr;
  end;

var
  ContLst: TContLst;

implementation

uses TDataLst;

//-----------------------------------------------------------------------------

constructor TBox.Create;
begin
  inherited;
  FItemCount:=0;
  SetLength(FItems,FItemCount);
  FBNet:=0;
end;

destructor TBox.Destroy;
begin
  //
  inherited;
end;

procedure TBox.AddInBox(NewItem: TOneBoxItem);
begin
  inc(FItemCount);
  SetLength(FItems,FItemCount);
  FItems[FItemCount-1]:=NewItem;
end;

function TBox.CalcNet : real;
var
  i : integer;
  res : real;
begin  
  res:=0;
  for I := 0 to FItemCount - 1 do 
    if Fitems[i].NetEI then
      begin
        res:=res+FItems[i].Count/1000;
      end
      else res:=res+ModLst.GetNetByCode(FItems[i].OrdName,FItems[i].PosCode)*FItems[i].Count;
  result:=res;
end;

function TBox.CalcVol : real;
var
  i : integer;
  res : real;
begin
  res:=0;
  for I := 0 to FItemCount - 1 do res:=res+ModLst.GetVolByCode(FItems[i].OrdName,FItems[i].PosCode)*FItems[i].Count;
  result:=res;
end;

procedure TBox.DelItem (Ind : integer);
var
  i : integer;
begin
  dec(self.FItemCount);
  for i := ind to self.ItemCount-1 do 
    self.Items[i]:=self.Items[i+1];
end;

//-----------------------------------------------------------------------------

constructor TContr.Create;
begin
  inherited;
  FBoxCount:=0;
  SetLength(FBox,FBoxCount);
end;

destructor TContr.Destroy;
begin
  //
  inherited;
end;

function TContr.GetTotalBoxCount: integer;
var
  i,res : integer;
begin
  res:=0;
  for I := 0 to self.BoxCount - 1 do
    res:=res+self.Box[i].BoxCount;
  result:=res;
end;

function TContr.NewGroup(BC : integer; Item: TOneBoxItem; Group:boolean; LBI : integer; newCode:string=''):integer;
begin
  inc(FBoxCount);
  SetLength(FBox,FBoxCount);
  FBox[FBoxCount-1]:=TBox.Create;
  FBox[FBoxCount-1].FBoxCount:=BC;
  FBox[FBoxCount-1].AddInBox(Item);
  FBox[FBoxCount-1].FGroup:=Group;
  FBox[FBoxCount-1].Sel:=false;
  if Length(newCode)>0 then FBox[FBoxCount-1].BoxCode:=newCode
    else FBox[FBoxCount-1].BoxCode:=FormatFloat('00000',LBI);
  result:=FBoxCount-1;
end;

function TContr.AddBox(Box: TBox): integer;
var
  i : integer;
begin
  inc(FBoxCount);
  SetLength(FBox,FBoxCount);
  FBox[FBoxCount-1]:=TBox.Create;
  FBox[FBoxCount-1].FBoxCount:=box.BoxCount;
  FBox[FBoxCount-1].FGroup:=box.Group;
  FBox[FBoxCount-1].FBNet:=box.BNet;
  FBox[FBoxCount-1].FBoxCode:=box.BoxCode;
  FBox[FBoxCount-1].FSel:=false;
  for I := 0 to box.ItemCount - 1 do FBox[FBoxCount-1].AddInBox(box.items[i]);
  result:=FBoxCount-1;
end;

function TContr.GetNNet:real;
var
  i : integer;
  res:real;
begin
  res:=0;
  for I := 0 to self.FBoxCount - 1 do
    res:=res+self.FBox[i].Net;
  result:=res;
end;

function TContr.GetNet:real;
var
  i : integer;
  res:real;
begin
  res:=0;
  for I := 0 to self.FBoxCount - 1 do
    res:=res+self.FBox[i].BNet;
  result:=res;
end;

function TContr.GetVol:real;
var
  i : integer;
  res:real;
begin
  res:=0;
  for I := 0 to self.FBoxCount - 1 do
    res:=res+self.FBox[i].Vol;
  result:=res;
end;

procedure TContr.DeleteBox(ind:integer);
var
  i : integer;
begin
  dec(self.FBoxCount);
  for I := Ind to self.BoxCount-1 do
      self.Box[i]:=self.box[i+1];
  //self.Box[i].Destroy;    
end;

function Tcontr.FindByRowInd(ind:integer):TPoint;
var
  i,j : integer;
  res : TPoint;
begin
  res.X:=-1;
  res.Y:=-1;
  for I := 0 to self.FBoxCount - 1 do
    for j := 0 to self.FBox[i].FItemCount - 1 do
      if self.FBox[i].Items[j].RowInd=ind then
        begin
          res.X:=i;
          res.Y:=j;
        end;
  result:=res;        
end;

function TContr.SearchBoxGroup(groupCode: string): TBox;
var
  find : boolean;
  box : integer;
  res : TBox;
begin
 find := false;
 res := nil;
 box := 0;
 while (not find)and(box < self.FBoxCount) do begin
    if self.FBox[box].FBoxCode=groupCode then begin
      find := true;
      res := self.FBox[box];
    end else inc(box);
 end;
 result:=res;
end;


//-----------------------------------------------------------------------------

constructor TContLst.Create;
begin
  inherited;
  FCount:=0;
  SetLength(FCont,FCount);
  FLBI:=0;
end;

destructor TContLst.Destroy;
begin
  //
  inherited;
end;

function TContLst.NewCont(name:string; net,vol : real):integer;
begin
  inc(FCount);
  SetLength(FCont,FCount);
  FCont[FCount-1]:=TContr.Create;
  FCont[FCount-1].FName:=name;
  FCont[FCount-1].FMaxVol:=vol;
  FCont[FCount-1].FMaxNet:=net;
  result:=FCount-1;
end;

function TContLst.ByName (name:string):TContr;
var
  i:integer;
begin
  result:=nil;
  if name='' then Abort;
  I := 0;
  while ((i<FCount)and(self.FCont[i].FName<>name)) do inc(i);
  if (i<FCount) then result:=self.FCont[i];
end;

function TContLst.PosCount(ordname,code : string):real;
var
  i,j,k : integer;
  res : real;
begin
  res:=0;
  for I := 0 to self.FCount - 1 do
    for j := 0 to self.FCont[i].FBoxCount-1 do
      for k := 0 to self.FCont[i].FBox[j].FItemCount-1 do
         if (self.FCont[i].FBox[j].FItems[k].OrdName=OrdName)and
          (self.FCont[i].FBox[j].FItems[k].PosCode=code) then
          res:=res+self.FCont[i].FBox[j].FItems[k].Count;
  result:=res;
end;

function TContLst.FindPos (ordname,code : string):TOneBoxItem;
var
  i,j,k : integer;
begin
  result.RowInd:=-1;
  for I := 0 to self.FCount - 1 do
    for j := 0 to self.FCont[i].FBoxCount-1 do
      for k := 0 to self.FCont[i].FBox[j].FItemCount-1 do
         if (self.FCont[i].FBox[j].FItems[k].OrdName=OrdName)and
          (self.FCont[i].FBox[j].FItems[k].PosCode=code) then
            result:=self.FCont[i].FBox[j].FItems[k];
end;

procedure TContLst.DeletePos(ordname: string; code: string);
var
  i,j,k : integer;
  CI,BI,II : integer;
begin
  for I := 0 to self.FCount - 1 do
    for j := 0 to self.FCont[i].FBoxCount-1 do
      for k := 0 to self.FCont[i].FBox[j].FItemCount-1 do
         if (self.FCont[i].FBox[j].FItems[k].OrdName=OrdName)and
          (self.FCont[i].FBox[j].FItems[k].PosCode=code) then
            begin
              CI:=i;
              BI:=j;
              II:=k;
            end;
  self.FCont[CI].FBox[BI].DelItem(II);
  if self.FCont[CI].FBox[BI].FItemCount=0 then self.FCont[CI].DeleteBox(BI);
end;

procedure TContLst.DelCont(name: string);
var
  i,ind : integer;
begin
  i:=0;
  while (i<self.FCount)and(self.Cont[i].FName<>name) do inc(i);
  if i>=self.FCount then Abort;
  ind:=i;
  while self.Cont[ind].BoxCount> 0 do self.Cont[ind].DeleteBox(0);
  self.Cont[ind].BoxCount:=0;
  dec(self.FCount);
  for i:=ind to self.Count-1 do
      self.Cont[i]:=self.Cont[i+1];
end;

procedure TContLst.DelMod(name: string);
var
  i,j,k : integer;
begin
  for I := 0 to self.Count - 1 do
    begin
      j:=0;
      while j<self.Cont[i].BoxCount do
        begin
          k:=0;
          while k<self.Cont[i].Box[j].ItemCount do
              if self.Cont[i].Box[j].Items[k].OrdName=name then
                self.Cont[i].Box[j].DelItem(k) else inc(k);
          if self.Cont[i].Box[j].ItemCount=0 then self.Cont[i].DeleteBox(j) else inc(j);
        end;
    end;
end;

function TContLst.GetNextBoxCode :integer;
begin
  result:=0;
  inc(self.FLBI);
  result:=self.FLBI;
end;

procedure TContLst.AddCont(Cnt: TContr);
begin
  inc(FCount);
  SetLength(FCont,FCount);
  FCont[FCount-1]:=TContr.Create;
  FCont[FCount-1]:=Cnt;
end;

function TContLst.ByInd(ind:integer):TContr;
begin
  if (ind>=0) and (ind<self.FCount) then result:= self.FCont[ind]
    else result:=nil;  
end;

end.
