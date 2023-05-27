unit DtEDUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, TDataLst, TntStdCtrls;

const
  edmEdit   = 0;
  edmNew    = 1;
  edmCopy   = 2;
  edmCNName = 3;

type
  TDtEDForm = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    ENameED: TEdit;
    Label8: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    BomED: TEdit;
    QtyED: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    WghtED: TEdit;
    VolED: TEdit;
    Label15: TLabel;
    FOBED: TEdit;
    Label16: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    TCB: TCheckBox;
    Bevel2: TBevel;
    CodeED: TEdit;
    RNameED: TEdit;
    LRNameED: TEdit;
    CIBED: TEdit;
    BARED: TEdit;
    Label4: TLabel;
    CIBOldED: TEdit;
    Label5: TLabel;
    PRNED: TEdit;
    Label6: TLabel;
    PRAED: TEdit;
    Label9: TLabel;
    EICB: TComboBox;
    Label11: TLabel;
    Label17: TLabel;
    TNCodeED: TEdit;
    Label18: TLabel;
    BoxTypeEd: TEdit;
    CnNameED: TTntEdit;
    Label19: TLabel;
    CIOneEd: TEdit;
    procedure TCBClick(Sender: TObject);
    function Show(edm:byte; var Itm : TOnePos):boolean;
    procedure SetLang(lng:byte);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DtEDForm: TDtEDForm;
  totchange : boolean;

implementation

{$R *.dfm}

var
  lang : byte;

procedure TDtEDForm.SetLang(lng: Byte);
begin
  lang:=lng;
  if lng=0 then
    begin
      Label1.Caption:='��� �� 1�:';
      Label2.Caption:='������������:';
      Label3.Caption:='��� ������������:';
      Label8.Caption:='��� � ����� (���):';
      Label4.Caption:='��� � ����� (����):';
      Label9.Caption:='������� ���������:';
      Label7.Caption:='���� ������������:';
      Label11.Caption:='��� ������������:';
      Label17.Caption:='��� �����:';
      Label18.Caption:='��� ��������:';
      Label16.Caption:='���� FOB,USD:';
      Label15.Caption:='����� 1 ��,�3:';
      Label6.Caption:='���� �������,USD:';
      Label5.Caption:='���� �������,USD:';
      Label12.Caption:='BOM ���:';
      Label10.Caption:='�����-���:';
      Label14.Caption:='��� 1 ��,��:';
      Label13.Caption:='����� ����������:';
      Label19.Caption:='��� � 1 �������:';
      TCB.Caption:='�������� ��� ������ �� ���� ������� (���������� ���������� �� ��������)';
    end;
  if lng>0 then
    begin
      Label1.Caption:='Spec code:';
      Label2.Caption:='Rus name:';
      Label3.Caption:='Full rus name:';
      Label8.Caption:='Count in box (new):';
      Label4.Caption:='Count in box (old):';
      Label9.Caption:='Unit:';
      Label7.Caption:='Eng name:';
      Label11.Caption:='Chine name:';
      Label17.Caption:='Rus custom code:';
      Label18.Caption:='Box type:';
      Label16.Caption:='Price FOB,USD:';
      Label15.Caption:='Vol 1 pcs,m3:';
      Label6.Caption:='Price Angarsk,USD:';
      Label5.Caption:='Price Novoros,USD:';
      Label12.Caption:='BOM code:';
      Label10.Caption:='BAR-code:';
      Label14.Caption:='Net weight,kg:';
      Label13.Caption:='Ordered count:';
      Label19.Caption:='Qty in 1 machine:';
      TCB.Caption:='change all record (ordered count not changing)';
    end;
end;

function TDtEDForm.Show(edm:byte; var Itm: TOnePos):boolean;
var
  fl : boolean;
begin
  if edm=edmNew then
    begin
      if lang=0 then self.Caption:='���������� ������ � ������� �����'
        else self.Caption:='Add detail in current order';
      CodeED.Enabled:=true;
      TCB.Visible:=false;
      totchange:=false;
      CodeED.Text:='�0000000';
      RNameED.Text:='';
      LRNameED.Text:='';
      CIBED.Text:='0';
      CIBOldED.Text:='0';
      BARED.Text:='';
      ENameED.Text:='';
      BomED.Text:='';
      QtyED.Text:=FormatFloat('####0.#####',0);
      WghtED.Text:=FormatFloat('####0.#####',0);
      VolED.Text:=FormatFloat('####0.#####',0);
      FOBED.Text:=FormatFloat('####0.#####',0);
      PRNED.Text:=FormatFloat('####0.#####',0);
      PRAED.Text:=FormatFloat('####0.#####',0);
      CnNameED.Text:='';
      TNCodeEd.Text:='';
      BoxTypeEd.Text:='';
      EICB.ItemIndex:=0;
      CIOneED.Text:='0';
    end;
  if edm=edmCopy then
    begin
      if lang=0 then self.Caption:='����������� ������ � ������� ������'
        else self.Caption:='Copy detail in current order';
      CodeED.Enabled:=true;
      TCB.Visible:=false;
      totchange:=false;
      CodeED.Text:=Itm.Code;
      RNameED.Text:=Itm.RName;
      LRNameED.Text:=Itm.LRName;
      CIBED.Text:=IntToStr(itm.CntInBox);
      CIBOldED.Text:=IntTOStr(Itm.CIBOld);
      BARED.Text:=Itm.BarCode;
      ENameED.Text:=Itm.EName;
      BomED.Text:=Itm.BOM;
      QtyED.Text:=FormatFloat('####0.#####',itm.TotCount);
      WghtED.Text:=FormatFloat('####0.#####',itm.Net);
      VolED.Text:=FormatFloat('####0.#####',itm.Vol);
      FOBED.Text:=FormatFloat('####0.#####',itm.Price);
      PRNED.Text:=FormatFloat('####0.#####',itm.PriceN);
      PRAED.Text:=FormatFloat('####0.#####',itm.PriceA);
      if itm.EI='��' then EICB.ItemIndex:=0;
      if itm.EI='��' then EICB.ItemIndex:=1;
      if itm.EI='�'  then EICB.ItemIndex:=2;
      if itm.EI='�'  then EICB.ItemIndex:=3;
      if itm.EI='��' then EICB.ItemIndex:=4;
      if itm.EI='��' then EICB.ItemIndex:=5;
      CnNameED.Text:=UTF8Decode(itm.CName);
      TNCodeEd.Text:=itm.TNCode;
      BoxTypeEd.Text:=itm.BoxType;
      CIOneED.Text:=FormatFloat('####0.#####',itm.CntInOne);
    end;
  if (edm=edmEdit)or(edm=edmCNName) then
    begin
      if lang=0 then self.Caption:='�������������� ������ � ������ (�������)'
        else self.Caption:='Edit detail in current order (or all orders)';
      CodeED.Enabled:=false;
      TCB.Visible:=true;
      totchange:=false;
      TCB.Checked:=totchange;
      QtyED.Enabled:=not totchange;
      CodeED.Text:=Itm.Code;
      RNameED.Text:=Itm.RName;
      LRNameED.Text:=Itm.LRName;
      CIBED.Text:=IntToStr(itm.CntInBox);
      CIBOldED.Text:=IntTOStr(Itm.CIBOld);
      BARED.Text:=Itm.BarCode;
      ENameED.Text:=Itm.EName;
      BomED.Text:=Itm.BOM;
      QtyED.Text:=FormatFloat('####0.#####',itm.TotCount);
      WghtED.Text:=FormatFloat('####0.#####',itm.Net);
      VolED.Text:=FormatFloat('####0.#####',itm.Vol);
      FOBED.Text:=FormatFloat('####0.#####',itm.Price);
      PRNED.Text:=FormatFloat('####0.#####',itm.PriceN);
      PRAED.Text:=FormatFloat('####0.#####',itm.PriceA);
      if itm.EI='��' then EICB.ItemIndex:=0;
      if itm.EI='��' then EICB.ItemIndex:=1;
      if itm.EI='�'  then EICB.ItemIndex:=2;
      if itm.EI='�'  then EICB.ItemIndex:=3;
      if itm.EI='��' then EICB.ItemIndex:=4;
      if itm.EI='��' then EICB.ItemIndex:=5;
      CnNameED.Text:=UTF8Decode(itm.CName);
      TNCodeEd.Text:=itm.TNCode;
      BoxTypeEd.Text:=itm.BoxType;
      CIOneED.Text:=FormatFloat('####0.#####',itm.CntInOne);
      //
      if edm=edmCNName then fl:=false else fl:=true;
      if not(fl) then
        if lang=0 then self.Caption:=self.Caption+' (�������������� ������ ��� ������������)'
          else self.Caption:=self.Caption+' (edit only chine name)';
      ENameED.Enabled  :=fl;
      BomED.Enabled    :=fl;
      QtyED.Enabled    :=fl;
      WghtED.Enabled   :=fl;
      VolED.Enabled    :=fl;
      FOBED.Enabled    :=fl;
      CodeED.Enabled   :=fl;
      RNameED.Enabled  :=fl;
      LRNameED.Enabled :=fl;
      CIBED.Enabled    :=fl;
      BARED.Enabled    :=fl;
      CIBOldED.Enabled :=fl;
      PRNED.Enabled    :=fl;
      PRAED.Enabled    :=fl;
      TNCodeED.Enabled :=fl;
      BoxTypeEd.Enabled:=fl;
      EICB.Enabled     :=fl;
      CIOneEd.Enabled  :=fl;
    end;
  if self.ShowModal=mrOk then
    begin
      Itm.Code:=CodeED.Text;
      Itm.RName:=RNameED.Text;
      Itm.LRName:=LRNameED.Text;
      itm.CntInBox:=StrToInt(CIBED.Text);
      Itm.CIBOld:=StrToInt(CIBOldED.Text);
      Itm.BarCode:=BARED.Text;
      Itm.EName:=ENameED.Text;
      Itm.BOM:=BomED.Text;
      if (not totchange) then Itm.TotCount:=StrToFloat(QtyED.Text);
      Itm.Net:=StrToFloat(WghtED.Text);
      Itm.Vol:=StrToFloat(VolED.Text);
      Itm.Price:=StrToFloat(FOBED.Text);
      Itm.PriceN:=StrToFloat(PRNED.Text);
      Itm.PriceA:=StrToFloat(PRAED.Text);
      if EICB.ItemIndex=0 then itm.EI:='��';
      if EICB.ItemIndex=1 then itm.EI:='��';
      if EICB.ItemIndex=2 then itm.EI:='�';
      if EICB.ItemIndex=3 then itm.EI:='�';
      if EICB.ItemIndex=4 then itm.EI:='��';
      if EICB.ItemIndex=5 then itm.EI:='��';
      if ((itm.EI='�')or(itm.EI='�')or(itm.EI='��')or(itm.EI='��'))
        then itm.NetEI:=true else itm.NetEI:=false;
      itm.CName:=UTF8Encode(CnNameED.Text);
      itm.TNCode:=TNCodeEd.Text;
      itm.BoxType:=BoxTypeEd.Text;
      itm.CntInOne:=StrToFloat(CIOneED.Text);
      result:=true;
    end else result:=false;
end;

procedure TDtEDForm.TCBClick(Sender: TObject);
begin
  totchange:=TCB.Checked;
  QtyED.Enabled:=not totchange;
end;

end.
