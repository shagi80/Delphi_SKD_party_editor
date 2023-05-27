unit NewContUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TNewContForm = class(TForm)
    Panel1: TPanel;
    NewContMaxVolCap: TLabel;
    NewContMaxNetCap: TLabel;
    NewContName: TEdit;
    NewContNameCap: TLabel;
    NewContMaxNet: TEdit;
    NewContMaxVol: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NewContMaxNetKeyPress(Sender: TObject; var Key: Char);
    function ShowForm(num : integer):boolean;
    function ChgData(name : string; Net,Vol: real):boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NewContForm: TNewContForm;

implementation

{$R *.dfm}

uses LangUnit;

var
  newname : string;

procedure TNewContForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if self.NewContMaxNet.Text='' then self.NewContMaxNet.Text:='0';
  if self.NewContMaxVol.Text='' then self.NewContMaxVol.Text:='0';
  if NewContName.Text='' then NewContName.Text:=newname;
end;

procedure TNewContForm.NewContMaxNetKeyPress(Sender: TObject; var Key: Char);
begin
  if not((key in ['0'..'9'])or(key=',')or(ord(key)=13)or(ord(key)=8)or(ord(key)=46)) then
    begin
      beep;
      key:=#0;
    end;
end;

function TNewContForm.ShowForm(num : integer):boolean;
begin
  self.Caption:=tNewContFormCap;
  NewContNameCap.Caption:=tContNameCap;
  NewContMaxNetCap.Caption:=tMaxContNetCap;
  NewContMaxVolCap.Caption:=tMaxContVolCap;
  newname:='NEW CONT '+inttostr(num);
  NewContName.Text:=newname;
  NewContMaxNet.Text:='20000';
  NewContMaxVol.Text:='70';
  if self.ShowModal=mrOk then result:=true else result:=false;
end;

function TNewContForm.ChgData(name : string; Net,Vol : real):boolean;
begin
  self.Caption:=tNewContFormCh;
  NewContNameCap.Caption:=tContNameCap;
  NewContMaxNetCap.Caption:=tMaxContNetCap;
  NewContMaxVolCap.Caption:=tMaxContVolCap;
  newname:=name;
  NewContName.Text:=newname;
  NewContMaxNet.Text:=FormatFloat('####0.###',net);
  NewContMaxVol.Text:=FormatFloat('####0.###',vol);;
  if self.ShowModal=mrOk then result:=true else result:=false;
end;


end.
