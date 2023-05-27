unit AcsUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

const
  paswrd='shrtyjk';

type
  TAcsForm = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    AcsED: TEdit;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function ShowForm(Lang:integer):boolean;
  end;

var
  AcsForm: TAcsForm;

implementation

{$R *.dfm}

uses LangUnit;

var
  res:boolean;

procedure TAcsForm.BitBtn1Click(Sender: TObject);
var
  str:string;
begin
  if AcsED.Text=paswrd then
    begin
      res:=true;
      self.Close;
    end
    else
      begin
        res:=false;
        if Lang=lgRus then str:='Пароль не верен!';
        if (Lang=lgEng)or(Lang=lgCn) then str:='Password incorrect!';
        MessageDlg(str,mtError,[mbOk],0);
      end;
end;

function TAcsForm.ShowForm(Lang: Integer):boolean;
begin
  if Lang=lgRUS then self.Caption:='Пароль';
  if Lang=lgEng then self.Caption:='Password';
  res:=false;
  self.AcsED.Text:='';
  Self.ShowModal;
  result:=res;
end;

end.
