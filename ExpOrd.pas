unit ExpOrd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CheckLst, ExtCtrls, Buttons, DB, DBClient, Grids, DBGrids,
  jpeg, TntStdCtrls;

const
  umAll      =0;
  umContLst  =0;
  umFieldLst =1;
  umSortLst  =2;

type
  TExpField = record
    ind   : integer;
    rname : string;
    ename : string;
    write : boolean;
  end;

  TExpOrdForm = class(TForm)
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
    MsgPanel: TPanel;
    Label1: TLabel;
    procedure MovUpBtnClick(Sender: TObject);
    procedure MovDownBtnClick(Sender: TObject);
    procedure FieldCBLClickCheck(Sender: TObject);
    procedure BBtnClick(Sender: TObject);
    procedure FbtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Update(new:integer);
    procedure Table;
    function  GetFieldByName(name:string):TExpField;
    function  ContWrite(contind:integer):boolean;
    function  GetIndByName(name:string):integer;
    procedure SetFieldLst;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ExpOrdForm: TExpOrdForm;

implementation

{$R *.dfm}

uses TDataLst, TCont, LangUnit, PrUnit;

var
  ExpField    : array [1..30] of TExpField;
  MaxExpField : byte;

procedure TExpOrdForm.SetFieldLst;
var
  i : integer;
begin
      MaxExpField:=22;
      ExpField[1].rname  :='Рус наимен';
      ExpField[1].ind    :=1;
      ExpField[2].rname  :='Анг наимен';
      ExpField[2].ind    :=2;
      ExpField[3].rname  :='Ед измерения';
      ExpField[3].ind    :=3;
      ExpField[4].rname  :='Заказанное кол-во';
      ExpField[4].ind    :=4;
      ExpField[5].rname  :='BOM номер';
      ExpField[5].ind    :=5;
      ExpField[6].rname  :='Нетто,кг';
      ExpField[6].ind    :=6;
      ExpField[7].rname  :='Объем,м куб';
      ExpField[7].ind    :=7;
      ExpField[8].rname  :='Имя заказа';
      ExpField[8].ind    :=8;
      ExpField[9].rname  :='Кит наимен';
      ExpField[9].ind    :=9;
      ExpField[10].rname :='Код по 1С';
      ExpField[10].ind   :=10;
      ExpField[11].rname :='Цена за ед FOB,USD';
      ExpField[11].ind   :=11;
      ExpField[12].rname :='Цена за ед Новорос,USD';
      ExpField[12].ind   :=12;
      ExpField[13].rname :='Цена за ед Ангарск,USD';
      ExpField[13].ind   :=13;
      ExpField[14].rname :='Код ТНВЭД';
      ExpField[14].ind   :=14;
      ExpField[15].rname :='Вид упаковки';
      ExpField[15].ind   :=15;
      ExpField[16].rname:='Общ цена FOB,USD';
      ExpField[16].ind   :=16;
      ExpField[17].rname:='Общ цена Новорос,USD';
      ExpField[17].ind   :=17;
      ExpField[18].rname:='Общ цена Ангарск,USD';
      ExpField[18].ind   :=18;
      ExpField[19].rname:='Кол в кор (тек)';
      ExpField[19].ind  :=19;
      ExpField[20].rname:='Кол в кор (стар)';
      ExpField[20].ind  :=20;
      ExpField[21].rname:='Кол на 1 изд';
      ExpField[21].ind  :=21;
      ExpField[22].rname:='Загруж кол-во';
      ExpField[22].ind  :=22;
      for i := 1 to MaxExpField do
        begin
          if i<9 then ExpField[i].write:=true else ExpField[i].write:=false;
        end;
end;
//Настройка визуальных элементов закладок
procedure TExpOrdForm.Update(new:integer);
var
  i   : integer;
  str : string;
begin
  //Заполнение списка контейнеров
  if (new in [umAll,umContLSt]) then
    begin
      ContCbl.Items.Clear;
      for i := 0 to ModLst.Count - 1 do ContCbl.Items.Add(ModLst.Model[i].EngName);
      for I := 0 to ContCBL.Items.Count - 1 do ContCBL.Checked[i]:=true;
    end;
  //Заполнение списка полей для выбора выгружать/невыгружать
  if (new in [umAll,umFieldLst]) then
    begin
      self.SetFieldLst;
      FieldCBL.Items.Clear;
      for i := 1 to MaxExpField do
        begin
          str:=ExpField[i].rname;
          if str<>'' then FieldCBL.Items.Add(str);
        end;
      for I := 0 to FieldCBL.Items.Count - 1 do
        FieldCBL.Checked[i]:=self.GetFieldByName(FieldCBL.Items[i]).write;
    end;
  //Вывод списка полей для сортировки
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
//Кнопка Назад
procedure TExpOrdForm.BBtnClick(Sender: TObject);
begin
  if NB.PageIndex>0 then
    begin
      NB.PageIndex:=NB.PageIndex-1;
      FBtn.Enabled:=true;
      FBtn.Caption:='Вперед >>';
    end;
  if NB.PageIndex=0 then BBtn.Enabled:=false;
end;
//Кнопка Вперед
procedure TExpOrdForm.FbtnClick(Sender: TObject);
begin
  if NB.PageIndex<NB.Pages.Count-1 then
    begin
      NB.PageIndex:=NB.PageIndex+1;
      if NB.PageIndex=NB.Pages.Count-1 then FBtn.Caption:='Готово' else FBtn.Caption:='Вперед >>';
      BBtn.Enabled:=true;
      Update(NB.PageIndex);
    end else
      begin
        self.Table;
        self.Close;
      end;
end;
//Отметка в списке выгружаемых полей
procedure TExpOrdForm.FieldCBLClickCheck(Sender: TObject);
var
  i : integer;
begin
  for I := 0 to FieldCBL.Items.Count - 1 do ExpField[i+1].write:=FieldCBL.Checked[i];
end;
//Кнопки закладки сортировки  полей
procedure TExpOrdForm.MovUpBtnClick(Sender: TObject);
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

procedure TExpOrdForm.MovDownBtnClick(Sender: TObject);
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
//Инициализация формы и переменных
procedure TExpOrdForm.FormShow(Sender: TObject);
begin
  MsgPanel.Visible:=false;
  NB.PageIndex:=0;
  BBtn.Enabled:=false;
  FBtn.Enabled:=true;
  FBtn.Caption:='Вперед >>';
  self.SetFieldLst;
  Update(umAll);
end;


//------------------ Процедуры создания таблицы --------------------------------

function TExpOrdForm.GetIndByName(name:string):integer;
var
  i:integer;
begin
  for I := 1 to MaxExpField do
    if (ExpField[i].rname=name)or(ExpField[i].ename=name) then result:=i;
end;

function TExpOrdForm.ContWrite(contind:integer):boolean;
var
  i : integer;
begin
  result:=false;
  for i := 0 to ContCBL.Items.Count-1 do
    if ((ContCBL.Items[i]=ModLst.Model[contind].EngName)and(ContCBL.Checked[i]=true)) then result:=true;
end;

function TExpOrdForm.GetFieldByName(name:string):TExpField;
var
  i:integer;
begin
  for I := 1 to MaxExpField do
    if (ExpField[i].rname=name)or(ExpField[i].ename=name) then result:=ExpField[i];
end;

procedure AddRow (var CDS : TClientDataSet; OrdName : string; Item : TOnePos; Count,LoadCount : real);
var
  k,FldInd   : integer;
  str        : string;
begin
  CDS.Append;
  for k := 1 to ExpOrdForm.SortFieldCBL.Items.Count do
    begin
      str:='Fld'+IntToStr(k);
      fldind:=ExpOrdForm.GetFieldByName(ExpOrdForm.SortfieldCBL.Items[k-1]).ind;
      case fldind of
            1  {Рус наимен}    : CDS.FieldByName(str).AsWideString:=Item.RName;
            2  {Анг наимен}    : CDS.FieldByName(str).AsWideString:=Item.EName;
            3  {Ед измер}      : CDS.FieldByName(str).AsWideString:=ModLst.GetEIByCode(Lang,OrdName,Item.Code);
            4  {Заказ кол-во}  : CDS.FieldByName(str).AsWideString:=FormatFloat('####0.0######',Count);
            5  {BOM код}       : CDS.FieldByName(str).AsWideString:=Item.BOM;
            6  {Нетто}         : CDS.FieldByName(str).AsWideString:=FormatFloat('####0.0######',Item.Net);
            7  {Объем}         : CDS.FieldByName(str).AsWideString:=FormatFloat('####0.0######',Item.Vol);
            8  {Имя заказа}    : CDS.FieldByName(str).AsWideString:=OrdName;
            9  {Кит наимен}    : CDS.FieldByName(str).AsWideString:=utf8decode(ModLst.GetNameByCode(lgCN,OrdName,Item.Code));
            10 {Код 1С}        : CDS.FieldByName(str).AsWideString:=Item.Code;
            11 {Цена}          : CDS.FieldByName(str).AsWideString:=FormatFloat('####0.0######',item.Price);
            12 {Цена Новорос}  : CDS.FieldByName(str).AsWideString:=FormatFloat('####0.0######',item.PriceN);
            13 {Цена Ангарск}  : CDS.FieldByName(str).AsWideString:=FormatFloat('####0.0######',item.PriceA);
            14 {Код ТНВЭД}     : CDS.FieldByName(str).AsWideString:=Item.TNCode;
            15 {Вид упаковки}  : CDS.FieldByName(str).AsWideString:=Item.BoxType;
            16 {Общ цена ФОБ}  : CDS.FieldByName(str).AsWideString:=FormatFloat('####0.0######',Item.Price*Count);
            17 {Общ цена Нов}  : CDS.FieldByName(str).AsWideString:=FormatFloat('####0.0######',Item.PriceN*Count);
            18 {Общ цена Анг}  : CDS.FieldByName(str).AsWideString:=FormatFloat('####0.0######',Item.PriceA*Count);
            19 {Кол в кор(тек)}: CDS.FieldByName(str).AsWideString:=FormatFloat('####0',Item.CntInBox);
            20 {Кол в кор(сар)}: CDS.FieldByName(str).AsWideString:=FormatFloat('####0',Item.CIBOld);
            21 {Кол в издел}   : CDS.FieldByName(str).AsWideString:=FormatFloat('####0.0######',Item.CntInOne);
            22 {Загруж кол-во} : CDS.FieldByName(str).AsWideString:=FormatFloat('####0.0######',LoadCount);
          end;
    end;
  CDS.Post;
end;

procedure TExpOrdForm.Table;
var
  CDS                   : TClientDataSet;
  c,d,i                 : integer;
  Item                  : TOnePos;
  CodeCDS               : TClientDataSet;
  Count                 : real;
  LoadCount             : real;
  str,title             : string;
begin
  //Создание таблицы с необходимым количеством полей
  CDS:=TClientDataSet.Create(self);
  for i := 1 to SortFieldCBL.Items.Count do
      CDS.FieldDefs.Add('Fld'+IntToStr(i),ftWideString,255);
  CDS.CreateDataSet;
  //Создание заголовка с именами столбцов
  for i := 1 to ExpOrdForm.SortFieldCBL.Items.Count do
      CDS.Fields[i-1].DisplayLabel:=ExpOrdForm.SortfieldCBL.Items[i-1];
  //Заполнение таблицы
  //Создание и заполнение таблицы кодов
  CodeCDS:=TClientDataSet.Create(self);
  CodeCDS.FieldDefs.Add('Code',ftString,20);
  CodeCDS.FieldDefs.Add('RName',ftString,255);
  CodeCDS.FieldDefs.Add('OrdID',ftInteger,0);
  CodeCDS.FieldDefs.Add('ItmID',ftInteger,0);
  CodeCDS.CreateDataSet;
  CodeCDS.IndexFieldNames:='RName';
  for c := 0 to ModLst.Count - 1 do
    if self.ContWrite(c) then
        for I := 0 to ModLst.Model[c].Count-1 do
              begin
                Item:=ModLst.Model[c].item[i];
                if CodeCDS.Locate('Code',Item.Code,[])=false  then
                  begin
                    CodeCDS.Append;
                    CodeCDS.FieldByName('Code').AsString:=Item.Code;
                    CodeCDS.FieldByName('RName').AsString:=Item.RName;
                    CodeCDS.FieldByName('OrdID').AsInteger:=c;
                    CodeCDS.FieldByName('ItmID').AsInteger:=i;
                  end;
              end;
  //Вставляем строку с именами заказов
  str:='';
  for i := 0 to ExpOrdForm.ContCBL.Items.Count-1 do
        if ExpOrdForm.ContCBL.Checked[i] then str:=str+ExpOrdForm.ContCBL.Items[i]+', ';
  str:='Заказы: '+str;
  str:=copy(str,1,Length(str)-2);
  title:=str;
  //Пишем данные в порядке сортировки таблицы CodeCDS
  CodeCDS.First;
  for d := 0 to CodeCDS.RecordCount-1 do
    begin
      //Подсчитываем общее заказанное количество
      Count:=0;
      for c := 0 to ModLst.Count - 1 do
        if self.ContWrite(c) then
          for I := 0 to ModLst.Model[c].Count-1 do
            if ModLst.Model[c].Item[i].Code=CodeCDS.FieldByName('Code').AsString then
              begin
                Item:=ModLst.Model[c].Item[i];
                Count:=Count+Item.TotCount;
              end;
      //Подсчитываем общее загруженное количество
      LoadCount:=0;
      for c := 0 to ModLst.Count - 1 do
        if self.ContWrite(c) then
          for I := 0 to ModLst.Model[c].Count-1 do
            if ModLst.Model[c].Item[i].Code=CodeCDS.FieldByName('Code').AsString then
              begin
                Item:=ModLst.Model[c].Item[i];
                LoadCount:=LoadCount+ContLst.PosCount(ModLst.Model[c].EngName,Item.Code);
              end;
      c:=CodeCDS.FieldByName('OrdID').AsInteger;
      i:=CodeCDS.FieldByName('ItmID').AsInteger;
      AddRow(CDS, ModLst.Model[c].EngName, ModLst.Model[c].Item[i],Count,LoadCount);
      CodeCDS.Next;
    end;
  //Даем ссылку на таблицу, загружаем отчет, уст заголовок
  PrUnit.PCDS:=@CDS;
  PrDm.frxReport1.LoadFromFile(AppPath+'ExpDataReport.fr3');
  PrDm.frxReport1.Variables['TITLE']:='''' + Title + '''';
  //PrDm.frxReport1.Variables['RESULT']:='''' + Res + '''';
  //Подготавливаем отчет, показываем панель "Ждите"
  MsgPanel.Visible:=true;
  self.Refresh;
  PrDm.frxReport1.PrepareReport;
  MsgPanel.Visible:=false;
  //Показываем отчет
  PrDm.frxReport1.ShowPreparedReport;
  PrDm.frxReport1.Clear;
end;

end.
