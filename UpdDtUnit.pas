unit UpdDtUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CheckLst, Grids, ExtCtrls, ComCtrls, ToolWin, ImgList,
  Buttons;

type

  TCngRec = record
    Code     : string;
    Ind      : integer;
    Mode     : string;
    Text     : string;
    Flag     : boolean;
  end;

  TCngLst = record
    Count : Integer;
    Item  : array of TCngRec;
  end;

  TUpdDtForm = class(TForm)
    Panel: TPanel;
    BtnPanel: TPanel;
    SG: TStringGrid;
    ImgLst: TImageList;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    procedure ToolButton5Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure SGDblClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure SGDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
    function  UpdateDataLst(FName:string):boolean;
    //procedure CreateCngLst(NewData:TDataList);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  UpdDtForm: TUpdDtForm;

implementation

{$R *.dfm}

uses TDataLst,PrUnit;

var
  CngList : TCngLst;
  NewData : TDataList;

procedure CreateCngLst(NewData:TDataList);
var
  i,j,k   : integer;
  str1,str: string;
  CngRec  : TCngRec;
  find : boolean;

procedure Add(Rec:TCngRec);
var
  i : integer;
  find : boolean;
begin
  find:=false;
  for i := 0 to CngList.Count - 1 do
    if ((CngList.Item[i].Code=Rec.Code)and
        (CngList.Item[i].Mode=Rec.Mode))
      then find:=true;
  if not find then
    begin
      inc(CngList.Count);
      SetLength(CngList.Item,CngList.Count);
      CngList.Item[CngList.Count-1]:=Rec;
    end;
end;

begin
  CngList.Count:=0;
  for k := 0 to NewData.Count - 1 do
    for i := 0 to ModLst.Count - 1 do
    for j := 0 to ModLst.Model[i].Count-1 do
      if NewData.Item[k].Code=ModLst.Model[i].item[j].Code then
      begin
        str1:=ModLst.Model[i].item[j].Code+' '+ModLst.Model[i].item[j].RName+chr(13);
        CngRec.Code:=ModLst.Model[i].item[j].Code;
        CngRec.Ind:=k;
        if ModLst.Model[i].item[j].BOM<>NewData.item[k].Bom then
          begin
            str:='Изменился BOM. Старое значение: "'+ModLst.Model[i].item[j].BOM+
                 '" новое значение: "'+NewData.item[k].Bom + '"';
            CngRec.Text:=str1+str;
            CngRec.Mode:='BOM';
            CngRec.Flag:=true;
            Add(CngRec);
          end;
        if ModLst.Model[i].item[j].RName<>NewData.item[k].RName then
          begin
            str:='Изменилось русское наименование. Старое значение: "'+ModLst.Model[i].item[j].RName+
                 '" новое значение: "'+NewData.item[k].RName + '"';;
            CngRec.Text:=str1+str;
            CngRec.Mode:='RName';
            CngRec.Flag:=true;
            Add(CngRec);
          end;
        if ModLst.Model[i].item[j].LRName<>NewData.item[k].LRName then
          begin
            str:='Изменилось полное русское наименование. Старое значение: "'+ModLst.Model[i].item[j].LRName+
                 '" новое значение: "'+NewData.item[k].LRName + '"';;
            CngRec.Text:=str1+str;
            CngRec.Mode:='LRName';
            CngRec.Flag:=true;
            Add(CngRec);
          end;
        if ModLst.Model[i].item[j].EName<>NewData.item[k].EName then
          begin
            str:='Изменилось английское наименование. Старое значение: "'+ModLst.Model[i].item[j].EName+
                 '" новое значение: "'+NewData.item[k].EName + '"';;
            CngRec.Text:=str1+str;
            CngRec.Mode:='EName';
            CngRec.Flag:=true;
            Add(CngRec);
          end;
        if ModLst.Model[i].item[j].TNCode<>NewData.item[k].TNCode then
          begin
            str:='Изменился код ТНВЭД. Старое значение: "'+ModLst.Model[i].item[j].TNCode+
                 '" новое значение: "'+NewData.item[k].TNCode + '"';;
            CngRec.Text:=str1+str;
            CngRec.Mode:='TNCode';
            CngRec.Flag:=true;
            Add(CngRec);
          end;
        if ModLst.Model[i].item[j].BoxType<>NewData.item[k].BoxType then
          begin
            str:='Изменился тип упаковки. Старое значение: "'+ModLst.Model[i].item[j].BoxType+
                 '" новое значение: "'+NewData.item[k].BoxType + '"';;
            CngRec.Text:=str1+str;
            CngRec.Mode:='BoxType';
            CngRec.Flag:=true;
            Add(CngRec);
          end;
        if ModLst.Model[i].item[j].EI<>NewData.item[k].EI then
          begin
            str:='Изменилась едиинца измерения. Старое значение: "'+ModLst.Model[i].item[j].EI+
                 '" новое значение: "'+NewData.item[k].EI + '"';;
            CngRec.Text:=str1+str;
            CngRec.Mode:='EI';
            CngRec.Flag:=true;
            Add(CngRec);
          end;
        if ModLst.Model[i].item[j].Net<>NewData.item[k].Net then
          begin
            str:='Изменился вес нетто. Старое значение: "'+FormatFloat('####0.0####',ModLst.Model[i].item[j].Net)+
                 '" новое значение: "'+FormatFloat('####0.0####',NewData.item[k].Net) + '"';;
            CngRec.Text:=str1+str;
            CngRec.Mode:='Net';
            CngRec.Flag:=true;
            Add(CngRec);
          end;
        if ModLst.Model[i].item[j].Vol<>NewData.item[k].Vol then
          begin
            str:='Изменился объем. Старое значение: "'+FormatFloat('####0.0####',ModLst.Model[i].item[j].Vol)+
                 '" новое значение: "'+FormatFloat('####0.0####',NewData.item[k].Vol) + '"';;
            CngRec.Text:=str1+str;
            CngRec.Mode:='Vol';
            CngRec.Flag:=true;
            Add(CngRec);
          end;
        if ModLst.Model[i].item[j].CntInBox<>NewData.item[k].CntInBox then
          begin
            str:='Изменилось количество в коробке. Старое значение: "'+IntTostr(ModLst.Model[i].item[j].CntInBox)+
                 '" новое значение: "'+IntToStr(NewData.item[k].CntInBox) + '"';;
            CngRec.Text:=str1+str;
            CngRec.Mode:='CntInBox';
            CngRec.Flag:=true;
            Add(CngRec);
          end;
        if ModLst.Model[i].item[j].BarCode<>NewData.item[k].BarCode then
          begin
            str:='Изменился штрих-код. Старое значение: "'+ModLst.Model[i].item[j].BarCode+
                 '" новое значение: "'+NewData.item[k].BarCode + '"';;
            CngRec.Text:=str1+str;
            CngRec.Mode:='BarCode';
            CngRec.Flag:=true;
            Add(CngRec);
          end;
        if ModLst.Model[i].item[j].GNet<>NewData.item[k].GNet then
          begin
            str:='Изменился вес брутто. Старое значение: "'+FormatFloat('####0.0####',ModLst.Model[i].item[j].GNet)+
                 '" новое значение: "'+FormatFloat('####0.0####',NewData.item[k].GNet) + '"';;
            CngRec.Text:=str1+str;
            CngRec.Mode:='GNet';
            CngRec.Flag:=true;
            Add(CngRec);
          end;
        if ModLst.Model[i].item[j].Price<>NewData.item[k].Price then
          begin
            str:='Изменилась цена FOB. Старое значение: "'+FormatFloat('####0.0####',ModLst.Model[i].item[j].Price)+
                 '" новое значение: "'+FormatFloat('####0.0####',NewData.item[k].Price) + '"';;
            CngRec.Text:=str1+str;
            CngRec.Mode:='Price';
            CngRec.Flag:=true;
            Add(CngRec);
          end;
        if ModLst.Model[i].item[j].PriceN<>NewData.item[k].PriceN then
          begin
            str:='Изменилась цена Новороссийск. Старое значение: "'+FormatFloat('####0.0####',ModLst.Model[i].item[j].PriceN)+
                 '" новое значение: "'+FormatFloat('####0.0####',NewData.item[k].PriceN) + '"';;
            CngRec.Text:=str1+str;
            CngRec.Mode:='PriceN';
            CngRec.Flag:=true;
            Add(CngRec);
          end;
        if ModLst.Model[i].item[j].PriceA<>NewData.item[k].PriceA then
          begin
            str:='Изменилась цена Ангарск. Старое значение: "'+FormatFloat('####0.0####',ModLst.Model[i].item[j].PriceA)+
                 '" новое значение: "'+FormatFloat('####0.0####',NewData.item[k].PriceA) + '"';;
            CngRec.Text:=str1+str;
            CngRec.Mode:='PriceA';
            CngRec.Flag:=true;
            Add(CngRec);
          end;
      end;
end;

procedure TUpdDtForm.BitBtn2Click(Sender: TObject);
var
  i,j,k : integer;
begin
  //
  if MessageDlg('Вы уверенны?',mtWarning,[mbYes,mbNo],0)=mrYes then
  begin
  for k := 0 to CngList.Count - 1 do
   if CngList.Item[k].Flag then
    for i := 0 to ModLst.Count - 1 do
      for j := 0 to ModLst.Model[i].Count-1 do
        if CngList.Item[k].Code=ModLst.Model[i].item[j].Code then
          begin
            if CngList.Item[k].Mode='BOM'   then ModLst.Model[i].item[j].BOM:=NewData.Item[CngList.Item[k].Ind].BOM;
            if CngList.Item[k].Mode='RName' then ModLst.Model[i].item[j].RName:=NewData.Item[CngList.Item[k].Ind].RName;
            if CngList.Item[k].Mode='LRName' then ModLst.Model[i].item[j].LRName:=NewData.Item[CngList.Item[k].Ind].LRName;
            if CngList.Item[k].Mode='EName' then ModLst.Model[i].item[j].EName:=NewData.Item[CngList.Item[k].Ind].EName;
            if CngList.Item[k].Mode='TNCode' then ModLst.Model[i].item[j].TNCode:=NewData.Item[CngList.Item[k].Ind].TNCode;
            if CngList.Item[k].Mode='BoxType' then ModLst.Model[i].item[j].BoxType:=NewData.Item[CngList.Item[k].Ind].BoxType;
            if CngList.Item[k].Mode='EI' then ModLst.Model[i].item[j].EI:=NewData.Item[CngList.Item[k].Ind].EI;
            if CngList.Item[k].Mode='Net' then ModLst.Model[i].item[j].Net:=NewData.Item[CngList.Item[k].Ind].Net;
            if CngList.Item[k].Mode='Vol' then ModLst.Model[i].item[j].Vol:=NewData.Item[CngList.Item[k].Ind].Vol;
            if CngList.Item[k].Mode='CntInBox' then ModLst.Model[i].item[j].CntInBox:=NewData.Item[CngList.Item[k].Ind].CntInBox;
            if CngList.Item[k].Mode='BarCode' then ModLst.Model[i].item[j].BarCode:=NewData.Item[CngList.Item[k].Ind].BarCode;
            if CngList.Item[k].Mode='GNet' then ModLst.Model[i].item[j].GNet:=NewData.Item[CngList.Item[k].Ind].GNet;
            if CngList.Item[k].Mode='Price' then ModLst.Model[i].item[j].Price:=NewData.Item[CngList.Item[k].Ind].Price;
            if CngList.Item[k].Mode='PriceN' then ModLst.Model[i].item[j].PriceN:=NewData.Item[CngList.Item[k].Ind].PriceN;
            if CngList.Item[k].Mode='PriceA' then ModLst.Model[i].item[j].PriceA:=NewData.Item[CngList.Item[k].Ind].PriceA;
          end;
  self.Close;
  end;
end;

procedure TUpdDtForm.FormResize(Sender: TObject);
begin
  SG.ColWidths[1]:=SG.ClientWidth-SG.ColWidths[0];
end;

procedure TUpdDtForm.SGDblClick(Sender: TObject);
begin
  if CngList.Item[SG.Selection.Top].Flag then
    CngList.Item[SG.Selection.Top].Flag:=false
  else
    CngList.Item[SG.Selection.Top].Flag:=true;
  SG.Refresh;
end;

procedure TUpdDtForm.SGDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  s    : string;
  Flag : Cardinal;
  Rct  : TRect;
  H    : integer;
begin
  s := SG.Cells[ACol,ARow];
  Rct:=Rect;
  Flag := DT_LEFT;
  Flag := Flag or DT_WORDBREAK;
  if Acol=0 then
    begin
      Inc(Rct.Left,3);
      Dec(Rct.Right,3);
      Inc(Rct.Top,3);
      Rct.Bottom:=Rct.Top+20;
      SG.Canvas.Brush.Color:=clWhite;
      SG.Canvas.FillRect(Rct);
      SG.Canvas.Pen.Color:=clBlack;
      SG.Canvas.Rectangle(Rct);
      if CngList.Item[ARow].Flag then
        begin
          SG.Canvas.Pen.Color:=clBlack;
          SG.Canvas.MoveTo(Rct.Left+3,Rct.Top+10);
          SG.Canvas.LineTo(Rct.Left+7,Rct.Bottom-3);
          SG.Canvas.LineTo(Rct.Right-2,Rct.Top+2);
          SG.Canvas.MoveTo(Rct.Left+3,Rct.Top+10);
          SG.Canvas.LineTo(Rct.Left+7,Rct.Bottom-4);
          SG.Canvas.LineTo(Rct.Right-2,Rct.Top+2);
          SG.Canvas.MoveTo(Rct.Left+3,Rct.Top+10);
          SG.Canvas.LineTo(Rct.Left+7,Rct.Bottom-5);
          SG.Canvas.LineTo(Rct.Right-2,Rct.Top+2);
        end;
    end
    else
    begin
      if SG.Selection.Top=ARow then SG.Canvas.Brush.Color:=clSilver
        else SG.Canvas.Brush.Color:=clWhite;
      SG.Canvas.FillRect(Rect);
      Inc(Rct.Left,3);
      Dec(Rct.Right,3);
      H:=DrawText(SG.Canvas.Handle,PChar(s),length(s),Rct,Flag);
      if H>SG.RowHeights[ARow] then SG.RowHeights[ARow]:=H;
    end;
end;

procedure TUpdDtForm.ToolButton1Click(Sender: TObject);
var
  i : integer;
begin
  for i := 0 to CngList.Count - 1 do CngList.Item[i].Flag:=false;
  SG.Repaint;
end;

procedure TUpdDtForm.ToolButton2Click(Sender: TObject);
var
  i : integer;
begin
  for i := 0 to CngList.Count - 1 do
    if CngList.Item[i].Flag then CngList.Item[i].Flag:=false
      else CngList.Item[i].Flag:=true;
  SG.Repaint;
end;

procedure TUpdDtForm.ToolButton3Click(Sender: TObject);
var
  i : integer;
begin
  for i := 0 to CngList.Count - 1 do CngList.Item[i].Flag:=true;
  SG.Repaint;
end;

procedure TUpdDtForm.ToolButton5Click(Sender: TObject);
var
  Strs:TStringList;
  i : integer;
begin
  Strs:=TStringList.Create;
  for I := 0 to CngList.Count - 1 do Strs.Add(CngList.Item[i].Text);
  PrDm.PrintCngList(Strs);
end;

function TUpdDtForm.UpdateDataLst(FName:string):boolean;
var
  i,j     : integer;
begin
  NewData:=TDataList.Create;
  NewData.LoadFrom1CTXT(FName);
  CreateCngLst(NewData);
  if CngList.Count=0 then
    MessageDlg('Информация о деталях полностью корректна. Измененией нет!',mtInformation,[mbOK],0)
  else
    begin
      SG.RowCount:=CngList.Count;
      for I := 0 to CngList.Count - 1 do
        SG.Cells[1,i]:=CngList.Item[i].Text;
      self.ShowModal;
    end;
end;

end.
