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
  USDtoRUB    : real=0; //курс RMB к доллару
  RUBtoRMB    : real=0; //курс рубля к RMB

function MyRound(fl : Real):Real;
begin
  //округление в ручную
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
      ExpField[1].rname :='Номер коробки';
      ExpField[1].ind   :=9;
      ExpField[2].rname:='BOM номер';
      ExpField[2].ind   :=13;
      ExpField[3].rname :='Рус наимен';
      ExpField[3].ind   :=1;
      ExpField[4].rname :='Анг наимен';
      ExpField[4].ind   :=2;
      ExpField[5].rname:='Кит наимен';
      ExpField[5].ind   :=11;
      ExpField[6].rname :='Ед измерения';
      ExpField[6].ind   :=3;
      ExpField[7].rname :='Кол-во';
      ExpField[7].ind   :=4;
      ExpField[8].rname :='Кол-во мест';
      ExpField[8].ind   :=5;
      ExpField[9].rname :='Нетто,кг';
      ExpField[9].ind   :=6;
      ExpField[10].rname :='Брутто,кг';
      ExpField[10].ind   :=7;
      ExpField[11].rname :='Объем, м куб';
      ExpField[11].ind   :=8;
      ExpField[12].rname :='Заказ';
      ExpField[12].ind   :=10;
      ExpField[13].rname:='Код по 1С';
      ExpField[13].ind   :=12;
      ExpField[14].rname:='Цена за ед FOB,USD';
      ExpField[14].ind   :=14;
      ExpField[15].rname:='Цена за ед Новорос,USD';
      ExpField[15].ind   :=15;
      ExpField[16].rname:='Цена за ед Ангарск,USD';
      ExpField[16].ind   :=16;
      ExpField[17].rname:='Код ТНВЭД';
      ExpField[17].ind  :=22;
      ExpField[18].rname:='Общ цена FOB,USD';
      ExpField[18].ind  :=17;
      ExpField[19].rname:='Общ цена Новорос,USD';
      ExpField[19].ind  :=18;
      ExpField[20].rname:='Общ цена Ангарск,USD';
      ExpField[20].ind  :=19;
      for i := 1 to MaxExpField do
        begin
          if i<12 then ExpField[i].write:=true else ExpField[i].write:=false;
        end;
    end;
  if mode=tmInvoice then
    begin
      MaxExpField:=19;
      ExpField[1].rname :='BOM номер';
      ExpField[1].ind   :=13;
      ExpField[2].rname :='Рус наимен';
      ExpField[2].ind   :=1;
      ExpField[3].rname :='Анг наимен';
      ExpField[3].ind   :=2;
      ExpField[4].rname :='Кит наимен';
      ExpField[4].ind   :=11;
      ExpField[5].rname :='Ед измерения';
      ExpField[5].ind   :=3;
      ExpField[6].rname :='Кол-во';
      ExpField[6].ind   :=4;
      ExpField[7].rname :='Код по 1С';
      ExpField[7].ind   :=12;
      ExpField[8].rname :='Цена за ед FOB,USD';
      ExpField[8].ind   :=14;
      ExpField[9].rname :='Цена за ед Новорос,USD';
      ExpField[9].ind   :=15;
      ExpField[10].rname:='Цена за ед Ангарск,USD';
      ExpField[10].ind  :=16;
      ExpField[11].rname:='Общ цена FOB,USD';
      ExpField[11].ind  :=17;
      ExpField[12].rname:='Общ цена Новорос,USD';
      ExpField[12].ind  :=18;
      ExpField[13].rname:='Общ цена Ангарск,USD';
      ExpField[13].ind  :=19;
      ExpField[14].rname:='Нетто,кг';
      ExpField[14].ind  :=6;
      ExpField[15].rname:='Брутто,кг';
      ExpField[15].ind  :=7;
      ExpField[16].rname:='Полные коробки,шт';
      ExpField[16].ind  :=20;
      ExpField[17].rname:='Неполные коробки,шт';
      ExpField[17].ind  :=21;
      ExpField[18].rname:='Код ТНВЭД';
      ExpField[18].ind  :=22;
      ExpField[19].rname:='Вид упаковки';
      ExpField[19].ind  :=23;
      for i := 1 to MaxExpField do
        begin
          if i<9 then ExpField[i].write:=true else ExpField[i].write:=false;
        end;
    end;
end;
//Настройка визуальных элементов закладок
procedure TExpContForm.MyUpdate(new:integer);
var
  i   : integer;
  str : string;
begin
  //Заполнение списка контейнеров
  if (new in [umAll,umContLSt]) then
    begin
      ContCbl.Items.Clear;
      for i := 0 to ContLst.Count - 1 do ContCbl.Items.Add(ContLst.Cont[i].Name);
      for I := 0 to ContCBL.Items.Count - 1 do ContCBL.Checked[i]:=true;
    end;
  //Заполнение списка полей для выбора выгружать/невыгружать
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
procedure TExpContForm.BBtnClick(Sender: TObject);
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
procedure TExpContForm.FbtnClick(Sender: TObject);
begin
  if NB.PageIndex<NB.Pages.Count-1 then
    begin
      if (NB.PageIndex=NB.Pages.Count-1)or(ModeRG.ItemIndex=2)
         then FBtn.Caption:='Готово' else FBtn.Caption:='Вперед >>';
      if (NB.PageIndex=1)and(ModeRG.ItemIndex=2) then
        begin
          //Режим выгрузки в 1С
          PrPanel.Visible:=true;

        end else
        begin
          //Выгрузки в виде инвойса или упаковочного
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
//Отметка в списке выгружаемых полей
procedure TExpContForm.FieldCBLClickCheck(Sender: TObject);
var
  i : integer;
begin
  for I := 0 to FieldCBL.Items.Count - 1 do ExpField[i+1].write:=FieldCBL.Checked[i];
end;
//Кнопки закладки сортировки  полей
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
//Кнопка выбора файла
procedure TExpContForm.SaveBtnClick(Sender: TObject);
begin
end;
//Инициализация формы и переменных
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
  FBtn.Caption:='Вперед >>';
  self.SetFieldLst(tmInvoice);
  MyUpdate(umAll);
  OrderCB.Items.Clear;
  for I := 0 to ModLst.Count - 1 do
    begin
      OrderCB.Items.Add(ModLst.Model[i].EngName);
      OrderCB.Checked[i]:=true;
    end;
end;


//------------------ Процедуры создания таблицы --------------------------------

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
  if self.ExpTo1C then ShowMessage('Выгрузка успешно завершена!')
            else  ShowMessage('Ошибка выгрузки!');
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
            1  {Рус наимен} : CDS.FieldByName(str).AsWideString:=ModLst.GetLongRusName(Item.OrdName,Item.PosCode);
            2  {Анг наимен} : CDS.FieldByName(str).AsWideString:=ModLst.GetNameByCode(lgENG,Item.OrdName,Item.PosCode);
            3  {Ед измер}   : CDS.FieldByName(str).AsWideString:=ModLst.GetEIByCode(Lang,Item.OrdName,Item.PosCode);
            4  {Кол-во}     : CDS.FieldByName(str).AsWideString:=FormatFloat('####0.0##',Item.Count);
            5  {Кол-во мест}: if j=0 then CDS.FieldByName(str).AsString:=FormatFloat('####0.0##',ContLst.Cont[c].Box[i].BoxCount)
                  else CDS.FieldByName(str).AsString:='';
            6  {Нетто}      : begin
                    if Item.NetEI then Buf:=MyRound(Item.Count/1000)
                      else Buf:=ModLst.GetNetByCode(Item.OrdName,Item.PosCode)*Item.Count;
//                    CDS.FieldByName(str).AsWideString:=FormatFloat('####0.0##',MyRound(Buf/1000)*1000);
                    CDS.FieldByName(str).AsWideString:=FormatFloat('####0.000',Buf);
                  end;
            7  {Брутто}     :
                  if Brutto=-1 then
                  begin
                    //Определяем вес нетто текущей позиции
                    if Item.NetEI then Buf:=MyRound(Item.Count/1000)
                      else Buf:=ModLst.GetNetByCode(Item.OrdName,Item.PosCode)*Item.Count;
                    //Суммируем веса нетто всех позиций
                    Buf1:=0;
                    for l := 0 to ContLst.Cont[c].Box[i].ItemCount-1 do
                      if ContLst.Cont[c].Box[i].Items[l].NetEI then
                        Buf1:=Buf1+MyRound(ContLst.Cont[c].Box[i].Items[l].Count/1000)
                      else
                        Buf1:=Buf1+ModLst.GetNetByCode(ContLst.Cont[c].Box[i].Items[l].OrdName,
                            ContLst.Cont[c].Box[i].Items[l].PosCode)*ContLst.Cont[c].Box[i].Items[l].Count;
                    //Вычисляем вес брутто текущей позиции по пропорции
                    if Buf1>0 then Buf:=(ContLst.Cont[c].Box[i].BNet/Buf1)*Buf else Buf:=0;
                    CDS.FieldByName(str).AsWideString:=FormatFloat('####0.000',Buf)
                    //CDS.FieldByName(str).AsWideString:=Floattostr(Buf)
                  end
                  else
                    CDS.FieldByName(str).AsWideString:=FormatFloat('####0.000',Brutto);
                    //CDS.FieldByName(str).AsWideString:=Floattostr(Brutto);
            8  {Объем}      : if j=0 then CDS.FieldByName(str).AsWideString:=FormatFloat('####0.0##',ContLst.Cont[c].Box[i].Vol)
                  else CDS.FieldByName(str).AsWideString:='';
            9  {Код коробки}: if j=0 then CDS.FieldByName(str).AsWideString:=ContLst.Cont[c].Box[i].BoxCode
                  else CDS.FieldByName(str).AsString:='';
            10 {Имя заказа} : CDS.FieldByName(str).AsWideString:=Item.OrdName;
            11 {Кит наимен} : CDS.FieldByName(str).AsWideString:=utf8decode(ModLst.GetNameByCode(lgCN,Item.OrdName,Item.PosCode));
            12 {Код 1С}     : CDS.FieldByName(str).AsWideString:=Item.PosCode;
            13 {BOM код}    : CDS.FieldByName(str).AsWideString:=ModLst.GetBOMByCode(Item.OrdName,Item.PosCode);
            14 {Цена}             : begin
                                    price:=ModLst.GetPriceByCode(0,item.OrdName,item.PosCode);
                                    if ExpContForm.CalcRMB.Checked then price:=price*USDtoRUB/RUBtoRMB;
                                    price:=round(price*10000)/10000;
                                    CDS.FieldByName(str).AsWideString:=FloatToStr(price);
                                    end;
            15 {Цена Новороссийск}: begin
                                    price:=ModLst.GetPriceByCode(1,item.OrdName,item.PosCode);
                                    if ExpContForm.CalcRMB.Checked then price:=price*USDtoRUB/RUBtoRMB;
                                    price:=round(price*10000)/10000;
                                    //price:=DecimalRoundExt(price,4,drHalfPos);
                                    CDS.FieldByName(str).AsWideString:=FloatToStr(price);
                                    end;
            16 {Цена Ангарск}     : begin
                                    price:=ModLst.GetPriceByCode(2,item.OrdName,item.PosCode);
                                    if ExpContForm.CalcRMB.Checked then price:=price*USDtoRUB/RUBtoRMB;
                                    price:=round(price*10000)/10000;
                                    CDS.FieldByName(str).AsWideString:=FloatToStr(price);
                                    end;
            17 {Общ по цене ФОБ} : begin
                    Buf:=roundto(ModLst.GetPriceByCode(0,Item.OrdName,Item.PosCode),-4);
                    if ExpContForm.CalcRMB.Checked then buf:=roundto(buf*USDtoRUB/RUBtoRMB,-4);
                    buf:=buf*Item.Count;
                    CDS.FieldByName(str).AsWideString:=FloatToStr(Buf);
                  end;
            18 {Общ по цене Новорос} : begin
                    Buf:=roundto(ModLst.GetPriceByCode(1,Item.OrdName,Item.PosCode),-4);
                    if ExpContForm.CalcRMB.Checked then buf:=roundto(buf*USDtoRUB/RUBtoRMB,-4);
                    buf:=buf*Item.Count;
                    CDS.FieldByName(str).AsWideString:=FloatToStr(Buf);
                  end;
            19 {Общ по цене Ангарск} : begin
                    Buf:=roundto(ModLst.GetPriceByCode(2,Item.OrdName,Item.PosCode),-4);
                    if ExpContForm.CalcRMB.Checked then buf:=roundto(buf*USDtoRUB/RUBtoRMB,-4);
                    buf:=buf*Item.Count;
                    CDS.FieldByName(str).AsWideString:=FloatToStr(Buf);
                  end;
            20 {Кол-во полных коробок} : begin
                    if FB>-1 then CDS.FieldByName(str).AsWideString:=IntToStr(FB)
                      else CDS.FieldByName(str).AsWideString:='';
                  end;
            21 {Кол-во частичных коробок} : begin
                    if HB>-1 then CDS.FieldByName(str).AsWideString:=IntToStr(HB)
                      else CDS.FieldByName(str).AsWideString:='';
                  end;
            22 {Код ТНВЭД}     : CDS.FieldByName(str).AsWideString:=ModLst.GetTnCodeByCode(Item.OrdName,Item.PosCode);
            23 {Вид упаковки}  : CDS.FieldByName(str).AsWideString:=ModLst.GetBoxTypeByCode(Item.OrdName,Item.PosCode);
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
  //для железнодорожного упаковосного
  BufCont               : TContr;
  NewBox                : TBox;
  PosCode               : string;
  num,ind               : integer;
begin
  //Если указан флаг пересчета в RMB запрашиваем курсы валют
  if CalcRMB.Checked then if not GetRate(USDtoRUB,RUBtoRMB) then Abort;
  //Создание таблицы с необходимым количеством полей
  CDS:=TClientDataSet.Create(self);
  for i := 1 to SortFieldCBL.Items.Count do
      CDS.FieldDefs.Add('Fld'+IntToStr(i),ftWideString,255);
  CDS.CreateDataSet;
  //Создание заголовка с именами столбцов
  for i := 1 to ExpContForm.SortFieldCBL.Items.Count do
      CDS.Fields[i-1].DisplayLabel:=ExpContForm.SortfieldCBL.Items[i-1];
  //Заполнение таблицы
  //Режим упаковочного листа
  if mode=tmPacing then begin
    for c := 0 to ContLst.Count - 1 do if self.ContWrite(c) then
    begin
      CDS.Append;
      CDS.FieldByName('Fld1').AsWideString:='Контейнер № '+ContLst.Cont[c].Name;
      CDS.Post;
      for I := 0 to ContLst.Cont[c].BoxCount-1 do
      for j := 0 to ContLst.Cont[c].Box[i].ItemCount-1 do
        begin
          Item:=ContLst.Cont[c].Box[i].Items[j];
          AddRow(CDS,item,j,c,i,-1,-1,-1);
        end;
      CDS.Append;
      CDS.FieldByName('Fld1').AsWideString:='Кол-во коробок: '+IntToStr(ContLst.Cont[c].TotBoxCnt);
      CDS.Post;
    end;
    Title:='Выгрузка в формате "упаковочный лист"';
    Res:='';
  end;
  //Режим инвойса
  if mode=tmInvoice then
    begin
      //Создание и заполнение таблицы кодов
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
      //Вставляем строку с номерами контейнеров
      str:='';
      for i := 0 to ExpContForm.ContCBL.Items.Count-1 do
        if ExpContForm.ContCBL.Checked[i] then str:=str+ExpContForm.ContCBL.Items[i]+', ';
      str:='Контейнеры: '+str;
      str:=copy(str,1,Length(str)-2);
      title:=str;
      //Пишем данные в порядке сортировки таблицы CodeCDS
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
              //Подсчитываем количество полных и частичных коробок
              //Составляем список кодов, входящих в коробку
              PosCodeLSt.Clear;
              for j := 0 to ContLst.Cont[c].Box[i].ItemCount-1 do
                begin
                  Fl:=false;
                  for k := 0 to PosCodeLst.Count-1 do
                      if PosCodeLst.Strings[k]=ContLst.Cont[c].Box[i].Items[j].PosCode then Fl:= true;
                  if not Fl then PosCodeLst.Add(ContLst.Cont[c].Box[i].Items[j].PosCode);
                end;
              //По составленному списку считаем количество коробок
              for j := 0 to PosCodeLst.Count - 1 do
                if PosCodeLst.Strings[j]=CodeCDS.FieldByName('Code').AsString then
                  begin
                    if PosCodeLst.Count=1 then FB:=FB+ContLst.Cont[c].Box[i].BoxCount
                      else HB:=HB+ContLst.Cont[c].Box[i].BoxCount;
                  end;
              // Подсчитываем общее количество и веса
              for j := 0 to ContLst.Cont[c].Box[i].ItemCount-1 do
                if ContLst.Cont[c].Box[i].Items[j].PosCode=CodeCDS.FieldByName('Code').AsString then
                  begin
                    //Получаем элемент
                    Item:=ContLst.Cont[c].Box[i].Items[j];
                    //Подсчитываем общее количество
                    Count:=Count+Item.Count;
                    //Брутто
                    //Определяем вес нетто текущей позиции
                    if Item.NetEI then Buf:=MyRound(Item.Count/1000)
                      else Buf:=ModLst.GetNetByCode(Item.OrdName,Item.PosCode)*Item.Count;
                    //Суммируем веса нетто всех позиций
                    Buf1:=0;
                    for l := 0 to ContLst.Cont[c].Box[i].ItemCount-1 do
                      if ContLst.Cont[c].Box[i].Items[l].NetEI then
                        Buf1:=Buf1+MyRound(ContLst.Cont[c].Box[i].Items[l].Count/1000)
                      else
                        Buf1:=Buf1+ModLst.GetNetByCode(ContLst.Cont[c].Box[i].Items[l].OrdName,
                            ContLst.Cont[c].Box[i].Items[l].PosCode)*ContLst.Cont[c].Box[i].Items[l].Count;
                    //Вычисляем вес брутто текущей позиции по пропорции
                    if Buf1>0 then Buf:=(ContLst.Cont[c].Box[i].BNet/Buf1)*Buf else Buf:=0;
                    Brutto:=Brutto+Buf;
                  end;
              end;
        Item.Count:=Count;
        AddRow(CDS,Item,-1,-1,-1,FB,HB,Brutto);
        CodeCDS.Next;
      end;
      res:='Всего '+IntToStr(BC)+' мест.';
      POsCodeLst.Destroy;
    end;
  //Режим упаковочного листа для ЖД
  if mode=tmTrain then begin
    //создаем буферный контейнер в котором будем все складывать
    num:=0; // нумератор коробок в буферном контейнере
    ind:=ContLst.NewCont('BUFFER',0,0);
    BufCont:=ContLst.Cont[ind];
    //проходим по всем коробкам "нормальных" контейнеров
    for c := 0 to ContLst.Count - 2 do if self.ContWrite(c) then
       for I := 0 to ContLst.Cont[c].BoxCount-1 do
        // если в коробке нескольок элементо переписываем в буфер как есть
        if ContLst.Cont[c].Box[i].ItemCount>1 then begin
          ind:=BufCont.AddBox(ContLst.Cont[c].Box[i]);
          inc(num);
          BufCont.Box[ind].BoxCode:=inttostr(num);
        end else begin
          //если в коробке один элемент пытаемся определить не было ли такого ранее
          ind:=0;
          while(ind<BufCont.BoxCount)and(not((BufCont.Box[ind].ItemCount=1)and
            (BufCont.Box[ind].Items[0].PosCode=ContLst.Cont[c].Box[i].Items[0].PosCode)))do inc(ind);
          //если одиночная коробка с таким элементом уже существет складываемся с ней
          if(ind<BufCont.BoxCount)and(BufCont.Box[ind].ItemCount=1)and
            (BufCont.Box[ind].Items[0].PosCode=ContLst.Cont[c].Box[i].Items[0].PosCode)then begin
              BufCont.Box[ind].BoxCount:= BufCont.Box[ind].BoxCount+ContLst.Cont[c].Box[i].BoxCount;
              BufCont.Box[ind].BNet:= BufCont.Box[ind].BNet+ContLst.Cont[c].Box[i].BNet;
              BufCont.Box[ind].Items[0].Count:= BufCont.Box[ind].Items[0].Count+ContLst.Cont[c].Box[i].Items[0].Count;
            end else begin
           //если ранее не записывались - записываемся 
              ind:=BufCont.AddBox(ContLst.Cont[c].Box[i]);
              inc(num);
              BufCont.Box[ind].BoxCode:=inttostr(num);
            end;
        end;
    //упаковочный по буферному контейнеру
    c:=ContLst.Count-1;
    for I := 0 to BufCont.BoxCount-1 do
      for j := 0 to BufCont.Box[i].ItemCount-1 do
        begin
          Item:=BufCont.Box[i].Items[j];
          AddRow(CDS,item,j,c,i,-1,-1,-1);
        end;
    Title:='Выгрузка в формате "упаковочный лист с объединениекм позиций"';
    Res:='';
    //ужаляем буферный контейнер
    ContLst.DelCont('BUFFER');
  end;
  //Даем ссылку на таблицу, загружаем отчет, уст заголовок
  PrUnit.PCDS:=@CDS;
  PrDm.frxReport1.LoadFromFile(AppPath+'ExpDataReport.fr3');
  PrDm.frxReport1.Variables['TITLE']:='''' + Title + '''';
  PrDm.frxReport1.Variables['RESULT']:='''' + Res + '''';
  //Подготавливаем отчет, показываем панель "Ждите"
  MsgPanel.Visible:=true;
  self.Refresh;
  PrDm.frxReport1.PrepareReport;
  MsgPanel.Visible:=false;
  //Показываем отчет
  PrDm.frxReport1.ShowPreparedReport;
  PrDm.frxReport1.Clear;
end;

//------------------ Выгрузка для 1С -------------------------------------------
function TExpContForm.ExpTo1C: boolean;
var
  i,j,k,ord  : integer;
  str  : string;
  Strs : TStringList;
  CDS  : TClientDataSet;
  price: real;
begin
  Result:=false;
  //создаем текстовый буфер
  Strs:=TstringList.Create;
  //Формируем первую строку: контейнера, заказы
  str:='Cont: ';
  for I := 0 to ContCBL.Count - 1 do if ContCBL.Checked[i] then Str:=str+ContCBL.Items[i]+',';
  delete(str,Length(str),1);
  str:=str+' orders: ';
  for I := 0 to OrderCB.Count - 1 do if OrderCB.Checked[i] then Str:=str+OrderCB.Items[i]+',';
  delete(str,Length(str),1);
  strs.Add(str);
  //создаем таблицу
  CDS:=TClientDataSet.Create(self);
  CDS.FieldDefs.Add('Code',ftString,255,true);
  CDS.FieldDefs.Add('Name',ftString,255,true);
  CDS.FieldDefs.Add('Qty',ftFloat,0,true);
  CDS.FieldDefs.Add('Price',ftFloat,0,true);
  CDS.CreateDataSet;
  //по списку заказов
  for ord := 0 to OrderCB.Items.Count - 1 do
    //если заказ выбран - по списку контейнеров
    if OrderCB.Checked[ord] then begin
      for I := 0 to ContCBL.Count - 1 do
        //если контейнер выбран - по списку коробок
        if ContCBL.Checked[i] then for j := 0 to ContLst.ByName(ContCBL.Items[i]).BoxCount - 1 do
          //по списку деталей в коробке
          for k := 0 to ContLst.ByName(ContCBL.Items[i]).Box[j].ItemCount - 1 do
            //если деталь из текущего заказа
            //заполняем таблицу деталями выбранного заказа из выбранных контейнеров
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
  //переписываем таблицу в текстовый буфер
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
  //удалям таблицу
  CDS.Free;
  //записываем текствый буфер в файл
  if saveDlg.Execute then
    begin
      strs.SaveToFile(SaveDlg.FileName);
      result:=true;
    end;
  Strs.Free;
end;

end.
