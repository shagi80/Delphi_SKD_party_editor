unit CntLstUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  TCntLstForm = class(TForm)
    Panel1: TPanel;
    CntLst: TListBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BCLB: TLabel;
    BCED: TEdit;
    BCUD: TUpDown;
  private
    { Private declarations }
  public
    { Public declarations }
    function ShowForm(Lang:integer; ContLst:TStringList; BC: integer):string;
  end;

var
  CntLstForm: TCntLstForm;

implementation

{$R *.dfm}

uses LangUnit;

function TCntLstForm.ShowForm(Lang: Integer; ContLst: TStringList; BC: integer): string;
begin
  if Lang=lgENG then
    begin
      self.Caption:='Container list:';
      self.BCLB.Caption:='Boxes qty :';
    end;
  if Lang=lgRUS then
    begin
      self.Caption:='Список контейнеров:';
      self.BCLB.Caption:='Кол-во коробок :';
    end;
  CntLst.Items.Clear;
  CntLst.Items.AddStrings(ContLst);
  CntLst.ItemIndex:=0;
  BCUD.Min:=1;
  BCUD.Max:=BC;
  BCUD.Position:=bc;
  result:='';
  if self.ShowModal=mrOk then result:=CntLst.Items[CntLst.ItemIndex];
end;

end.
