unit USetSehi;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Db, Grids, DBGrids, DBTables, ComCtrls, ExtCtrls, ADODB,
  PrnCanvasU,
  DBCtrls, NumEdit,DMU, Mask,Usehisekkei;

type
  TFSetSehi = class(TForm)
    Panel2: TPanel;
    btnPost: TBitBtn;
    btnCancel: TBitBtn;
    btnClose: TBitBtn;
    EditPanel: TPanel;
    Ds1: TDataSource;
    PageHiryoDest: TPageControl;
    TabSheet6: TTabSheet;
    Label2: TLabel;
    ListSehiY: TListBox;
    TabSheet7: TTabSheet;
    Label15: TLabel;
    ListSehiM: TListBox;
    TabSheet8: TTabSheet;
    Label3: TLabel;
    ListSehiB: TListBox;
    TabSheet9: TTabSheet;
    Label6: TLabel;
    ListSehiB2: TListBox;
    TabYuukisitu: TTabSheet;
    Label62: TLabel;
    ListSehiM2: TListBox;
    NumM21: TNumEdit;
    NumM22: TNumEdit;
    NumM23: TNumEdit;
    NumM24: TNumEdit;
    NumM25: TNumEdit;
    RLPanel: TPanel;
    BtnDel: TButton;
    btnAdd: TButton;
    Panel1: TPanel;
    chkSim: TDBCheckBox;
    PageHiryoSource: TPageControl;
    TabSheet3: TTabSheet;
    Bevel4: TBevel;
    ListYuuki: TListBox;
    btnSakuhi: TButton;
    TabSheet4: TTabSheet;
    grKasei: TRadioGroup;
    ListKasei: TListBox;
    btnSakuhi2: TButton;
    TabSheet5: TTabSheet;
    ListTanpi: TListBox;
    btnTanpi: TButton;
    grTanpi: TRadioGroup;
    Label13: TLabel;
    DBEdit1: TDBEdit;
    Bevel5: TBevel;
    Label8: TLabel;
    Bevel6: TBevel;
    Bevel7: TBevel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label50: TLabel;
    Bevel16: TBevel;
    Label55: TLabel;
    Label61: TLabel;
    Bevel18: TBevel;
    txtNBuld1: TDBEdit;
    txtPBuld1: TDBEdit;
    txtKBuld1: TDBEdit;
    txtMBuld1: TDBEdit;
    txtNBuld2: TDBEdit;
    txtPBuld2: TDBEdit;
    txtKBuld2: TDBEdit;
    txtNBuld3: TDBEdit;
    txtPBuld3: TDBEdit;
    txtKBuld3: TDBEdit;
    txtCntBuld: TDBEdit;
    txtNBuldSum: TDBEdit;
    txtPBuldSum: TDBEdit;
    txtKBuldSum: TDBEdit;
    txtMBuldSum: TDBEdit;
    txtNyBuldSum: TDBEdit;
    txtPyBuldSum: TDBEdit;
    txtKyBuldSum: TDBEdit;
    QueryWork: TADOQuery;
    ADOSindan: TADOQuery;
    ADOUketuke: TADOQuery;
    Ds2: TDataSource;
    DBCd1: TDBEdit;
    DBCd2: TDBEdit;
    DBcd3: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    ADOSindan�T���v���ԍ�: TWideStringField;
    ADOSindan�ҏW��: TDateTimeField;
    ADOSindan�R�����g: TWideMemoField;
    ADOSindanpH�f�f�s����: TFloatField;
    ADOSindanP�f�f�s����: TFloatField;
    ADOSindanMg�f�f�s����: TFloatField;
    ADOSindanK�f�f�s����: TFloatField;
    ADOSindan�y���ރR�[�h1: TWideStringField;
    ADOSindan�y���ޗ�1: TFloatField;
    ADOSindan�y���ރR�[�h2: TWideStringField;
    ADOSindan�y���ޗ�2: TFloatField;
    ADOSindan�y���ރR�[�h3: TWideStringField;
    ADOSindan�y���ޗ�3: TFloatField;
    ADOSindan�y���ރR�[�h4: TWideStringField;
    ADOSindan�y���ޗ�4: TFloatField;
    ADOSindan�y���ރR�[�h5: TWideStringField;
    ADOSindan�y���ޗ�5: TFloatField;
    ADOSindanN�{��s����: TFloatField;
    ADOSindanP�{��s����: TFloatField;
    ADOSindanK�{��s����: TFloatField;
    ADOSindanMg�{��s����: TFloatField;
    ADOSindan���{��: TSmallintField;
    ADOSindanN�{��s����2: TFloatField;
    ADOSindanP�{��s����2: TFloatField;
    ADOSindanK�{��s����2: TFloatField;
    ADOSindanN�{��s����3: TFloatField;
    ADOSindanP�{��s����3: TFloatField;
    ADOSindanK�{��s����3: TFloatField;
    ADOSindanN�{��s���ʍ��v: TFloatField;
    ADOSindanP�{��s���ʍ��v: TFloatField;
    ADOSindanK�{��s���ʍ��v: TFloatField;
    ADOSindanMg�{��s���ʍ��v: TFloatField;
    ADOSindan���1: TWideStringField;
    ADOSindan����1: TFloatField;
    ADOSindan���2: TWideStringField;
    ADOSindan����2: TFloatField;
    ADOSindan���3: TWideStringField;
    ADOSindan����3: TFloatField;
    ADOSindan���4: TWideStringField;
    ADOSindan����4: TFloatField;
    ADOSindan���5: TWideStringField;
    ADOSindan����5: TFloatField;
    ADOSindan���{11: TWideStringField;
    ADOSindan���{1��1: TFloatField;
    ADOSindan���{12: TWideStringField;
    ADOSindan���{1��2: TFloatField;
    ADOSindan���{13: TWideStringField;
    ADOSindan���{1��3: TFloatField;
    ADOSindan���{14: TWideStringField;
    ADOSindan���{1��4: TFloatField;
    ADOSindan���{15: TWideStringField;
    ADOSindan���{1��5: TFloatField;
    ADOSindan���{21: TWideStringField;
    ADOSindan���{2��1: TFloatField;
    ADOSindan���{22: TWideStringField;
    ADOSindan���{2��2: TFloatField;
    ADOSindan���{23: TWideStringField;
    ADOSindan���{2��3: TFloatField;
    ADOSindan���{24: TWideStringField;
    ADOSindan���{2��4: TFloatField;
    ADOSindan���{25: TWideStringField;
    ADOSindan���{2��5: TFloatField;
    ADOSindan�L�@1: TWideStringField;
    ADOSindan�L�@��1: TFloatField;
    ADOSindan�L�@2: TWideStringField;
    ADOSindan�L�@��2: TFloatField;
    ADOSindan�L�@3: TWideStringField;
    ADOSindan�L�@��3: TFloatField;
    ADOSindan�L�@4: TWideStringField;
    ADOSindan�L�@��4: TFloatField;
    ADOSindan�L�@5: TWideStringField;
    ADOSindan�L�@��5: TFloatField;
    ADOSindanSIM�v�Z��: TBooleanField;
    ADOSindan�݌v�R�����g: TWideMemoField;
    ADOSindan�폜�t���O: TBooleanField;
    ADOSindanNy�{��s���ʍ��v: TFloatField;
    ADOSindanPy�{��s���ʍ��v: TFloatField;
    ADOSindanKy�{��s���ʍ��v: TFloatField;
    ADOSindan�����y��: TWideMemoField;
    ADOSindan�����{��: TWideMemoField;
    procedure Ds1StateChange(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MakeKaseiList;
    procedure MakeTanpiList;
    procedure grTanpiClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DspHiryoList(aType : THiryoType);
    procedure BtnDelClick(Sender: TObject);
    procedure SehiGoukei;
    procedure btnAddClick(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure ADOSindanBeforePost(DataSet: TDataSet);
    procedure NumChange(Sender: TObject);
    function SetEdit:Boolean;
    procedure btnSakuhi2Click(Sender: TObject);
    procedure btnSakuhiClick(Sender: TObject);
    procedure btnTanpiClick(Sender: TObject);
    procedure ListSehiMDblClick(Sender: TObject);
    procedure NumM1Change(Sender: TObject);
    procedure NumExit(Sender: TObject);
    procedure EnterKeyPress(Sender: TObject; var Key: Char);


  private
    { Private �錾 }




    IsKazan : Boolean ;
    SehiList : TSehiHiryo ;   {�{���ʃ��X�g}

    lsTanpi : TStringList ;

    txtSehiValue : array[Ord(Low(THiryoType))..Ord(High(THiryoType)),1..5] of TNumEdit ;

    procedure SetHiryoField(DataSet: TDataSet; aField: string;
      aCnt: integer; aRecHiryo: TRecHiryo);
    function SetHiryoList( aMode :TSetMode; aHiryo :THiryoType  ; aDelNum: integer ; aCode: string ):Boolean;

  public
     SNo : String;
    { Public �錾 }
  end;

var
  FSetSehi: TFSetSehi;

implementation

uses M_SakuhiU, M_TanpiU;

{$R *.dfm}

procedure TFSetSehi.ADOSindanBeforePost(DataSet: TDataSet);
var
  aCnt : integer ;
  stmp : string;
begin


//�엿�ݒ���
  for aCnt := 1 to 5 do begin
    SetHiryoField (DataSet,'�L�@',aCnt,SehiList.GetHiryo(htYuuki,aCnt)) ;
    SetHiryoField (DataSet,'���',aCnt,SehiList.GetHiryo(htHiryo1,aCnt)) ;
    SetHiryoField (DataSet,'���{1',aCnt,SehiList.GetHiryo(htHiryo2,aCnt)) ;
    SetHiryoField (DataSet,'���{2',aCnt,SehiList.GetHiryo(htHiryo3,aCnt)) ;
  end;


end;

procedure TFSetSehi.btnAddClick(Sender: TObject);
var
  aCode : string ;
begin
  if not SetEdit then exit ;
  Ds1.DataSet.FieldByName('SIM�v�Z��').asBoolean := True ;

  {�엿�R�[�h��ݒ�}
  case PageHiryoSource.ActivePageIndex of
  0: begin //�L�@�엿
    if ListYuuki.ItemIndex < 0 then exit;
    aCode := Copy(ListYuuki.Items[ListYuuki.ItemIndex],1,2);
  end;
  1: begin //�����엿
    if ListKasei.ItemIndex < 0 then exit;
    aCode := Copy(ListKasei.Items[ListKasei.ItemIndex],1,4);
  end;
  2: begin //�P��엿
    if ListTanpi.ItemIndex < 0 then exit;
    aCode := Copy(ListTanpi.Items[ListTanpi.ItemIndex],1,2);
  end;
  end;

  case PageHiryoSource.ActivePageIndex of
  0: begin
    PageHiryoDest.ActivePageIndex := 0 ; {��̌v�Z�ŗp����̂Ő�Ƀy�[�W�ݒ�}
    if SetHiryoList(smIns,htYuuki,0,aCode) then begin
      {�ݒ�l�\��}
      DspHiryoList(htYuuki);
    end;
  end;
  else  {���̊��A�ǔ�̕\���łɒǉ�����}
    if PageHiryoDest.ActivePageIndex = 0 then PageHiryoDest.ActivePageIndex := 1;{���ɂ���}
    case PageHiryoDest.ActivePageIndex of
    1: if SetHiryoList(smIns,htHiryo1,0,aCode) then DspHiryoList(htHiryo1);
    2: if SetHiryoList(smIns,htHiryo2,0,aCode) then DspHiryoList(htHiryo2);
    3: if SetHiryoList(smIns,htHiryo3,0,aCode) then DspHiryoList(htHiryo3);
    end;
  end;


  SehiGoukei;

end;

procedure TFSetSehi.btnCloseClick(Sender: TObject);
begin

Close;

end;

procedure TFSetSehi.BtnDelClick(Sender: TObject);
var
  aCnt : integer ;
begin
  if not SetEdit then exit ;

  //ADOSindan.edit;
  Ds1.DataSet.FieldByName('SIM�v�Z��').asBoolean := True ;


  case PageHiryoDest.ActivePageIndex of
  0:begin
    SehiList.DelHiryo(htYuuki,ListSehiY.ItemIndex+1);
    DspHiryoList(htYuuki);
    {�엿�ݒ���}
    for aCnt := 1 to 5 do
      SetHiryoField (Ds1.DataSet,'�L�@',aCnt,SehiList.GetHiryo(htYuuki,aCnt)) ;
  end;
  1:begin
    SehiList.DelHiryo(htHiryo1,ListSehiM.ItemIndex+1);
    DspHiryoList(htHiryo1);
    for aCnt := 1 to 5 do
      SetHiryoField (Ds1.DataSet,'���',aCnt,SehiList.GetHiryo(htHiryo1,aCnt)) ;
  end;
  2:begin
    SehiList.DelHiryo(htHiryo2,ListSehiB.ItemIndex+1);
    DspHiryoList(htHiryo2);
    for aCnt := 1 to 5 do
      SetHiryoField (Ds1.DataSet,'���{1',aCnt,SehiList.GetHiryo(htHiryo2,aCnt)) ;
  end;
  3:begin
    SehiList.DelHiryo(htHiryo3,ListSehiB2.ItemIndex+1);
    DspHiryoList(htHiryo3);
    for aCnt := 1 to 5 do
      SetHiryoField (Ds1.DataSet,'���{2',aCnt,SehiList.GetHiryo(htHiryo3,aCnt)) ;
  end;

  end;

  SehiGoukei;


end;



procedure TFSetSehi.btnPostClick(Sender: TObject);
begin


 	if ADOSindan.State in [dsEdit	,dsInsert] then
    ADOSindan.Post ;


end;

procedure TFSetSehi.btnSakuhi2Click(Sender: TObject);
begin
  Application.CreateForm(TmstSakuhiForm, mstSakuhiForm);
  {Version 0.6 #48 �앨����肳����}
  with ADOUketuke do begin
//     stmp := FieldByName('��ڃR�[�h').asString;
//     stmp := FieldByName('�앨�R�[�h').asString;
//     stmp := FieldByName('��^�R�[�h').asString;

    mstSakuhiForm.SelectRecord(
      FieldByName('��ڃR�[�h').asString,
      FieldByName('�앨�R�[�h').asString,
      FieldByName('��^�R�[�h').asString);
  end;
  mstSakuhiForm.ShowModal ;
  mstSakuhiForm.Release ;
  MakeKaseiList;

end;

procedure TFSetSehi.btnSakuhiClick(Sender: TObject);
begin
  Application.CreateForm(TmstSakuhiForm, mstSakuhiForm);
  {Version 0.6 #48 �앨����肳����}
  with ADOUketuke do begin
//     stmp := FieldByName('��ڃR�[�h').asString;
//     stmp := FieldByName('�앨�R�[�h').asString;
//     stmp := FieldByName('��^�R�[�h').asString;

    mstSakuhiForm.SelectRecord(
      FieldByName('��ڃR�[�h').asString,
      FieldByName('�앨�R�[�h').asString,
      FieldByName('��^�R�[�h').asString);
  end;
  mstSakuhiForm.ShowModal ;
  mstSakuhiForm.Release ;
  MakeKaseiList;

end;

procedure TFSetSehi.btnTanpiClick(Sender: TObject);
begin
  Application.CreateForm(TmstTanpiForm, mstTanpiForm);
  mstTanpiForm.ShowModal ;
  mstTanpiForm.Release ;
  MakeTanpiList;

end;

procedure TFSetSehi.Ds1StateChange(Sender: TObject);
begin
	case ds1.DataSet.State of
	dsEdit	,dsInsert	: begin
//  	EditPanel.Enabled := True ;
    btnPost.Enabled := True ;
    btnCancel.Enabled := True ;
//    DBGrid1.Enabled := False;    ���Xstatechange���邽�ߕs��
//    GridPanel.Enabled := False;
  end;
  else begin
//  	EditPanel.Enabled := False ;
    btnPost.Enabled := False ;
    btnCancel.Enabled := False ;
//    DBGrid1.Enabled := True;
//    GridPanel.Enabled := True;
  end;
  end;

end;

procedure TFSetSehi.FormCreate(Sender: TObject);
var
aCnt : integer;
stmp : String;
begin
  TabYuukisitu.TabVisible := false;


  lsTanpi := TStringList.Create ;


	Color := BackColor ;
  SehiList := TSehiHiryo.Create ;  {�{���ʃ��X�g}

 {�z��R���|�[�l���g�̓o�^}
  for aCnt := 1 to 5 do begin
    txtSehiValue[Ord(htYuuki)][aCnt] := TNumEdit(FindComponent('NumY'+InttoStr(aCnt)) );
    txtSehiValue[Ord(htHiryo1)][aCnt] := TNumEdit(FindComponent('NumM'+InttoStr(aCnt))  );
    txtSehiValue[Ord(htHiryo2)][aCnt] := TNumEdit(FindComponent('NumB'+InttoStr(aCnt))  );
    txtSehiValue[Ord(htHiryo3)][aCnt] := TNumEdit(FindComponent('NumB2'+InttoStr(aCnt))  );
  end;


  //PageSehiValues.ActivePageIndex := 0 ;
  PageHiryoDest.ActivePageIndex := 0 ;
  PageHiryoSource.ActivePageIndex := 1 ;


end;
procedure TFSetSehi.FormShow(Sender: TObject);
var
stmp : String;
  aCnt : integer ;
  aCode : string ;

begin






ADOSindan.close;
ADOSindan.SQL.Clear;
stmp := 'select * from T_SINDAN where �T���v���ԍ� = "'+SNO+'"';
ADOSindan.SQL.Add(stmp);
ADOSindan.open;



ADOUketuke.close;
ADOUketuke.SQL.Clear;
stmp := 'select * from T_UKETUKE where �T���v���ԍ� = "'+SNO+'"';
ADOUketuke.SQL.Add(stmp);
ADOUketuke.open;




  //�f�[�^�̃������ɃZ�b�g
  SehiList.Clear ;
  for aCnt := 1 to 5 do begin
    aCode := ADOSindan.FieldByName('�L�@'+InttoStr(aCnt)).asString ;
    if aCode <> '' then
      SehiList.SetHiryo(htYuuki,aCode,
        ADOSindan.FieldByName('�L�@��'+InttoStr(aCnt)).asFloat, IsKazan);

    aCode := ADOSindan.FieldByName('���'+InttoStr(aCnt)).asString ;
    if aCode <> '' then
      SehiList.SetHiryo(htHiryo1,aCode,
        ADOSindan.FieldByName('����'+InttoStr(aCnt)).asFloat, IsKazan);

    aCode := ADOSindan.FieldByName('���{1'+InttoStr(aCnt)).asString ;
    if aCode <> '' then
      SehiList.SetHiryo(htHiryo2,aCode,
        ADOSindan.FieldByName('���{1��'+InttoStr(aCnt)).asFloat, IsKazan);

    aCode := ADOSindan.FieldByName('���{2'+InttoStr(aCnt)).asString ;
    if aCode <> '' then
      SehiList.SetHiryo(htHiryo3,aCode,
        ADOSindan.FieldByName('���{2��'+InttoStr(aCnt)).asFloat, IsKazan);
  end;



  DspHiryoList(htYuuki);
  DspHiryoList(htHiryo1);
  DspHiryoList(htHiryo2);
  DspHiryoList(htHiryo3);


  MakeKaseiList;
  MakeTanpiList;

end;

{�엿�ݒ��\��}
procedure TFSetSehi.DspHiryoList(aType : THiryoType);
var
  aCnt : integer ;
  aRecHiryo : TRecHiryo ;
  aListBox : TListBox ;
  sfield : String;
begin
  case aType of
  htYuuki: begin
            aListBox  := ListSehiY ;
            sfield := '�L�@��';
           end;
  htHiryo1: begin
             aListBox := ListSehiM ;
             sfield := '����';
           end;
  htHiryo2: begin
             aListBox := ListSehiB ;
             sfield := '���{1��';
           end;
  htHiryo3: begin
             aListBox := ListSehiB2 ;
             sfield := '���{2��';
           end;
  end;
  aListBox.Clear ;
  for aCnt := 1 to 5 do begin
    aRecHiryo := SehiList.GetHiryo(aType,aCnt) ;
    if aRecHiryo.CD <> '' then begin
      aListBox.Items.Add( aRecHiryo.CD + ' ' + aRecHiryo.Name );
//      txtSehiValue[Ord(aType)][aCnt].Value := aRecHiryo.V ;
ds1.Edit;
      ds1.DataSet.FieldByName(sfield+inttostr(aCnt)).asfloat := aRecHiryo.V ;
    end;
//     else
//    txtSehiValue[Ord(aType)][aCnt].Text := '' ;
  end;
end;


procedure TFSetSehi.MakeKaseiList;
var
  aCnt : integer ;
  cd1,cd2,cd3 : String;

begin
  ListKasei.Clear ;
  ListYuuki.Clear ;
//  lsKasei.Clear ;


  cd1 := ADOUketuke.FieldByName('��ڃR�[�h').AsString;
  cd2 := ADOUketuke.FieldByName('�앨�R�[�h').AsString;
  cd3 := ADOUketuke.FieldByName('��^�R�[�h').AsString;



  QueryWork.Close;


  with QueryWork do begin
    SQL.Text := 'Select * from M_SAKHI where ��ڃR�[�h="'+cd1+'" and �앨�R�[�h="'+cd2+'" and ��^�R�[�h="'+cd3+'"';
    Open;
    if RecordCount > 0 then begin
      for aCnt := 1 to 10 do begin
        ListKasei.Items.Add(FieldByName('����'+inttoStr(aCnt)).asString+' '+
            GetHiryoName(FieldByName('����'+inttoStr(aCnt)).asString ) );
        ListYuuki.Items.Add(FieldByName('�L�@'+inttoStr(aCnt)).asString+' '+
            GetHiryoName(FieldByName('�L�@'+inttoStr(aCnt)).asString ) );
      end;
    end;
    Close;
    DataSource := nil ;
  end;
end;
{�P�샊�X�g�̍쐬->������}
procedure TFSetSehi.MakeTanpiList;
begin
  lsTanpi.Clear ;
  with QueryWork do begin
    SQL.Text := 'Select * from M_TANPI';
    Open;
    While not Eof do begin
//      ListTanpi.Items.Add(FieldByName('�엿��').asString );
      lsTanpi.Add(FieldByName('CODE').asString+' '+FieldByName('�엿��').asString) ;
      Next;
    end;
    Close;
  end;
  grTanpiClick(self);  //���X�g�{�b�N�X�Ƀ��X�g�쐬
end;
{�������|���w�萬���̂݃��X�g�{�b�N�X�ɓW�J}
procedure TFSetSehi.grTanpiClick(Sender: TObject);
var
  aCnt : integer ;
begin
{�P���ʑI��}
  ListTanpi.Clear ;
  for aCnt := 0 to lsTanpi.Count -1 do begin
    if lsTanpi[aCnt][1] = InttoStr(grTanpi.ItemIndex + 1) then
      ListTanpi.Items.Add(lsTanpi[aCnt]);
  end;
end;

procedure TFSetSehi.ListSehiMDblClick(Sender: TObject);
var
  aCnt : integer ;
begin
  if not SetEdit then exit ;

  case PageHiryoDest.ActivePageIndex of
  0:begin
    SehiList.DelHiryo(htYuuki,ListSehiY.ItemIndex+1);
    DspHiryoList(htYuuki);
    {�엿�ݒ���}
    for aCnt := 1 to 5 do
      SetHiryoField (Ds1.DataSet,'�L�@',aCnt,SehiList.GetHiryo(htYuuki,aCnt)) ;
  end;
  1:begin
    SehiList.DelHiryo(htHiryo1,ListSehiM.ItemIndex+1);
    DspHiryoList(htHiryo1);
    for aCnt := 1 to 5 do
      SetHiryoField (Ds1.DataSet,'���',aCnt,SehiList.GetHiryo(htHiryo1,aCnt)) ;
  end;
  2:begin
    SehiList.DelHiryo(htHiryo2,ListSehiB.ItemIndex+1);
    DspHiryoList(htHiryo2);
    for aCnt := 1 to 5 do
      SetHiryoField (Ds1.DataSet,'���{1',aCnt,SehiList.GetHiryo(htHiryo2,aCnt)) ;
  end;
  3:begin
    SehiList.DelHiryo(htHiryo3,ListSehiB2.ItemIndex+1);
    DspHiryoList(htHiryo3);
    for aCnt := 1 to 5 do
      SetHiryoField (Ds1.DataSet,'���{2',aCnt,SehiList.GetHiryo(htHiryo3,aCnt)) ;
  end;
//  4:begin
//    SehiList.DelHiryo(htHiryo1,ListSehiM2.ItemIndex+1);
//    DspHiryoList(htHiryo1);
//    for aCnt := 1 to 5 do
//      SetHiryoField (DataSource2.DataSet,'���',aCnt,SehiList.GetHiryo(htHiryo1,aCnt)) ;
//  end;

  end;

  SehiGoukei;

end;

{�w��t�B�[���h�̏����t���f�[�^�������݁B}
procedure TFSetSehi.SetHiryoField( DataSet: TDataSet; aField : string; aCnt : integer ;aRecHiryo : TRecHiryo );
begin
  if aRecHiryo.CD <> '' then begin
    DataSet.FieldByName(aField+InttoStr(aCnt)).asString :=  aRecHiryo.CD ;
   // DataSet.FieldByName(aField+'��'+InttoStr(aCnt)).asFloat :=  aRecHiryo.V ;
  end else begin
    DataSet.FieldByName(aField+InttoStr(aCnt)).Clear ;
    DataSet.FieldByName(aField+'��'+InttoStr(aCnt)).Clear ;
  end;
end;

///////////////////////////////////////////////////////////////////////////
procedure TFSetSehi.SehiGoukei;
begin
    //���v�̍Čv�Z

    if ADOSindan.State <> dsEdit then ADOSindan.Edit;


    if ADOSindan.FieldByName('���{��').asInteger > 0 then begin
       ADOSindan.FieldByName('N�{��s���ʍ��v').asfloat := ADOSindan.FieldByName('N�{��s����').asfloat + ADOSindan.FieldByName('N�{��s����2').asfloat + (ADOSindan.FieldByName('N�{��s����3').asfloat * (ADOSindan.FieldByName('���{��').asInteger - 1))+ADOSindan.FieldByName('Ny�{��s���ʍ��v').asfloat;
       ADOSindan.FieldByName('P�{��s���ʍ��v').asfloat := ADOSindan.FieldByName('P�{��s����').asfloat + ADOSindan.FieldByName('P�{��s����2').asfloat + (ADOSindan.FieldByName('P�{��s����3').asfloat * (ADOSindan.FieldByName('���{��').asInteger - 1))+ADOSindan.FieldByName('Py�{��s���ʍ��v').asfloat;
       ADOSindan.FieldByName('K�{��s���ʍ��v').asfloat := ADOSindan.FieldByName('K�{��s����').asfloat + ADOSindan.FieldByName('K�{��s����2').asfloat + (ADOSindan.FieldByName('K�{��s����3').asfloat * (ADOSindan.FieldByName('���{��').asInteger - 1))+ADOSindan.FieldByName('Ky�{��s���ʍ��v').asfloat;
       ADOSindan.FieldByName('Mg�{��s���ʍ��v').asfloat := ADOSindan.FieldByName('Mg�{��s����').asfloat;
    end
    else begin
       ADOSindan.FieldByName('N�{��s���ʍ��v').asfloat := ADOSindan.FieldByName('N�{��s����').asfloat + ADOSindan.FieldByName('N�{��s����2').asfloat + ADOSindan.FieldByName('Ny�{��s���ʍ��v').asfloat;
       ADOSindan.FieldByName('P�{��s���ʍ��v').asfloat := ADOSindan.FieldByName('P�{��s����').asfloat + ADOSindan.FieldByName('P�{��s����2').asfloat + ADOSindan.FieldByName('Py�{��s���ʍ��v').asfloat;
       ADOSindan.FieldByName('K�{��s���ʍ��v').asfloat := ADOSindan.FieldByName('K�{��s����').asfloat + ADOSindan.FieldByName('K�{��s����2').asfloat + ADOSindan.FieldByName('Ky�{��s���ʍ��v').asfloat;
       ADOSindan.FieldByName('Mg�{��s���ʍ��v').asfloat := ADOSindan.FieldByName('Mg�{��s����').asfloat;
    end;


    //if ADOSindan.State = dsEdit then ADOSindan.Post;




end;

function TFSetSehi.SetHiryoList( aMode :TSetMode; aHiryo :THiryoType  ; aDelNum: integer ; aCode: string ):Boolean;
var
  aNum,aIndex : integer ;    {�o�^�ł����z��ԍ�}
  aSetVal,aValue : double ;
//  stmp : String;
begin
  result := False ;

  //�E�B���h�E�̕`�����������B
//  Application.ProcessMessages();
//stmp := txtNSet1.Text;


  case aMode of
  smIns:begin
    aNum := SehiList.SetHiryo(aHiryo,aCode,0,IsKazan );
    if aNum > 0 then begin
      {�ڕW�l����ʂ̏�Ԃ��犄��o��}
      aSetVal := 0;
      aIndex := 0 ;
      case PageHiryoSource.ActivePageIndex of   {�ǂ̔엿�킩}
      0: {�L�@} aIndex := 0;  {�L�@�̏ꍇ�͑S�Ē��f�Ōv�Z}
      1: {����} aIndex := grKasei.ItemIndex;
      2: {�P��} aIndex := grTanpi.ItemIndex;
      end;
      {�L�@�ȊO�͑I�񂾔엿��Ōv�Z}
      if  aHiryo in [htHiryo1,htHiryo2,htHiryo3] then begin
        case aIndex of {�����ƒP��̃C���f�b�N�X����}
        0: {N}
          case PageHiryoDest.ActivePageIndex of {�{��̉����}
          1: aSetVal := StrToFloat(txtNBuld1.Text) ;
          2: aSetVal := StrToFloat(txtNBuld2.Text) ;
          3: aSetVal := StrToFloat(txtNBuld3.Text) ;
          end;
        1: {P}
          case PageHiryoDest.ActivePageIndex of {�{��̉����}
          1: aSetVal := StrToFloat(txtPBuld1.Text);
          2: aSetVal := StrToFloat(txtPBuld2.Text);
          3: aSetVal := StrToFloat(txtPBuld3.Text);
          end;
        2: {K}
          case PageHiryoDest.ActivePageIndex of {�{��̉����}
          1: aSetVal := StrToFloat(txtKBuld1.Text);
          2: aSetVal := StrToFloat(txtKBuld2.Text);
          3: aSetVal := StrToFloat(txtKBuld3.Text);
          end;
        3: {Mg}
          case PageHiryoDest.ActivePageIndex of {�{��̉����}
          1: aSetVal := StrToFloat(txtMBuld1.Text);
//  �Ȃ�    2: aSetVal := txtMSet2.Value ;
//          3: aSetVal := txtMSet3.Value ;
          end;
        end;
      end else begin
        aSetVal := StrToFloat(txtNyBuldSum.Text); //txtNySetSum.Value ;  {�L�@�̏ꍇ�͑S�Ē��f�Ōv�Z}
      end;
      {�{�e�ʂ��Z�o����}
      aValue := SehiList.CalcValue(aHiryo,aNum,aSetVal,aIndex+1);
      SehiList.SetValue(aHiryo,aNum,aValue);
    end;
    result := aNum > 0 ;
  end;
  smDel:begin
    SehiList.DelHiryo(aHiryo,aDelNum );
    result := True ;
  end;
  end;
end;

{
  �엿�݌v�̗p�ʂ̕ύX
}
procedure TFSetSehi.NumChange(Sender: TObject);
begin
  {���ڕҏW���ꂽ��}
  if Sender is TNumEdit then
    if (Sender as TNumEdit).Focused then
      if not SetEdit then exit ;   //���ڕҏW�Ȃ�Edit���[�h�ɂ��āA�X�V���R���|�[�l���g�l���Q�Ƃ���
end;
procedure TFSetSehi.NumM1Change(Sender: TObject);
begin
  {���ڕҏW���ꂽ��}
  if Sender is TNumEdit then
    if (Sender as TNumEdit).Focused then
      if not SetEdit then exit ;   //���ڕҏW�Ȃ�Edit���[�h�ɂ��āA�X�V���R���|�[�l���g�l���Q�Ƃ���

end;

procedure TFSetSehi.EnterKeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 then  //Enter�L�[�������ꂽ��
  begin
    Key:=#0; //�L�[���͂𖳌��ɂ�
    Keybd_event(VK_TAB,0,0,0) //Tab�L�[�𔭐�������B
  end;
end;

procedure TFSetSehi.NumExit(Sender: TObject);
begin
//  SehiList.SetValue( THiryoType(PageHiryoDest.ActivePageIndex) ,
//    (Sender as TNumEdit).Tag , (Sender as TNumEdit).Value);

end;

function TFSetSehi.SetEdit:Boolean;
begin
  if Ds1.DataSet.Eof and Ds1.DataSet.Bof then begin
    result := false ;
    exit;
  end;
  {Version 0.6 #27 �T���v���ԍ���PC�͈͓��̂ݗL��}
  result := IsEditRec(Ds1.DataSet.FieldByName('�T���v���ԍ�').asString);

  if (Ds1.State <> dsEdit) and result then
    Ds1.DataSet.edit;
end;

end.
