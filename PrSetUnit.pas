unit PrSetUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TPrSetForm = class(TForm)
    Panel1: TPanel;
    PrRG: TRadioGroup;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    function PrintSet(sel:boolean):integer;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PrSetForm: TPrSetForm;

implementation

{$R *.dfm}

uses LangUnit;

function TPrSetForm.PrintSet(sel: Boolean):integer;
begin
  self.Caption:=prstCap;
  self.PrRG.Caption:=prstPRRGCap;
  PrRG.Items.Clear;
  PrRG.Items.Add('');
  PrRG.Items.Strings[0]:=prstRI1;
  PrRG.Items.Add('');
  PrRG.Items.Strings[1]:=prstRI2;
  if sel then
    begin
      PrRG.Items.Add('');
      PrRG.Items.Strings[2]:=prstRI3;
    end;
  PrRG.ItemIndex:=0;
  result:=0;
  if Self.ShowModal=mrOK then result:=PrRG.ItemIndex+1;
end;

end.
