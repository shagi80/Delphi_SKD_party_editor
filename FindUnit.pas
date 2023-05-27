unit FindUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, ExtCtrls, Buttons;

type
  TFindForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    ED: TEdit;
    Cbtn: TButton;
    NameBtn: TButton;
    BomBtn: TButton;
    SG: TStringGrid;
    RG: TRadioGroup;
    OkBtn: TBitBtn;
    CanBtn: TBitBtn;
    ENameBtn: TButton;
    procedure CanBtnClick(Sender: TObject);
    procedure OkBtnClick(Sender: TObject);
    procedure ENameBtnClick(Sender: TObject);
    procedure SGDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure CbtnClick(Sender: TObject);
    procedure BomBtnClick(Sender: TObject);
    procedure NameBtnClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Find(md:byte);
    procedure MyShow;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FindForm: TFindForm;

implementation

{$R *.dfm}

uses TDataLst, LangUnit, TCont, sdimain;

procedure TFindForm.FormResize(Sender: TObject);
var
  i,w : integer;
begin
  w:=0;
  for I := 0 to SG.ColCount-1 do w:=w+SG.ColWidths[i];
  w:=w-SG.ColWidths[4]-SG.ColWidths[5];
  SG.ColWidths[4]:=round((SG.ClientWidth-w-10)/2);
  SG.ColWidths[5]:=SG.ClientWidth-w-SG.ColWidths[4]-8;
end;

procedure TFindForm.SGDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  H    : integer;
  s    : string;
  Flag : Cardinal;
  Rct  : TRect;
begin
   if(Sender as TStringGrid).Enabled then
    begin
      s := (Sender as TStringGrid).Cells[Acol,Arow];
      Rct:=Rect;
      Flag := DT_LEFT;
      Flag := Flag or DT_WORDBREAK;
      (Sender as TStringGrid).Canvas.FillRect(Rect);
      Inc(Rct.Left,3);
      Dec(Rct.Right,3);
      H:=DrawText((Sender as TStringGrid).Canvas.Handle,PChar(s),length(s),Rct,Flag);
      if H>(Sender as TStringGrid).RowHeights[Arow] then (Sender as TStringGrid).RowHeights[Arow]:=H;
    end;
end;

procedure TFindForm.CanBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TFindForm.CbtnClick(Sender: TObject);
begin
 Find(4);
end;

procedure TFindForm.ENameBtnClick(Sender: TObject);
begin
  Find(2);
end;

procedure TFindForm.NameBtnClick(Sender: TObject);
begin
  Find(1);
end;

procedure TFindForm.OkBtnClick(Sender: TObject);
var
  ARow : integer;
begin
  if (SG.Enabled) then
    begin
      ARow:=SG.Selection.Top;
      sdiappform.FindInOrd(self.SG.Cells[1,ARow],self.SG.Cells[3,Arow]);
    end;
end;

procedure TFindForm.BomBtnClick(Sender: TObject);
begin
  Find(3);
end;

procedure TFindForm.Find(md: Byte);
var
  i,j,k : integer;
  Find  : boolean;
  str   : string;
begin
  find:=false;
  SG.Enabled:=true;
  k:=1;
  for J:=0 to ModLst.Count-1 do
    for i:=0 to ModLst.Model[j].Count-1 do
        begin
          case md of
            1: str:=ModLst.Model[j].Item[i].RName;
            2: str:=ModLst.Model[j].Item[i].EName;
            3: str:=ModLst.Model[j].Item[i].BOM;
            4: str:=ModLst.Model[j].Item[i].Code;
          end;
          if ((RG.ItemIndex=0)and(pos(AnsiUpperCase(ED.Text),AnsiUpperCase(str))=1))or
             ((RG.ItemIndex=1)and(pos(AnsiUpperCase(ED.Text),AnsiUpperCase(str))<>0))  then
            begin
              SG.RowCount:=k+1;
              SG.Cells[1,k]:=ModLst.Model[j].engname;
              SG.Cells[2,k]:=ModLst.Model[j].Item[i].BOM;
              SG.Cells[3,k]:=ModLst.Model[j].Item[i].Code;
              SG.Cells[4,k]:=ModLst.Model[j].Item[i].RName;
              SG.Cells[5,k]:=ModLst.Model[j].Item[i].EName;
              SG.Cells[6,k]:=TranslateEI(ModLst.Model[j].Item[i].EI);
              SG.Cells[7,k]:=FormatFloat('####0.###',ModLst.Model[j].Item[i].TotCount);
              inc(k);
              Find:=true;
            end;
        end;
  if Find=false then
      begin
        SG.RowCount:=2;
        for I := 0 to SG.ColCount - 1 do SG.Cells[i,1]:='';
        SG.Enabled:=false;
        if lang=lgRUS then MessageDlg('Деталь не найдена!',mtError,[mbOk],0);
        if (lang=lgENG)or(Lang=lgCn) then MessageDlg('Detail not find!',mtError,[mbOk],0);
      end;
  self.FormResize(self);
end;

procedure  TFindForm.MyShow;
var
  i : integer;
begin
  if Lang=lgRus then
    begin
      self.Caption:='Поиск детали в заказе';
      RG.Items.Clear;
      RG.Items.Add('в начале');
      RG.Items.Add('везде');
      NameBtn.Caption:='Рус назв';
      ENameBtn.Caption:='Анг назв';
      BomBtn.Caption:='BOM';
      CBtn.Caption:='Код 1С';
      OkBtn.Caption:='Показать';
      CanBtn.Caption:='Закрыть';
      SG.Cells[1,0]:=' Имя заказа';
      SG.Cells[2,0]:=' BOM код';
      SG.Cells[3,0]:=' Код по 1С';
      SG.Cells[4,0]:=' Рус наименование';
      SG.Cells[5,0]:=' Анг наименование';
      SG.Cells[6,0]:=' Ед';
      SG.Cells[7,0]:=' Заказ';
    end;
  if (Lang=lgEng)or(Lang=lgCn) then
    begin
      self.Caption:='Find detail in order';
      RG.Items.Clear;
      RG.Items.Add('at first');
      RG.Items.Add('anywhere');
      NameBtn.Caption:='Rus name';
      ENameBtn.Caption:='Eng name';
      BomBtn.Caption:='BOM';
      CBtn.Caption:='1C code';
      OkBtn.Caption:='Show';
      CanBtn.Caption:='Close';
      SG.Cells[1,0]:=' Ord name';
      SG.Cells[2,0]:=' BOM code';
      SG.Cells[3,0]:=' 1C code';
      SG.Cells[4,0]:=' Rus name';
      SG.Cells[5,0]:=' Eng name';
      SG.Cells[6,0]:=' Unt';
      SG.Cells[7,0]:=' Ord qty';
    end;
  ED.Text:='';
  RG.ItemIndex:=0;
  SG.RowCount:=2;
  for I := 0 to SG.ColCount - 1 do SG.Cells[i,1]:='';
  SG.Enabled:=false;
  self.Show;
end;

end.
