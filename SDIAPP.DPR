program Sdiapp;

uses
  Forms,
  SDIMAIN in 'SDIMAIN.PAS' {SDIAppForm},
  ABOUT in 'ABOUT.PAS' {AboutBox},
  TDataLst in 'TDataLst.pas',
  LangUnit in 'LangUnit.pas',
  TCont in 'TCont.pas',
  NewContUnit in 'NewContUnit.pas' {NewContForm},
  CreateBoxUnit in 'CreateBoxUnit.pas' {CreateBoxForm},
  PrUnit in 'PrUnit.pas' {PrDM: TDataModule},
  PrSetUnit in 'PrSetUnit.pas' {PrSetForm},
  AcsUnit in 'AcsUnit.pas' {AcsForm},
  CntLstUnit in 'CntLstUnit.pas' {CntLstForm},
  FindUnit in 'FindUnit.pas' {FindForm},
  DtEDUnit in 'DtEDUnit.pas' {DtEDForm},
  ExpOrd in 'ExpOrd.pas' {ExpOrdForm},
  CompUnit in 'CompUnit.pas' {CompForm},
  ExpCont in 'ExpCont.pas' {ExpContForm},
  UpdDtUnit in 'UpdDtUnit.pas' {UpdDtForm},
  OrdSumUnit in 'OrdSumUnit.pas' {OrdSumForm},
  RateUnit in 'RateUnit.pas' {RateForm},
  ImportFromKlass in 'ImportFromKlass.pas' {ImportFromExcelForTurkei};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TSDIAppForm, SDIAppForm);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TNewContForm, NewContForm);
  Application.CreateForm(TCreateBoxForm, CreateBoxForm);
  Application.CreateForm(TPrDM, PrDM);
  Application.CreateForm(TPrSetForm, PrSetForm);
  Application.CreateForm(TAcsForm, AcsForm);
  Application.CreateForm(TCntLstForm, CntLstForm);
  Application.CreateForm(TFindForm, FindForm);
  Application.CreateForm(TDtEDForm, DtEDForm);
  Application.CreateForm(TExpOrdForm, ExpOrdForm);
  Application.CreateForm(TCompForm, CompForm);
  Application.CreateForm(TExpContForm, ExpContForm);
  Application.CreateForm(TUpdDtForm, UpdDtForm);
  Application.CreateForm(TOrdSumForm, OrdSumForm);
  Application.CreateForm(TImportFromExcelForTurkei, ImportFromExcelForTurkei);
  Application.Run;
end.
 
