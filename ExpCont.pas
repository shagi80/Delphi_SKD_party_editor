unit ExpCont;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CheckLst, ExtCtrls, Buttons, DB, DBClient, Grids, DBGrids,
  jpeg, TntStdCtrls;

const
  umAll      =0;
  umContLst  =1;
  umFieldLst =2;
  umSortLst  =3;
  tmInvoice  =0;
  tmPacing   =1;
  tmTrain    =3;

type

  TExpField = record
    ind   : integer;
    rname : string;
    ename : string;
    write : boolean;
  end;

  TExpContForm = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    BBtn: TButton;
    Fbtn: TButton;
    BitBtn1: TBitBtn;
    NB: TNotebook;
    ContLB: TLabel;
    ContCBL: TCheckListBox;
    FieldLB: TLabel;
    FieldCBL: TCheckListBox;
    Panel2: TPanel;
    SortFieldLB: TLabel;
    MovUpBtn: TSpeedButton;
    MovDownBtn: TSpeedButton;
    SortFieldCBL: TListBox;
    SaveDlg: TSaveDialog;
    Label2: TLabel;
    ModeRG: TRadioGroup;
    MsgPanel: TPanel;
    Label1: TLabel;
    PrPanel: TPanel;
    Label3: TLabel;
    PrRg: TRadioGroup;
    BitBtn2: TBitBtn;
    GroupBox1: TGroupBox;
    OrderCB: TCheckListBox;
    CalcRMB: TCheckBox;
    procedure BitBtn2Click(Sender: TObject);
    procedure SaveBtnClick(Sender: TObject);
    procedure MovUpBtnClick(Sender: TObject);
    procedure MovDownBtnClick(Sender: TObject);
    procedure FieldCBLClickCheck(Sender: TObject);
    procedure BBtnClick(Sender: TObject);
    procedure FbtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MyUpdate(new:integer);
    procedure Table (mode:integer);
    function  GetFieldByName(name:string):TExpField;
    function  ContWrite(contind:integer):boolean;
    function  GetIndByName(name:string):integer;
    procedure SetFieldLst(mode:integer);
    function  ExpTo1C: boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ExpContForm: TExpContForm;

function MyRound(fl : Real):Real;

implementation

{$R *.dfm}

uses TDataLst, TCont, LangUnit, PrUnit, math, RateUnit, DecimalRounding_JH1;

var
  ExpField    : array [1..30] of TExpField;
  MaxExpField : byte;
  USDtoRUB    : real=0; //���� RMB � �������
  RUBtoRMB    : real=0; //���� ����� � RMB

function MyRound(fl : Real):Real;
begin
  //���������� � ������
  SetRoundMode(rmUp);
  result:=Trunc(fl * 1000 + 0.5) / 1000;
end;

procedure TExpContForm.SetFieldLst(mode: integer);
var
  i : integer;
begin
  if (mode=tmPacing) or (mode=tmTrain) then
    begin
      MaxExpField:=20;
      ExpField[1].rname :='����� �������';
      ExpField[1].ind   :=9;
      ExpField[2].rname:='BOM �����';
      ExpField[2].ind   :=13;
      ExpField[3].rname :='��� ������';
      ExpField[3].ind   :=1;
      ExpField[4].rname :='��� ������';
      ExpField[4].ind   :=2;
      ExpField[5].rname:='��� ������';
      ExpField[5].ind   :=11;
      ExpField[6].rname :='�� ���������';
      ExpField[6].ind   :=3;
      ExpField[7].rname :='���-��';
      ExpField[7].ind   :=4;
      ExpField[8].rname :='���-�� ����';
      ExpField[8].ind   :=5;
      ExpField[9].rname :='�����,��';
      ExpField[9].ind   :=6;
      ExpField[10].rname :='������,��';
      ExpField[10].ind   :=7;
      ExpField[11].rname :='�����, � ���';
      ExpField[11].ind   :=8;
      ExpField[12].rname :='�����';
      ExpField[12].ind   :=10;
      ExpField[13].rname:='��� �� 1�';
      ExpField[13].ind   :=12;
      ExpField[14].rname:='���� �� �� FOB,USD';
      ExpField[14].ind   :=14;
      ExpField[15].rname:='���� �� �� �������,USD';
      ExpField[15].ind   :=15;
      ExpField[16].rname:='���� �� �� �������,USD';
      ExpField[16].ind   :=16;
      ExpField[17].rname:='��� �����';
      ExpField[17].ind  :=22;
      ExpField[18].rname:='��� ���� FOB,USD';
      ExpField[18].ind  :=17;
      ExpField[19].rname:='��� ���� �������,USD';
      ExpField[19].ind  :=18;
      ExpField[20].rname:='��� ���� �������,USD';
      ExpField[20].ind  :=19;
      for i := 1 to MaxExpField do
        begin
          if i<12 then ExpField[i].write:=true else ExpField[i].write:=false;
        end;
    end;
  if mode=tmInvoice then
    begin
      MaxExpField:=19;
      ExpField[1].rname :='BOM �����';
      ExpField[1].ind   :=13;
      ExpField[2].rname :='��� ������';
      ExpField[2].ind   :=1;
      ExpField[3].rname :='��� ������';
      ExpField[3].ind   :=2;
      ExpField[4].rname :='��� ������';
      ExpField[4].ind   :=11;
      ExpField[5].rname :='�� ���������';
      ExpField[5].ind   :=3;
      ExpField[6].rname :='���-��';
      ExpField[6].ind   :=4;
      ExpField[7].rname :='��� �� 1�';
      ExpField[7].ind   :=12;
      ExpField[8].rname :='���� �� �� FOB,USD';
      ExpField[8].ind   :=14;
      ExpField[9].rname :='���� �� �� �������,USD';
      ExpField[9].ind   :=15;
      ExpField[10].rname:='���� �� �� �������,USD';
      ExpField[10].ind  :=16;
      ExpField[11].rname:='��� ���� FOB,USD';
      ExpField[11].ind  :=17;
      ExpField[12].rname:='��� ���� �������,USD';
      ExpField[12].ind  :=18;
      ExpField[13].rname:='��� ���� �������,USD';
      ExpField[13].ind  :=19;
      ExpField[14].rname:='�����,��';
      ExpField[14].ind  :=6;
      ExpField[15].rname:='������,��';
      ExpField[15].ind  :=7;
      ExpField[16].rname:='������ �������,��';
      ExpField[16].ind  :=20;
      ExpField[17].rname:='�������� �������,��';
      ExpField[17].ind  :=21;
      ExpField[18].rname:='��� �����';
      ExpField[18].ind  :=22;
      ExpField[19].rname:='��� ��������';
      ExpField[19].ind  :=23;
      for i := 1 to MaxExpField do
        begin
          if i<9 then ExpField[i].write:=true else ExpField[i].write:=false;
        end;
    end;
end;
//��������� ���������� ��������� ��������
procedure TExpContForm.MyUpdate(new:integer);
var
  i   : integer;
  str : string;
begin
  //���������� ������ �����������
  if (new in [umAll,umContLSt]) then
    begin
      ContCbl.Items.Clear;
      for i := 0 to ContLst.Count - 1 do ContCbl.Items.Add(ContLst.Cont[i].Name);
      for I := 0 to ContCBL.Items.Count - 1 do ContCBL.Checked[i]:=true;
    end;
  //���������� ������ ����� ��� ������ ���������/�����������
  if (new in [umAll,umFieldLst]) then
    begin
      self.SetFieldLst(ModeRG.ItemIndex);
      FieldCBL.Items.Clear;
      for i := 1 to MaxExpField do
        begin
          str:=ExpField[i].rname;
          if str<>'' then FieldCBL.Items.Add(str);
        end;
      for I := 0 to FieldCBL.Items.Count - 1 do
        FieldCBL.Checked[i]:=self.GetFieldByName(FieldCBL.Items[i]).write;
    end;
  //����� ������ ����� ��� ����������
  if (new in [umAll,umSortLst]) then
    begin
      SortFieldCBL.Items.Clear;
      for I := 1 to MaxExpField do
        if self.GetFieldByName(ExpField[i].rname).write then
          begin
            str:=ExpField[i].rname;
            if str<>'' then SortFieldCBL.Items.Add(str);
          end;
    end;
end;
//������ �����
procedure TExpContForm.BBtnClick(Sender: TObject);
begin
  if NB.PageIndex>0 then
    begin
      NB.PageIndex:=NB.PageIndex-1;
      FBtn.Enabled:=true;
      FBtn.Caption:='������ >>';
    end;
  if NB.PageIndex=0 then BBtn.Enabled:=false;
end;
//������ ������
procedure TExpContForm.FbtnClick(Sender: TObject);
begin
  if NB.PageIndex<NB.Pages.Count-1 then
    begin
      if (NB.PageIndex=NB.Pages.Count-1)or(ModeRG.ItemIndex=2)
         then FBtn.Caption:='������' else FBtn.Caption:='������ >>';
      if (NB.PageIndex=1)and(ModeRG.ItemIndex=2) then
        begin
          //����� �������� � 1�
          PrPanel.Visible:=true;

        end else
        begin
          //�������� � ���� ������� ��� ������������
          NB.PageIndex:=NB.PageIndex+1;
          BBtn.Enabled:=true;
          MyUpdate(NB.PageIndex);
        end;
    end else
      begin
        self.Table(ModeRG.ItemIndex);
        self.Close;
      end;
end;
//������� � ������ ����������� �����
procedure TExpContForm.FieldCBLClickCheck(Sender: TObject);
var
  i : integer;
begin
  for I := 0 to FieldCBL.Items.Count - 1 do ExpField[i+1].write:=FieldCBL.Checked[i];
end;
//������ �������� ����������  �����
procedure TExpContForm.MovUpBtnClick(Sender: TObject);
var
  ind : integer;
  buf1,buf2 : TExpField;
begin
  if (SortFieldCBL.ItemIndex>0)then
    begin
      ind:=SortFieldCBL.ItemIndex;
      SortFieldCBL.Items.Move(ind,ind-1);
      SortFieldCBL.ItemIndex:=ind-1;
      buf1:=self.GetFieldByName(SortFieldCBL.Items[ind]);
      buf2:=self.GetFieldByName(SortFieldCBL.Items[ind-1]);
      ExpField[GetIndByName(buf1.rname)]:=buf2;
      ExpField[GetIndByName(buf2.rname)]:=buf1;
      //ExpField[buf1.ind].ind:=buf1.ind;
      //ExpField[buf2.ind].ind:=buf2.ind;
    end;
end;
procedure TExpContForm.MovDownBtnClick(Sender: TObject);
var
  ind : integer;
  buf1,buf2 : TExpField;
begin
  if (SortFieldCBL.ItemIndex>-1)and(SortFieldCBL.ItemIndex<SortFieldCBL.Count-1) then
    begin
      ind:=SortFieldCBL.ItemIndex;
      SortFieldCBL.Items.Move(ind,ind+1);
      SortFieldCBL.ItemIndex:=ind+1;
      buf1:=self.GetFieldByName(SortFieldCBL.Items[ind]);
      buf2:=self.GetFieldByName(SortFieldCBL.Items[ind+1]);
      ExpField[GetIndByName(buf1.rname)]:=buf2;
      ExpField[GetIndByName(buf2.rname)]:=buf1;
      //ExpField[buf1.ind].ind:=buf1.ind;
      //ExpField[buf2.ind].ind:=buf2.ind;
    end;
end;
//������ ������ �����
procedure TExpContForm.SaveBtnClick(Sender: TObject);
begin
end;
//������������� ����� � ����������
procedure TExpContForm.FormShow(Sender: TObject);
var
  i : integer;
begin
  MsgPanel.Visible:=false;
  PrPanel.Visible:=false;
  PrRG.ItemIndex:=1;
  NB.PageIndex:=0;
  BBtn.Enabled:=false;
  FBtn.Enabled:=true;
  FBtn.Caption:='������ >>';
  self.SetFieldLst(tmInvoice);
  MyUpdate(umAll);
  OrderCB.Items.Clear;
  for I := 0 to ModLst.Count - 1 do
    begin
      OrderCB.Items.Add(ModLst.Model[i].EngName);
      OrderCB.Checked[i]:=true;
    end;
end;


//------------------ ��������� �������� ������� --------------------------------

function TExpContForm.GetIndByName(name:string):integer;
var
  i:integer;
  res : integer;
begin
  res:=-1;
  for I := 1 to MaxExpField do
    if (ExpField[i].rname=name)or(ExpField[i].ename=name) then res:=i;
  result:=res;
end;

procedure TExpContForm.BitBtn2Click(Sender: TObject);
begin
  if CalcRMB.Checked then if not GetRate(USDtoRUB,RUBtoRMB) then Abort;
  PrPanel.Visible:=false;
  if self.ExpTo1C then ShowMessage('�������� ������� ���������!')
            else  ShowMessage('������ ��������!');
  self.Close;
end;

function TExpContForm.ContWrite(contind:integer):boolean;
var
  i : integer;
begin
  result:=false;
  for i := 0 to ContCBL.Items.Count-1 do
    if ((ContCBL.Items[i]=ContLst.Cont[contind].Name)and(ContCBL.Checked[i]=true)) then result:=true;
end;

function TExpContForm.GetFieldByName(name:string):TExpField;
var
  i:integer;
begin
  for I := 1 to MaxExpField do
    if (ExpField[i].rname=name)or(ExpField[i].ename=name) then result:=ExpField[i];
end;

procedure AddRow (var CDS : TClientDataSet; Item : TOneBoxItem; j,c,i,FB,HB : integer;Brutto : real);
var
  k,FldInd,l : integer;
  str        : string;
  Buf,Buf1   : real;
  price      : double;
begin
  CDS.Append;
  for k := 1 to ExpContForm.SortFieldCBL.Items.Count do
    begin
      str:='Fld'+IntToStr(k);
      fldind:=ExpContForm.GetFieldByName(ExpContForm.SortfieldCBL.Items[k-1]).ind;
      case fldind of
            1  {��� ������} : CDS.FieldByName(str).AsWideString:=ModLst.GetLongRusName(Item.OrdName,Item.PosCode);
            2  {��� ������} : CDS.FieldByName(str).AsWideString:=ModLst.GetNameByCode(lgENG,Item.OrdName,Item.PosCode);
            3  {�� �����}   : CDS.FieldByName(str).AsWideString:=ModLst.GetEIByCode(Lang,Item.OrdName,Item.PosCode);
            4  {���-��}     : CDS.FieldByName(str).AsWideString:=FormatFloat('####0.0##',Item.Count);
            5  {���-�� ����}: if j=0 then CDS.FieldByName(str).AsString:=FormatFloat('####0.0##',ContLst.Cont[c].Box[i].BoxCount)
                  else CDS.FieldByName(str).AsString:='';
            6  {�����}      : begin
                    if Item.NetEI then Buf:=MyRound(Item.Count/1000)
                      else Buf:=ModLst.GetNetByCode(Item.OrdName,Item.PosCode)*Item.Count;
//                    CDS.FieldByName(str).AsWideString:=FormatFloat('####0.0##',MyRound(Buf/1000)*1000);
                    CDS.FieldByName(str).AsWideString:=FormatFloat('####0.000',Buf);
                  end;
            7  {������}     :
                  if Brutto=-1 then
                  begin
                    //���������� ��� ����� ������� �������
                    if Item.NetEI then Buf:=MyRound(Item.Count/1000)
                      else Buf:=ModLst.GetNetByCode(Item.OrdName,Item.PosCode)*Item.Count;
                    //��������� ���� ����� ���� �������
                    Buf1:=0;
                    for l := 0 to ContLst.Cont[c].Box[i].ItemCount-1 do
                      if ContLst.Cont[c].Box[i].Items[l].NetEI then
                        Buf1:=Buf1+MyRound(ContLst.Cont[c].Box[i].Items[l].Count/1000)
                      else
                        Buf1:=Buf1+ModLst.GetNetByCode(ContLst.Cont[c].Box[i].Items[l].OrdName,
                            ContLst.Cont[c].Box[i].Items[l].PosCode)*ContLst.Cont[c].Box[i].Items[l].Count;
                    //��������� ��� ������ ������� ������� �� ���������
                    if Buf1>0 then Buf:=(ContLst.Cont[c].Box[i].BNet/Buf1)*Buf else Buf:=0;
                    CDS.FieldByName(str).AsWideString:=FormatFloat('####0.000',Buf)
                    //CDS.FieldByName(str).AsWideString:=Floattostr(Buf)
                  end
                  else
                    CDS.FieldByName(str).AsWideString:=FormatFloat('####0.000',Brutto);
                    //CDS.FieldByName(str).AsWideString:=Floattostr(Brutto);
            8  {�����}      : if j=0 then CDS.FieldByName(str).AsWideString:=FormatFloat('####0.0##',ContLst.Cont[c].Box[i].Vol)
                  else CDS.FieldByName(str).AsWideString:='';
            9  {��� �������}: if j=0 then CDS.FieldByName(str).AsWideString:=ContLst.Cont[c].Box[i].BoxCode
                  else CDS.FieldByName(str).AsString:='';
            10 {��� ������} : CDS.FieldByName(str).AsWideString:=Item.OrdName;
            11 {��� ������} : CDS.FieldByName(str).AsWideString:=utf8decode(ModLst.GetNameByCode(lgCN,Item.OrdName,Item.PosCode));
            12 {��� 1�}     : CDS.FieldByName(str).AsWideString:=Item.PosCode;
            13 {BOM ���}    : CDS.FieldByName(str).AsWideString:=ModLst.GetBOMByCode(Item.OrdName,Item.PosCode);
            14 {����}             : begin
                                    price:=ModLst.GetPriceByCode(0,item.OrdName,item.PosCode);
                                    if ExpContForm.CalcRMB.Checked then price:=price*USDtoRUB/RUBtoRMB;
                                    price:=round(price*10000)/10000;
                                    CDS.FieldByName(str).AsWideString:=FloatToStr(price);
                                    end;
            15 {���� ������������}: begin
                                    price:=ModLst.GetPriceByCode(1,item.OrdName,item.PosCode);
                                    if ExpContForm.CalcRMB.Checked then price:=price*USDtoRUB/RUBtoRMB;
                                    price:=round(price*10000)/10000;
                                    //price:=DecimalRoundExt(price,4,drHalfPos);
                                    CDS.FieldByName(str).AsWideString:=FloatToStr(price);
                                    end;
            16 {���� �������}     : begin
                                    price:=ModLst.GetPriceByCode(2,item.OrdName,item.PosCode);
                                    if ExpContForm.CalcRMB.Checked then price:=price*USDtoRUB/RUBtoRMB;
                                    price:=round(price*10000)/10000;
                                    CDS.FieldByName(str).AsWideString:=FloatToStr(price);
                                    end;
            17 {��� �� ���� ���} : begin
                    Buf:=roundto(ModLst.GetPriceByCode(0,Item.OrdName,Item.PosCode),-4);
                    if ExpContForm.CalcRMB.Checked then buf:=roundto(buf*USDtoRUB/RUBtoRMB,-4);
                    buf:=buf*Item.Count;
                    CDS.FieldByName(str).AsWideString:=FloatToStr(Buf);
                  end;
            18 {��� �� ���� �������} : begin
                    Buf:=roundto(ModLst.GetPriceByCode(1,Item.OrdName,Item.PosCode),-4);
                    if ExpContForm.CalcRMB.Checked then buf:=roundto(buf*USDtoRUB/RUBtoRMB,-4);
                    buf:=buf*Item.Count;
                    CDS.FieldByName(str).AsWideString:=FloatToStr(Buf);
                  end;
            19 {��� �� ���� �������} : begin
                    Buf:=roundto(ModLst.GetPriceByCode(2,Item.OrdName,Item.PosCode),-4);
                    if ExpContForm.CalcRMB.Checked then buf:=roundto(buf*USDtoRUB/RUBtoRMB,-4);
                    buf:=buf*Item.Count;
                    CDS.FieldByName(str).AsWideString:=FloatToStr(Buf);
                  end;
            20 {���-�� ������ �������} : begin
                    if FB>-1 then CDS.FieldByName(str).AsWideString:=IntToStr(FB)
                      else CDS.FieldByName(str).AsWideString:='';
                  end;
            21 {���-�� ��������� �������} : begin
                    if HB>-1 then CDS.FieldByName(str).AsWideString:=IntToStr(HB)
                      else CDS.FieldByName(str).AsWideString:='';
                  end;
            22 {��� �����}     : CDS.FieldByName(str).AsWideString:=ModLst.GetTnCodeByCode(Item.OrdName,Item.PosCode);
            23 {��� ��������}  : CDS.FieldByName(str).AsWideString:=ModLst.GetBoxTypeByCode(Item.OrdName,Item.PosCode);
          end;
    end;
  CDS.Post;
end;

procedure TExpContForm.Table(mode : integer);
var
  CDS                   : TClientDataSet;
  i,j,c,d,l,BC,k        : integer;
  Item                  : TOneBoxItem;
  CodeCDS               : TClientDataSet;
  Count,Brutto,Buf,Buf1 : real;
  FB,HB                 : word;
  str,title,res         : string;
  Fl                    : boolean;
  PosCodeLst            : TStringList;
  //��� ���������������� ������������
  BufCont               : TContr;
  NewBox                : TBox;
  PosCode               : string;
  num,ind               : integer;
begin
  //���� ������ ���� ��������� � RMB ����������� ����� �����
  if CalcRMB.Checked then if not GetRate(USDtoRUB,RUBtoRMB) then Abort;
  //�������� ������� � ����������� ����������� �����
  CDS:=TClientDataSet.Create(self);
  for i := 1 to SortFieldCBL.Items.Count do
      CDS.FieldDefs.Add('Fld'+IntToStr(i),ftWideString,255);
  CDS.CreateDataSet;
  //�������� ��������� � ������� ��������
  for i := 1 to ExpContForm.SortFieldCBL.Items.Count do
      CDS.Fields[i-1].DisplayLabel:=ExpContForm.SortfieldCBL.Items[i-1];
  //���������� �������
  //����� ������������ �����
  if mode=tmPacing then begin
    for c := 0 to ContLst.Count - 1 do if self.ContWrite(c) then
    begin
      CDS.Append;
      CDS.FieldByName('Fld1').AsWideString:='��������� � '+ContLst.Cont[c].Name;
      CDS.Post;
      for I := 0 to ContLst.Cont[c].BoxCount-1 do
      for j := 0 to ContLst.Cont[c].Box[i].ItemCount-1 do
        begin
          Item:=ContLst.Cont[c].Box[i].Items[j];
          AddRow(CDS,item,j,c,i,-1,-1,-1);
        end;
      CDS.Append;
      CDS.FieldByName('Fld1').AsWideString:='���-�� �������: '+IntToStr(ContLst.Cont[c].TotBoxCnt);
      CDS.Post;
    end;
    Title:='�������� � ������� "����������� ����"';
    Res:='';
  end;
  //����� �������
  if mode=tmInvoice then
    begin
      //�������� � ���������� ������� �����
      CodeCDS:=TClientDataSet.Create(self);
      CodeCDS.FieldDefs.Add('Code',ftString,20);
      CodeCDS.FieldDefs.Add('RName',ftString,255);
      CodeCDS.CreateDataSet;
      CodeCDS.IndexFieldNames:='RName';
      BC:=0;
      for c := 0 to ContLst.Count - 1 do
        if self.ContWrite(c) then
          begin
          BC:=BC+ContLst.Cont[c].TotBoxCnt;
          for I := 0 to ContLst.Cont[c].BoxCount-1 do
            for j := 0 to ContLst.Cont[c].Box[i].ItemCount-1 do
              begin
                Item:=ContLst.Cont[c].Box[i].Items[j];
                if CodeCDS.Locate('Code',Item.PosCode,[])=false  then
                  begin
                    CodeCDS.Append;
                    CodeCDS.FieldByName('Code').AsString:=Item.PosCode;
                    CodeCDS.FieldByName('RName').AsString:=ModLst.GetLongRusName(Item.OrdName,Item.PosCode);                  end;
              end;
          end;
      //��������� ������ � �������� �����������
      str:='';
      for i := 0 to ExpContForm.ContCBL.Items.Count-1 do
        if ExpContForm.ContCBL.Checked[i] then str:=str+ExpContForm.ContCBL.Items[i]+', ';
      str:='����������: '+str;
      str:=copy(str,1,Length(str)-2);
      title:=str;
      //����� ������ � ������� ���������� ������� CodeCDS
      CodeCDS.First;
      PosCodeLst:=TStringList.Create;
      for d := 0 to CodeCDS.RecordCount-1 do
      begin
        Count:=0;
        FB:=0;
        HB:=0;
        Brutto:=0;
        for c := 0 to ContLst.Count - 1 do
          if self.ContWrite(c) then
            for I := 0 to ContLst.Cont[c].BoxCount-1 do
              begin
              //������������ ���������� ������ � ��������� �������
              //���������� ������ �����, �������� � �������
              PosCodeLSt.Clear;
              for j := 0 to ContLst.Cont[c].Box[i].ItemCount-1 do
                begin
                  Fl:=false;
                  for k := 0 to PosCodeLst.Count-1 do
                      if PosCodeLst.Strings[k]=ContLst.Cont[c].Box[i].Items[j].PosCode then Fl:= true;
                  if not Fl then PosCodeLst.Add(ContLst.Cont[c].Box[i].Items[j].PosCode);
                end;
              //�� ������������� ������ ������� ���������� �������
              for j := 0 to PosCodeLst.Count - 1 do
                if PosCodeLst.Strings[j]=CodeCDS.FieldByName('Code').AsString then
                  begin
                    if PosCodeLst.Count=1 then FB:=FB+ContLst.Cont[c].Box[i].BoxCount
                      else HB:=HB+ContLst.Cont[c].Box[i].BoxCount;
                  end;
              // ������������ ����� ���������� � ����
              for j := 0 to ContLst.Cont[c].Box[i].ItemCount-1 do
                if ContLst.Cont[c].Box[i].Items[j].PosCode=CodeCDS.FieldByName('Code').AsString then
                  begin
                    //�������� �������
                    Item:=ContLst.Cont[c].Box[i].Items[j];
                    //������������ ����� ����������
                    Count:=Count+Item.Count;
                    //������
                    //���������� ��� ����� ������� �������
                    if Item.NetEI then Buf:=MyRound(Item.Count/1000)
                      else Buf:=ModLst.GetNetByCode(Item.OrdName,Item.PosCode)*Item.Count;
                    //��������� ���� ����� ���� �������
                    Buf1:=0;
                    for l := 0 to ContLst.Cont[c].Box[i].ItemCount-1 do
                      if ContLst.Cont[c].Box[i].Items[l].NetEI then
                        Buf1:=Buf1+MyRound(ContLst.Cont[c].Box[i].Items[l].Count/1000)
                      else
                        Buf1:=Buf1+ModLst.GetNetByCode(ContLst.Cont[c].Box[i].Items[l].OrdName,
                            ContLst.Cont[c].Box[i].Items[l].PosCode)*ContLst.Cont[c].Box[i].Items[l].Count;
                    //��������� ��� ������ ������� ������� �� ���������
                    if Buf1>0 then Buf:=(ContLst.Cont[c].Box[i].BNet/Buf1)*Buf else Buf:=0;
                    Brutto:=Brutto+Buf;
                  end;
              end;
        Item.Count:=Count;
        AddRow(CDS,Item,-1,-1,-1,FB,HB,Brutto);
        CodeCDS.Next;
      end;
      res:='����� '+IntToStr(BC)+' ����.';
      POsCodeLst.Destroy;
    end;
  //����� ������������ ����� ��� ��
  if mode=tmTrain then begin
    //������� �������� ��������� � ������� ����� ��� ����������
    num:=0; // ��������� ������� � �������� ����������
    ind:=ContLst.NewCont('BUFFER',0,0);
    BufCont:=ContLst.Cont[ind];
    //�������� �� ���� �������� "����������" �����������
    for c := 0 to ContLst.Count - 2 do if self.ContWrite(c) then
       for I := 0 to ContLst.Cont[c].BoxCount-1 do
        // ���� � ������� ��������� �������� ������������ � ����� ��� ����
        if ContLst.Cont[c].Box[i].ItemCount>1 then begin
          ind:=BufCont.AddBox(ContLst.Cont[c].Box[i]);
          inc(num);
          BufCont.Box[ind].BoxCode:=inttostr(num);
        end else begin
          //���� � ������� ���� ������� �������� ���������� �� ���� �� ������ �����
          ind:=0;
          while(ind<BufCont.BoxCount)and(not((BufCont.Box[ind].ItemCount=1)and
            (BufCont.Box[ind].Items[0].PosCode=ContLst.Cont[c].Box[i].Items[0].PosCode)))do inc(ind);
          //���� ��������� ������� � ����� ��������� ��� ��������� ������������ � ���
          if(ind<BufCont.BoxCount)and(BufCont.Box[ind].ItemCount=1)and
            (BufCont.Box[ind].Items[0].PosCode=ContLst.Cont[c].Box[i].Items[0].PosCode)then begin
              BufCont.Box[ind].BoxCount:= BufCont.Box[ind].BoxCount+ContLst.Cont[c].Box[i].BoxCount;
              BufCont.Box[ind].BNet:= BufCont.Box[ind].BNet+ContLst.Cont[c].Box[i].BNet;
              BufCont.Box[ind].Items[0].Count:= BufCont.Box[ind].Items[0].Count+ContLst.Cont[c].Box[i].Items[0].Count;
            end else begin
           //���� ����� �� ������������ - ������������ 
              ind:=BufCont.AddBox(ContLst.Cont[c].Box[i]);
              inc(num);
              BufCont.Box[ind].BoxCode:=inttostr(num);
            end;
        end;
    //����������� �� ��������� ����������
    c:=ContLst.Count-1;
    for I := 0 to BufCont.BoxCount-1 do
      for j := 0 to BufCont.Box[i].ItemCount-1 do
        begin
          Item:=BufCont.Box[i].Items[j];
          AddRow(CDS,item,j,c,i,-1,-1,-1);
        end;
    Title:='�������� � ������� "����������� ���� � ������������� �������"';
    Res:='';
    //������� �������� ���������
    ContLst.DelCont('BUFFER');
  end;
  //���� ������ �� �������, ��������� �����, ��� ���������
  PrUnit.PCDS:=@CDS;
  PrDm.frxReport1.LoadFromFile(AppPath+'ExpDataReport.fr3');
  PrDm.frxReport1.Variables['TITLE']:='''' + Title + '''';
  PrDm.frxReport1.Variables['RESULT']:='''' + Res + '''';
  //�������������� �����, ���������� ������ "�����"
  MsgPanel.Visible:=true;
  self.Refresh;
  PrDm.frxReport1.PrepareReport;
  MsgPanel.Visible:=false;
  //���������� �����
  PrDm.frxReport1.ShowPreparedReport;
  PrDm.frxReport1.Clear;
end;

//------------------ �������� ��� 1� -------------------------------------------
function TExpContForm.ExpTo1C: boolean;
var
  i,j,k,ord  : integer;
  str  : string;
  Strs : TStringList;
  CDS  : TClientDataSet;
  price: real;
begin
  Result:=false;
  //������� ��������� �����
  Strs:=TstringList.Create;
  //��������� ������ ������: ����������, ������
  str:='Cont: ';
  for I := 0 to ContCBL.Count - 1 do if ContCBL.Checked[i] then Str:=str+ContCBL.Items[i]+',';
  delete(str,Length(str),1);
  str:=str+' orders: ';
  for I := 0 to OrderCB.Count - 1 do if OrderCB.Checked[i] then Str:=str+OrderCB.Items[i]+',';
  delete(str,Length(str),1);
  strs.Add(str);
  //������� �������
  CDS:=TClientDataSet.Create(self);
  CDS.FieldDefs.Add('Code',ftString,255,true);
  CDS.FieldDefs.Add('Name',ftString,255,true);
  CDS.FieldDefs.Add('Qty',ftFloat,0,true);
  CDS.FieldDefs.Add('Price',ftFloat,0,true);
  CDS.CreateDataSet;
  //�� ������ �������
  for ord := 0 to OrderCB.Items.Count - 1 do
    //���� ����� ������ - �� ������ �����������
    if OrderCB.Checked[ord] then begin
      for I := 0 to ContCBL.Count - 1 do
        //���� ��������� ������ - �� ������ �������
        if ContCBL.Checked[i] then for j := 0 to ContLst.ByName(ContCBL.Items[i]).BoxCount - 1 do
          //�� ������ ������� � �������
          for k := 0 to ContLst.ByName(ContCBL.Items[i]).Box[j].ItemCount - 1 do
            //���� ������ �� �������� ������
            //��������� ������� �������� ���������� ������ �� ��������� �����������
            if ContLst.ByName(ContCBL.Items[i]).Box[j].Items[k].OrdName=OrderCB.Items[ord] then begin
              str:=ContLst.ByName(ContCBL.Items[i]).Box[j].Items[k].PosCode;
              if not(CDS.Locate('Code',str,[])) then
                begin
                  CDS.Append;
                  CDS.FieldByName('Code').AsString:=str;
                  CDS.FieldByName('Name').AsString:=ModLst.GetNameByCode
                    (lgRus,ContLst.ByName(ContCBL.Items[i]).Box[j].Items[k].OrdName,
                    ContLst.ByName(ContCBL.Items[i]).Box[j].Items[k].PosCode);
                  CDS.FieldByName('Qty').AsFloat:=ContLst.ByName(ContCBL.Items[i]).Box[j].Items[k].Count;
                  price:=ModLst.GetPriceByCode(PrRG.ItemIndex,ContLst.ByName(ContCBL.Items[i]).Box[j].Items[k].OrdName,ContLst.ByName(ContCBL.Items[i]).Box[j].Items[k].PosCode);
                  if CalcRMB.Checked then price:=price*USDtoRUB/RUBtoRMB;
                  price:=round(price*10000)/10000;
                  CDS.FieldByName('Price').AsFloat:=price;
                  CDS.Post;
                end else begin
                  CDS.Edit;
                  CDS.FieldByName('Qty').AsFloat:=CDS.FieldByName('Qty').AsFloat+ContLst.ByName(ContCBL.Items[i]).Box[j].Items[k].Count;
                  CDS.Post;
                end;
              end;
    end;
  //������������ ������� � ��������� �����
  //showmessage(inttostr(CDS.RecordCount));
  CDS.IndexFieldNames:='Name';
  CDS.First;
  for I := 0 to CDS.RecordCount - 1 do begin
    str:='"'+CDS.FieldByName('Code').AsString+'",';
    str:=str+'"'+CDS.FieldByName('Name').AsString+'",';
    str:=str+'"'+FormatFloat('####0.0####',CDS.FieldByName('Qty').AsFloat)+'",';
    str:=str+'"'+FormatFloat('####0.0####',CDS.FieldByName('Price').AsFloat)+'"';
    strs.Add(str);
    CDS.Next;
  end;
  //������ �������
  CDS.Free;
  //���������� �������� ����� � ����
  if saveDlg.Execute then
    begin
      strs.SaveToFile(SaveDlg.FileName);
      result:=true;
    end;
  Strs.Free;
end;

end.
