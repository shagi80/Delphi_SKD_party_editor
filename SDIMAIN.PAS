
unit SDIMAIN;

interface

uses Windows, Classes, Graphics, Forms, Controls, Menus,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, ImgList, StdActns,
  ActnList, ToolWin, Tabs, Grids, SysUtils, jpeg,Messages, DB, DBClient, DBGrids,
  TntStdCtrls, TntDBGrids, TntGrids, Mask, ImportFromKlass;

type
  TSDIAppForm = class(TForm)
    OpenDlg: TOpenDialog;
    ActionList1: TActionList;
    FileNew1: TAction;
    FileOpen1: TAction;
    FileSave1: TAction;
    FileSaveAs1: TAction;
    FileExit1: TAction;
    EditCut1: TEditCut;
    EditCopy1: TEditCopy;
    EditPaste1: TEditPaste;
    HelpAbout1: TAction;
    StatusBar: TStatusBar;
    ImgLst: TImageList;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    FileNewItem: TMenuItem;
    FileOpenItem: TMenuItem;
    FileSaveItem: TMenuItem;
    FileSaveAsItem: TMenuItem;
    N1: TMenuItem;
    FileExitItem: TMenuItem;
    Help1: TMenuItem;
    HelpAboutItem: TMenuItem;
    Panel1: TPanel;
    LoadPN: TPanel;
    DataPn: TPanel;
    DtPnBomCap: TLabel;
    Image1: TImage;
    DtPnCIOCap: TLabel;
    DtPnEICap: TLabel;
    DtPnBom: TLabel;
    DtPnCIO: TLabel;
    DtPnEI: TLabel;
    DtPnNetCap: TLabel;
    DtPnVolCap: TLabel;
    DtPnCIBCap: TLabel;
    DtPnNet: TLabel;
    DtPnCIB: TLabel;
    DtPnVol: TLabel;
    actOpenOrd: TAction;
    actDelOrd: TAction;
    DtPnBarCap: TLabel;
    DtPnBar: TLabel;
    DtPnTCCap: TLabel;
    DtPnTC: TLabel;
    DtPnLCCap: TLabel;
    DtPnLC: TLabel;
    Panel5: TPanel;
    LoadPnCap: TLabel;
    ToolBar2: TToolBar;
    ContCreateBtn: TToolButton;
    LoadSGDelContBtn: TToolButton;
    ContTbs: TTabSet;
    ContrDtPn: TPanel;
    ContVol: TLabel;
    ContNet: TLabel;
    MaxContNetCap: TLabel;
    MaxContVolCap: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    MaxContNet: TLabel;
    MaxContVol: TLabel;
    RealContNetCap: TLabel;
    RealContVolCap: TLabel;
    actNewCont: TAction;
    miSet: TMenuItem;
    actSetRUS: TAction;
    actSetENG: TAction;
    LOrdPn: TPanel;
    MPn: TPanel;
    AutoLoadBtn: TSpeedButton;
    Bevel1: TBevel;
    CrBoxBtn: TSpeedButton;
    OrdSelImg: TImage;
    DelBoxBtn: TSpeedButton;
    DelItmBtn: TSpeedButton;
    CrItmBtn: TSpeedButton;
    LPn: TPanel;
    Panel2: TPanel;
    OrdPnCap: TLabel;
    ToolBar1: TToolBar;
    OrdOpenBtn: TToolButton;
    DelOrdBtn: TToolButton;
    OrdPn: TPanel;
    OrdTbs: TTabSet;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    actMaxLoadPn: TAction;
    CIBED: TEdit;
    BNETED: TEdit;
    LoadSGEdBtn: TToolButton;
    ToolButton4: TToolButton;
    Bevel3: TBevel;
    actDelCont: TAction;
    DtPnPriceCap: TLabel;
    DtPnPrice: TLabel;
    OrdPrintBtn: TToolButton;
    PrintContLstBtn: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    UnSelAllBtn: TToolButton;
    InvSelBtn: TToolButton;
    SelAllBtn: TToolButton;
    ToolButton11: TToolButton;
    SaveDlg: TSaveDialog;
    InvNumPanel: TPanel;
    miPswrd: TMenuItem;
    miLang: TMenuItem;
    actSetENG2: TMenuItem;
    actSetRUS2: TMenuItem;
    actPswrd: TAction;
    movBoxBtn: TToolButton;
    ChContDtBtn: TToolButton;
    FindInContBtn: TToolButton;
    ToolButton1: TToolButton;
    FindInOrdBtn: TToolButton;
    RealContNNetCap: TLabel;
    RealBoxCount: TLabel;
    ContBox: TLabel;
    ContNNet: TLabel;
    FindBtn: TToolButton;
    DtEdBtn: TToolButton;
    DtCopyBtn: TToolButton;
    DtNewBtn: TToolButton;
    ToolButton2: TToolButton;
    DtDelBtn: TToolButton;
    DtPnPriceNCap: TLabel;
    DtPnPriceN: TLabel;
    DtPnPriceACap: TLabel;
    DtPnPriceA: TLabel;
    DtPnNameCap: TLabel;
    DtPnName1: TLabel;
    actSetCn: TAction;
    actSetCn1: TMenuItem;
    ExpContBtn: TToolButton;
    DtPnTNCodeCap: TLabel;
    DtPnTNCode: TLabel;
    DtPnBoxTypeCap: TLabel;
    DtPnBoxType: TLabel;
    CompScanBtn: TToolButton;
    ToolButton3: TToolButton;
    UpdateDtBtn: TToolButton;
    DtPnName2: TTntLabel;
    OrdSG: TTntStringGrid;
    LoadSG: TTntStringGrid;
    DtPnCap: TTntLabel;
    ExpOrdBtn: TToolButton;
    Bevel2: TBevel;
    OrdSumBtn: TToolButton;
    Bevel4: TBevel;
    ImportKlassBtn: TSpeedButton;
    procedure OrdSumBtnClick(Sender: TObject);
    procedure ExpOrdBtnClick(Sender: TObject);
    procedure UpdateDtBtnClick(Sender: TObject);
    procedure CompScanBtnClick(Sender: TObject);
    procedure actSetCnExecute(Sender: TObject);
    procedure ExpContBtnClick(Sender: TObject);
    procedure DtDelBtnClick(Sender: TObject);
    procedure DtNewBtnClick(Sender: TObject);
    procedure DtCopyBtnClick(Sender: TObject);
    procedure DtEdBtnClick(Sender: TObject);
    procedure FindBtnClick(Sender: TObject);
    procedure ContVolClick(Sender: TObject);
    procedure FindInOrdBtnClick(Sender: TObject);
    procedure FindInContBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ChContDtBtnClick(Sender: TObject);
    procedure movBoxBtnClick(Sender: TObject);
    procedure actPswrdExecute(Sender: TObject);
    procedure HelpAbout1Execute(Sender: TObject);
    procedure FileExit1Execute(Sender: TObject);
    procedure FileOpen1Execute(Sender: TObject);
    procedure FileNew1Execute(Sender: TObject);
    procedure FileSaveAs1Execute(Sender: TObject);
    procedure FileSave1Execute(Sender: TObject);
    procedure InvSelBtnClick(Sender: TObject);
    procedure UnSelAllBtnClick(Sender: TObject);
    procedure SelAllBtnClick(Sender: TObject);
    procedure LoadSGEdBtnClick(Sender: TObject);
    procedure PrintContLstBtnClick(Sender: TObject);
    procedure OrdPrintBtnClick(Sender: TObject);
    procedure actDelContExecute(Sender: TObject);
    procedure AutoLoadBtnClick(Sender: TObject);
    procedure LoadSGMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BNETEDKeyPress(Sender: TObject; var Key: Char);
    procedure actMaxLoadPnExecute(Sender: TObject);
    procedure CIBEDKeyPress(Sender: TObject; var Key: Char);
    procedure OrdSGMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure LoadSGDblClick(Sender: TObject);
    procedure CrItmBtnClick(Sender: TObject);
    procedure DelItmBtnClick(Sender: TObject);
    procedure LoadSGSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure DelBoxBtnClick(Sender: TObject);
    procedure LoadSGDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure CrBoxBtnClick(Sender: TObject);
    procedure OrdSGDblClick(Sender: TObject);
    procedure actSetENGExecute(Sender: TObject);
    procedure actSetRUSExecute(Sender: TObject);
    procedure OrdSGDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure ContTbsChange(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure actNewContExecute(Sender: TObject);
    procedure actDelOrdExecute(Sender: TObject);
    procedure actOpenOrdExecute(Sender: TObject);
    procedure OrdSGSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure OrdTbsChange(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure UpdateOrdLists( OrdName : string);
    procedure UpdateContList( ContName: string);
    procedure UpdateControl;
    procedure UpdateDtPn;
    procedure DrawBoxRect;
    procedure UpdateBtn;
    procedure FindInOrd(OrdName,Code : string);
    procedure SetCNName;
    procedure FileOpen(FName : string);
    procedure ImportKlassBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SDIAppForm: TSDIAppForm;

implementation

uses about, TDataLst, LangUnit, TCont, NewContUnit,DtEDUnit, ExpCont,
     CreateBoxUnit, PrUnit, PrSetUnit, AcsUnit, CntLstUnit, FindUnit,
     CompUnit, ExpOrd, UpdDtUnit, OrdSumUnit;

{$R *.dfm}

var
  CurOrdName  : string;
  CurContName : string;
  CurItem     : TOnePos;
  CurBoxInd   : integer;
  FA          : boolean=false;

//-------------- Процедуры обновления визуальных компонентов -------------------

procedure TSDIAppForm.UpdateBtn;
var
  i : integer;
  fl: boolean;
  item : TOnePos;
  LoadCount:real;
begin
  if CurBoxInd>-1 then
    begin
      movBoxBtn.Enabled:=true;
      LoadSGEdBtn.Enabled:=true;
      FindInOrdBtn.Enabled:=true;
    end else
    begin
      movBoxBtn.Enabled:=false;
      LoadSGEdBtn.Enabled:=false;
      FindInOrdBtn.Enabled:=false;
    end;
  if (CurContName<>'') then
    begin
      PrintContLstBtn.Enabled:=(ContLst.ByName(CurcontName).BoxCount>0);
      LoadSGDelContBtn.Enabled:=FA;
      ExpContBtn.Enabled:=FA;
      CompScanBtn.Enabled:=FA;
    end
    else
    begin
      PrintContLstBtn.Enabled:=false;
      LoadSGDelContBtn.Enabled:=false;
      ExpContBtn.Enabled:=false;
      CompScanBtn.Enabled:=false;
    end;
  if CurOrdName <>'' then
    begin
      if FA then self.actDelOrd.Enabled:=(ModLst.Count>0);
      self.DtEdBtn.Enabled:=true;
      self.UpdateDtBtn.Enabled:=FA;
      self.DtNewBtn.Enabled:=FA;
      self.DtCopyBtn.Enabled:=FA;
      self.OrdPrintBtn.Enabled:=true;
      self.FindInContBtn.Enabled:=true;
      self.FindBtn.Enabled:=true;
      if FA then self.DtDelBtn.Enabled:=(ModLst.Model[ModLst.IndByName(curOrdName)].Count>0);
      ExpOrdBtn.Enabled:=FA;
    end
    else
    begin
      self.actDelOrd.Enabled:=false;
      self.DtEdBtn.Enabled:=false;
      self.UpdateDtBtn.Enabled:=false;
      self.DtNewBtn.Enabled:=false;
      self.DtCopyBtn.Enabled:=false;
      self.OrdPrintBtn.Enabled:=false;
      self.FindInContBtn.Enabled:=false;
      self.FindBtn.Enabled:=false;
      self.DtDelBtn.Enabled:=false;
      ExpOrdBtn.Enabled:=false;
    end;
  OrdOpenBtn.Enabled:=fa;
  OrdSumBtn.Enabled:=((fa)and(ModLst.Count>1));
  ContCreateBtn.Enabled:=fa;
  if (CurOrdName<>'')and(CurContName<>'') then
    begin
      //Кнопка автозагрузки
      fl:=false;
      for I:= 0 to ModLst.Model[ModLst.IndByName(CurOrdName)].Count-1 do
        begin
          item:=ModLst.Model[ModLst.IndByName(CurOrdName)].Item[i];
          LoadCount:=ContLst.PosCount(CurOrdName,Item.Code);
          if//Если деталь загружается в коробку (те кол-во в коробке больше 0)
            (item.CntInBox>0)
            //Если осталось какое то незагруж кол-во
            and((Item.TotCount-LoadCount)>0)
            //Если незагруженно 1 или больше коробок
            and(trunc((Item.TotCount-LoadCount)/Item.CntInBox)>0)
            //тогда загружаем деталь в контейнер
            then fl:=true;
        end;
      if fl then AutoLoadBtn.Enabled:=true else AutoLoadBtn.Enabled:=false;
      //Кнопки ручной загрузки
      fl:=false;
      for I := 0 to ModLst.Model[ModLst.IndByName(CurOrdName)].Count - 1 do
        if ModLst.Model[ModLst.IndByName(CurOrdName)].Item[i].sel then fl:=true;
      if fl then CrBoxBtn.Enabled:=true else CrBoxBtn.Enabled:=false;
      if (CurBoxInd>-1)and(ContLst.ByName(CurContName).Box[CurBoxInd].Group)
          and(fl) then CrItmBtn.Enabled:=true else CrItmBtn.Enabled:=false;
      //Кнопки удаления коробок и содержимого
      if (CurBoxInd>-1)then DelBoxBtn.Enabled:=true else DelBoxBtn.Enabled:=false;
      if (CurBoxInd>-1)and(ContLst.ByName(CurContName).Box[CurBoxInd].ItemCount>1)
          then DelItmBtn.Enabled:=true else DelItmBtn.Enabled:=false;
    end
    else
    begin
      AutoLoadBtn.Enabled:=false;
      CrBoxBtn.Enabled:=false;
      CrItmBtn.Enabled:=false;
      DelBoxBtn.Enabled:=false;
      DelItmBtn.Enabled:=false;
    end;
  ImportKlassBtn.Enabled := ((CurOrdName<>'')and(CurContName<>''));
end;

procedure TSDIAppForm.UpdateContList(ContName: string);
var
  i,j,k : integer;
  Cnt   : TContr;
begin
  if (ContName<>'')and(ContLst.ByName(ContName).BoxCount>0) then
    begin
      Cnt:=ContLst.ByName(ContName);
      if Cnt.Net>Cnt.MaxNet then ContNet.Font.Color:=clRed else ContNet.Font.Color:=clBlack;
      ContNet.Caption:=FormatFloat('####0.###',MyRound(Cnt.Net));
      ContNet.Caption:=FormatFloat('####0.###',Cnt.Net);
      if Cnt.Vol>Cnt.MaxVol then ContVol.Font.Color:=clRed else ContVol.Font.Color:=clBlack;
      ContVol.Caption:=FormatFloat('####0.###',Cnt.Vol);
      MaxContNet.Caption:=FormatFloat('####0.###',Cnt.MaxNet);
      MaxContVol.Caption:=FormatFloat('####0.###',Cnt.MaxVol);
      ContBox.Caption:=IntToStr(Cnt.TotBoxCnt);
      ContNNet.Caption:=FormatFloat('####0.###',Cnt.NNet);
      LoadSG.Enabled:=true;
      k:=1;
      for I := 0 to Cnt.BoxCount - 1 do for j := 0 to Cnt.Box[i].ItemCount-1 do inc(k);
      LoadSG.RowCount:=k;
      k:=1;
      for I := 0 to Cnt.BoxCount - 1 do
       for j := 0 to Cnt.Box[i].ItemCount-1 do
        with LoadSG do
        begin
          Cnt.Box[i].Items[j].RowInd:=k;
          if j=0 then Cells[0,k]:=IntToStr(i+1) else Cells[0,k]:='';
          if j=0 then Cells[1,k]:=Cnt.Box[i].BoxCode else Cells[1,k]:='';
          Cells[2,k]:=Cnt.Box[i].Items[j].OrdName;
          if lang=lgCN then
            Cells[3,k]:=UTF8Decode(ModLst.GetNameByCode(Lang,Cnt.Box[i].Items[j].OrdName,
              Cnt.Box[i].Items[j].PosCode))
            else
            Cells[3,k]:=ModLst.GetNameByCode(Lang,Cnt.Box[i].Items[j].OrdName,
              Cnt.Box[i].Items[j].PosCode);
          Cells[4,k]:=ModLst.GetEIByCode(Lang,Cnt.Box[i].Items[j].OrdName,
              Cnt.Box[i].Items[j].PosCode);
          Cells[5,k]:=FormatFloat('###0.###',Cnt.Box[i].Items[j].Count);
          if j=0 then
            begin
              Cells[6,k]:=IntToStr(Cnt.Box[i].BoxCount);
              Cells[7,k]:=FormatFloat('###0.###',Cnt.Box[i].Net);
              Cells[8,k]:=FormatFloat('###0.###',Cnt.Box[i].BNet);
              Cells[9,k]:=FormatFloat('###0.###',((Cnt.Box[i].BNet-Cnt.Box[i].Net)/Cnt.Box[i].BoxCount));
              Cells[10,k]:=FormatFloat('###0.###',Cnt.Box[i].Vol);
            end
            else
            begin
              Cells[6,k]:='';
              Cells[7,k]:='';
              Cells[8,k]:='';
              Cells[9,k]:='';
              Cells[10,k]:='';
            end;
          inc(k);
        end;
        CurBoxInd:=ContLst.ByName(CurContName).FindByRowInd(LoadSG.Selection.Top).X;
        BNETED.Visible:=false;
        SelAllBtn.Enabled:=true;
        UnSelAllBtn.Enabled:=true;
        InvSelBtn.Enabled:=true;
        PrintContLstBtn.Enabled:=true;
        ChContDtBtn.Enabled:=true;
        self.FormResize(self);
    end
    else
    begin
      LoadSG.RowCount:=2;
      for i := 0 to LoadSG.ColCount - 1 do LoadSG.Cells[i,1]:='';
      ContNet.Caption:='';
      ContVol.Caption:='';
      MaxContNet.Caption:='';
      MaxContVol.Caption:='';
      ContNNet.Caption:='';
      ContBox.Caption:='';
      CurBoxInd:=-1;
      BNETED.Visible:=false;
      LoadSGEdBtn.Enabled:=false;
      SelAllBtn.Enabled:=false;
      UnSelAllBtn.Enabled:=false;
      InvSelBtn.Enabled:=false;
      PrintContLstBtn.Enabled:=false;
      ChContDtBtn.Enabled:=false;
    end;
    self.UpdateBtn;
end;

procedure TSDIAppForm.UpdateDtPn;
var
  item : TOnePos;
  LoadCount:real;
begin
  if CurItem.Code='' then DataPn.Visible:=false else DataPn.Visible:=true;
  Item:=CurItem;
  if LANG=lgRUS then
    begin
      DtPnCap.Caption:='  '+Item.RName;
      DtPnName1.Caption:=Item.EName;
      if Item.CName<>'' then DtPnName2.Caption:=UTF8Decode(Item.CName)
        else DtPnName2.Caption:='Китайское наименование не указанно.';
    end;
  if LANG=lgENG then
    begin
      DtPnCap.Caption:='  '+Item.EName;
      DtPnName1.Caption:=Item.RName;
      if Item.CName<>'' then DtPnName2.Caption:=UTF8Decode(Item.CName)
        else DtPnName2.Caption:='Chine name not enter.';
    end;
  if LANG=lgCn then
    begin
      if Item.CName<>'' then DtPnCap.Caption:='  '+UTF8Decode(Item.CName)
        else DtPnCap.Caption:='    Chine name not enter.';
      DtPnName1.Caption:=Item.RName;
      DtPnName2.Caption:=Item.EName
    end;
  self.DtPnTNCode.Caption:=Item.TNCode;
  self.DtPnBoxType.Caption:=Item.BoxType;
  self.DtPnBom.Caption:=Item.BOM;
  self.DtPnCIO.Caption:=FormatFloat('##0.#######',Item.CntInOne);
  if LANG=lgRUS then self.DtPnEI.Caption:=Item.EI;
  if (LANG=lgENG)or(Lang=LgCN) then self.DtPnEI.Caption:=TranslateEI(Item.EI);
  self.DtPnNet.Caption:=FormatFloat('##0.######',Item.Net);
  self.DtPnVol.Caption:=FormatFloat('##0.######',Item.Vol);
  self.DtPnCIB.Caption:=IntTostr(Item.CntInBox)+'/'+IntTostr(Item.CIBOld);
  self.DtPnBar.Caption:=Item.BarCode;
  self.DtPnTC.Caption:=FormatFloat('####0.###',Item.TotCount);
  LoadCount:=ContLst.PosCount(CurOrdName,Item.Code);
  if LoadCount>Item.TotCount then self.DtPnLC.Font.Color:=clGreen;
  if LoadCount<Item.TotCount then self.DtPnLC.Font.Color:=clRed;
  if LoadCount=Item.TotCount then self.DtPnLC.Font.Color:=clBlack;
  self.DtPnLC.Caption:=FormatFloat('####0.###',LoadCount);
  self.DtPnPrice.Caption:=FormatFloat ('###0.0###',Item.Price);
  self.DtPnPriceA.Caption:=FormatFloat('###0.0###',Item.PriceA);
  self.DtPnPriceN.Caption:=FormatFloat('###0.0###',Item.PriceN);
end;

procedure TSDIAppForm.UpdateControl;
begin
  self.Caption:=tCaption+' '+AboutBox.Copyright.Caption;
  self.Caption:=self.Caption+' - '+PrDM.ExtractFileNameEx(FileName,false);
  //Заголовики панели информации о детали
  DtPnBomCap.Caption:=tDtPnBomCap;
  DtPnCIOCap.Caption:=tDtPnCIOCap;
  DtPnEICap.Caption :=tDtPnEICap;
  DtPnNetCap.Caption:=tDtPnNetCap;
  DtPnVolCap.Caption:=tDtPnVolCap;
  DtPnCIBCap.Caption:=tDtPnCIBCap;
  DtPnBarCap.Caption:=tDtPnBarCap;
  DtPnTCCap.Caption:=tDtPnTCCap;
  DtPnLCCap.Caption:=tDtPnLCCap;
  DtPnPriceCap.Caption:=tDtPnPriceCap;
  DtPnPriceACap.Caption:=tDtPnPriceACap;
  DtPnPriceNCap.Caption:=tDtPnPriceNCap;
  DtPnNameCap.Caption:=tDtPnNameCap;
  DtPnTNCodeCap.Caption:=tDtPnTnCodeCap;
  DtPnBoxTypeCap.Caption:=tDtPnBoxTypeCap;
  //Элементы ActionList
  actOpenOrd.Caption:=actOpenOrdCap;
  actOpenOrd.Hint:=actOpenOrdHint;
  actDelOrd.Caption :=actDelOrdCap;
  actDelOrd.Hint :=actDelOrdHint;
  actDelCont.Caption :=actDelContCap;
  actDelCont.Hint :=actDelContHint;
  actNewCont.Caption:=actNewContCap;
  actNewCont.Hint:=actNewContHint;
  actSetRUs.Caption:=actSetRUSCap;
  actSetEng.Caption:=actSetENGCap;
  actSetCn.Caption:=actSetCnCap;
  actSetRUS.Hint:=actSetRUSHint;
  actSetENG.Hint:=actSetENFHint;
  actSetCn.Hint:=actSetCnHint;
  actMaxLoadPn.Caption:=actMaxLoadPnCap;
  actMaxLoadPn.Hint:=actMaxLoadPnHint;
  FileNew1.Caption:=actNewCap;
  FileNew1.Hint:=actNewHint;
  FileOpen1.Caption:=actOpenCap;
  FileOpen1.Hint:=actOpenHint;
  FileSave1.Caption:=actSaveCap;
  FileSave1.Hint:=actSaveHint;
  FileSaveAs1.Caption:=actSaveAsCap;
  FileSaveAs1.Hint:=actSaveAsHint;
  FileExit1.Caption:=actExitCap;
  FileExit1.Hint:=actExitHint;
  HelpAbout1.Caption:=actHelpCap;
  HelpAbout1.Hint:=actHelpHint;
  Help1.Caption:=miHelpCap;
  Help1.Hint:=miHelpHint;
  //Элементы меню
  File1.Caption:=miFileCap;
  File1.Hint:=miFileHint;
  miLang.Caption:=miLangCap;
  miLang.Hint:=miLangHint;
  miSet.Caption:=miSetCap;
  miSet.Hint:=miSetHint;
  actPswrd.Caption:=actPswrdCap;
  actPswrd.Hint:=actPswrdHint;
  //Основные кнопки управления
  AutoLoadBtn.Hint:=btnAutoLoadHint;
  CrBoxBtn.Hint:=btnCrBoxHint;
  CrItmBtn.Hint:=btnCrItmHint;
  DelBoxBtn.Hint:=btnDelBoxHint;
  DelItmBtn.Hint:=btnDelItmHint;
  //Заголовки панели заказа
  OrdPnCap.Caption  :=tOrdPnCap;
  OrdSG.Cells[0,0]  :=tOrgSGCol0 ;
  OrdSG.Cells[1,0]  :=tOrgSGCol1 ;
  OrdSG.Cells[2,0]  :=tOrgSGCol2 ;
  OrdSG.Cells[3,0]  :=tOrgSGCol3 ;
  OrdSG.Cells[4,0]  :=tOrgSGCol4 ;
  OrdPrintBtn.Hint  :=tOrdPrintHint;
  FindInContBtn.Hint:=tFindInContHint;
  FindBtn.Hint      :=tAdvFindInOrdHint;
  DtNewBtn.Hint     :=tNewDtHint;
  DtCopyBtn.Hint    :=tCopyDtHint;
  DtEdBtn.Hint      :=tEditDtHint;
  DtDelBtn.Hint     :=tDelDtHint;
  UpdateDtBtn.Hint  :=tUpdateDtHint;
  ExpOrdBtn.Hint    :=tExpOrdHint;
  OrdSumBtn.Hint    :=tOrdSumBtnHint;
  //Заголовки панели контейнера
  LoadPnCap.Caption  :=tLoadPnCap;
  LoadSG.Cells[0,0]  :=tOrgSGCol0 ;
  LoadSG.Cells[2,0]  :=tLoadSGCol1 ;
  LoadSG.Cells[1,0]  :=tLoadSGCol2 ;
  LoadSG.Cells[3,0]  :=tOrgSGCol1 ;
  LoadSG.Cells[4,0]  :=tOrgSGCol3 ;
  LoadSG.Cells[5,0]  :=tLoadSGCol4 ;
  LoadSG.Cells[6,0]  :=tLoadSGCol5 ;
  LoadSG.Cells[7,0]  :=tLoadSGCol6 ;
  LoadSG.Cells[8,0]  :=tLoadSGCol7 ;
  LoadSG.Cells[9,0]  :=tLoadSGCol9 ;
  LoadSG.Cells[10,0]  :=tLoadSGCol8 ;
  LoadSGEdBtn.Hint:= tLoadSGEdBtnHint;
  PrintContLstBtn.Hint:=tContLstPrintHint;
  SelAllBtn.Hint:=tSelAllBtnHint;
  UnSelAllBtn.Hint:=tUnSelAllBtnHint;
  InvSelBtn.Hint:=tInvSelBtnHint;
  movBoxBtn.Hint:=tMovBoxHint;
  ChContDtBtn.Hint:=tNewContFormCh;
  FindInOrdBtn.Hint:=tFindInOrdHint;
  ExpContBtn.Hint:=tExpContHint;
  CompScanBtn.Hint:=TCompScanHint;
  //Панель информации о контейнере
  MaxContNetCap.Caption  := tMaxContNetCap;
  MaxContVolCap.Caption  := tMaxContVolCap;
  RealContNetCap.Caption := tRealContNetCap;
  RealContVolCap.Caption := tRealContVolCap;
  RealContNNetCap.Caption:= tRealContNNetCap;
  RealBoxCount.Caption   := tRealContBoxCap;
end;

procedure TSDIAppForm.UpdateOrdLists(OrdName: string);
var
  i,ModInd : integer;
  Count: real;
begin
  if (OrdName<>'')and(ModLst.Model[ModLst.IndByName(curOrdName)].Count>0) then
    begin
      OrdSg.Enabled:=true;
      ModInd:=ModLst.IndByName(OrdName);
      if(OrdSG.RowCount<>ModLst.Model[ModInd].Count+1)then
        OrdSG.RowCount:=ModLst.Model[ModInd].Count+1;
      for I := 0 to ModLst.Model[ModInd].Count - 1 do
        begin
          Count:=ContLst.PosCount(OrdName,ModLst.Model[ModInd].Item[i].Code);
          Count:=ModLst.Model[ModInd].Item[i].TotCount-Count;
          if Count<0 then count:=0;
          OrdSG.Cells[0,i+1]:=IntToStr(i+1);
          if Lang=lgCN then
            OrdSG.Cells[1,i+1]:=UTF8Decode(ModLst.GetNameByCode(Lang,OrdName,ModLst.Model[ModInd].Item[i].Code))
            else
            OrdSG.Cells[1,i+1]:=ModLst.GetNameByCode(Lang,OrdName,ModLst.Model[ModInd].Item[i].Code);
          OrdSG.Cells[2,i+1]:=FormatFloat('##0.#######',Count);
          if Lang=lgRUS then OrdSG.Cells[3,i+1]:=ModLst.Model[ModInd].Item[i].EI;
          if (Lang=lgENG)or(Lang=lgCn) then OrdSG.Cells[3,i+1]:=TranslateEI(ModLst.Model[ModInd].Item[i].EI);
          OrdSG.Cells[4,i+1]:=IntToStr(ModLst.Model[ModInd].Item[i].CntInBox);
          if ModLst.Model[ModInd].Count>0 then CurItem:=ModLst.Model[ModInd].Item[0];
        end;
    end else
    begin
      OrdSg.Enabled:=false;
      OrdSG.RowCount:=2;
      OrdSG.Cells[0,1]:='';
      OrdSG.Cells[1,1]:='';
      OrdSG.Cells[2,1]:='';
      OrdSG.Cells[3,1]:='';
      OrdSG.Cells[4,1]:='';
    end;
    self.UpdateBtn;
end;

//------------------------------------------------------------------------------

procedure TSDIAppForm.FileExit1Execute(Sender: TObject);
begin
  self.FileNew1.Execute;
  self.Close;
end;

procedure TSDIAppForm.FileNew1Execute(Sender: TObject);
var
  mr : TModalResult;
begin
  mr:=MessageDlg(msgNew,mtWarning,[mbYes,mbNo,mbCancel],0);
  if mr=mrYes then self.FileSave1.Execute;
  if mr=mrCancel then Abort;
  OrdTbs.Tabs.Clear;
  ContTbs.Tabs.Clear;
  FileName:='no name';
  CurOrdName:='';
  CurContName:='';
  CurBoxInd:=-1;
  CurItem:=NilOnePos;
  while ContLst.Count>0 do ContLst.DelCont(ContLst.Cont[0].Name);
  ContLst.LastBoxInd:=0;
  while ModLst.Count>0 do ModLst.Delete(ModLst.Model[0].EngName);
  self.UpdateOrdLists('');
  self.UpdateContList('');
  self.UpdateControl;
  self.UpdateBtn;
  self.DataPn.Visible:=false;
end;

procedure TSDIAppForm.SetCnName;
var
  i,j   : integer;
  CNLst : TStringList;
  CDS   : TClientDataSet;
  str,st1,st2 : string;
begin
  if FileExists(AppPath+'/'+CNFName)=false then abort;
  CNlst:=TStringList.Create;
  CnLst.LoadFromFile(AppPath+'/'+CNFName);
  CDS:=TClientDataSet.Create(self);
  CDS.FieldDefs.Add('CODE',ftstring,20,false);
  CDS.FieldDefs.Add('NAME',ftString,255,false);
  CDS.CreateDataSet;
  for I := 1 to CnLst.Count - 1 do
    begin
      str:=CnLst[i];
      st1:=copy(str,1,pos(',',str)-1);
      st2:=copy(str,pos(',',str)+1,MaxInt);
      CDS.Append;
      CDS.FieldByName('CODE').AsString:=st1;
      CDS.FieldByName('NAME').AsString:=st2;
      CDS.Post;
    end;
  for I := 0 to ModLst.Count - 1 do
    for j := 0 to ModLst.Model[i].Count-1 do
      begin
        str:=ModLst.Model[i].Item[j].Code;
        str:=copy(str,2,MaxInt);
        if  (ModLst.Model[i].Item[j].CName='')and
            (CDS.Locate('CODE',str,[])) then
            begin
              ModLst.Model[i].Item[j].CName:=CDS.FieldByName('NAME').AsString;
            end;
      end;
end;

procedure TSDIAppForm.OrdSumBtnClick(Sender: TObject);
var
  i,j,ind  : integer;
  name : string;
begin
  if ModLst.Count>1 then
    begin
      name:=OrdSumForm.ShowForm;
      if name<>'' then
        begin
          CurItem:=NilOnePos;
          for i := 0 to OrdSumForm.CBL.Items.Count - 1 do
            if OrdSumForm.CBL.Checked[i] then
              begin
                j:=0;
                while (j<OrdTbs.Tabs.Count)and(OrdTbs.Tabs[j]<>OrdSumForm.CBL.Items[i]) do inc(j);
                if(OrdTbs.Tabs[j]=OrdSumForm.CBL.Items[i])then OrdTbs.Tabs.Delete(j);
              end;
          ind:=OrdTbs.Tabs.Add(name);
          OrdTbs.TabIndex:=ind;
          CurOrdName:=name;
          //Обновление отображений
          self.SetCNName;
          self.UpdateOrdLists(CurOrdName);
          self.UpdateContList(CurContName);
          self.UpdateDtPn;
          self.FormResize(sender);
        end;
    end;
end;

procedure TSDIAppForm.FileOpen1Execute(Sender: TObject);
begin
  self.FileNew1.Execute;
  if OpenDlg.Execute then self.FileOpen(OpenDlg.FileName) else Abort;
end;

procedure TSDIAppForm.FileOpen(FName : string);
var
  i:integer;
begin
  FileName:=FName;
  PrDM.LoadAll(FName);
  if ModLst.Count>0 then begin
    for I := 0 to ModLst.Count - 1 do OrdTbs.Tabs.Add(ModLst.Model[i].EngName);
    OrdTbs.TabIndex:=0;
    CurOrdName:=OrdTbs.Tabs[0];
  end;
  if ContLst.Count>0 then begin
    for I := 0 to ContLst.Count - 1 do ContTbs.Tabs.Add(ContLst.Cont[i].Name);
    ContTbs.TabIndex:=0;
    CurContName:=ContTbs.Tabs[0];
  end;
  self.SetCNName;
  PrUnit.PrDM.SaveAll(FileName);
  self.UpdateControl;
  self.UpdateOrdLists(CurOrdName);
  self.UpdateContList(CurContname);
  self.UpdateBtn;
end;

procedure TSDIAppForm.FileSave1Execute(Sender: TObject);
begin
  if FileName<>'no name' then PrUnit.PrDM.SaveAll(FileName)
    else self.FileSaveAs1.Execute;
end;

procedure TSDIAppForm.FileSaveAs1Execute(Sender: TObject);
begin
  SaveDlg.Title:=tSvDlgOFCap;
  SaveDlg.FileName:=PrDM.ExtractFileNameEx(FileName,false);
  if SaveDlg.Execute then
    begin
      PrUnit.PrDM.SaveAll(SaveDlg.FileName);
      FileName:=SaveDlg.FileName;
      self.UpdateControl;
    end else Abort;
end;

//----------------------- Процедуры работы формы -------------------------------

procedure TSDIAppForm.FormCreate(Sender: TObject);
begin
   AppPath:=ExtractFilePath(Application.ExeName);
end;

procedure TSDIAppForm.FormResize(Sender: TObject);
var
  i,w : integer;
begin
  //Установка размера панели заказа
  LOrdPn.Width:=round(Panel1.Width/2.5);
  //Установка размера столбца "наименования" в таблице заказа
  w:=0;
  for I := 0 to OrdSG.ColCount-1 do w:=w+OrdSG.ColWidths[i];
  w:=w-OrdSG.ColWidths[1];
  OrdSG.ColWidths[1]:=OrdSG.ClientWidth-w-5;
  //Установка размера столбца "наименования" в таблице контейнра
  w:=0;
  for I := 0 to LoadSG.ColCount-1 do w:=w+LoadSG.ColWidths[i];
  w:=w-LoadSG.ColWidths[3];
  LoadSG.ColWidths[3]:=LoadSG.ClientWidth-w-10;
end;

procedure TSDIAppForm.FormShow(Sender: TObject);
var
   buffer: array[0..MAX_COMPUTERNAME_LENGTH + 1] of Char;
   Size: Cardinal;
   fname : string;
   i : integer;
   err_msg : TStringList;
begin
  ModLst:=TModList.Create;
  ContLst:=TContLst.Create;
  FileName:='no name';
  Lang:=lgRUS;
  SetLang(lgRus);
  CurOrdName:='';
  CurContName:='';
  CurBoxInd:=-1;
  CurItem:=NilOnePos;
  self.actSetRUS.Execute;
  //определяем имя компъютера и включаем полный доступ для себя
  Size := MAX_COMPUTERNAME_LENGTH + 1;
  Windows.GetComputerName(@buffer, Size);
  if StrPas(buffer)='SERGEYSHAGINYAN' then FA:=true;
  self.UpdateControl;
  self.UpdateBtn;
  if ParamCount>=1 then begin
    fname:=ParamStr(1);
    for I := 2 to ParamCount do
      fname:=fname+' '+ParamStr(i);
  end;
  err_msg:= TStringList.Create;
  try
    if FileExists(fname) then self.FileOpen(fname);
  except
    on E: Exception do
      err_msg.Add(E.Message);
  end;
  if err_msg.Count>0 then  MessageDlg(err_msg.Text,mtError,[mbOk],0);

  err_msg.free;
end;

procedure TSDIAppForm.HelpAbout1Execute(Sender: TObject);
begin
  about.AboutBox.ShowModal;
end;

//------------------------------------------------------------------------------

procedure TSDIAppForm.actDelContExecute(Sender: TObject);
var
  str : string;
begin
  if CurContName<>'' then
  begin
  if ContLst.ByName(CurContName).BoxCount>0 then
    str:=msgDelCont+CurContName+msgDelCont2
    else str:=msgDelCont+CurContName+'"?';
  if MessageDlg(str,mtWarning,[mbYes,mbNo],0)=mrYes then
    begin
      ContLst.DelCont(CurContName);
      ContTbs.Tabs.Delete(ContTbs.TabIndex);
      if ContTbs.Tabs.Count>0 then
        begin
          ContTbs.TabIndex:=0;
          CurContName:=ContTbs.Tabs[0];
        end
        else
        begin
          CurContName:='';
        end;
      self.UpdateContList(CurContName);
      self.UpdateOrdLists(CurOrdName);
    end;
  end;
end;

procedure TSDIAppForm.actDelOrdExecute(Sender: TObject);
begin
  if (CurOrdName<>'')then
    if (MessageDlg(msgDelOrd+CurOrdName+msgDelOrd2,mtWarning,[mbOk,mbCancel],0)=mrOk) then
    begin
      ModLst.Delete(CurOrdName);
      OrdTbs.Tabs.Delete(OrdTbs.TabIndex);
      CurItem:=NilOnePos;
      self.UpdateDtPn;
      ContLst.DelMod(CurOrdName);
      if OrdTbs.Tabs.Count>0 then
        begin
          OrdTbs.TabIndex:=0;
          CurOrdName:=OrdTbs.Tabs[0];
        end
        else
        begin
          CurOrdName:='';
        end;
      self.UpdateOrdLists(CurOrdName);
      self.UpdateContList(CurContName);
    end;
end;

procedure TSDIAppForm.actMaxLoadPnExecute(Sender: TObject);
var
  W,i:integer;
begin
  LOrdPn.Visible:=not LordPn.Visible;
  (Sender as TAction).Checked:=not (Sender as TAction).Checked;
  //Установка размера столбца "наименования" в таблице контейнра
  w:=0;
  for I := 0 to LoadSG.ColCount-1 do w:=w+LoadSG.ColWidths[i];
  w:=w-LoadSG.ColWidths[3];
  LoadSG.ColWidths[3]:=LoadSG.ClientWidth-w-10;
end;

procedure TSDIAppForm.actNewContExecute(Sender: TObject);
var
  name    : string;
  net,vol : real;
begin
  if NewContForm.ShowForm(ContLst.Count) then
    begin
      name:=NewContForm.NewContName.Text;
      net :=strtofloat(NewContForm.NewContMaxNet.Text);
      vol :=strtofloat(NewContForm.NewContMaxVol.Text);
      if ContLst.ByName(name)=nil then
        begin
          ContLst.NewCont(name,net,vol);
          CurContName:=name;
          ContTbs.TabIndex:=ContTbs.Tabs.Add(name);
          //self.UpdateContList(CurContName);
        end
        else
          MessageDLg(msgNewContExst,mtError,[mbOk],0);
    end;
end;

procedure TSDIAppForm.actOpenOrdExecute(Sender: TObject);
var
  ind    : integer;
  name   : string;
  Model  : TDataList;
begin
  OpenDlg.Title:=tOpnDlg1SCap;
  if OpenDlg.Execute then
    begin
      Model:=TDataList.Create;
      name:=Model.LoadFrom1CTXT(OpenDlg.FileName);
      if ModLst.Add(Model)>0 then
        begin
          ind:=OrdTbs.Tabs.Add(name);
          OrdTbs.TabIndex:=ind;
          //Обновление отображений
          self.SetCNName;
          self.UpdateOrdLists(name);
          self.UpdateDtPn;
          self.FormResize(sender);
        end
        else
        MessageDLG(msgOpenOrdExst,mtError,[mbOk],0);
    end;
end;

procedure TSDIAppForm.actPswrdExecute(Sender: TObject);
begin
  if AcsForm.ShowForm(Lang) then
    begin
      FA:= not FA;
      self.UpdateBtn;
    end;
end;

procedure TSDIAppForm.actSetENGExecute(Sender: TObject);
begin
  SetLang(lgENG);
  self.actSetRUS.Checked:=false;
  self.actSetENG.Checked:=true;
  self.actSetCn.Checked:=false;
  self.UpdateControl;
  self.UpdateOrdLists(CurOrdName);
  self.UpdateDtPn;
  self.UpdateContList(CurContName);
end;

procedure TSDIAppForm.actSetRUSExecute(Sender: TObject);
begin
  SetLang(lgRus);
  self.actSetCn.Checked:=false;
  self.actSetRUS.Checked:=true;
  self.actSetENG.Checked:=false;
  self.UpdateControl;
  self.UpdateOrdLists(CurOrdName);
  self.UpdateDtPn;
  self.UpdateContList(CurContName);
end;

//------------- Работа визуальных компонентов панели загрузки ------------------

procedure TSDIAppForm.BNETEDKeyPress(Sender: TObject; var Key: Char);
begin
  if not((key in ['0'..'9'])or(key=',')or(ord(key)=13)or(ord(key)=8)or(ord(key)=46)) then
    begin
      beep;
      key:=#0;
    end;
  if ord(key)=13 then
    begin
      BNETED.Visible:=false;
      ContLst.ByName(CurContName).Box[CurBoxInd].BNet:=StrToFloat(BNETED.Text);
      self.UpdateContList(CurContName);
    end;
end;

procedure TSDIAppForm.DrawBoxRect;
var
  i,w   : integer;
  rct : Trect;
  st  : boolean;
begin
  st:=false;
  for I := 0 to LoadSG.RowCount-1 do
    if (ContLst.ByName(CurContName).FindByRowInd(i).X=CurBoxInd) then
      begin
        if st=false then
          begin
            rct.TopLeft:=LoadSG.CellRect(1,i).TopLeft;
            st:=true;
          end;
        if st=true then rct.BottomRight:=LoadSG.CellRect(LoadSG.ColCount-1,i).BottomRight;
      end;
  w:=2;
  LoadSG.Canvas.Pen.Color:=clRed;
  LoadSG.Canvas.Pen.Width:=3;
  LoadSG.Canvas.MoveTo(rct.Left+w,rct.Top+w);
  LoadSG.Canvas.LineTo(rct.Right-w,rct.Top+w);
  LoadSG.Canvas.LineTo(rct.Right-w,rct.Bottom-w);
  LoadSG.Canvas.LineTo(rct.Left+w,rct.Bottom-w);
end;

procedure TSDIAppForm.PrintContLstBtnClick(Sender: TObject);
var
  i        : integer;
  sel      : boolean;
begin
  if CurContName<>'' then
    begin
      for I := 0 to ContLst.ByName(CurContName).BoxCount - 1 do
        if ContLst.ByName(CurContName).Box[i].BNet<
          ContLst.ByName(CurContName).Box[i].Net then
          begin
            MessageDlg(msgNetError,mtError,[mbOK],0);
            Abort;
          end;
      sel:=false;
      i:=0;
      while (not sel)and(i<(ContLst.ByName(CurContName).BoxCount)) do
        begin
          if ContLst.ByName(CurContName).Box[i].Sel then sel:=true;
          inc(i);
        end;
      case PrSetForm.PrintSet(sel) of
        1: PrDM.PrintContList(CurContName,Lang);
        2: PrDM.PrintContTabl(CurContName,true);
        3: PrDM.PrintContTabl(CurContName,false);
      end;
    end;
end;

procedure TSDIAppForm.movBoxBtnClick(Sender: TObject);
var
  i,j,old,new : integer;
  Strs        : TStringList;
  Name        : string;
begin
  Strs:=TStringList.Create;
  for I := 0 to ContLst.Count - 1 do
    if(ContLst.Cont[i].Name<>CurContName)then Strs.Add(ContLst.Cont[i].Name);
  Name:=CntLstForm.ShowForm(Lang,Strs, ContLst.ByName(CurContName).Box[CurBoxInd].BoxCount);
  if Name<>'' then
    begin
      old:=ContLst.ByName(CurContName).Box[CurBoxInd].BoxCount-CntLstForm.BCUD.Position;
      new:=CntLstForm.BCUD.Position;
      i:=ContLst.ByName(Name).AddBox(ContLst.ByName(CurContName).Box[CurBoxInd]);
      //Старые коробки
      if old>0 then
        begin
          ContLst.ByName(CurContName).Box[CurBoxInd].BoxCount:=old;
          ContLst.ByName(CurContName).Box[CurBoxInd].Sel:=false ;
          for j := 0 to ContLst.ByName(CurContName).Box[CurBoxInd].ItemCount - 1 do
            begin
              ContLst.ByName(CurContName).Box[CurBoxInd].Items[j].Count:=
                (ContLst.ByName(CurContName).Box[CurBoxInd].Items[j].Count/(new+old))*old;
              ContLst.ByName(CurContName).Box[CurBoxInd].BNet:=
                (ContLst.ByName(CurContName).Box[CurBoxInd].BNet/(new+old))*old;
            end;
        end else ContLst.ByName(curContName).DeleteBox(curBoxInd);
      //Новые коробки
      ContLst.ByName(Name).Box[i].BoxCount:=new;
      ContLst.ByName(Name).Box[i].BNet:=(ContLst.ByName(Name).Box[i].BNet/(new+old))*new;
      for j := 0 to ContLst.ByName(Name).Box[i].ItemCount - 1 do
          ContLst.ByName(Name).Box[i].Items[j].Count:=
            (ContLst.ByName(name).Box[i].Items[j].Count/(new+old))*new;
      j:=0;
      while ContTbs.Tabs[j]<>Name do inc(j);
      ContTbs.TabIndex:=j;
      CurContName:=name;
      self.UpdateContList(CurContName);
      LoadSG.Row:=LoadSG.RowCount-ContLst.ByName(Name).Box[i].ItemCount;
    end;
end;

procedure TSDIAppForm.SelAllBtnClick(Sender: TObject);
var
  i : integer;
  sel:boolean;
begin
  if (CurContName<>'')and(ContLst.ByName(CurContName).BoxCount>0) then
    begin
      for I := 0 to ContLst.ByName(CurContName).BoxCount - 1 do
        ContLst.ByName(CurContName).Box[i].Sel:=true;
      LoadSG.Refresh;
       //Проверяем есть ли в списке выбранные элементы
       //и настраиваем кнопку перемещения коробок
       sel:=false;
       i:=0;
       while (not sel)and(i<(ContLst.ByName(CurContName).BoxCount)) do
        begin
          if ContLst.ByName(CurContName).Box[i].Sel then sel:=true;
          inc(i);
        end;
    end;
end;

procedure TSDIAppForm.UpdateDtBtnClick(Sender: TObject);
begin
  if OpenDlg.Execute then UpdDtForm.UpdateDataLst(OpenDlg.FileName);
  self.UpdateOrdLists(CurOrdName);
  self.UpdateContList(CurContName);
end;

procedure TSDIAppForm.CompScanBtnClick(Sender: TObject);
begin
  CompForm.ShowModal;
end;

procedure TSDIAppForm.actSetCnExecute(Sender: TObject);
begin
  SetLang(lgCn);
  self.actSetRUS.Checked:=false;
  self.actSetENG.Checked:=false;
  self.actSetCn.Checked:=true;
  self.UpdateControl;
  self.UpdateOrdLists(CurOrdName);
  self.UpdateDtPn;
  self.UpdateContList(CurContName);
end;

procedure TSDIAppForm.ExpContBtnClick(Sender: TObject);
begin
  if ModLst.Count>0 then ExpContForm.ShowModal;
end;

procedure TSDIAppForm.ExpOrdBtnClick(Sender: TObject);
begin
  if ModLst.Count>0 then ExpOrdForm.ShowModal;
end;

procedure TSDIAppForm.DtDelBtnClick(Sender: TObject);
begin
  if ModLst.Model[ModLst.IndByName(CurOrdName)].Count>0 then
    if MessageDLg('Вы уверенны? Деталь будет удалена из всех конетейнеров и из списка заказа!'
      ,mtWarning,[mbYes,mbCancel],0)=mrYes then
    begin
      if ContLst.FindPos(CurOrdName,CurItem.Code).RowInd>-1 then
        ContLst.DeletePos(CurOrdName,CurItem.Code);
      ModLst.Model[ModLst.IndByName(CurOrdName)].Delete(CurItem);
      self.UpdateOrdLists(CurOrdName);
      OrdSG.Row:=1;
      self.UpdateDtPn;
      self.UpdateContList(CurContName);
    end;
end;

procedure TSDIAppForm.DtCopyBtnClick(Sender: TObject);
begin
  if (CurItem.Code<>'')and(DtEdForm.Show(edmCopy,CurItem)) then
    begin
      ModLst.Model[ModLst.IndByName(CurOrdName)].Add(CurItem);
      self.UpdateOrdLists(CurOrdName);
      OrdSG.Row:=OrdSG.RowCount-1;
      self.UpdateDtPn;
    end;
end;

procedure TSDIAppForm.DtEdBtnClick(Sender: TObject);
var
  i,j,ARow  : integer;
  TC        : real;
  edm       : byte;
begin
  if FA then edm:=edmEdit else edm:=edmCNName;
  DtEdForm.SetLang(lang);
  CurItem:=ModLst.Model[ModLst.IndByName(OrdTbs.Tabs[OrdTbs.TabIndex])].Item[OrdSG.Selection.Top-1];
  if (CurItem.Code<>'')and(DtEdForm.Show(edm,CurItem)) then
    begin
      ARow:=OrdSG.Selection.Top;
      if totchange then
        begin
          for j:=0 to ModLst.Count-1 do
            for i:=0 to ModLst.Model[j].Count-1 do
              if(ModLst.Model[j].Item[i].Code=CurItem.Code)then
                begin
                  tc:=ModLst.Model[j].Item[i].TotCount;
                  ModLst.Model[j].Item[i]:=CurItem;
                  ModLst.Model[j].Item[i].TotCount:=tc;
                end;
        end
      else
        ModLst.Model[ModLst.IndByName(CurOrdName)].Item[ARow-1]:=CurItem;
      self.UpdateOrdLists(CurOrdName);
      CurItem:=ModLst.Model[ModLst.IndByName(CurOrdName)].Item[ARow-1];
      self.UpdateDtPn;
      self.UpdateContList(CurContName);
    end;
end;

procedure TSDIAppForm.DtNewBtnClick(Sender: TObject);
begin
  if (CurItem.Code<>'')and(DtEdForm.Show(edmNew,CurItem)) then
    begin
      ModLst.Model[ModLst.IndByName(CurOrdName)].Add(CurItem);
      self.UpdateOrdLists(CurOrdName);
      OrdSG.Row:=OrdSG.RowCount-1;
      self.UpdateDtPn;
    end;
end;

procedure TSDIAppForm.FindBtnClick(Sender: TObject);
begin
  findform.MyShow;
end;

procedure TSDIAppForm.FindInOrd(OrdName: string; Code: string);
var
  i,j  : integer;
  Find : boolean;
begin
  I:=0;
  Find:=false;
  j:=0;
  while (j<ModLst.Count)and(not Find) do
    begin
      i:=0;
      while (i<ModLst.Model[j].Count)and(not Find) do
          if((ModLst.Model[j].Item[i].Code=Code)and(ModLst.Model[j].EngName=OrdName))
              then Find:=true else inc (i);
      if (not Find) then inc(j);
    end;
  if (Find)then
    begin
      OrdTbs.TabIndex:=j;
      CurOrdName:=OrdTbs.Tabs[j];
      self.UpdateOrdLists(CurOrdName);
      OrdSG.Row:=i+1;
    end else
      begin
        OrdSG.TopRow:=1;
        MessageDlg(tFindError,mtError,[mbOk],0);
      end;
end;

procedure TSDIAppForm.FindInOrdBtnClick(Sender: TObject);
var
  ind  : integer;
begin
  Ind:=ContLst.ByName(CurContName).FindByRowInd(LoadSG.Selection.Top).Y;
  self.FindInOrd(ContLst.ByName(CurContName).Box[CurBoxInd].Items[Ind].OrdName,
    ContLst.ByName(CurContName).Box[CurBoxInd].Items[Ind].PosCode);
  self.UpdateDtPn;
end;

procedure TSDIAppForm.FindInContBtnClick(Sender: TObject);
var
  i,j,k  : integer;
  Find : boolean;
begin
  i:=0;
  k:=0;
  Find:=false;
  j:=0;
  while (j<ContLst.Count)and(not Find) do
    begin
      i:=0;
      while (i<ContLst.Cont[j].BoxCount)and(not Find) do
        begin
          k:=0;
          while (k<ContLst.Cont[j].Box[i].ItemCount)and(not Find) do
            if((ContLst.Cont[j].Box[i].Items[k].OrdName=CurOrdName)
                and(ContLst.Cont[j].Box[i].Items[k].PosCode=CurItem.Code))
              then Find:=true else inc (k);
          if (not Find) then inc(i);
        end;
      if (not Find) then inc(j);
    end;
  if (Find)then
    begin
      ContTbs.TabIndex:=j;
      CurContName:=ContTbs.Tabs[j];
      CurBoxInd:=-1;
      self.UpdateContList(CurContName);
      LoadSG.Row:=ContLst.Cont[j].Box[i].Items[k].RowInd;
    end else
      begin
        LoadSG.TopRow:=1;
        MessageDlg(tFindError,mtError,[mbOk],0);
      end;
end;

procedure TSDIAppForm.ChContDtBtnClick(Sender: TObject);
var
  name    : string;
  net,vol : real;
begin
  Net:=ContLst.ByName(CurContName).MaxNet;
  Vol:=ContLst.ByName(CurContName).MaxVol;
  name:=CurContName;
  if NewContForm.ChgData(name,net,vol) then
    begin
      name:=NewContForm.NewContName.Text;
      net :=strtofloat(NewContForm.NewContMaxNet.Text);
      vol :=strtofloat(NewContForm.NewContMaxVol.Text);
      if name=CurContName then
        begin
          ContLst.ByName(CurContName).MaxNet:=net;
          ContLst.ByName(CurContName).MaxVol:=Vol;
          self.UpdateContList(CurContName);
        end
        else
          begin
            if ContLst.ByName(name)=nil then
              begin
                ContLst.ByName(CurContName).MaxNet:=net;
                ContLst.ByName(CurContName).MaxVol:=Vol;
                ContLst.ByName(CurContName).Name:=name;
                CurContName:=name;
                ContTbs.Tabs[ContTbs.TabIndex]:=name;
                self.UpdateContList(CurContName);
              end
              else
                MessageDLg(msgNewContExst,mtError,[mbOk],0);
          end;
    end;
end;

procedure TSDIAppForm.UnSelAllBtnClick(Sender: TObject);
var
  i : integer;
begin
  if (CurContName<>'')and(ContLst.ByName(CurContName).BoxCount>0) then
    begin
      for I := 0 to ContLst.ByName(CurContName).BoxCount - 1 do
        ContLst.ByName(CurContName).Box[i].Sel:=false;
      LoadSG.Refresh;
    end;
end;

procedure TSDIAppForm.ImportKlassBtnClick(Sender: TObject);
begin
  if ((CurOrdName<>'')and(CurContName<>'')) then begin
    ImportFromKlass.ImportDataFromKlass(CurOrdName, CurContName);
    self.UpdateContList(CurContName);
    self.UpdateDtPn;
    self.UpdateOrdLists(CurOrdName);
  end;
end;

procedure TSDIAppForm.InvSelBtnClick(Sender: TObject);
var
  i : integer;
  sel:boolean;
begin
  if (CurContName<>'')and(ContLst.ByName(CurContName).BoxCount>0) then
    begin
      for I := 0 to ContLst.ByName(CurContName).BoxCount - 1 do
        ContLst.ByName(CurContName).Box[i].Sel:=not ContLst.ByName(CurContName).Box[i].Sel;
      LoadSG.Refresh;
       //Проверяем есть ли в списке выбранные элементы
       //и настраиваем кнопку перемещения коробок
       sel:=false;
       i:=0;
       while (not sel)and(i<(ContLst.ByName(CurContName).BoxCount)) do
        begin
          if ContLst.ByName(CurContName).Box[i].Sel then sel:=true;
          inc(i);
        end;
    end;
end;

procedure TSDIAppForm.LoadSGDblClick(Sender: TObject);
var
  i   : integer;
  sel : boolean;
begin
  if (CurBoxInd>-1) then
    begin
      ContLst.ByName(CurContName).Box[CurBoxInd].Sel:=
       not ContLst.ByName(CurContName).Box[CurBoxInd].Sel;
       LoadSG.Refresh;
       //Проверяем есть ли в списке выбранные элементы
       //и настраиваем кнопку перемещения коробок
       sel:=false;
       i:=0;
       while (not sel)and(i<(ContLst.ByName(CurContName).BoxCount)) do
        begin
          if ContLst.ByName(CurContName).Box[i].Sel then sel:=true;
          inc(i);
        end;
    end;
end;

procedure TSDIAppForm.LoadSGDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  str  : WideString;
  Flag : Cardinal;
  Rct  : TRect;
  BI   : integer;
  Clr  : TColor;
begin
  if (ACol=0)and(Arow>0)and(CurContName<>'')and(ContLst.ByName(CurContName).BoxCount>0)
     then begin
      BI:=ContLst.ByName(CurContName).FindByRowInd(ARow).X;
      if (BI>-1)and(ContLst.ByName(CurContName).Box[BI].Sel)
         and((Sender as TTntStringGrid).Cells[Acol,Arow]<>'') then
         (Sender as TTntStringGrid).Canvas.Draw(Rect.Left,Rect.Top+1,OrdSelImg.Picture.Graphic);
     end;
  if (ARow>0)and(ACol>0)and(CurContName<>'')and(ContLst.ByName(CurContName).BoxCount>0) then
  with (Sender as TTntStringGrid) do
    begin
      BI:=ContLst.ByName(CurContName).FindByRowInd(ARow).X;
      if (BI=CurBoxInd)and(ARow<>Selection.Top) then
        begin
          str :=Cells[Acol,Arow];
          Clr:=clSkyBlue;
          if Canvas.Brush.Color<>Clr then Canvas.Brush.Color:=Clr;
          Canvas.FillRect(Rect);
          Rct:=Rect;
          Flag := DT_LEFT;
          Inc(Rct.Left,2);
          Inc(Rct.Top,2);
          DrawTextW((Sender as TDrawGrid).Canvas.Handle,PWideChar(str),length(str),Rct,Flag);
        end;
      if (ACol=8)and(BI>-1)then
      if(ContLst.ByName(CurContName).Box[BI].Net>ContLst.ByName(CurContName).Box[BI].BNet)or
          (ContLst.ByName(CurContName).Box[BI].BNet=0) then
        begin
          str :=Cells[Acol,Arow];
          Clr:=clRed;
          if Canvas.Font.Color<>Clr then Canvas.Font.Color:=Clr;
          Canvas.FillRect(Rect);
          Rct:=Rect;
          Flag := DT_LEFT;
          Inc(Rct.Left,2);
          Inc(Rct.Top,2);
          DrawTextW((Sender as TDrawGrid).Canvas.Handle,PWideChar(str),length(str),Rct,Flag);
        end;
    end;
end;

procedure TSDIAppForm.LoadSGEdBtnClick(Sender: TObject);
var
  Items     : array of TOneBoxItem;
  Cnt,i,bc  : integer;
  BoxCode : string;
begin
  if (CurBoxInd>-1)and(ContLst.ByName(CurContName).Box[CurBoxInd].Group) then
    begin
      cnt:=0;
      for I := 0 to ContLst.ByName(CurContName).Box[CurBoxInd].ItemCount-1 do
          begin
            inc(cnt);
            SetLength(Items,Cnt);
            Items[Cnt-1]:=ContLst.ByName(CurContName).Box[CurBoxInd].Items[i];
          end;
      bc:=ContLst.ByName(CurContName).Box[CurBoxInd].BoxCount;
      BoxCode := ContLst.ByName(CurContName).Box[CurBoxInd].BoxCode;
      bc:=CreateBoxForm.ShowForm(Items,bc,Cnt,Lang,
        ContLst.ByName(CurContName).Box[CurBoxInd].BNet, BoxCode);
      if bc>0 then
        begin
          ContLst.ByName(CurContName).Box[CurBoxInd].BoxCode := BoxCode;
          ContLst.ByName(CurContName).Box[CurBoxInd].BoxCount:=bc;
          ContLst.ByName(CurContName).Box[CurBoxInd].BNet:=StrToFloat(CreateBoxForm.BoxGNet.Text);
          for I := 0 to Cnt - 1 do ContLst.ByName(CurContName).Box[CurBoxInd].Items[i].Count:=Items[i].Count;
          self.UpdateContList(CurContName);
          self.UpdateOrdLists(CurOrdName);
          self.UpdateDtPn;
        end;
    end;
end;

procedure TSDIAppForm.LoadSGMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  pnt : TPoint;
begin
  if (LoadSG.MouseCoord(x,y).X=8)and(LoadSG.MouseCoord(x,y).y>0)
      and(LoadSG.MouseCoord(x,y).y<LoadSG.RowCount)and
      (ContLst.ByName(CurContName).FindByRowInd(LoadSG.MouseCoord(x,y).Y).Y=0) then
    begin
      pnt:=LoadSG.CellRect(LoadSG.MouseCoord(x,y).X,LoadSG.MouseCoord(x,y).Y).TopLeft;
      pnt:=LoadSG.ClientToScreen(pnt);
      pnt:=LoadPn.ScreenToClient(pnt);
      BNETED.Top:=pnt.Y;
      BNETED.Left:=pnt.X;
      BNETED.Width:=LoadSG.ColWidths[7];
      BNETED.Height:=LoadSG.RowHeights[LoadSG.MouseCoord(x,y).y];
      BNETED.Visible:=true;
      BNETED.Text:=FormatFloat('###0.####',ContLst.ByName(CurContName).Box[CurBoxInd].BNet);
    end else BNETED.Visible:=false;
end;

procedure TSDIAppForm.LoadSGSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  if CurContName<>'' then
    begin
      if CurBoxInd<>ContLst.ByName(CurContName).FindByRowInd(Arow).X then BNETED.Visible:=false;
      CurBoxInd:=ContLst.ByName(CurContName).FindByRowInd(Arow).X;
      if (CurBoxInd>-1) then LoadSG.Repaint;
      self.UpdateBtn;
    end;
end;

procedure TSDIAppForm.ContTbsChange(Sender: TObject; NewTab: Integer;
  var AllowChange: Boolean);
begin
  CurContName:=ContTbs.Tabs[NewTab];
  self.UpdateContList(CurContName);
  self.LoadSG.Repaint;
end;

procedure TSDIAppForm.ContVolClick(Sender: TObject);
begin

end;

//-------------- Работа визуальных компонентов панели заказа -------------------

procedure TSDIAppForm.OrdTbsChange(Sender: TObject; NewTab: Integer;
  var AllowChange: Boolean);
begin
  CurOrdName:=OrdTbs.Tabs[NewTab];
  {    CIBED.Visible:=false;
  if (OrdSG.Selection.Top>0)and(OrdTbs.TabIndex>-1) then
    begin
      ModInd:=ModLst.IndByName(CurOrdName);
      CurItem:=ModLst.Model[ModInd].Item[OrdSG.Selection.Top-1];
      self.UpdateDtPn;
    end;}
  self.UpdateOrdLists(CurOrdName);
  self.OrdSG.Repaint;
  self.DataPn.Visible:=false;
end;

procedure TSDIAppForm.OrdPrintBtnClick(Sender: TObject);
begin
  if CurOrdName<>'' then PrDM.PrintOrder(CurOrdName,Lang);
end;

procedure TSDIAppForm.OrdSGDblClick(Sender: TObject);
var
  ModInd : integer;
begin
  if (OrdSG.Selection.Top>0)and(ModLst.Model[ModLst.IndByName(CurOrdName)].Count>0) then
    begin
      ModInd:=ModLst.IndByName(OrdTbs.Tabs[OrdTbs.TabIndex]);
      ModLst.Model[ModInd].Item[OrdSG.Selection.Top-1].sel:=
        not ModLst.Model[ModInd].Item[OrdSG.Selection.Top-1].sel;
      CurItem:=ModLst.Model[ModInd].Item[OrdSG.Selection.Top-1];
      OrdSG.Refresh;
      self.UpdateBtn;
    end;
end;

procedure TSDIAppForm.OrdSGDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  MI   : integer;
  Item : TOnePos;
  s    : Widestring;
  Flag : Cardinal;
  Rct  : TRect;
  Clr  : TColor;
begin
  if (CurOrdName<>'')and(ModLst.Model[ModLst.IndByName(CurOrdName)].Count>0) then
   if(Arow>0)and(Acol>-1)then
    begin
      s := (Sender as TTntStringGrid).Cells[Acol,Arow];
      MI:=ModLst.IndByName(CurOrdName);
      Item:=ModLst.Model[MI].Item[ARow-1];
      Clr:=clBlack;
      if ContLst.PosCount(CurOrdName,Item.Code)>=Item.TotCount then Clr:=clSilver;
      if (ContLst.PosCount(CurOrdName,Item.Code)<Item.TotCount)and(ACol=2) then Clr:=clRed;
      if (ContLst.PosCount(CurOrdName,Item.Code)>Item.TotCount)and(ACol=2) then
        begin
        s:=FormatFloat('##0.#######',ContLst.PosCount(CurOrdName,Item.Code)-Item.TotCount);
        s:='+'+s;
        Clr:=clGreen;
        end;
      if (clr<>clSilver)and(Item.CIBOld>Item.CntInBox)and(ACol=4) then Clr:=clRed;
      if (clr<>clSilver)and(Item.CIBOld<Item.CntInBox)and(ACol=4) then Clr:=clGreen;
      if (Sender as TStringGrid).Canvas.Font.Color<>Clr then (Sender as TStringGrid).Canvas.Font.Color:=Clr;
      Rct:=Rect;
      Flag := DT_LEFT;
      Flag := Flag or DT_WORDBREAK;
      if (item.sel)and(ACol=0) then
        (Sender as TTntStringGrid).Canvas.Draw(Rect.Left,Rect.Top+1,OrdSelImg.Picture.Graphic)
        else
        begin
          (Sender as TTntStringGrid).Canvas.FillRect(Rect);
          Inc(Rct.Left,3);
          Dec(Rct.Right,3);
          DrawTextW((Sender as TTntStringGrid).Canvas.Handle,PWideChar(s),length(s),Rct,Flag);
        end;
    end;
end;

procedure TSDIAppForm.OrdSGMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  pnt : TPoint;
begin
  if (OrdSG.MouseCoord(x,y).X=4)and(OrdSG.MouseCoord(x,y).y>0)
      and(OrdSG.MouseCoord(x,y).y<OrdSG.RowCount) then
    begin
      pnt:=OrdSG.CellRect(OrdSG.MouseCoord(x,y).X,OrdSG.MouseCoord(x,y).Y).TopLeft;
      pnt:=OrdSG.ClientToScreen(pnt);
      pnt:=OrdPn.ScreenToClient(pnt);
      CIBED.Top:=pnt.Y;
      CIBED.Left:=pnt.X;
      CIBED.Width:=OrdSG.ColWidths[4];
      CIBED.Height:=OrdSG.RowHeights[OrdSG.MouseCoord(x,y).y];
      CIBED.Visible:=true;
      CIBED.Text:=IntToStr(CurItem.CntInBox);
    end else CIBED.Visible:=false;
end;

procedure TSDIAppForm.OrdSGSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
var
  ModInd : integer;
begin
  if (OrdSG.Selection.Top>0)and(OrdTbs.TabIndex>=0) then
    begin
      CIBED.Visible:=false;
      ModInd:=ModLst.IndByName(OrdTbs.Tabs[OrdTbs.TabIndex]);
      CurItem:=ModLst.Model[ModInd].Item[ARow-1];
      self.UpdateDtPn;
    end;
end;

procedure TSDIAppForm.CIBEDKeyPress(Sender: TObject; var Key: Char);
begin
  if not((key in ['0'..'9'])or(ord(key)=13)or(ord(key)=8)or(ord(key)=46)) then
    begin
      beep;
      key:=#0;
    end;
  if ord(key)=13 then
    begin
      CIBED.Visible:=false;
      ModLst.Model[ModLst.IndByName(CurOrdName)].Item[OrdSG.Selection.Top-1].CntInBox:=
        StrToInt(CIBED.Text);
      CurItem.CntInBox:=StrToInt(CIBED.Text);
      self.UpdateOrdLists(CurOrdName);
      self.UpdateDtPn;
    end;
end;

//------------- Процедуры обработки нажатия основных кнопок --------------------

procedure TSDIAppForm.AutoLoadBtnClick(Sender: TObject);
var
  NewBox : TOneBoxItem;
  Item   : TOnePos;
  i,bc,ind : integer;
  LoadCount : real;
begin
  if (CurContName<>'')and(CurOrdName<>'') then
   for I:= 0 to ModLst.Model[ModLst.IndByName(CurOrdName)].Count-1 do
    begin
      item:=ModLst.Model[ModLst.IndByName(CurOrdName)].Item[i];
      LoadCount:=ContLst.PosCount(CurOrdName,Item.Code);
      if//Если деталь загружается в коробку (те кол-во в коробке больше 0)
        (item.CntInBox>0)
        //Если осталось какое то незагруж кол-во
        and((Item.TotCount-LoadCount)>0)
        //Если незагруженно 1 или больше коробок
        and(trunc((Item.TotCount-LoadCount)/Item.CntInBox)>0)
        //тогда загружаем деталь в контейнер
        then begin
          NewBox.OrdName:=CurOrdName;
          NewBox.PosCode:=Item.Code;
          bc:= trunc((Item.TotCount-LoadCount)/Item.CntInBox);
          NewBox.Count:= Item.CntInBox*bc ;
          NewBox.NetEI:=Item.NetEI;
          ind:=ContLst.ByName(CurContName).NewGroup(bc,NewBox,true,ContLst.GetNextBoxCode);
          ContLst.ByName(CurContName).Box[Ind].BNet:=Item.GNet;
          ModLst.Model[ModLst.IndByName(CurOrdName)].Item[i].sel:=false;
          self.UpdateContList(CurContName);
          self.UpdateDtPn;
          self.UpdateOrdLists(CurOrdName);
        end;
    end;
end;

procedure TSDIAppForm.CrBoxBtnClick(Sender: TObject);
var
  Items        : array of TOneBoxItem;
  Cnt,i,bc,bi  : integer;
  Count,Net    : real;
  BoxCode : string;
begin
  if (CurOrdName<>'')and(CurContName<>'') then
    begin
      cnt:=0;
      Net:=0;
      for I := 0 to ModLst.Model[ModLst.IndByName(CurOrdName)].Count-1 do
        if ModLst.Model[ModLst.IndByName(CurOrdName)].Item[i].sel then
          begin
            inc(cnt);
            SetLength(Items,Cnt);
            Items[Cnt-1].OrdName:=CurOrdName;
            Items[Cnt-1].PosCode:=ModLst.Model[ModLst.IndByName(CurOrdName)].Item[i].Code;
            Count:=ContLst.PosCount(CurOrdName,Items[Cnt-1].PosCode);
            Count:=ModLst.Model[ModLst.IndByName(CurOrdName)].Item[i].TotCount-Count;
            Items[Cnt-1].Count:=Count;
            Items[Cnt-1].NetEI:=ModLst.Model[ModLst.IndByName(CurOrdName)].Item[i].NetEI;
            if Items[Cnt-1].NetEI then
                Net:=Net+Count
              else
                Net:=Net+ModLst.Model[ModLst.IndByName(CurOrdName)].Item[i].Net*Count;
          end;
      if Cnt=0 then Abort;
      BoxCode := '';
      bc:=CreateBoxForm.ShowForm(Items,1,Cnt,Lang,0,BoxCode);
      if bc>0 then
        begin
          bi:=ContLst.ByName(CurContName).NewGroup(bc,Items[0],true,ContLst.GetNextBoxCode, BoxCode);
          ContLst.ByName(CurContName).Box[bi].BNet:=StrToFloat(CreateBoxForm.BoxGNet.Text);
          for I := 1 to Cnt - 1 do ContLst.ByName(CurContName).Box[bi].AddInBox(Items[i]);
          self.UpdateContList(CurContName);
        end;
      for I := 0 to ModLst.Model[ModLst.IndByName(CurOrdName)].Count-1 do
        ModLst.Model[ModLst.IndByName(CurOrdName)].Item[i].sel:=false;
      self.UpdateOrdLists(CurOrdName);
      self.UpdateDtPn;
    end;
end;

procedure TSDIAppForm.DelBoxBtnClick(Sender: TObject);
begin
  if CurBoxInd>-1 then
    begin
      ContLst.ByName(CurContName).DeleteBox(CurBoxInd);
      if ContLst.ByName(CurContName).BoxCount=0 then CurBoxInd:=-1;
      self.UpdateContList(CurContName);
      self.UpdateOrdLists(CurOrdName);
      self.UpdateDtPn;
    end;
end;

procedure TSDIAppForm.DelItmBtnClick(Sender: TObject);
var
  Ind : integer;
begin
  if (CurBoxInd>-1)and(ContLst.ByName(CurContName).Box[CurBoxInd].ItemCount>1) then
    begin
      Ind:=ContLst.ByName(CurContName).FindByRowInd(LoadSG.Selection.Top).Y;
      ContLst.ByName(CurContName).Box[CurBoxInd].DelItem(Ind);
      self.UpdateContList(CurContName);
      self.UpdateOrdLists(CurOrdName);
      self.UpdateDtPn;
    end;
end;

procedure TSDIAppForm.CrItmBtnClick(Sender: TObject);
var
  Items     : array of TOneBoxItem;
  Cnt,i,bc,k  : integer;
  Count     : real;
  BoxCode : string;
begin
  if (CurItem.Code<>'')and(CurBoxInd>-1)and(CurItem.sel)and
     (ContLst.ByName(CurContName).Box[CurBoxInd].Group) then
    begin
      cnt:=0;
      for I := 0 to ContLst.ByName(CurContName).Box[CurBoxInd].ItemCount-1 do
          begin
            inc(cnt);
            SetLength(Items,Cnt);
            Items[Cnt-1]:=ContLst.ByName(CurContName).Box[CurBoxInd].Items[i];
          end;
      for I := 0 to ModLst.Model[ModLst.IndByName(CurOrdName)].Count-1 do
        if ModLst.Model[ModLst.IndByName(CurOrdName)].Item[i].sel then
          begin
            inc(cnt);
            SetLength(Items,Cnt);
            Items[Cnt-1].OrdName:=CurOrdName;
            Items[Cnt-1].PosCode:=ModLst.Model[ModLst.IndByName(CurOrdName)].Item[i].Code;
            Count:=ContLst.PosCount(CurOrdName,Items[Cnt-1].PosCode);
            Count:=ModLst.Model[ModLst.IndByName(CurOrdName)].Item[i].TotCount-Count;
            Items[Cnt-1].Count:=Count;
            Items[Cnt-1].NetEI:=ModLst.Model[ModLst.IndByName(CurOrdName)].Item[i].NetEI;
          end;
      if Cnt=0 then Abort;
      BoxCode := ContLst.ByName(CurContName).Box[CurBoxInd].BoxCode;
      bc:=ContLst.ByName(CurContName).Box[CurBoxInd].BoxCount;
      bc:=CreateBoxForm.ShowForm(Items,bc,Cnt,Lang,
        ContLst.ByName(CurContName).Box[CurBoxInd].BNet,BoxCode);
      if bc>0 then
        begin
          ContLst.ByName(CurContName).Box[CurBoxInd].BoxCode := BoxCode;
          ContLst.ByName(CurContName).Box[CurBoxInd].BoxCount:=bc;
          ContLst.ByName(CurContName).Box[CurBoxInd].BNet:=StrToFloat(CreateBoxForm.BoxGNet.Text);
          k:=ContLst.ByName(CurContName).Box[CurBoxInd].ItemCount;
          for I := 0 to k-1 do ContLst.ByName(CurContName).Box[CurBoxInd].Items[i].Count:=Items[i].Count;
          for I := k to Cnt - 1 do ContLst.ByName(CurContName).Box[CurBoxInd].AddInBox(Items[i]);
          self.UpdateContList(CurContName);
        end;
      for I := 0 to ModLst.Model[ModLst.IndByName(CurOrdName)].Count-1 do
        ModLst.Model[ModLst.IndByName(CurOrdName)].Item[i].sel:=false;
      self.UpdateOrdLists(CurOrdName);
      self.UpdateDtPn;
    end;
end;

end.
