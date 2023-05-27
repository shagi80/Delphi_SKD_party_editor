unit RateUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TRateForm = class(TForm)
    USDtoRUBED: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    RUBtoRMBED: TEdit;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function GetRate(var USD,RMB : real): boolean;

implementation

{$R *.dfm}

function GetRate(var USD,RMB : real): boolean;
var
  form : TRateForm;
begin
  form:=TrateForm.Create(application);
  form.USDtoRUBED.Text:=FormatFloat('###0.0###',USD);
  form.RUBtoRMBED.Text:=FormatFloat('###0.0###',RMB);
  if form.ShowModal=mrOK then begin
    usd:=StrToFloatDef(form.USDtoRUBED.Text,0);
    rmb:=StrToFloatDef(form.RUBtoRMBED.Text,0);
    result:=true;
  end else result:=false;
  form.Free;
end;


procedure TRateForm.BitBtn1Click(Sender: TObject);
begin
  if(StrToFloatDef(USDtoRUBED.Text,0)=0)or(StrToFloatDef(RUBtoRMBED.Text,0)=0) then
      MessageDLG('Ошибка ввода !',mtError,[mbOK],0) else self.ModalResult:=mrOk;
end;

end.
