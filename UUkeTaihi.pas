unit UUkeTaihi;
{
  ��t��ʁF��t�e�[�u���ɃG���g���[������
  �����N�e�[�u������������̂ŁA���R�[�h�ړ����Ɏ��Ԃ�������B
  �K�{���͂̃`�F�b�N�͓o�^�{�^���̎��̓v���O��������o���邪�A
  AutoPost���̓V�X�e���iBDE�j�ɂ䂾�˂�B
}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBTables, Mask, DBCtrls, Db, ComCtrls, ExtCtrls, ADODB;

type
  TfrmUkeTaihi = class(TForm)
    StatusBar1: TStatusBar;
    ds1: TDataSource;
    Panel2: TPanel;
    btnNew: TBitBtn;
    btnEdit: TBitBtn;
    btnDel: TBitBtn;
    btnPost: TBitBtn;
    btnCancel: TBitBtn;
    btnClose: TBitBtn;
    Panel3: TPanel;
    Panel5: TPanel;
    gb5: TGroupBox;
    gb2: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    btnSHojou: TBitBtn;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    ds2: TDataSource;
    DBEdit2: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit9: TDBEdit;
    Label5: TLabel;
    Label13: TLabel;
    txtSampleNo: TDBEdit;
    btnSNo: TButton;
    DBNavigator1: TDBNavigator;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    dtUketuke2: TDateTimePicker;
    DBEdit1: TDBEdit;
    Label11: TLabel;
    DBEdit10: TDBEdit;
    Label15: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Label16: TLabel;
    Shape3: TShape;
    DBEdit11: TDBEdit;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    Shape7: TShape;
    Label17: TLabel;
    Shape8: TShape;
    Shape9: TShape;
    Label18: TLabel;
    Label19: TLabel;
    Shape10: TShape;
    Label20: TLabel;
    DBEdit14: TDBEdit;
    Label14: TLabel;
    Shape11: TShape;
    Shape12: TShape;
    Label21: TLabel;
    Shape13: TShape;
    DBEdit15: TDBEdit;
    Shape14: TShape;
    Shape15: TShape;
    Shape16: TShape;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    Shape17: TShape;
    Label22: TLabel;
    Shape18: TShape;
    Shape19: TShape;
    Label23: TLabel;
    Label24: TLabel;
    Shape20: TShape;
    Label25: TLabel;
    DBEdit18: TDBEdit;
    Label26: TLabel;
    Shape21: TShape;
    Shape22: TShape;
    Label27: TLabel;
    Shape23: TShape;
    DBEdit19: TDBEdit;
    Shape24: TShape;
    Shape25: TShape;
    Shape26: TShape;
    DBEdit20: TDBEdit;
    DBEdit22: TDBEdit;
    Shape27: TShape;
    Label28: TLabel;
    Shape28: TShape;
    Shape29: TShape;
    Label29: TLabel;
    Label30: TLabel;
    Shape30: TShape;
    Label31: TLabel;
    Label32: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    Label33: TLabel;
    DBLookupComboBox4: TDBLookupComboBox;
    ds4: TDataSource;
    ds5: TDataSource;
    Label34: TLabel;
    cmbSakumoku: TDBLookupComboBox;
    Label35: TLabel;
    cmbSakumotu: TDBLookupComboBox;
    Label36: TLabel;
    cmbSakugata: TDBLookupComboBox;
    BtSakuCls1: TButton;
    dsSakumotu: TDataSource;
    dsSakugata: TDataSource;
    dsSakumoku: TDataSource;
    Label37: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label40: TLabel;
    DateTimePicker4: TDateTimePicker;
    Label38: TLabel;
    DBEdit23: TDBEdit;
    BtWariCls: TButton;
    Label39: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    DBEdit21: TDBEdit;
    Label53: TLabel;
    DBEdit24: TDBEdit;
    BtKingaku: TButton;
    Label54: TLabel;
    DBFutan: TDBComboBox;
    QNouka: TADOQuery;
    ADOTable2: TADOTable;
    ADOTable3: TADOTable;
    QKingaku: TADOQuery;
    QuerySakumoku: TADOQuery;
    QuerySakumotu: TADOQuery;
    QuerySakugata: TADOQuery;
    ADOQuery1: TADOQuery;
//    procedure btnSHojouClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
//    procedure txtHojouNoChange(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure ds1StateChange(Sender: TObject);
    procedure Table1orgAfterInsert(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure btnSNoClick(Sender: TObject);
    procedure Table1orgAfterScroll(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cmbJikiChange(Sender: TObject);
    procedure dtUketukeChange(Sender: TObject);
    procedure Table1orgAfterCancel(DataSet: TDataSet);
    procedure ds1DataChange(Sender: TObject; Field: TField);
    procedure EnterKeyPress(Sender: TObject; var Key: Char);
    procedure Table1orgBeforePost(DataSet: TDataSet);
    procedure BtnClrClick(Sender: TObject);
    procedure txtSampleNoExit(Sender: TObject);
    procedure Table1orgAfterPost(DataSet: TDataSet);
    procedure BtSakuCls0Click(Sender: TObject);
    procedure BtSakuCls1Click(Sender: TObject);
    procedure dtUketuke2Change(Sender: TObject);
    procedure btnSHojouClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure DateTimePicker4Change(Sender: TObject);
    procedure BtWariClsClick(Sender: TObject);
    procedure BtKingakuClick(Sender: TObject);
    procedure ADOTable1AfterCancel(DataSet: TDataSet);
    procedure ADOTable1AfterInsert(DataSet: TDataSet);
    procedure ADOTable1AfterPost(DataSet: TDataSet);
    procedure ADOTable1AfterScroll(DataSet: TDataSet);
    procedure ADOTable1BeforePost(DataSet: TDataSet);
    procedure ADOQuery1BeforePost(DataSet: TDataSet);
    procedure ADOQuery1AfterScroll(DataSet: TDataSet);
    procedure ADOQuery1AfterCancel(DataSet: TDataSet);
    procedure ADOQuery1AfterInsert(DataSet: TDataSet);
    procedure ADOQuery1AfterPost(DataSet: TDataSet);
  private
    { Private �錾 }
    FNewNO : string ;
    procedure SetEditEnable(aFlag: Boolean);
  public
    procedure LocateNo(pSmplNo: string);
    { Public �錾 }
  end;

var
  frmUkeTaihi: TfrmUkeTaihi;

implementation

uses DMU,SUketukeU, MHojouU,SNoukaU;

{$R *.DFM}

procedure TfrmUkeTaihi.FormCreate(Sender: TObject);
var
stmp : String;
begin
	Color := BackColor ;
  FNewNO := '';
	ADOQuery1.Open;
  QNouka.CLose;
  QNouka.SQL.Clear();
  stmp := 'select * from M_NOUKA,M_CITY,M_TIKU'+
  ' where M_NOUKA.�_�Ɣԍ� = "'+DBEdit8.Text+'"';
  QNouka.SQL.Add( stmp );
  QNouka.Open;
//  QueryHojou.Open;
//���x�A�b�v�Ȃ�ȉ��̍앨�֘A�̃����N�e�[�u���������������Ɖ��P�����


        //
	if not IsEntryYear then begin		//����\�N�x�Ŗ�����ΕҏW�s��
    btnNew.Enabled := False ;
    SetEditEnable(False);
  end;
end;
{
  �f�[�^�o�^�R���|�[�l���g�̗L���ݒ�F�T���v���ꍆ�ʕҏW����p
}
procedure TfrmUkeTaihi.SetEditEnable(aFlag:Boolean);
begin
    btnEdit.Enabled := aFlag ;
    btnDel.Enabled := aFlag ;
  	ds1.AutoEdit := aFlag ;
//    gb1.Enabled := aFlag ;
    gb2.Enabled := aFlag ;
//		gb3.Enabled := aFlag ;
//		gb4.Enabled := aFlag ;
end;
procedure TfrmUkeTaihi.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
	if ds1.DataSet.State in [dsEdit	,dsInsert] then begin
    if Application.MessageBox ('�ҏW���������܂����H','�m�F', MB_YESNO ) = ID_YES then
  		ds1.DataSet.Cancel
    else begin
      CanClose := false ;
      exit ;
    end;
  end;
end;

procedure TfrmUkeTaihi.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ADOQuery1.Close;
end;

{�w��T���v���ԍ��Ɉړ�}
procedure TfrmUkeTaihi.LocateNo( pSmplNo : string );
begin
  //�ҏW���łȂ���΃T���v���ԍ��Ɉړ�
	if ds1.DataSet.State in [dsEdit	,dsInsert] then exit;
  ADOQuery1.locate('�T���v���ԍ�',pSmplNo,[]);
end;
{�V�K�{�^��}
procedure TfrmUkeTaihi.btnNewClick(Sender: TObject);
var
  bNewRec : Boolean ;
begin

//ScaleBy(1,10);
    //�ő�T���v���ԍ����蓖��
    FNewNO := GetMaxSampleNo(bNewRec,'2') ;   {Version 0.6 #38}
    if FNewNO = '' then exit ;   {Version 0.6 #36}
    {Version 0.6 #46 : �폜���R�[�h���g��}
    if not bNewRec then begin
      {���ۂɃ��R�[�h���폜����B�łȂ��ƕύX�ʁi��ʃ����N���ځAFiltere�����j���傫��}
      with DataModule1.QueryWrite do begin
        SQL.Text := 'delete from T_UKETUKE2 where �T���v���ԍ�='''+FNewNO+'''';
        ExecSQL ;
//        SQL.Text := 'delete from T_SINDAN where �T���v���ԍ�='''+FNewNO+'''';
//        ExecSQL ;
      end;
    end;
	  ds1.DataSet.Append;    {Append->Insert���ɖ��Ȃ�����}
    ds1.DataSet.FieldByName('�T���v���ԍ�').asString := FNewNO ;
    ds1.DataSet.FieldByName('��p���S��').asString := '���Y�Җ{�l';



end;
{����{�^��}
procedure TfrmUkeTaihi.btnCloseClick(Sender: TObject);
begin
//	if ds1.DataSet.State in [dsEdit	,dsInsert] then
//		ds1.DataSet.Cancel;
	Close;
end;
{�L�����Z���{�^��}
procedure TfrmUkeTaihi.btnCancelClick(Sender: TObject);
begin
	ds1.DataSet.Cancel;
end;
{�o�^�{�^��}
procedure TfrmUkeTaihi.btnPostClick(Sender: TObject);
begin
  {���̓`�F�b�N}
  if not ChkEditLength(txtSampleNo,4) then exit;
//  if not ChkEditLength(txtHojouNo,7) then exit;





	ds1.DataSet.Post;
end;
//�V�K�̏ꍇ��t���Z�b�g
procedure TfrmUkeTaihi.Table1orgAfterInsert(DataSet: TDataSet);
begin
//	dtUketuke.Date := now ;
//	dtUketuke2.Date := now ;
  {�����l�̐ݒ�}
//  ds1.DataSet.FieldByName('��t�N����').asDateTime := dtUketuke.Date ;
//  ds1.DataSet.FieldByName('�̎�N����').asDateTime := dtUketuke2.Date ;
  ds1.DataSet.FieldByName('�ҏW��').asDatetime := now ;  //���M�t���O�̎�O�A�蓮�ōX�V����
	ds1.DataSet.FieldByName('�폜�t���O').asBoolean := False ;

  SetEditEnable( True );  {Version 0.6 #37}
end;
//�X�V�O����
procedure TfrmUkeTaihi.Table1orgBeforePost(DataSet: TDataSet);
var
nname : String;
sname : String;
itmp : Integer;
flg : boolean;
i : Integer;
stmp : String;
begin
  //���R�[�h�ړ��ɂ�鎩���|�X�g�̎��͕K�{���ڂ������͂̂Ƃ���O���������A
  //���̍��ڂɃt�H�[�J�X���ړ�����̂ŁA�C����B

 //



  {�����l�̐ݒ�}
//  ds1.DataSet.FieldByName('��t�N����').asDateTime := dtUketuke.Date ;
  ds1.DataSet.FieldByName('�̎�N����').asDateTime := dtUketuke2.Date ;

  ds1.DataSet.FieldByName('�T���v��������').asDateTime := DateTimePicker1.Date ;
//  ds1.DataSet.FieldByName('���ʔz�M�\���').asDateTime := DateTimePicker2.Date ;
//  ds1.DataSet.FieldByName('�{����t��').asDateTime := DateTimePicker3.Date ;
  ds1.DataSet.FieldByName('�Z���^�[��t��').asDateTime := DateTimePicker4.Date ;


  //���͎���
//  ds1.DataSet.FieldByName('���͎���').asString := InttoStr(cmbJiki.ItemIndex);
	//�ҏW���̓o�^
  ds1.DataSet.FieldByName('�ҏW��').asDatetime := now ;  //���M�t���O�̎�O�A�蓮�ōX�V����


  //���S�҃��X�g�o�^
  nname := ds1.DataSet.FieldByName('��p���S��').asString;
  if nname <> '' then begin
        //ini�t�@�C���ɓo�^
        itmp := SystemIni.ReadInteger( 'Futansya', 'Count', 0 );

        //ini�Ɋ��ɂ�����̂́A�o�^���Ȃ�
        flg := false;
        for i := 1 to itmp do begin
            stmp := 'name'+InttoStr(i);
            sname := SystemIni.ReadString( 'Futansya', stmp, '' );
            if nname = sname then
               flg := true;
        end;

        if not flg then begin
           INC(itmp);
           stmp := 'name'+InttoStr(itmp);
           SystemIni.WriteInteger( 'Futansya', 'Count', itmp );
           SystemIni.WriteString('Futansya', stmp, nname );
           DBFutan.Items.Add( nname );
        end;
  end;



end;
//�X�V�㏈��
procedure TfrmUkeTaihi.Table1orgAfterPost(DataSet: TDataSet);
begin
  //�����A�V�K�쐬�Ȃ�A�f�f�e�[�u�����쐬����B {Version 0.6 #38}
//  if FNewNO <> '' then
//    InsertSindanTable(DataSet.FieldByName('�T���v���ԍ�').asString);  //��FNewNO�ɂ��Ȃ�����
  FNewNO:=''; //Post,Cancel������̓N���A
end;

{�폜�{�^��}
procedure TfrmUkeTaihi.btnDelClick(Sender: TObject);
begin
	if ds1.DataSet.Bof and  ds1.DataSet.Eof then exit ;
  if Application.MessageBox ('�폜���܂����H','�m�F', MB_YESNO ) = ID_YES then begin
    {Version 0.6 #23 }  //���������Ώ��̂��߁A�폜�t���O�ɂ���B�f�fT������Γ��l
//		ds1.DataSet.Delete;
    //�f�f�e�[�u���폜
    DelFlagSindanTable(ds1.DataSet.FieldByName('�T���v���ԍ�').asString);
    ds1.DataSet.Edit ;
    ds1.DataSet.FieldByName('�폜�t���O').asBoolean := True ;
    ds1.DataSet.Post ;
    {Version 0.6 #47 : �ҏW�{�^���ĕ]��}
    ADOTable1AfterScroll(ds1.DataSet);
  end;
end;
{�ҏW�{�^��}
procedure TfrmUkeTaihi.btnEditClick(Sender: TObject);
begin
	if ds1.DataSet.Bof and  ds1.DataSet.Eof then exit ;
	ds1.DataSet.Edit;
end;
{�X�e�[�^�X�ύX�C�x���g�ő���{�^���̐���}
procedure TfrmUkeTaihi.ds1StateChange(Sender: TObject);
begin
	//��L�[�͐V�K�̂ݏC����
	txtSampleNo.Enabled := ds1.DataSet.State in [dsInsert ];
  //�����{�^�� �V�K�̎��͖���  2003/05/06
  btnSNO.Enabled := not (ds1.DataSet.State in [dsInsert ]);

	case ds1.DataSet.State of
	dsEdit	,dsInsert	: begin
  	btnNew.Enabled := False;
    btnEdit.Enabled := False;
    btnDel.Enabled := False;
    btnPost.Enabled := True ;
    btnCancel.Enabled := True ;
    btnSHojou.Enabled := True ;
    BtKingaku.Enabled := True;

//    BtTitenIn.Enabled := True;
    DBNavigator1.Enabled := false;
  end;
  else begin
  	btnNew.Enabled := True;
    btnEdit.Enabled := True;
    btnDel.Enabled := True;
    btnPost.Enabled := False ;
    btnCancel.Enabled := False ;
    btnSHojou.Enabled := False ;
    BtKingaku.Enabled := False;
//    BtTitenIn.Enabled := False ;
    DBNavigator1.Enabled := True;
  end;
  end;
end;

//����
procedure TfrmUkeTaihi.btnSNoClick(Sender: TObject);
var
	SNO : string ;
begin
  SNO := DspUkeList(txtSampleNo.Text, '2');
  if SNO <> '' then begin
  	ADOQuery1.Locate('�T���v���ԍ�',SNO,[]);
  end;
end;
//���R�[�h�̈ړ��łc�a�����N�łȂ����ڂ��Z�b�g
procedure TfrmUkeTaihi.Table1orgAfterScroll(DataSet: TDataSet);
begin
//  if not DataSet.FieldByName('��t�N����').IsNull then
//    dtUketuke.Date := DataSet.FieldByName('��t�N����').asDateTime ;

  if not DataSet.FieldByName('�̎�N����').IsNull then
    dtUketuke2.Date := DataSet.FieldByName('�̎�N����').asDateTime ;

  if not DataSet.FieldByName('�T���v��������').IsNull then
    DateTimePicker1.Date := DataSet.FieldByName('�T���v��������').asDateTime ;

//  if not DataSet.FieldByName('���ʔz�M�\���').IsNull then
//    DateTimePicker2.Date := DataSet.FieldByName('���ʔz�M�\���').asDateTime ;

//  if not DataSet.FieldByName('�{����t��').IsNull then
//    DateTimePicker3.Date := DataSet.FieldByName('�{����t��').asDateTime ;

  if not DataSet.FieldByName('�Z���^�[��t��').IsNull then
    DateTimePicker4.Date := DataSet.FieldByName('�Z���^�[��t��').asDateTime ;

  //���͎���
//  cmbJiki.ItemIndex := StrtoIntDef(DataSet.FieldByName('���͎���').asString,0);

  {Version 0.6 #27 : ��PC�G���g���[�ԍ��͈͓��̂ݕҏW��}
	if not (ds1.DataSet.State  in [dsEdit	,dsInsert]) then
    SetEditEnable(
      IsEditRec(DataSet.FieldByName('�T���v���ԍ�').asString)  and IsEntryYear
    );
end;

//DB�񃊃��N���ڕҏW�����΁A�����G�f�B�b�g����B
procedure TfrmUkeTaihi.cmbJikiChange(Sender: TObject);
begin
	if ds1.DataSet.Bof and  ds1.DataSet.Eof then exit ;
	if not (ds1.DataSet.State  in [dsEdit	,dsInsert]) then
    ds1.DataSet.Edit ;
//  ds1.DataSet.FieldByName('���͎���').asString := InttoStr(cmbJiki.ItemIndex);

end;
//DB�񃊃��N���ڕҏW�����΁A�����G�f�B�b�g����B
procedure TfrmUkeTaihi.dtUketukeChange(Sender: TObject);
begin
end;

//�L�����Z��������񃊃��N���ڂ�߂�
procedure TfrmUkeTaihi.Table1orgAfterCancel(DataSet: TDataSet);
begin
  FNewNO := '';     //Post,Cancel������̓N���A {Version 0.6 #38}
//   Table1AfterScroll(DataSet);
//2003/5/6 ��x�Ă΂�邽�߃R�����g
end;
{�f�[�^�ҏW�C�x���g}
procedure TfrmUkeTaihi.ds1DataChange(Sender: TObject; Field: TField);
var
stmp : String;
begin

  QNouka.CLose;
  QNouka.SQL.Clear();
  stmp := 'select * from M_NOUKA,M_CITY,M_TIKU'+
  ' where M_NOUKA.�_�Ɣԍ� = "'+DBEdit8.Text+'"';
  QNouka.SQL.Add( stmp );
  QNouka.Open;


end;
{Enter�L�[�Ń^�u�ړ�}
procedure TfrmUkeTaihi.EnterKeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 then  //Enter�L�[�������ꂽ��
  begin
    Key:=#0; //�L�[���͂𖳌��ɂ�
    Keybd_event(VK_TAB,0,0,0) //Tab�L�[�𔭐�������B
  end;
end;

procedure TfrmUkeTaihi.BtnClrClick(Sender: TObject);
var
  aBuff : string ;
begin
  aBuff := InttoStr( (Sender as TButton).Tag ) ;
	if ds1.DataSet.Bof and  ds1.DataSet.Eof then exit ;
	if not (ds1.DataSet.State  in [dsEdit	,dsInsert]) then
    ds1.DataSet.Edit ;
  ds1.DataSet.FieldByName('�L�@���R�[�h'+aBuff).Clear ;
  ds1.DataSet.FieldByName('�L�@���{���'+aBuff).Clear ;
end;


procedure TfrmUkeTaihi.txtSampleNoExit(Sender: TObject);
var
  iNum : integer ;
begin
  {Version 0.6 #24 �͈͓��̓`�F�b�N}
  if txtSampleNo.Enabled  then begin
    //�V�K�̎������L���łȂ�
    try
      iNum := StrtoInt(txtSampleNo.Text);
    except
      showmessage('�T���v���ԍ��𐳂������͂��ĉ������B');
      txtSampleNo.Text := FNewNO ;
      ds1.DataSet.FieldByName('�T���v���ԍ�').asString := txtSampleNo.Text ;
      txtSampleNo.SetFocus ;
      exit;
    end;
    txtSampleNo.Text := Format('%0.4d',[iNum]);
    ds1.DataSet.FieldByName('�T���v���ԍ�').asString := txtSampleNo.Text ;
    //�p�ӂ��ꂽ�ԍ��ȏさ�G���h�Ȃ����H
//    if (iNum < StrtoInt(FNewNO) ) or ( iNum > EntrySTOP ) then begin
//      showmessage('�T���v���ԍ��͈͐���𒴂��Ă��܂��B');
//      txtSampleNo.Text := FNewNO ;
//      ds1.DataSet.FieldByName('�T���v���ԍ�').asString := txtSampleNo.Text ;
//      txtSampleNo.SetFocus ;
//    end;

    //���ɂ���T���v���̏ꍇ
    with DataModule1.ADOQtmp do begin
        SQL.Text := 'select * from T_UKETUKE2 where �T���v���ԍ�='''+txtSampleNo.Text+'''';
        Open;
        //���R�[�h�����邩
        if DataModule1.ADOQtmp.RecordCount > 0 then begin
          if DataModule1.ADOQtmp.FieldByName('�폜�t���O').asBoolean Then begin
               DataModule1.ADOQtmp.Delete;
               close;
               //�f�f�e�[�u�����폜
               SQL.Text := 'select * from T_SINDAN where �T���v���ԍ�='''+txtSampleNo.Text+'''';
               Open;
               DataModule1.ADOQtmp.Delete;
               close;
          end
          else begin
              showMessage('���ɃT���v��������܂��B�ʂ̃T���v���ɂ��Ă��������B');
              txtSampleNo.Text := FNewNO ;
              ds1.DataSet.FieldByName('�T���v���ԍ�').asString := txtSampleNo.Text ;
              txtSampleNo.SetFocus ;

          end;

        end

    end;

  end;
end;


procedure TfrmUkeTaihi.BtSakuCls0Click(Sender: TObject);

begin
//  aBuff := InttoStr( (Sender as TButton).Tag ) ;
	if ds1.DataSet.Bof and  ds1.DataSet.Eof then exit ;
	if not (ds1.DataSet.State  in [dsEdit	,dsInsert]) then
    ds1.DataSet.Edit ;
    ds1.DataSet.FieldByName('�O��ڃR�[�h').Clear ;
    ds1.DataSet.FieldByName('�O�앨�R�[�h').Clear ;
    ds1.DataSet.FieldByName('�O��^�R�[�h').Clear ;

end;

procedure TfrmUkeTaihi.BtSakuCls1Click(Sender: TObject);
begin
	if ds1.DataSet.Bof and  ds1.DataSet.Eof then exit ;
	if not (ds1.DataSet.State  in [dsEdit	,dsInsert]) then
    ds1.DataSet.Edit ;
    ds1.DataSet.FieldByName('��ڃR�[�h').Clear ;
    ds1.DataSet.FieldByName('�앨�R�[�h').Clear ;
    ds1.DataSet.FieldByName('��^�R�[�h').Clear ;

end;

procedure TfrmUkeTaihi.dtUketuke2Change(Sender: TObject);
begin
	if ds1.DataSet.Bof and  ds1.DataSet.Eof then exit ;
	if not (ds1.DataSet.State in [dsEdit	,dsInsert]) then
    ds1.DataSet.Edit ;
    ds1.DataSet.FieldByName('�̎�N����').asDateTime := dtUketuke2.Date ;

end;

procedure TfrmUkeTaihi.btnSHojouClick(Sender: TObject);
var
	aBuff :string;
        stmp : String;
begin
	aBuff := DBEdit8.Text;
  if DspSNouka(aBuff) then begin
//    DBEdit2.Text := aBuff ;   ���ꂾ�ƁA�ҏW���[�h�Ɏ����I�ɂȂ�Ȃ�
    if not( ds1.DataSet.State in [dsEdit	,dsInsert] ) then ds1.DataSet.Edit;
    ds1.DataSet.FieldByName('�_�Ɣԍ�').asString :=  aBuff;
  end;

  QNouka.CLose;
  QNouka.SQL.Clear();
  stmp := 'select * from M_NOUKA,M_CITY,M_TIKU'+
  ' where M_NOUKA.�_�Ɣԍ� = "'+aBuff+'"';
  QNouka.SQL.Add( stmp );
  QNouka.Open;





end;

procedure TfrmUkeTaihi.FormShow(Sender: TObject);
var
itmp : Integer;
i : Integer;
stmp : String;
stmp2 : String;
begin

  DBFutan.Items.Clear;
  itmp := SystemIni.ReadInteger('Futansya', 'Count', 0 );
  for i := 1 to itmp do begin
     stmp2 := 'name'+InttoStr(i);
     stmp := SystemIni.ReadString('Futansya',stmp2, '' );
     if stmp <> '' then
       DBFutan.Items.Add( stmp );
  end;


 // TSisyo.Open;
  ADOTable2.Open; //�y��
  ADOTable3.Open; //�y��

  QuerySakumoku.Open;
  QuerySakumotu.Open;
  QuerySakugata.Open;



end;

procedure TfrmUkeTaihi.DateTimePicker1Change(Sender: TObject);
begin
	if ds1.DataSet.Bof and  ds1.DataSet.Eof then exit ;
	if not (ds1.DataSet.State in [dsEdit	,dsInsert]) then
    ds1.DataSet.Edit ;
    ds1.DataSet.FieldByName('�T���v��������').asDateTime := DateTimePicker1.Date ;

end;

procedure TfrmUkeTaihi.DateTimePicker4Change(Sender: TObject);
begin
	if ds1.DataSet.Bof and  ds1.DataSet.Eof then exit ;
	if not (ds1.DataSet.State in [dsEdit	,dsInsert]) then
    ds1.DataSet.Edit ;
    ds1.DataSet.FieldByName('�Z���^�[��t��').asDateTime := DateTimePicker4.Date ;

end;

procedure TfrmUkeTaihi.BtWariClsClick(Sender: TObject);
begin

    if ADOQuery1.State <> dsEdit then
       ADOQuery1.Edit;

    ADOQuery1.FieldByName('����').AsString := '';
    ADOQuery1.FieldByName('�����').AsString := '';
    ADOQuery1.FieldByName('������').AsString := '';
    ADOQuery1.FieldByName('�앨�c��').AsString := '';
    ADOQuery1.FieldByName('���ӂ�').AsString := '';
    ADOQuery1.FieldByName('�؂Ղ�').AsString := '';
    ADOQuery1.FieldByName('�{�ӂ�').AsString := '';
    ADOQuery1.FieldByName('�n�ӂ�').AsString := '';
    ADOQuery1.FieldByName('�ł񕲔�').AsString := '';
    ADOQuery1.fieldByName('�c�y').AsString := '';
    ADOQuery1.FieldByName('���D�͔�').AsString := '';
    ADOQuery1.FieldByName('���̑�').AsString := '';

end;

procedure TfrmUkeTaihi.ADOQuery1AfterCancel(DataSet: TDataSet);
begin
 FNewNO := '';
end;

procedure TfrmUkeTaihi.ADOQuery1AfterInsert(DataSet: TDataSet);
begin
  ds1.DataSet.FieldByName('�ҏW��').asDatetime := now ;  //���M�t���O�̎�O�A�蓮�ōX�V����
	ds1.DataSet.FieldByName('�폜�t���O').asBoolean := False ;

  SetEditEnable( True );  {Version 0.6 #37}

end;

procedure TfrmUkeTaihi.ADOQuery1AfterPost(DataSet: TDataSet);
begin
 FNewNO:='';
end;

procedure TfrmUkeTaihi.ADOQuery1AfterScroll(DataSet: TDataSet);
begin
  if not DataSet.FieldByName('�̎�N����').IsNull then
    dtUketuke2.Date := DataSet.FieldByName('�̎�N����').asDateTime ;

  if not DataSet.FieldByName('�T���v��������').IsNull then
    DateTimePicker1.Date := DataSet.FieldByName('�T���v��������').asDateTime ;

//  if not DataSet.FieldByName('���ʔz�M�\���').IsNull then
//    DateTimePicker2.Date := DataSet.FieldByName('���ʔz�M�\���').asDateTime ;

//  if not DataSet.FieldByName('�{����t��').IsNull then
//    DateTimePicker3.Date := DataSet.FieldByName('�{����t��').asDateTime ;

  if not DataSet.FieldByName('�Z���^�[��t��').IsNull then
    DateTimePicker4.Date := DataSet.FieldByName('�Z���^�[��t��').asDateTime ;

  //���͎���
//  cmbJiki.ItemIndex := StrtoIntDef(DataSet.FieldByName('���͎���').asString,0);

  {Version 0.6 #27 : ��PC�G���g���[�ԍ��͈͓��̂ݕҏW��}
	if not (ds1.DataSet.State  in [dsEdit	,dsInsert]) then
    SetEditEnable(
      IsEditRec(DataSet.FieldByName('�T���v���ԍ�').asString)  and IsEntryYear
    );

end;

procedure TfrmUkeTaihi.ADOQuery1BeforePost(DataSet: TDataSet);
var
nname : String;
sname : String;
itmp : Integer;
flg : boolean;
i : Integer;
stmp : String;
begin
  //���R�[�h�ړ��ɂ�鎩���|�X�g�̎��͕K�{���ڂ������͂̂Ƃ���O���������A
  //���̍��ڂɃt�H�[�J�X���ړ�����̂ŁA�C����B

 //



  {�����l�̐ݒ�}
//  ds1.DataSet.FieldByName('��t�N����').asDateTime := dtUketuke.Date ;
  ds1.DataSet.FieldByName('�̎�N����').asDateTime := dtUketuke2.Date ;

  ds1.DataSet.FieldByName('�T���v��������').asDateTime := DateTimePicker1.Date ;
//  ds1.DataSet.FieldByName('���ʔz�M�\���').asDateTime := DateTimePicker2.Date ;
//  ds1.DataSet.FieldByName('�{����t��').asDateTime := DateTimePicker3.Date ;
  ds1.DataSet.FieldByName('�Z���^�[��t��').asDateTime := DateTimePicker4.Date ;


  //���͎���
//  ds1.DataSet.FieldByName('���͎���').asString := InttoStr(cmbJiki.ItemIndex);
	//�ҏW���̓o�^
  ds1.DataSet.FieldByName('�ҏW��').asDatetime := now ;  //���M�t���O�̎�O�A�蓮�ōX�V����


  //���S�҃��X�g�o�^
  nname := ds1.DataSet.FieldByName('��p���S��').asString;
  if nname <> '' then begin
        //ini�t�@�C���ɓo�^
        itmp := SystemIni.ReadInteger( 'Futansya', 'Count', 0 );

        //ini�Ɋ��ɂ�����̂́A�o�^���Ȃ�
        flg := false;
        for i := 1 to itmp do begin
            stmp := 'name'+InttoStr(i);
            sname := SystemIni.ReadString( 'Futansya', stmp, '' );
            if nname = sname then
               flg := true;
        end;

        if not flg then begin
           INC(itmp);
           stmp := 'name'+InttoStr(itmp);
           SystemIni.WriteInteger( 'Futansya', 'Count', itmp );
           SystemIni.WriteString('Futansya', stmp, nname );
           DBFutan.Items.Add( nname );
        end;
  end;

end;

procedure TfrmUkeTaihi.ADOTable1AfterCancel(DataSet: TDataSet);
begin
  FNewNO := '';     //Post,Cancel������̓N���A {Version 0.6 #38}
end;

procedure TfrmUkeTaihi.ADOTable1AfterInsert(DataSet: TDataSet);
begin
  ds1.DataSet.FieldByName('�ҏW��').asDatetime := now ;  //���M�t���O�̎�O�A�蓮�ōX�V����
	ds1.DataSet.FieldByName('�폜�t���O').asBoolean := False ;

  SetEditEnable( True );  {Version 0.6 #37}

end;

procedure TfrmUkeTaihi.ADOTable1AfterPost(DataSet: TDataSet);
begin
  FNewNO:=''; //Post,Cancel������̓N���A

end;

procedure TfrmUkeTaihi.ADOTable1AfterScroll(DataSet: TDataSet);
begin
//  if not DataSet.FieldByName('��t�N����').IsNull then
//    dtUketuke.Date := DataSet.FieldByName('��t�N����').asDateTime ;

  if not DataSet.FieldByName('�̎�N����').IsNull then
    dtUketuke2.Date := DataSet.FieldByName('�̎�N����').asDateTime ;

  if not DataSet.FieldByName('�T���v��������').IsNull then
    DateTimePicker1.Date := DataSet.FieldByName('�T���v��������').asDateTime ;

//  if not DataSet.FieldByName('���ʔz�M�\���').IsNull then
//    DateTimePicker2.Date := DataSet.FieldByName('���ʔz�M�\���').asDateTime ;

//  if not DataSet.FieldByName('�{����t��').IsNull then
//    DateTimePicker3.Date := DataSet.FieldByName('�{����t��').asDateTime ;

  if not DataSet.FieldByName('�Z���^�[��t��').IsNull then
    DateTimePicker4.Date := DataSet.FieldByName('�Z���^�[��t��').asDateTime ;

  //���͎���
//  cmbJiki.ItemIndex := StrtoIntDef(DataSet.FieldByName('���͎���').asString,0);

  {Version 0.6 #27 : ��PC�G���g���[�ԍ��͈͓��̂ݕҏW��}
	if not (ds1.DataSet.State  in [dsEdit	,dsInsert]) then
    SetEditEnable(
      IsEditRec(DataSet.FieldByName('�T���v���ԍ�').asString)  and IsEntryYear
    );

end;

procedure TfrmUkeTaihi.ADOTable1BeforePost(DataSet: TDataSet);
var
nname : String;
sname : String;
itmp : Integer;
flg : boolean;
i : Integer;
stmp : String;
begin
  //���R�[�h�ړ��ɂ�鎩���|�X�g�̎��͕K�{���ڂ������͂̂Ƃ���O���������A
  //���̍��ڂɃt�H�[�J�X���ړ�����̂ŁA�C����B

 //



  {�����l�̐ݒ�}
//  ds1.DataSet.FieldByName('��t�N����').asDateTime := dtUketuke.Date ;
  ds1.DataSet.FieldByName('�̎�N����').asDateTime := dtUketuke2.Date ;

  ds1.DataSet.FieldByName('�T���v��������').asDateTime := DateTimePicker1.Date ;
//  ds1.DataSet.FieldByName('���ʔz�M�\���').asDateTime := DateTimePicker2.Date ;
//  ds1.DataSet.FieldByName('�{����t��').asDateTime := DateTimePicker3.Date ;
  ds1.DataSet.FieldByName('�Z���^�[��t��').asDateTime := DateTimePicker4.Date ;


  //���͎���
//  ds1.DataSet.FieldByName('���͎���').asString := InttoStr(cmbJiki.ItemIndex);
	//�ҏW���̓o�^
  ds1.DataSet.FieldByName('�ҏW��').asDatetime := now ;  //���M�t���O�̎�O�A�蓮�ōX�V����


  //���S�҃��X�g�o�^
  nname := ds1.DataSet.FieldByName('��p���S��').asString;
  if nname <> '' then begin
        //ini�t�@�C���ɓo�^
        itmp := SystemIni.ReadInteger( 'Futansya', 'Count', 0 );

        //ini�Ɋ��ɂ�����̂́A�o�^���Ȃ�
        flg := false;
        for i := 1 to itmp do begin
            stmp := 'name'+InttoStr(i);
            sname := SystemIni.ReadString( 'Futansya', stmp, '' );
            if nname = sname then
               flg := true;
        end;

        if not flg then begin
           INC(itmp);
           stmp := 'name'+InttoStr(itmp);
           SystemIni.WriteInteger( 'Futansya', 'Count', itmp );
           SystemIni.WriteString('Futansya', stmp, nname );
           DBFutan.Items.Add( nname );
        end;
  end;

end;

procedure TfrmUkeTaihi.BtKingakuClick(Sender: TObject);
var
stmp : String;
skubun : String;
skoumoku : String;
itmp : Integer;
begin
  //���z�Z�b�g
  skubun := QNouka.FieldByName('�敪').asString;
  if skubun <> '' then begin

     skoumoku := '�͔�';

     QKingaku.Close;
     stmp := 'select ���,'+skoumoku+' ���z from M_KINGAKU where ��� = "'+skubun+'"';
     QKingaku.SQL.Clear;
     QKingaku.SQL.Add(stmp);
     QKingaku.Open;

     if QKingaku.RecordCount > 0 then begin

       itmp := QKingaku.FieldByName('���z').asInteger;

       ds1.DataSet.FieldByName('���z').asInteger := itmp;
     end;

     QKingaku.close;

  end;

end;

end.
