unit OrdSumUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, CheckLst, ExtCtrls;

type
  TOrdSumForm = class(TForm)
    Panel: TPanel;
    NameED: TEdit;
    CBL: TCheckListBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    function  ShowForm: string;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OrdSumForm: TOrdSumForm;

implementation

{$R *.dfm}

uses TDataLst, TCont;


procedure TOrdSumForm.BitBtn1Click(Sender: TObject);
begin
  NameED.Text:='';
  self.Close;
end;

procedure TOrdSumForm.BitBtn2Click(Sender: TObject);
var
  i,j,ind,k,l : integer;
  Model       : TDataList;
  str         : string;
  LoadFl      : boolean;
begin
  //Проверка ошибок задания исходных данных
  if NameED.Text='' then
    begin
      MessageDlg('Должно быть определено имя!',mtError,[mbOk],0);
      Abort;
    end;
  for I := 0 to CBL.Items.Count - 1 do
    if (CBL.Items.Strings[i]=NameED.Text)then
      begin
        MessageDlg('Заказ с таким именем уже существует!',mtError,[mbOk],0);
        Abort;
      end;
  j:=0;
  for I := 0 to CBL.Items.Count - 1 do if CBL.Checked[i] then inc(j);
  if j<2 then
    begin
      MessageDlg('Должно быть выбрано не менее двух заказов!',mtError,[mbOk],0);
      Abort;
    end;
  //Создание объединенного заказа
  Model:=TDataList.Create;
  for I := 0 to CBL.Items.Count - 1 do
    if CBL.Checked[i] then
      begin
        ind:=ModLst.IndByName(CBL.Items.Strings[i]);
        for j := 0 to ModLst.Model[ind].Count - 1 do
          begin
            k:=0;
            while ((k<Model.Count)and(Model.Item[k].Code<>ModLst.Model[ind].Item[j].Code)) do inc(k);
            if k=Model.Count then
              begin
                Model.Add(ModLst.Model[ind].Item[j]);
              end
              else
              begin
                Model.Item[k].TotCount:=Model.Item[k].TotCount+ModLst.Model[ind].Item[j].TotCount;
              end;
          end;
      end;
  //Добавление объединенного заказа в список
  Model.EngName:=NameED.Text;
  ModLst.Add(Model);
  //Удаление старых заказов
  for I := 0 to CBL.Items.Count - 1 do
    if CBL.Checked[i] then
      begin
        //Проверка загрузки хотябы одной детали в контейнера
        LoadFl:=false;
        j:=0;
        while(j<ModLst.Model[ModLst.IndByName(CBL.Items.Strings[i])].Count)and(not LoadFl)do
          begin
            if ContLst.PosCount(CBL.Items.Strings[i],ModLst.Model[ModLst.IndByName(CBL.Items.Strings[i])].Item[j].Code)>0 then
              LoadFl:=true;
            inc(j);
          end;
        //Удаление заказа
        ModLst.Delete(CBL.Items.Strings[i]);
        //Уточняем - выгружать детали из контейнеров или нет
        str:='Выгрузить детали заказа "';
        str:=str+CBL.Items.Strings[i];
        str:=str+'" из уже загруженных контейнеров ?';
        if (LoadFl)and(MessageDlg(str,mtWarning,[mbYes,mbNo],0)=mrYes) then
          ContLst.DelMod(CBL.Items.Strings[i])
        else
          for j := 0 to ContLst.Count - 1 do
            for k := 0 to ContLst.Cont[j].BoxCount - 1 do
              for l := 0 to ContLst.Cont[j].Box[k].ItemCount-1 do
                if ContLst.Cont[j].Box[k].Items[l].OrdName=CBL.Items.Strings[i] then
                  ContLst.Cont[j].Box[k].Items[l].OrdName:=NameED.Text;
      end;
  self.Close;
end;

function TOrdSumForm.ShowForm:string;
var
  i : integer;
begin
  NameED.Text:='no name';
  CBL.Items.Clear;
  for I := 0 to ModLst.Count - 1 do
    CBL.Items.Add(ModLst.Model[i].EngName);
  self.ShowModal;
  result:=NameED.Text;
end;


end.
