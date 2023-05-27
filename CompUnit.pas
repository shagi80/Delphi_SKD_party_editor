unit CompUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, CheckLst, ExtCtrls, DB, DBClient, Grids, DBGrids;

type
  TCompForm = class(TForm)
    OpenDlg: TOpenDialog;
    NB: TNotebook;
    Panel1: TPanel;
    GB3: TGroupBox;
    AddLB: TLabel;
    sb6: TSpeedButton;
    GB2: TGroupBox;
    NotFindLB: TLabel;
    SB3: TSpeedButton;
    SB4: TSpeedButton;
    GB1: TGroupBox;
    FindLb: TLabel;
    SB1: TSpeedButton;
    SB2: TSpeedButton;
    Panel2: TPanel;
    GroupBox4: TGroupBox;
    ContCBL: TCheckListBox;
    GroupBox5: TGroupBox;
    Panel3: TPanel;
    FNameED: TEdit;
    Button1: TButton;
    BitBtn1: TBitBtn;
    CompBtn: TBitBtn;
    SaveDlg: TSaveDialog;
    SB5: TSpeedButton;
    tmPanel: TPanel;
    Label1: TLabel;
    ModeRG: TRadioGroup;
    procedure SB1Click(Sender: TObject);
    procedure SB2Click(Sender: TObject);
    procedure SB5Click(Sender: TObject);
    procedure SB4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure sb6Click(Sender: TObject);
    procedure SB3Click(Sender: TObject);
    procedure CompBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SaveDtLst(Lst : TstringList; title : string; mode:integer);
    function CompareOneCode: integer;
    function CompareCodeCount: integer;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CompForm: TCompForm;

implementation

{$R *.dfm}

uses TCont, TDataLst, LangUnit, PrUnit;

var
  BoxLst,AddLst,FindLst : TStringList;

procedure TCompForm.Button1Click(Sender: TObject);
begin
  if OpenDlg.Execute then
    begin
      FNameED.Text:=OpenDlg.FileName;
      CompBtn.Enabled:=true;
    end;
end;

function TCompForm.CompareOneCode: integer;
var
  c,i,j,BC    : integer;
  str            : string;
  ScanLst  : TStringList;
begin
  //������� ������ ������� ������� ������ ����
  BoxLst.Clear;
  for c := 0 to ContCBL.Items.Count-1 do
    if ContCBL.Checked[c] then
      for i := 0 to ContLst.Cont[c].BoxCount-1 do
        begin
          str:=ContLst.Cont[c].Box[i].BoxCode;
          for j := 0 to ContLst.Cont[c].Box[i].BoxCount - 1 do
            begin
              BoxLst.Add
              ('"00'+str+FormatFloat('000.#',j+1)+FormatFloat('000.#',ContLst.Cont[c].Box[i].BoxCount)+'"');
            end;
        end;
  BC:=BoxLst.Count;
  //��������� ���� �������
  ScanLst:=TStringList.Create;
  ScanLst.LoadFromFile(FNameED.Text);
  //��������� ����� �������      (31/10/12)
  for I := 0 to ScanLst.Count - 1 do
    begin
      str:=ScanLst[i];
      //showmessage(str);
      if Length(str)>14 then delete(str,Length(str)-1,1);
      delete(str,1,1);
      str:='"00'+copy(str,2,MaxInt);
      ScanLst[i]:=str;
      //showmessage(str);
    end;
  //��������������� �������
  FindLst.Clear;
  AddLst.Clear;
  //����������
  for I := 0 to ScanLst.Count-1 do
    begin
      j:=0;
      str:=ScanLst[i];
      while (j<BoxLst.Count)and(BoxLst[j]<>str) do
        begin
        //ShowMessage(str+' = '+BoxLst[j]);
        inc(j);
        end;
      if j<BoxLst.Count then
        //���� ������� ������� ������� �� �� ������ �������
        begin
          BoxLst.Delete(j);
          FindLst.Add(str);
        end
        //���� �� ������� - ���������� ��� ���� "������"
        else AddLst.Add(str);
    end;
  result:=BC;
end;

function TCompForm.CompareCodeCount: integer;
var
  c,i,j,BC    : integer;
  str,tc,code    : string;
  BUF,ScanLst : TStringList;
  CDS         : TClientDataSet;
begin
  //������� ������ ������� ������� ������ ����
  BoxLst.Clear;
  for c := 0 to ContCBL.Items.Count-1 do
    if ContCBL.Checked[c] then
      for i := 0 to ContLst.Cont[c].BoxCount-1 do
        begin
          str:=ContLst.Cont[c].Box[i].BoxCode;
          for j := 0 to ContLst.Cont[c].Box[i].BoxCount - 1 do
            begin
              BoxLst.Add
              (str+FormatFloat('000',j+1)+FormatFloat('000',ContLst.Cont[c].Box[i].BoxCount)+'"');
            end;
        end;
  BC:=BoxLst.Count;
  //��������� ���� �������
  BUF:=TStringList.Create;
  BUF.LoadFromFile(FNameED.Text);
  //��������� ����� ��� ��������
  for I := 0 to BUF.Count - 1 do
    begin
      str:=BUF[i];
      //������ ���� ��� �������������� � ����������� �� ������ ������
      if Length(str)=19 then
        begin
          //�������� �������, ����������� �������� ��� ���� �����
          //������� ������ ������� � ������ ������ ������� ��������� ������
          delete(str,1,2);
          //������� 13 ������ ������� ��������� ������
          delete(str,12,1);
        end else delete(str,1,1);  //�������� ������ ������� ��� ������ �����
      BUF[i]:=str;
    end;
  CDS:=TClientDataSet.Create(self);
  CDS.FieldDefs.Add('CODE',ftString,20,false);
  CDS.FieldDefs.Add('TOTCOUNT',ftInteger,0,false);
  CDS.FieldDefs.Add('COUNT',ftInteger,0,false);
  CDS.CreateDataSet;
  for I := 0 to BUF.Count - 1 do
    begin
      //�������� ���
      code:= copy(BUF[i],1,pos(',',BUF[i])-2);
      //�������� ����� �����
      tc:=copy(code,9,3);
      //�������� ������ ����� ������
      code:= copy(code,1,5);
      //�������� ���� �����
      str:=copy(BUF[i],pos(',',BUF[i])+1,MaxInt);
      str:=copy(str,2,Length(str)-2);
      if Length(str)=0 then str:='0';
      if CDS.Locate('CODE',code,[]) then
        begin
          CDS.Edit;
          CDS.FieldByName('COUNT').AsInteger:=CDS.FieldByName('COUNT').AsInteger+StrToInt(str);
          CDS.Post;
        end
        else
        begin
          if tc='' then tc:='0';
          if str='' then str:='0';
          CDS.Append;
          CDS.FieldByName('CODE').AsString:=code;
          CDS.FieldByName('TOTCOUNT').AsInteger:=StrToInt(tc);
          CDS.FieldByName('COUNT').AsInteger:=StrToInt(str);
          CDS.Post;
        end;
    end;
  ScanLst:=TStringList.Create;
  CDS.First;
  for I := 0 to CDS.RecordCount - 1 do
    begin
      for j := 1 to CDS.FieldByName('COUNT').AsInteger do
        begin
          code:=CDS.FieldByName('CODE').AsString;
          code:=copy(code,1,8)+formatFloat('000',j)+formatFloat('000',(CDS.FieldByName('TOTCOUNT').AsInteger))+'"';
          ScanLst.Add(code);
        end;
      CDS.Next;
    end;
  //��������������� �������
  FindLst.Clear;
  AddLst.Clear;
  //ListBox1.Items:=BoxLst;
  //����������
  for I := 0 to ScanLst.Count-1 do
    begin
      j:=0;
      str:=ScanLst[i];
      //ShowMessage(str+' = '+BoxLst[j]);
      while (j<BoxLst.Count)and(BoxLst[j]<>str) do
        begin
        inc(j);
        end;
      if j<BoxLst.Count then
        //���� ������� ������� ������� �� �� ������ �������
        begin
          BoxLst.Delete(j);
          FindLst.Add(str);
        end
        //���� �� ������� - ���������� ��� ���� "������"
        else AddLst.Add(str);
    end;
  CDS.Destroy;
  result:=BC;
end;

procedure TCompForm.CompBtnClick(Sender: TObject);
var
  str : string;
  BC  : integer;
begin
  if ModeRG.ItemIndex=0 then BC:=self.CompareOneCode
    else BC:=self.CompareCodeCount;
  NB.PageIndex:=1;
  if FindLst.Count>0 then
      begin
        str:='������� '+IntToStr(FindLst.Count)+' ������� �� '+IntToStr(BC);
        FindLb.Font.Color:=clNavy;
        SB1.Enabled:=true;
        SB2.Enabled:=true;
      end
    else
      begin
        str:='������ ������� ���������!';
        FindLb.Font.Color:=clRed;
        SB1.Enabled:=false;
        SB2.Enabled:=false;
      end;
  FindLB.Caption:=str;
  if BoxLst.Count>0 then
      begin
        str:=IntToStr(BoxLst.Count)+' ������� �� '+IntToStr(BC)+' ���������';
        NotFindLb.Font.Color:=clNavy;
        SB3.Enabled:=true;
        SB4.Enabled:=true;
        SB5.Enabled:=true;
      end
    else
      begin
        str:='��� ������� �������';
        NotFindLb.Font.Color:=clSilver;
        SB3.Enabled:=false;
        SB4.Enabled:=false;
        SB5.Enabled:=false;
      end;
  NotFindLB.Caption:=str;
  if AddLst.Count>0 then
      begin
        str:='������� '+IntToStr(AddLst.Count)+' "������" �������';
        AddLb.Font.Color:=clNavy;
        SB6.Enabled:=true;
      end
    else
      begin
        str:='"������" ������� ���!';
        AddLb.Font.Color:=clSilver;
        SB6.Enabled:=false;
      end;
  AddLB.Caption:=str;
end;

procedure TCompForm.FormCreate(Sender: TObject);
begin
  BoxLst:=TStringList.Create;
  AddLst:=TStringList.Create;
  FindLst:=TStringList.Create;
end;

procedure TCompForm.FormShow(Sender: TObject);
var
  i : integer;
begin
  tmPanel.Visible:=false;
  NB.PageIndex:=0;
  ContCBL.Items.Clear;
  for I := 0 to ContLst.Count-1 do
    ContCBL.Items.Add(ContLst.Cont[i].Name);
  for I := 0 to ContCBL.Items.Count-1 do
    ContCBL.Checked[i]:=true;
  FNameED.Text:='';
  CompBtn.Enabled:=false;
end;

procedure TCompForm.SB5Click(Sender: TObject);
begin
  self.SaveDtLst(BoxLst,'�������� ������ ���������� �������',2);
end;

procedure TCompForm.SB3Click(Sender: TObject);
var
  i : integer;
  str : string;
  CDS : TClientDataSet;
begin
  tmPanel.Visible:=true;
  self.Repaint;
  CDS:=TClientDataSet.Create(self);
  CDS.FieldDefs.Add('Code',ftString,16,false);
  CDS.CreateDataSet;
  for i := 0 to BoxLst.Count - 1 do
    begin
      str:=BoxLst[i];
      //str:='1'+str;
      str[Length(str)]:='0';
      CDS.Append;
      CDS.FieldByName('Code').AsString:=str;
      CDS.Post;
    end;
  tmPanel.Visible:=false;
  //����������� ������
  PrDM.frxDBDataSet1.DataSet:=CDS;
  PrDM.frxReport1.LoadFromFile(AppPath+'CompNotFindCode.fr3');
  PrDM.frxReport1.Variables['TITLE']:='''' + '����� �� �������: '+PrDm.ExtractFileNameEx(FileName,false)+ '''';
  PrDM.frxReport1.Variables['TITLE3']:='''' + '������ ���������� �����-�����'+ '''';
  PrDM.frxReport1.ShowReport(true);
  PrDM.frxReport1.Clear;
  CDS.Destroy;
end;

procedure TCompForm.SaveDtLst(Lst: TStringList; title: string; mode:integer);
var
  i,c,j,l,n : integer;
  str,boxcode : string;
  CDS  : TClientDataSet;
  tc   : real;
  F    : TextFile;
begin
  tmPanel.Visible:=true;
  self.Repaint;
  //�������������� ������ � �������
  CDS:=TClientDataSet.Create(application);
  CDS.FieldDefs.Add('Code',ftString,32,false);
  CDS.FieldDefs.Add('BOM',ftString,32,false);
  CDS.FieldDefs.Add('Name',ftString,255,false);
  CDS.FieldDefs.Add('EI',ftString,5,false);
  CDS.FieldDefs.Add('Count',ftFloat,0,false);
  CDS.FieldDefs.Add('ORDCount',ftFloat,0,false);
  CDS.CreateDataSet;
  //�������
  for I := 0 to Lst.Count - 1 do
    begin
      str:=Lst[i];
      BoxCode:=Copy(str,4,5);
      //8showmessage(boxcode);
      for c := 0 to ContLst.Count - 1 do
        for j := 0 to ContLst.Cont[c].BoxCount-1 do
          if ContLst.Cont[c].Box[j].BoxCode=BoxCode then
            begin
              for l := 0 to ContLst.Cont[c].Box[j].ItemCount - 1 do
                begin
                  if CDS.Locate('Code',ContLst.Cont[c].Box[j].Items[l].PosCode,[]) then
                    begin
                      CDS.Edit;
                      CDS.FieldByName('Count').AsFloat:=CDS.FieldByName('Count').AsFloat+
                        ContLst.Cont[c].Box[j].Items[l].Count/ContLst.Cont[c].Box[j].BoxCount;
                      CDS.Post
                    end
                  else
                    begin
                      CDS.Append;
                      CDS.FieldByName('Code').AsString:=ContLst.Cont[c].Box[j].Items[l].PosCode;
                      CDS.FieldByName('BOM').AsString:=ModLst.GetBOMByCode
                        (ContLst.Cont[c].Box[j].Items[l].OrdName,
                         ContLst.Cont[c].Box[j].Items[l].PosCode);
                      CDS.FieldByName('Name').AsString:=ModLst.GetNameByCode
                        (lgRus,ContLst.Cont[c].Box[j].Items[l].OrdName,
                         ContLst.Cont[c].Box[j].Items[l].PosCode);
                      CDS.FieldByName('EI').AsString:=ModLst.GetEIByCode
                        (lgRus,ContLst.Cont[c].Box[j].Items[l].OrdName,
                         ContLst.Cont[c].Box[j].Items[l].PosCode);
                      CDS.FieldByName('Count').AsFloat:=
                        ContLst.Cont[c].Box[j].Items[l].Count/ContLst.Cont[c].Box[j].BoxCount;
                      tc:=0;
                      for n := 0 to ModLst.Count - 1 do
                        begin
                          tc:=tc+ContLst.PosCount(ModLst.MOdel[n].EngName,ContLst.Cont[c].Box[j].Items[l].PosCode);
                        end;
                      CDS.FieldByName('ORDCount').AsFloat:=tc;
                      CDS.Post
                    end;
                end;
            end;
    end;
  tmPanel.Visible:=false;
  //����������� ������� � ������ ����������
  CDS.IndexFieldNames:='Name';
  if mode=0 then
    //����� ���������� ��� 1�
    begin
      //�������������� ������ ����������
      SaveDlg.Title:=title;
      SaveDlg.Filter:='��������� ���� (*.txt)|*.txt';
      SaveDlg.DefaultExt:='*.txt';
      if SaveDlg.Execute then
        begin
          //������ � ����
          assignfile(f,SaveDlg.FileName);
          rewrite(f);
          str:='����������� �� �������: '+PrDm.ExtractFileNameEx(FileName,false);
          writeln(f,str);
          CDS.First;
          for I := 0 to CDS.RecordCount - 1 do
            begin
              str:='"'+CDS.FieldByName('Code').AsString+'","';
              str:=str+CDS.FieldByName('Name').AsString+'","';
              str:=str+FormatFloat('####0.0####',CDS.FieldByName('Count').AsInteger)+'"';
              if i<(CDS.RecordCount-1) then writeln(f,str) else write(f,str);
              CDS.Next;
            end;
          closefile(f);
        end;
    end
    else
    begin
      //����������� ������
      PrDM.frxDBDataSet1.DataSet:=CDS;
      PrDM.frxReport1.LoadFromFile(AppPath+'CompFindLst.fr3');
      if mode=1 then
        begin
          PrDM.frxReport1.Variables['TITLE']:='''' + '����� �� ������� '+PrDm.ExtractFileNameEx(FileName,false)+ '''';
          PrDM.frxReport1.Variables['TITLE2']:='''' + '�������'+ '''';
          PrDM.frxReport1.Variables['TITLE3']:='''' + '������ �������� �������'+ '''';
        end;
      if mode=2 then
        begin
          PrDM.frxReport1.Variables['TITLE']:='''' + '����� �� �������: '+PrDm.ExtractFileNameEx(FileName,false)+ '''';
          PrDM.frxReport1.Variables['TITLE2']:='''' + '�� �������'+ '''';
          PrDM.frxReport1.Variables['TITLE3']:='''' + '������ ���������� �������'+ '''';
        end;
      PrDM.frxReport1.ShowReport(true);
      PrDM.frxReport1.Clear;
      CDS.Destroy;
    end;
end;

procedure TCompForm.sb6Click(Sender: TObject);
var
  i : integer;
  str : string;
  CDS : TClientDataSet;
begin
  tmPanel.Visible:=true;
  self.Repaint;
  CDS:=TClientDataSet.Create(self);
  CDS.FieldDefs.Add('Code',ftString,16,false);
  CDS.CreateDataSet;
  for i := 0 to AddLst.Count - 1 do
    begin
      str:=AddLst[i];
      str:='1'+str;
      str[Length(str)]:='0';
      CDS.Append;
      CDS.FieldByName('Code').AsString:=str;
      CDS.Post;
    end;
  tmPanel.Visible:=false;
  //����������� ������
  PrDM.frxDBDataSet1.DataSet:=CDS;
  PrDM.frxReport1.LoadFromFile(AppPath+'CompNotFindCode.fr3');
  PrDM.frxReport1.Variables['TITLE']:='''' + '����� �� �������: '+PrDm.ExtractFileNameEx(FileName,false)+ '''';
  PrDM.frxReport1.Variables['TITLE3']:='''' + '������ ������ �����-�����'+ '''';
  PrDM.frxReport1.ShowReport(true);
  PrDM.frxReport1.Clear;
  CDS.Destroy;
end;

procedure TCompForm.SB1Click(Sender: TObject);
begin
  self.SaveDtLst(FindLst,'�������� ������ ��� 1�',0);
end;

procedure TCompForm.SB2Click(Sender: TObject);
begin
  self.SaveDtLst(FindLst,'�������� ������ ���������� �������',1);
end;

procedure TCompForm.SB4Click(Sender: TObject);
var
  i,c,j,l : integer;
  str : string;
  TCDS,CDS : TClientDataSet;
begin
  tmPanel.Visible:=true;
  self.Repaint;
  TCDS:=TClientDataSet.Create(self);
  TCDS.FieldDefs.Add('BoxCode',ftString,8,false);
  TCDS.FieldDefs.Add('BoxQty',ftInteger,0,false);
  TCDS.FieldDefs.Add('FindBoxQty',ftInteger,0,false);
  TCDS.CreateDataSet;

  CDS:=TClientDataSet.Create(self);
  CDS.FieldDefs.Add('BoxCode',ftString,8,false);
  CDS.FieldDefs.Add('Code',ftString,16,false);
  CDS.FieldDefs.Add('BOM',ftString,32,false);
  CDS.FieldDefs.Add('Name',ftString,255,false);
  CDS.FieldDefs.Add('EI',ftString,6,false);
  CDS.FieldDefs.Add('InOneBox',ftFloat,0,false);
  CDS.FieldDefs.Add('Qty',ftFloat,0,false);
  CDS.CreateDataSet;
  //������� ������ ����� ���������� ������� � ������������� �� ���������
  for I := 0 to BoxLst.Count - 1 do
    begin
      str:=BoxLst[i];
      str:=Copy(str,4,5);
      if TCDS.Locate('BoxCode',str,[]) then
        begin
          TCDS.Edit;
          TCDS.FieldByName('FindBoxQty').AsInteger:=TCDS.FieldByName('FindBoxQty').AsInteger+1;
          TCDS.Post;
        end else
        begin
          TCDS.Append;
          TCDS.FieldByName('BoxCode').AsString:=str;
          TCDS.FieldByName('FindBoxQty').AsInteger:=1;
          TCDS.Post;
        end;
    end;
  //
  for c := 0 to ContLst.Count - 1 do
    for j := 0 to ContLst.Cont[c].BoxCount-1 do
      begin
        if TCDS.Locate('BoxCode',ContLst.Cont[c].Box[j].BoxCode,[]) then
          for l := 0 to ContLst.Cont[c].Box[j].ItemCount - 1 do
            begin
              TCDS.Edit;
              TCDS.FieldByName('BoxQty').AsInteger:=ContLst.Cont[c].Box[j].BoxCount;
              TCDS.Post;
              CDS.Append;
              CDS.FieldByName('BoxCode').AsString:=ContLst.Cont[c].Box[j].BoxCode;
              CDS.FieldByName('Code').AsString:=ContLst.Cont[c].Box[j].Items[l].PosCode;
              CDS.FieldByName('BOM').AsString:=ModLst.GetBOMByCode
                (ContLst.Cont[c].Box[j].Items[l].OrdName,
                ContLst.Cont[c].Box[j].Items[l].PosCode)+chr(9);
              CDS.FieldByName('Name').AsString:=ModLst.GetNameByCode
                (lgRus,ContLst.Cont[c].Box[j].Items[l].OrdName,
                ContLst.Cont[c].Box[j].Items[l].PosCode)+chr(9);
              CDS.FieldByName('EI').AsString:=ModLst.GetEIByCode
                (lgRus,ContLst.Cont[c].Box[j].Items[l].OrdName,
                ContLst.Cont[c].Box[j].Items[l].PosCode)+chr(9);
              CDS.FieldByName('InOneBox').AsFloat:=
                round(ContLst.Cont[c].Box[j].Items[l].Count/ContLst.Cont[c].Box[j].BoxCount);
              CDS.FieldByName('Qty').AsFloat:=
                CDS.FieldByName('InOneBox').AsFloat*TCDS.FieldByName('FindBoxQty').AsInteger;
              cds.Post;
            end;
      end;
  tmPanel.Visible:=false;
  //����������� ������
  PrDM.DataSource1.DataSet:=TCDS;
  CDS.IndexFieldNames:='BoxCode';
  CDS.MasterFields:='BoxCode';
  CDS.MasterSource:=PrDM.DataSource1;
  PrDM.frxDBDataSet1.DataSet:=TCDS;
  PrDM.frxDBDataSet2.DataSet:=CDS;


  PrDM.frxReport1.Clear;
  PrDM.frxReport1.LoadFromFile(AppPath+'CompNotFindBox.fr3');
  PrDM.frxReport1.Variables['TITLE']:='''' + '����� �� �������: '+PrDm.ExtractFileNameEx(FileName,false)+ '''';
  PrDM.frxReport1.Variables['TITLE3']:='''' + '������ ���������� �������'+ '''';
  PrDM.frxReport1.ShowReport(true);
  PrDM.frxReport1.Clear;
  TCDS.Destroy;
  CDS.Destroy;
end;

end.
