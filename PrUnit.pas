unit PrUnit;

interface

uses
  windows, SysUtils, Classes,
  DB, DBClient, Types, Math, ComCtrls,
  Dialogs, frxClass, frxDesgn, frxDBSet, frxBarcode, frxRich, frxExportXLS,
  frxExportPDF, frxExportODF, frxCross;

const
  CNFName = 'CNName.txt';

type
  TPrDM = class(TDataModule)
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    frxDBDataset2: TfrxDBDataset;
    DataSource1: TDataSource;
    frxXLSExport1: TfrxXLSExport;
    frxPDFExport1: TfrxPDFExport;
    frxODSExport1: TfrxODSExport;
    frxODTExport1: TfrxODTExport;
    frxCrossObject1: TfrxCrossObject;
    procedure frxReport1BeforePrint(Sender: TfrxReportComponent);
    procedure PrintCngList(Strs:TStringList);
    procedure PrintOrder(OrdName:string;Lan: integer);
    procedure PrintContList(ContName:string;Lan: integer);
    procedure PrintContTabl(ContName:string; All:boolean);
    procedure SaveAll(Fname:string);
    procedure LoadAll(Fname:string);
    function ExtractFileNameEx(FileName: string; ShowExtension: Boolean): string;
    function ExtractFileEx(FileName: string): string;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PrDM        : TPrDM;
  FileName    : string;
  AppPath     : string;
  PCDS        : ^TClientDataSet;

implementation

{$R *.dfm}

uses LangUnit,TCont,TDataLst,about;


procedure TPrDM.frxReport1BeforePrint(Sender: TfrxReportComponent);
var
  Cross: TfrxCrossView;
  i, j: Integer;
begin
  if (Sender is TfrxCrossView) then
  begin
    Cross := TfrxCrossView(Sender);
    PCDS.First;
    for i := 0 to PCDS^.RecordCount-1 do
      begin
      for j := 0 to PCDS^.FieldCount-1 do
          Cross.AddValue([i],[PCDS^.Fields[j].DisplayLabel],[PCDS^.Fields[j].AsWideString]);
      PCDS.Next;
      end;
  end;
end;

function TPrDm.ExtractFileEx(FileName: string): string;
//Функция возвращает имя файла, без или с его расширением.
//ВХОДНЫЕ ПАРАМЕТРЫ
//FileName - имя файла, которое надо обработать
//ShowExtension - если TRUE, то функция возвратит короткое имя файла
// (без полного пути доступа к нему), с расширением этого файла, иначе, возвратит
  // короткое имя файла, без расширения этого файла.
var
  I: Integer;
  S, S1: string;
begin
  //Определяем длину полного имени файла
  I := Length(FileName);
  //Если длина FileName <> 0, то
  if I <> 0 then
  begin
    //С конца имени параметра FileName ищем символ "\"
    while (FileName[i] <> '\') and (i > 0) do
      i := i - 1;
    // Копируем в переменную S параметр FileName начиная после последнего
    // "\", таким образом переменная S содержит имя файла с расширением, но без
    // полного пути доступа к нему
    S := Copy(FileName, i + 1, Length(FileName) - i);
    i := Length(S);
    //Если полученная S = '' то фукция возвращает ''
    if i = 0 then
    begin
      Result := '';
      Exit;
    end;
    //Иначе, получаем имя файла без расширения
    while (S[i] <> '.') and (i > 0) do
      i := i - 1;
    //... и сохраням это имя файла в переменную s1
    S1 := Copy(S, 1, i - 1);
    //если s1='' то , возвращаем s1=s
    if s1 = '' then
      s1 := s;
    delete(s,1,Length(s1)+1);
    Result := s
  end
    //Иначе функция возвращает ''
  else
    Result := '';
end;

function TPrDm.ExtractFileNameEx(FileName: string; ShowExtension: Boolean): string;
//Функция возвращает имя файла, без или с его расширением.
//ВХОДНЫЕ ПАРАМЕТРЫ
//FileName - имя файла, которое надо обработать
//ShowExtension - если TRUE, то функция возвратит короткое имя файла
// (без полного пути доступа к нему), с расширением этого файла, иначе, возвратит
  // короткое имя файла, без расширения этого файла.
var
  I: Integer;
  S, S1: string;
begin
  //Определяем длину полного имени файла
  I := Length(FileName);
  //Если длина FileName <> 0, то
  if I <> 0 then
  begin
    //С конца имени параметра FileName ищем символ "\"
    while (FileName[i] <> '\') and (i > 0) do
      i := i - 1;
    // Копируем в переменную S параметр FileName начиная после последнего
    // "\", таким образом переменная S содержит имя файла с расширением, но без
    // полного пути доступа к нему
    S := Copy(FileName, i + 1, Length(FileName) - i);
    i := Length(S);
    //Если полученная S = '' то фукция возвращает ''
    if i = 0 then
    begin
      Result := '';
      Exit;
    end;
    //Иначе, получаем имя файла без расширения
    while (S[i] <> '.') and (i > 0) do
      i := i - 1;
    //... и сохраням это имя файла в переменную s1
    S1 := Copy(S, 1, i - 1);
    //если s1='' то , возвращаем s1=s
    if s1 = '' then
      s1 := s;
    //Если было передано указание функции возвращать имя файла с его
    // расширением, то Result = s,
    //если без расширения, то Result = s1
    if ShowExtension = TRUE then
      Result := s
    else
      Result := s1;
  end
    //Иначе функция возвращает ''
  else
    Result := '';
end;

procedure TPrDm.PrintCngList(Strs:TStringList);
var
  CDS : TClientDataSet;
  i   : integer;
begin
  //
  CDS:=TClientDataSet.Create(self);
  CDS.FieldDefs.Add('Fld1',ftString,3);
  CDS.FieldDefs.Add('Fld2',ftString,255);
  CDS.CreateDataSet;

  for I := 0 to Strs.Count - 1 do
    begin
      CDS.Append;
      CDS.FieldByName('Fld1').AsString:=IntToStr(i+1);
      CDS.FieldByName('Fld2').AsString:=Strs[i];
      CDS.Post;
    end;
  frxDBDataSet2.DataSet:=CDS;
  frxReport1.LoadFromFile(AppPath+'CngLstReport.fr3');
  frxReport1.Variables['TITLE']:=''''+'файл "'+self.ExtractFileNameEx(FileName,false)+'"'+ '''';
  frxReport1.ShowReport(true);
  frxReport1.Clear;
  CDS.Destroy;
end;

procedure TPrDm.PrintOrder(OrdName:string;Lan: integer);
var
  CDS : TClientDataSet;
  i   : integer;
  Ord : TDataList;
  Pos : TonePos;
  Bal : real;
  str : string;
begin
  //
  CDS:=TClientDataSet.Create(self);
  for i := 1 to 15 do
    begin
      str:='Fld'+IntToStr(i);
      if (lang=lgCN)and(i=4) then
        CDS.FieldDefs.Add(str,ftWideString,255)
        else
        CDS.FieldDefs.Add(str,ftString,255);
    end;
  CDS.CreateDataSet;
  Ord:=ModLst.Model[ModLst.IndByName(OrdName)];
  for I := 0 to Ord.Count - 1 do
    begin
      Pos:=Ord.Item[i];
      CDS.Append;
      CDS.FieldByName('Fld1').AsString:=IntToStr(i+1);
      CDS.FieldByName('Fld2').AsString:=Pos.BOM;
      CDS.FieldByName('Fld3').AsString:=Pos.Code;
      if Lang=lgCN then
        CDS.FieldByName('Fld4').AsWideString:=utf8decode(ModLst.GetNameByCode(Lang,OrdName,Pos.Code))
        else
        CDS.FieldByName('Fld4').AsString:=ModLst.GetNameByCode(Lang,OrdName,Pos.Code);
      CDS.FieldByName('Fld5').AsString:=ModLst.GetEIByCode(Lang,OrdName,Pos.Code);
      CDS.FieldByName('Fld6').AsString:=FormatFloat('####0.0##',Pos.TotCount);
      Bal:=ContLst.PosCount(OrdName,Pos.Code);
      CDS.FieldByName('Fld7').AsString:=FormatFloat('####0.0##',Bal);
      Bal:=Bal-Pos.TotCount;
      if Bal>0 then CDS.FieldByName('Fld8').AsString:='+'+FormatFloat('####0.0##',Bal);
      if Bal<0 then CDS.FieldByName('Fld8').AsString:=FormatFloat('####0.0##',Bal);
      CDS.FieldByName('Fld9').AsString:=IntToStr(Pos.CIBOld)+'/'+IntToStr(Pos.CntInBox);
      CDS.Post;
    end;
  frxDBDataSet2.DataSet:=CDS;
  frxReport1.LoadFromFile(AppPath+'OrderLstReport.fr3');
  frxReport1.Variables['TITLE']:='''' +OrdName+'('+self.ExtractFileNameEx(FileName,false)+')'+ '''';
  frxReport1.ShowReport(true);
  frxReport1.Clear;
  CDS.Destroy;
end;

procedure TPrDm.PrintContList(ContName:string;Lan: integer);
var
  TCDS : TClientDataSet;
  CDS  : TClientDataSet;
  i,j,k: integer;
  Item : TOneBoxItem;
  Price: real;
  str  : string;
begin
  //
  TCDS:=TClientDataSet.Create(self);
  for i := 1 to 5 do
    begin
      str:='Fld'+IntToStr(i);
      TCDS.FieldDefs.Add(str,ftString,255);
    end;
  TCDS.CreateDataSet;
  for I := 0 to ContLst.ByName(ContName).BoxCount-1 do
    begin
      TCDS.Append;
      TCDS.FieldByName('Fld1').AsString:=ContLst.ByName(ContName).Box[i].BoxCode;
      TCDS.Post;
    end;
  //
  CDS:=TClientDataSet.Create(self);
  for i := 1 to 18 do
    begin
      str:='Fld'+IntToStr(i);
      if(i=13) then
        CDS.FieldDefs.Add(str,ftWideString,255)
        else
        CDS.FieldDefs.Add(str,ftString,255);
    end;
  CDS.CreateDataSet;
  //
  for I := 0 to ContLst.ByName(ContName).BoxCount-1 do
  for j := 0 to ContLst.ByName(ContName).Box[i].ItemCount-1 do
    begin
      Item:=ContLst.ByName(ContName).Box[i].Items[j];
      CDS.Append;
      {01}CDS.FieldByName('Fld1').AsString:=ContLst.ByName(ContName).Box[i].BoxCode;
      {02}CDS.FieldByName('Fld2').AsString:=IntToStr(j+1);
      {03}CDS.FieldByName('Fld3').AsString:=Item.OrdName;
      {04}CDS.FieldByName('Fld4').AsString:=Item.PosCode;
      {05}CDS.FieldByName('Fld5').AsString:=ModLst.GetBOMByCode(Item.OrdName,Item.PosCode);
      {06}CDS.FieldByName('Fld6').AsString:=ModLst.GetNameByCode(LgRus,Item.OrdName,Item.PosCode);
      {07}CDS.FieldByName('Fld7').AsString:=ModLst.GetEIByCode(Lang,Item.OrdName,Item.PosCode);
      {08}CDS.FieldByName('Fld8').AsString:=FormatFloat('####0.0##',Item.Count);
      {09}if j=0 then CDS.FieldByName('Fld9').AsString:=FormatFloat('####0.0##',ContLst.ByName(ContName).Box[i].BoxCount)
        else CDS.FieldByName('Fld9').AsString:='';
      {10}if j=0 then CDS.FieldByName('Fld10').AsString:=FormatFloat('####0.0##',ContLst.ByName(ContName).Box[i].Net)
        else CDS.FieldByName('Fld10').AsString:='';
      {11}if j=0 then CDS.FieldByName('Fld11').AsString:=FormatFloat('####0.0##',ContLst.ByName(ContName).Box[i].BNet)
        else CDS.FieldByName('Fld11').AsString:='';
      {12}Price:=Item.Count*ModLst.GetPriceByCode(0,Item.OrdName,Item.PosCode);
          CDS.FieldByName('Fld12').AsString:=FormatFloat('####0.0##',Price);
      {13}CDS.FieldByName('Fld13').AsWideString:=UTF8Decode(ModLst.GetNameByCode(LgCN,Item.OrdName,Item.PosCode)) ;
      {14}CDS.FieldByName('Fld14').AsString:=(ModLst.GetNameByCode(LgEng,Item.OrdName,Item.PosCode)) ;
      {15}if j=0 then CDS.FieldByName('Fld15').AsString:=ContLst.ByName(ContName).Box[i].BoxCode
        else CDS.FieldByName('Fld15').AsString:='';
      {16-18}if j=0 then
       if (ContLst.ByName(ContName).Box[i].BoxCount)/50>1 then
        begin
          str:='';
          for k := 1 to (ContLst.ByName(ContName).Box[i].BoxCount div 50)do str:=str+'[] ';
          if str<>'' then CDS.FieldByName('Fld16').AsString:='For 50 ctns : '+str else CDS.FieldByName('Fld16').AsString:='';
          str:='';
          for k := 1 to ((ContLst.ByName(ContName).Box[i].BoxCount-(ContLst.ByName(ContName).Box[i].BoxCount div 50)*50) div 10) do str:=str+'[] ';
          if str<>'' then CDS.FieldByName('Fld17').AsString:='For 10 ctns : '+str else CDS.FieldByName('Fld17').AsString:='';
          str:='';
          for k := 1 to (ContLst.ByName(ContName).Box[i].BoxCount-((ContLst.ByName(ContName).Box[i].BoxCount div 10)*10)) do str:=str+'[] ';
          if str<>'' then CDS.FieldByName('Fld18').AsString:='For one ctn : '+str else CDS.FieldByName('Fld18').AsString:='';
        end
        else
          if (ContLst.ByName(ContName).Box[i].BoxCount)/10>1 then
            begin
              str:='';
              for k := 1 to (ContLst.ByName(ContName).Box[i].BoxCount div 10)do str:=str+'[] ';
              if str<>'' then CDS.FieldByName('Fld16').AsString:='For 10 ctns : '+str else CDS.FieldByName('Fld16').AsString:='';
              str:='';
              for k := 1 to (ContLst.ByName(ContName).Box[i].BoxCount mod 10)do str:=str+'[] ';
              if str<>'' then CDS.FieldByName('Fld17').AsString:='For one ctn : '+str else CDS.FieldByName('Fld17').AsString:='';
              CDS.FieldByName('Fld18').AsString:='';
            end
          else
            begin
              str:='';
              for k := 1 to(ContLst.ByName(ContName).Box[i].BoxCount)do str:=str+'[] ';
              if str<>'' then CDS.FieldByName('Fld16').AsString:='For one ctn : '+str else CDS.FieldByName('Fld16').AsString:='';
              CDS.FieldByName('Fld17').AsString:='';
              CDS.FieldByName('Fld18').AsString:='';
            end
            else
            begin
              CDS.FieldByName('Fld16').AsString:='';
              CDS.FieldByName('Fld17').AsString:='';
              CDS.FieldByName('Fld18').AsString:='';
            end;
      CDS.Post;
    end;
  DataSource1.DataSet:=TCDS;
  CDS.IndexFieldNames:='Fld1';
  CDS.MasterFields:='Fld1';
  CDS.MasterSource:=DataSource1;
  frxDBDataSet1.DataSet:=TCDS;
  frxDBDataSet2.DataSet:=CDS;
  frxReport1.LoadFromFile(AppPath+'ContLstReport.fr3');
  frxReport1.Variables['TITLE']:='''' + 'CONTAINER: '+ContName+'  ('+self.ExtractFileNameEx(FileName,false)+')' + '''';
  frxReport1.ShowReport(true);
  frxReport1.Clear;
  TCDS.Destroy;
  CDS.Destroy;
end;

procedure TPrDm.PrintContTabl(ContName:string; All: boolean);
var
  TCDS          : TClientDataSet;
  CDS           : TClientDataSet;
  i,j,k,BoxQty,s1,s2,co  : integer;
  Item          : TOneBoxItem;
  ItemNet       : real;
  str,bk        : string;
begin
  //
  TCDS:=TClientDataSet.Create(self);
  for i := 1 to 5 do
    begin
      str:='Fld'+IntToStr(i);
      TCDS.FieldDefs.Add(str,ftString,255);
    end;
  TCDS.CreateDataSet;
  //
  CDS:=TClientDataSet.Create(self);

  for i := 1 to 15 do
    begin
      str:='Fld'+IntToStr(i);
      if (i=5) then
        CDS.FieldDefs.Add(str,ftWideString,255)
        else
        CDS.FieldDefs.Add(str,ftString,255);
    end;
  CDS.CreateDataSet;

  //
  for I := 0 to ContLst.ByName(ContName).BoxCount-1 do
  if (all)or(ContLst.ByName(ContName).Box[i].Sel) then
  for k := 0 to ContLst.ByName(ContName).Box[i].BoxCount - 1 do
    begin
      str:=ContLst.ByName(ContName).Box[i].BoxCode;
      str:=str+'-'+FormatFloat('000',(K+1))+'/'+FormatFloat('000',(ContLst.ByName(ContName).Box[i].BoxCount));
      BoxQty:= ContLst.ByName(ContName).Box[i].BoxCount;
      TCDS.Append;
      TCDS.FieldByName('Fld1').AsString:= str;
      TCDS.FieldByName('Fld2').AsString:=FormatFloat('####0.0##',ContLst.ByName(ContName).Box[i].Net/BoxQty);
      TCDS.FieldByName('Fld3').AsString:=FormatFloat('####0.0##',ContLst.ByName(ContName).Box[i].BNet/BoxQty);
      bk:=ContLst.ByName(ContName).Box[i].BoxCode;
      //Формируем штрих-код, первый символ - номер версии

      bk:=copy(self.ExtractFileNameEx(FileName,false),1,7)+bk+FormatFloat('000',(K+1))+FormatFloat('000',(BoxQty));
      //bk:=bk+inttostr(co);
      //bk:=bk+'0';

      TCDS.FieldByName('Fld4').AsString:=bk;
      TCDS.Post;

      for j := 0 to ContLst.ByName(ContName).Box[i].ItemCount-1 do
        begin
          Item:=ContLst.ByName(ContName).Box[i].Items[j];
          CDS.Append;
          CDS.FieldByName('Fld1').AsString:=str;
          CDS.FieldByName('Fld3').AsString:=Item.PosCode;
          CDS.FieldByName('Fld2').AsString:=ModLst.GetBOMByCode(Item.OrdName,Item.PosCode);
          CDS.FieldByName('Fld4').AsString:=ModLst.GetNameByCode(lgRus,Item.OrdName,Item.PosCode);
          CDS.FieldByName('Fld5').AsWideString:=UTF8Decode(ModLst.GetNameByCode(lgCn,Item.OrdName,Item.PosCode)) ;
          //ShowMessage(UTF8Encode(CDS.FieldByName('Fld5').AsWideString));
          CDS.FieldByName('Fld7').AsString:=ModLst.GetEIByCode(Lang,Item.OrdName,Item.PosCode);
          CDS.FieldByName('Fld6').AsString:=FormatFloat('####0.0##',Item.Count/BoxQty);
          if Item.NetEI then ItemNet:=Item.Count/1000
            else ItemNet:=ModLst.GetNetByCode(item.OrdName,item.PosCode)*Item.Count/BoxQty;
          CDS.FieldByName('Fld8').AsString:=FormatFloat('####0.0##',ItemNet);
          CDS.FieldByName('Fld9').AsWideString:=ModLst.GetNameByCode(lgEng,Item.OrdName,Item.PosCode);
          CDS.Post;
        end;
    end;
  DataSource1.DataSet:=TCDS;
  CDS.IndexFieldNames:='Fld1';
  CDS.MasterFields:='Fld1';
  CDS.MasterSource:=DataSource1;
  frxDBDataSet1.DataSet:=TCDS;
  frxDBDataSet2.DataSet:=CDS;
  frxReport1.LoadFromFile(AppPath+'ContBageReport.fr3');
  //str:=self.ExtractFileNameEx(FileName,false)+' ('+ContName+')';
  str:=self.ExtractFileNameEx(FileName,false);
  frxReport1.Variables['PINUMBER']:='''' + str + '''';
  frxReport1.Variables['VER']:='''' + AboutBox.Copyright.Caption + '''';
  frxReport1.Variables['TITLE']:='''' + 'Container: '+ContName+'  ('+self.ExtractFileNameEx(FileName,false)+')' + '''';
  frxReport1.ShowReport(true);
  frxReport1.Clear;
  TCDS.Destroy;
  CDS.Destroy;
end;

procedure TPrDm.SaveAll(Fname: string);
var
  i,j,k        : integer;
  str          : string;
  Strs         : TStringList;
  ModItm       : TOnePos;
  BoxItm       : TOneBoxItem;
begin
  Strs:=TStringList.Create;
  Strs.Add(IntToStr(ModLst.Count));
  for I := 0 to ModLst.Count - 1 do
    begin
      Strs.Add(ModLst.Model[i].EngName);
      Strs.Add(IntToStr(ModLst.Model[i].Count));
      for j := 0 to ModLst.Model[i].Count - 1 do
        begin
          ModItm:=ModLst.Model[i].Item[j];
          str:='"'+IntToStr(ModItm.Num)+'",';
          str:=str+'"'+ModItm.Code+'",';
          str:=str+'"'+ModItm.BOM+'",';
          str:=str+'"'+ModItm.RName+'",';
          str:=str+'"'+ModItm.LRName+'",';
          str:=str+'"'+ModItm.EName+'",';
          str:=str+'"'+Formatfloat('####0.########',ModItm.CntInOne)+'",';
          str:=str+'"'+ModItm.EI+'",';
          str:=str+'"'+Formatfloat('####0.########',ModItm.Net)+'",';
          str:=str+'"'+Formatfloat('####0.########',ModItm.Vol)+'",';
          str:=str+'"'+IntToStr(ModItm.CntInBox)+'",';
          str:=str+'"'+ModItm.BarCode+'",';
          str:=str+'"'+Formatfloat('####0.########',ModItm.TotCount)+'",';
          str:=str+'"'+Formatfloat('####0.########',ModItm.GNet)+'",';
          str:=str+'"'+Formatfloat('####0.########',ModItm.Price)+'",';
          str:=str+'"'+Formatfloat('####0.########',ModItm.PriceN)+'",';
          str:=str+'"'+Formatfloat('####0.########',ModItm.PriceA)+'",';
          if ModItm.sel then str:=str+'"true",' else str:=str+'"false",';
          if ModItm.NetEI then str:=str+'"true",' else str:=str+'"false",';
          str:=str+'"'+IntToStr(ModItm.CIBOld)+'",';
          str:=str+'"'+ModItm.CName+'",';
          str:=str+'"'+ModItm.TNCode+'",';
          str:=str+'"'+ModItm.BoxType+'"';
          Strs.Add(str);
        end;
    end;
  Strs.Add(IntToStr(ContLst.Count));
  Strs.Add(IntToStr(ContLst.LastBoxInd));
  for I := 0 to ContLst.Count - 1 do
    begin
      str:='"'+ContLst.Cont[i].Name+'",';
      str:=str+'"'+FormatFloat('###0.###',ContLst.Cont[i].MaxVol)+'",';
      str:=str+'"'+FormatFloat('###0.###',ContLst.Cont[i].MaxNet)+'"';
      Strs.Add(str);
      Strs.Add(IntToStr(ContLst.Cont[i].BoxCount));
      for j := 0 to ContLst.Cont[i].BoxCount - 1 do
        begin
          str:='"'+IntToStr(ContLst.Cont[i].Box[j].BoxCount)+'",';
          if ContLst.Cont[i].Box[j].Group then str:=str+'"true",' else str:=str+'"false",';
          str:=str+'"'+FormatFloat('####0.###',ContLst.Cont[i].Box[j].BNet)+'",';
          str:=str+'"'+ContLst.Cont[i].Box[j].BoxCode+'",';
          if ContLst.Cont[i].Box[j].Sel then str:=str+'"true",' else str:=str+'"false"';
          Strs.Add(str);
          Strs.Add(IntToStr(ContLst.Cont[i].Box[j].ItemCount));
          for k := 0 to ContLst.Cont[i].Box[j].ItemCount - 1 do
            begin
              BoxItm:=ContLst.Cont[i].Box[j].Items[k];
              str:='"'+BoxItm.OrdName+'",';
              str:=str+'"'+BoxItm.PosCode+'",';
              if BoxItm.NetEI then str:=str+'"true",' else str:=str+'"fasle",';
              str:=str+'"'+FormatFloat('#####0.######',BoxItm.Count)+'",';
              str:=str+'"'+FormatFloat('#####0.######',ModLst.GetNetByCode(BoxItm.OrdName,BoxItm.PosCode))+'",';
              str:=str+'"'+FormatFloat('#####0.######',ModLst.GetVolByCode(BoxItm.OrdName,BoxItm.PosCode))+'",';
              str:=str+'"'+IntToStr(BoxItm.RowInd)+'",';
              Strs.Add(str);
            end;
        end;
    end;
  if UpperCase(self.ExtractFileEx(fname))='OCT' then
  begin
  //Записываем список строк в поток
 {FileStream :=TFileStream.Create(FName,fmCreate or fmOpenWrite or fmShareDenyNone);
  Writer := TWriter.Create(FileStream, $FF);
  Writer.WriteListBegin;
  for I := 0 to strs.Count - 1 do
    for j := 1 to Length(Strs[i]) do
      begin
        p:=addr(Strs[i][j]);
        writer.Write(k,sizeof(char));
      end;
    //Writer.WriteString(Strs[i]);
  Writer.WriteListEnd;
  Writer.Destroy;
  FileStream.Destroy; }
  {assignfile(f,fname);
  rewrite(f);
  for I := 0 to strs.Count - 1 do
    begin
    for j := 1 to Length(Strs[i]) do
      begin
        fstr:=FormatFloat('000',ord(Strs[i][j]));
        write(f,fstr);
      end;
      writeln(f);
    end;
  closefile(f); }
  end;
  if UpperCase(self.ExtractFileEx(fname))='TXT' then
  begin
    strs.SaveToFile(fname);
  end;
end;

procedure TPrDM.LoadAll(Fname: string);
var
  i,j,s,k,l,MC,MIC,CC,BC,IC : integer;
  str,fstr : string;
  Strs   : TStringList;
  Model  : TDataList;
  Cont   : TContr;
  ModItm : TOnePos;
  Box    : TBox;
  BoxItm : TOneBoxItem;
  F      : TextFile;

function GetSubStr(ind:integer; str:string):string;
var
  j,k,s,e  : integer;
  open     : boolean;
  res      : string;
begin
  k:=0;
  j:=1;
  open:=false;
  while ((j<=Length(str))and(k<(Ind-1))) do
    begin
      if (str[j]='"')then
        if open then open:=false else open:=true;
      if (str[j]=',')and(open=false)then inc(k);
      inc(j);
    end;
  s:=j;
  j:=s;
  open:=false ;
  while ((j<=Length(str))and(k<Ind)) do
    begin
      if (str[j]='"')then
        if open then open:=false else open:=true;
      if (str[j]=',')and(open=false)then inc(k);
      inc(j);
    end;
  e:=j;
  res:=copy(str,s,(e-s));
  if Length(res)<1 then res:='0';
  if res[1]='"' then res:=copy(res,2,MaxInt);
  if res[Length(res)]=',' then res:=copy(res,1,Length(res)-1);
  if res[Length(res)]='"' then res:=copy(res,1,Length(res)-1);
  result:=res;
end;

function StrToReal(str:string):real;
var
  s       : string;
  ind,l,r : integer;
begin
  ind:=0;
  if (pos(',',str)<>0)or(pos('.',str)<>0) then
    begin
      if pos(',',str)<>0 then ind:=pos(',',str);
      if pos('.',str)<>0 then ind:=pos('.',str);
      s:=copy(str,1,ind-1);
      l:=StrToInt(s);
      s:=copy(str,ind+1,maxint);
      r:=StrToInt(s);
      result:=l+r/power(10,Length(str)-ind);
    end
    else result:=StrToFloat(str);
end;

begin
  Strs:=TStringList.Create;
  if (UpperCase(self.ExtractFileEx(fname))='OCT') then
  begin
  assignfile(f,fname);
  reset(f);
  while not EoF(f) do
    begin
    str:='';
    while not EoLn(f) do
      begin
        read(f,fstr);
        str:=str+char(StrToInt(fstr));
      end;
      readln(f);
      strs.Add(str);
    end;
  closefile(f);
  end;
  if UpperCase(self.ExtractFileEx(fname))='TXT' then
  begin
    Strs.LoadFromFile(fname);
  end;
  //работаем со списком строк
  s:=0; MC:=StrToInt(Strs[s]);
  for I := 0 to MC - 1 do
    begin
      Model:=TDataList.Create;
      inc(s); Model.EngName:=Strs[s];
      inc(s); MIC:=StrToInt(Strs[s]);
      for j := 0 to MIC - 1 do
        begin
          inc(s); str:=Strs[s];
          ModItm.Num:=StrToInt(GetSubStr(1,str));
          ModItm.Code:=GetSubStr(2,str);
          ModItm.BOM:=GetSubStr(3,str);
          ModItm.RName:=GetSubStr(4,str);
          ModItm.LRName:=GetSubStr(5,str);
          if GetSubStr(6,str)<>'0' then ModItm.EName:=GetSubStr(6,str)
            else ModItm.EName:='no english name';
          ModItm.CntInOne:=StrToReal(GetSubStr(7,str));
          ModItm.EI:=GetSubStr(8,str);
          ModItm.Net:=StrToReal(GetSubStr(9,str));
          ModItm.Vol:=StrToReal(GetSubStr(10,str));
          ModItm.CntInBox:=StrToInt(GetSubStr(11,str));
          ModItm.BarCode:=GetSubStr(12,str);
          ModItm.TotCount:=StrToReal(GetSubStr(13,str));
          ModItm.GNet:=StrToReal(GetSubStr(14,str));
          ModItm.Price:=StrToReal(GetSubStr(15,str));
          ModItm.PriceN:=StrToReal(GetSubStr(16,str));
          //showmessage(str+chr(13)+ GetSubStr(17,str));
          ModItm.PriceA:=StrToReal(GetSubStr(17,str));
          if GetSubStr(18,str)='true' then ModItm.sel:=true else ModItm.sel:=false;
          if GetSubStr(19,str)='true' then ModItm.NetEI:=true else ModItm.NetEI:=false;
          ModItm.CIBOld:=StrToInt(GetSubStr(20,str));
          if GetSubStr(21,str)<>'0' then ModItm.CName:=(GetSubStr(21,str))
            else ModItm.CName:='';
          if GetSubStr(22,str)<>'0' then ModItm.TNCode:=GetSubStr(22,str)
            else ModItm.CName:='';
          if GetSubStr(23,str)<>'0' then ModItm.BoxType:=GetSubStr(23,str)
            else ModItm.CName:='';
          //для устранения бага с признаком весовой единицы
          if ((ModItm.EI='Г')or(ModItm.EI='г')or(ModItm.EI='кг')or(ModItm.EI='КГ'))
            and(ModItm.NetEI=false) then ModItm.NetEI:=true;
          Model.Add(ModItm);
        end;
        ModLst.Add(Model);
    end;
  inc(s); CC:=StrToInt(Strs[s]);
  inc(s); ContLst.LastBoxInd:=StrToInt(strs[s]);
  for I := 0 to CC - 1 do
    begin
      inc(s); str:=Strs[s];
      Cont:=TContr.Create;
      Cont.Name:=GetSubStr(1,str);
      Cont.MaxVol:= StrToReal(GetSubStr(2,str));
      Cont.MaxNet:= StrToReal(GetSubStr(3,str));
      inc(s); BC:=StrToInt(Strs[s]);
      for j := 0 to BC - 1 do
        begin
          inc(s); str:=strs[s];
          Box:=TBox.Create;
          Box.BoxCount:=StrToInt(GetSubStr(1,str));
          if GetSubStr(2,str)='true' then Box.Group:=true else Box.Group:=false;
          Box.BNet:=StrToReal(GetSubStr(3,str));
          Box.BoxCode:=(GetSubStr(4,str));
          if GetSubStr(5,str)='true' then Box.Sel:=true else Box.Sel:=false;
          inc(s); IC:=StrToInt(Strs[s]);
          for k := 0 to IC - 1 do
            begin
              inc(s); str:=strs[s];
              BoxItm.OrdName:=GetSubStr(1,str);
              BoxItm.PosCode:=GetSubStr(2,str);
              if GetSubStr(3,str)='true' then BoxItm.NetEI:=true else BoxItm.NetEI:=false;
              BoxItm.Count:=StrToReal(GetSubStr(4,str));
              BoxItm.RowInd:=StrToInt(GetSubStr(7,str));
              //для устранения бага с признаком весовой единицы
              for l := 0 to ModLst.Model[ModLst.IndByName(BoxItm.OrdName)].Count - 1 do
                  if (ModLst.Model[ModLst.IndByName(BoxItm.OrdName)].Item[l].Code=BoxItm.PosCode)
                      and(ModLst.Model[ModLst.IndByName(BoxItm.OrdName)].Item[l].NetEI) then
                      BoxItm.NetEI:=ModLst.Model[ModLst.IndByName(BoxItm.OrdName)].Item[l].NetEI;
              Box.AddInBox(BoxItm);
            end;
          Cont.AddBox(Box);
        end;
      ContLst.AddCont(Cont);
    end;
end;

end.
