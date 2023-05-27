unit ImportFromKlass;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ComCtrls, ToolWin, ExtCtrls, StdCtrls, Buttons;

type
  TImportFromExcelForTurkei = class(TForm)
    BottomPanel: TPanel;
    MainPanel: TPanel;
    table: TStringGrid;
    checkButton: TBitBtn;
    topPanel: TPanel;
    infoLabel: TLabel;
    pasteButton: TSpeedButton;
    clearButton: TSpeedButton;
    createBoxButton: TBitBtn;
    delRowButton: TSpeedButton;
    procedure pasteButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure checkButtonClick(Sender: TObject);
    function CheckRow(row : integer):integer;
    procedure clearButtonClick(Sender: TObject);
    procedure createBoxButtonClick(Sender: TObject);
    procedure delRowButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ImportFromExcelForTurkei: TImportFromExcelForTurkei;

function ImportDataFromKlass(currentOrder, currentContainer : string): boolean;

implementation

{$R *.dfm}

uses ClipBrd, TDataLst, TCont;

var
  orderName, contName : string;


function ImportDataFromKlass(currentOrder, currentContainer : string): boolean;
begin
  orderName := currentOrder;
  contName := currentContainer;
  ImportFromExcelForTurkei.infoLabel.Caption := 'Attention: curent order is "'+
    orderName + '", curent container is "' + contName + '"';
  ImportFromExcelForTurkei.ShowModal
end;

function TImportFromExcelForTurkei.CheckRow(row : integer):integer;
var
  bom, code : string;
  res : integer;
  count : real;
begin
  bom := table.Cells[3,row];
  code := ModLst.GetCodeByBOM(orderName,bom);
  res := 2;
  if (Length(bom)>0)and(Length(code)>0) then begin
    res := 0;
    try
      count := StrToFloat(table.Cells[7,row]);
      if ContLst.ByName(contName).SearchBoxGroup(table.Cells[1,row])<>nil then res := 3;
    except
      res := 1;
    end;
  end;
  result := res;
end;

procedure TImportFromExcelForTurkei.clearButtonClick(Sender: TObject);
var
  row : integer;
begin
  for row := 1 to table.RowCount - 1 do table.Rows[row].Clear;
  table.RowCount := 50;
  createBoxButton.Enabled := false;
  checkButton.Enabled := false;
end;

procedure TImportFromExcelForTurkei.createBoxButtonClick(Sender: TObject);
var
  row, boxInd, itemInd, mode : integer;
  NewBox : TOneBoxItem;
  Item : TOnePos;
  Box : TBox;
begin
  for row := 1 to table.RowCount - 1 do begin
    mode := CheckRow(row);
    if (mode=0)or(mode=3) then begin
      itemInd:= ModLst.GetIndByBOM(orderName, table.Cells[3,row]);
      if itemInd>=0 then begin
        item := ModLst.Model[ModLst.IndByName(orderName)].Item[itemInd];
        NewBox.OrdName:=orderName;
        NewBox.PosCode:=Item.Code;
        NewBox.Count:= StrToFloat(table.Cells[7,row]);
        NewBox.NetEI:=Item.NetEI;
        if mode=0 then begin
          boxInd:=ContLst.ByName(contName).NewGroup(1,NewBox,true,0, table.Cells[1,row]);
          //ShowMessage('Create box '+ table.Cells[1,row] +' for part ' + table.Cells[3,row] + ' = ' + Item.CName);
          ContLst.ByName(contName).Box[boxInd].BNet:=Item.GNet;
        end;
        if mode=3 then begin
          Box := ContLst.ByName(contName).SearchBoxGroup(table.Cells[1,row]);
          //ShowMessage('Add in box '+ table.Cells[1,row] +' part ' + table.Cells[3,row] + ' = ' + Item.CName);
          Box.AddInBox(NewBox);
        end;
      end;
    end;
  end;
end;

procedure TImportFromExcelForTurkei.delRowButtonClick(Sender: TObject);
var
  row : integer;
begin
  if table.Selection.Top>0 then
    If MessageDlg('Do you really want to delete a row ' + inttostr(table.Selection.Top) + ' ?', mtConfirmation, [mbYes,mbCancel], 0) = mrYes then
      if table.RowCount>2 then begin
        for row := table.Selection.Top to table.RowCount - 2 do
          table.Rows[row] := table.Rows[row+1];
        table.RowCount := table.RowCount-1;
      end else begin
        table.Rows[1].Clear;
        createBoxButton.Enabled := false;
        checkButton.Enabled := false;
      end;
end;

procedure TImportFromExcelForTurkei.checkButtonClick(Sender: TObject);
var
  row : integer;
  text : string;
  notFound, dataError, duplicateBox : integer;
begin
  notfound := 0;
  dataError := 0;
  duplicateBox := 0;
  for row := 1 to table.RowCount - 1 do begin
    case CheckRow(row) of
      0 : table.Cells[10,row] := 'OK';
      1 : begin
        table.Cells[10,row] := 'Can not convert "AÇIKLAMA" to number';
        inc(dataError);
      end;
      2 : begin
        table.Cells[10,row] := 'Not found in the order';
        inc(notFound)
      end;
      3 : begin
        table.Cells[10,row] := 'Duplicate box number';
        inc(duplicateBox);
      end;
    end;
  end;
  if (notFound>0)or(dataError>0)or(duplicateBox>0) then begin
    text := '';
    if (notFound>0)then text := 'Not found in orders ' + inttostr(notFound) + ' parts';
    if (dataError>0) then begin
      if Length(text)>0 then text:=text + chr(13);
      text:=text + 'Can not convert "AÇIKLAMA" to number for ' + inttostr(dataError) + ' row';
    end;
    if (duplicateBox>0) then begin
      if Length(text)>0 then text:=text + chr(13);
      text:=text + 'Duplicate box number for ' + inttostr(duplicateBox) + ' rows';
    end;
    text := 'Warning!' + chr(13) + text;
    MessageDlg(text, mtWarning, [mbOk], 0)
  end else
    MessageDlg('Done. There are no errors.', mtInformation, [mbOk], 0);
  createBoxButton.Enabled := true;
end;

procedure TImportFromExcelForTurkei.FormShow(Sender: TObject);
begin
  table.Cells[1,0]:='KUTU NO';
  table.Cells[2,0]:='KOD NO';
  table.Cells[3,0]:='YARIMAMÜL KODU';
  table.Cells[4,0]:='YARIMAMÜL ADI';
  table.Cells[5,0]:='BR';
  table.Cells[6,0]:='TOPLAM MİKTAR';
  table.Cells[7,0]:='AÇIKLAMA';
  table.Cells[8,0]:='SANDIK NO';
  table.Cells[9,0]:='AĞIRLIK';
  table.Cells[10,0]:='RESULT';
  self.clearButtonClick(self);
end;

procedure TImportFromExcelForTurkei.pasteButtonClick(Sender: TObject);
var
  c,r,s,i :integer;
  buf : TStringList;
  str : string;
  EOR : boolean;
begin
  Clipboard.Open;
  if Length(Clipboard.AsText)>0 then begin
    buf:=TstringList.Create;
    buf.Text:=Clipboard.AsText;
    table.RowCount:=buf.Count+1;
    r:=1;
    if r<1 then r:=1;    
    s:=0;
    while (r<table.RowCount)and(s<buf.Count) do begin
      EOR:=false;
      table.Cells[0,r]:=inttostr(r);
      c:=1;
      if c<1 then c:=1;
      while(c<table.ColCount)and(not EOR)do begin
        i:= pos(#9,buf[s]);
        if (i<>0) then begin
          str:=copy(buf[s],1,i-1);
          buf[s]:= copy(buf[s],i+1,MaxInt);
        end else begin
          str:=buf[s];
          EOR:=true;
        end;
        table.Cells[c,r]:=str;
        inc(c);
      end;
      inc(r);
      inc(s);
    end;
    buf.Free;
  end else MessageDlg('Invalid clipboard format !',mtError,[mbok],0);
  Clipboard.Close;
  checkButton.Enabled := true;
end;

end.
