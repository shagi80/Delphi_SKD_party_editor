unit CreateBoxUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TCont,TDataLst, Grids, ExtCtrls, ComCtrls, StdCtrls, Buttons;

type
  TCreateBoxForm = class(TForm)
    Panel1: TPanel;
    BoxSG: TStringGrid;
    BoxItmCap: TLabel;
    BoxCountCap: TLabel;
    BoxCount: TEdit;
    UpDown1: TUpDown;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BoxGNetCap: TLabel;
    BoxGNet: TEdit;
    BoxNetCap: TLabel;
    BoxNet: TEdit;
    BoxNumberEdit: TEdit;
    BoxNumberCheck: TCheckBox;
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure BoxGNetKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BoxNetKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BoxSGKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BoxCountKeyPress(Sender: TObject; var Key: Char);
    procedure BoxGnetKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure BoxSGKeyPress(Sender: TObject; var Key: Char);
    procedure BoxSGSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure RecalcNet;
    procedure BoxNumberCheckClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function ShowForm(var Items:array of TOneBoxItem; BCount,Cnt,lng:integer;Gnet:real;var boxcode:string):integer;
  end;

var
  CreateBoxForm: TCreateBoxForm;



implementation

uses LangUnit;

{$R *.dfm}

var
  Item   : array of TOneBoxItem;
  ItmCnt : integer;

procedure TCreateBoxForm.RecalcNet;
var
  GNet,Net,BCount : real;
  i : integer;
begin
  if(BoxGNet.Text<>'')then Gnet:=StrToFloat(BoxGNet.Text) else Gnet:=0;
  //Вычисляем вес нетто
  Net:=0;
  for I := 0 to ItmCnt - 1 do
    if Item[i].NetEI then Net:=Net+Item[i].Count/1000
      else Net:=Net+ModLst.GetNetByCode(Item[i].OrdName,Item[i].PosCode)*Item[i].Count;
  if BoxCount.Text<>'' then BCount:=StrToFloat(BoxCount.Text) else BCount:=1;
  if BCount=0 then BCount:=1;
  BoxNet.Text:=FormatFloat('##0.###',((GNet-Net)/BCount));
end;

procedure TCreateBoxForm.BitBtn2Click(Sender: TObject);
var
  i : integer;
  r : real;
  CanSave : boolean;
begin
  CanSave := true;
  if (BoxNumberEdit.Visible) then begin
    if Length(BoxNumberEdit.Text)=0 then begin
      MessageDlg('Box number is not set !', mtError, [mbOk], 0);
      CanSave := false;
    end;
    for I := 0 to ContLst.Count - 1 do
      if ContLst.ByInd(i).SearchBoxGroup(BoxNumberEdit.Text)<>nil then begin
        MessageDlg('Box number is not set !', mtError, [mbOk], 0);
        CanSave := false;
      end;
  end;

  if CanSave then try
    for I := 1 to BoxSG.RowCount - 1 do r:=StrToFloat(BoxSg.Cells[3,i]);
    r:=StrToFloat(BoxGNet.Text);
    if r>0 then self.ModalResult:=mrOk else MessageDlg(msgGNetEr,mtError,[mbOk],0);
  except
    BoxSg.Cells[3,i]:='0';
  end;

end;

procedure TCreateBoxForm.BoxCountKeyPress(Sender: TObject; var Key: Char);
begin
  if not((key in ['0'..'9'])or(ord(key)=13)or(ord(key)=8)or(ord(key)=46)or(key=',')) then
    begin
      beep;
      key:=#0;
    end;
end;

procedure TCreateBoxForm.BoxGnetKeyPress(Sender: TObject; var Key: Char);
begin
  if not((key in ['0'..'9'])or(key=',')or(ord(key)=13)or(ord(key)=8)or(ord(key)=46)) then
    begin
      beep;
      key:=#0;
    end;
end;

procedure TCreateBoxForm.BoxGNetKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  self.RecalcNet;
end;

procedure TCreateBoxForm.BoxNetKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  BNet,Net,BCount : real;
  i : integer;
begin
  if(BoxNet.Text<>'')then BNet:=StrToFloat(BoxNet.Text) else BNet:=0;
  //Вычисляем вес нетто
  Net:=0;
  for I := 0 to ItmCnt - 1 do
    if Item[i].NetEI then Net:=Net+Item[i].Count/1000
      else Net:=Net+ModLst.GetNetByCode(Item[i].OrdName,Item[i].PosCode)*Item[i].Count;
  BCount:=StrToFloat(BoxCount.Text);
  BoxGNet.Text:=FormatFloat('##0.###',(BNet*BCount+Net));
end;

procedure TCreateBoxForm.BoxNumberCheckClick(Sender: TObject);
begin
  BoxNumberEdit.Visible := BoxNumberCheck.Checked;
end;

procedure TCreateBoxForm.BoxSGKeyPress(Sender: TObject; var Key: Char);
begin
  if not((key in ['0'..'9'])or(key=',')or(ord(key)=13)or(ord(key)=8)or(ord(key)=46)) then
    begin
      beep;
      key:=#0;
    end;
end;

procedure TCreateBoxForm.BoxSGKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(BoxSG.Cells[3,BoxSG.Selection.Top])<>'' then
   Item[BoxSG.Selection.Top-1].Count:=StrToFloat(BoxSG.Cells[3,BoxSG.Selection.Top])
  else Item[BoxSG.Selection.Top-1].Count:=0;
  self.RecalcNet;
end;

procedure TCreateBoxForm.BoxSGSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  if ACol<>3 then
    begin
      BoxSG.Options:=BoxSG.Options-[goEditing];
      beep;
    end
    else
      BoxSG.Options:=BoxSG.Options+[goEditing];
end;

function TCreateBoxForm.ShowForm(var Items:array of TOneBoxItem; BCount,Cnt,Lng:integer;Gnet :real;var boxcode:string):integer;
var
  i   : Integer;
  Net : real;
begin
  self.UpDown1.Position:=BCount;
  BoxSG.Cells[0,0]  :=tOrgSGCol0 ;
  BoxSG.Cells[1,0]  :=tOrgSGCol1 ;
  BoxSG.Cells[3,0]  :=tOrgSGCol2 ;
  BoxSG.Cells[2,0]  :=tOrgSGCol3 ;
  BoxCountCap.Caption:=tBoxCountCap;
  BoxItmCap.Caption:=tBoxItmCap;
  BoxNetCap.Caption:=tBoxNetCap;
  BoxGnetCap.Caption:=tDtPnBoxGNetCap;
  BoxGNet.Text:=FormatFloat('##0.###',GNet);
  //
  ItmCnt:=Cnt;
  SetLength(Item,Cnt);
  for I := 0 to Cnt - 1 do Item[i]:=Items[i];
  //Вычисляем вес нетто
  Net:=0;
  for I := 0 to Cnt - 1 do
    if Item[i].NetEI then Net:=Net+Item[i].Count/1000
      else Net:=Net+ModLst.GetNetByCode(Item[i].OrdName,Item[i].PosCode)*Item[i].Count;
  BoxNet.Text :=FormatFloat('##0.###',((GNet-Net)/BCount));
  if boxcode<>'' then self.Caption:=tEditBoxCap+' "'+boxcode+'"' else self.Caption:=tCreateBoxCap;
  for I := 0 to Cnt - 1 do               
    begin
      BoxSG.RowCount:=i+2;
      BoxSG.Cells[0,i+1]:=IntTostr(i+1);
      BoxSG.Cells[1,i+1]:=ModLst.GetNameByCode(Lng,Items[i].OrdName,Items[i].PosCode);
      BoxSG.Cells[2,i+1]:=ModLst.GetEIByCode(Lng,Items[i].OrdName,Items[i].PosCode);
      BoxSG.Cells[3,i+1]:=FormatFloat('####0.####',Items[i].Count);
    end;
  BoxNumberCheck.Checked := false;
  BoxNumberEdit.Visible := false;
  BoxNumberEdit.Text := boxcode;

  result:=0;
  if Self.ShowModal=mrOk then
    begin
      for I := 0 to Cnt - 1 do Items[i].Count:=StrToFloat(BoxSG.Cells[3,i+1]);
      if (BoxNumberEdit.Visible) and (Length(BoxNumberEdit.Text)>0) then boxcode := BoxNumberEdit.Text;
      result:=StrToInt(BoxCount.Text);
    end;
end;


procedure TCreateBoxForm.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin
  self.RecalcNet;
end;

end.
