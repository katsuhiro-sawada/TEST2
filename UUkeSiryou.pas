unit UUkeSiryou;
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
  TfrmUkeSiryou = class(TForm)
    StatusBar1: TStatusBar;
    Table1aaa: TTable;
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
    QNoukaorg: TQuery;
    ds2: TDataSource;
    Label13: TLabel;
    txtSampleNo: TDBEdit;
    btnSNo: TButton;
    DBNavigator1: TDBNavigator;
    gb2: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label6: TLabel;
    Label11: TLabel;
    btnSHojou: TBitBtn;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    dtUketuke2: TDateTimePicker;
    DBEdit1: TDBEdit;
    GroupBox2: TGroupBox;
    Label37: TLabel;
    Label40: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker4: TDateTimePicker;
    Panel1: TPanel;
    Label1: TLabel;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    Panel4: TPanel;
    DateTimePicker5: TDateTimePicker;
    Label14: TLabel;
    DateTimePicker6: TDateTimePicker;
    Label15: TLabel;
    DateTimePicker7: TDateTimePicker;
    Label16: TLabel;
    DateTimePicker8: TDateTimePicker;
    Label17: TLabel;
    Label18: TLabel;
    Label5: TLabel;
    Panel6: TPanel;
    Label19: TLabel;
    DBSName: TDBComboBox;
    DBSName2: TDBComboBox;
    Label20: TLabel;
    DBEdit9: TDBEdit;
    Label21: TLabel;
    Panel7: TPanel;
    Label22: TLabel;
    DBSt02: TDBComboBox;
    DBSt01: TDBComboBox;
    Label23: TLabel;
    DBEdit10: TDBEdit;
    Label43: TLabel;
    DBEdit21: TDBEdit;
    Label24: TLabel;
    DBEdit11: TDBEdit;
    BtKingaku: TButton;
    QKingakuorg: TQuery;
    Label54: TLabel;
    DBFutan: TDBComboBox;
    ADOTable1: TADOTable;
    QNouka: TADOQuery;
    QKingaku: TADOQuery;
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
    procedure Table1aaaAfterInsert(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure btnSNoClick(Sender: TObject);
    procedure Table1aaaAfterScroll(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cmbJikiChange(Sender: TObject);
    procedure dtUketukeChange(Sender: TObject);
    procedure Table1aaaAfterCancel(DataSet: TDataSet);
    procedure ds1DataChange(Sender: TObject; Field: TField);
    procedure EnterKeyPress(Sender: TObject; var Key: Char);
    procedure Table1aaaBeforePost(DataSet: TDataSet);
    procedure BtnClrClick(Sender: TObject);
    procedure txtSampleNoExit(Sender: TObject);
    procedure Table1aaaAfterPost(DataSet: TDataSet);
    procedure BtSakuCls0Click(Sender: TObject);
    procedure BtSakuCls1Click(Sender: TObject);
    procedure dtUketuke2Change(Sender: TObject);
    procedure btnSHojouClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure DateTimePicker4Change(Sender: TObject);
    procedure DateTimePicker5Change(Sender: TObject);
    procedure DateTimePicker7Change(Sender: TObject);
    procedure DateTimePicker6Change(Sender: TObject);
    procedure DateTimePicker8Change(Sender: TObject);
    procedure DBSt01Change(Sender: TObject);
    procedure DBSNameChange(Sender: TObject);
    procedure BtKingakuClick(Sender: TObject);
    procedure ADOTable1AfterCancel(DataSet: TDataSet);
    procedure ADOTable1AfterInsert(DataSet: TDataSet);
    procedure ADOTable1AfterPost(DataSet: TDataSet);
    procedure ADOTable1AfterScroll(DataSet: TDataSet);
    procedure ADOTable1BeforePost(DataSet: TDataSet);
  private
    { Private �錾 }
    FNewNO : string ;
    procedure SetEditEnable(aFlag: Boolean);
  public
    procedure LocateNo(pSmplNo: string);
    { Public �錾 }
  end;

var
  frmUkeSiryou: TfrmUkeSiryou;

implementation

uses DMU,SUketukeU, MHojouU,SNoukaU;

{$R *.DFM}

procedure TfrmUkeSiryou.FormCreate(Sender: TObject);
var
stmp : String;
begin
	Color := BackColor ;
  FNewNO := '';
	ADOTable1.Open;
  QNouka.CLose;
  QNouka.SQL.Clear();
  stmp := 'select * from M_NOUKA order by �_�Ɣԍ�';
//  stmp := 'select * from M_NOUKA,M_CITY,M_TIKU'+
//  ' where M_NOUKA.�_�Ɣԍ� = "'+DBEdit8.Text+'"';
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
procedure TfrmUkeSiryou.SetEditEnable(aFlag:Boolean);
begin
    btnEdit.Enabled := aFlag ;
    btnDel.Enabled := aFlag ;
  	ds1.AutoEdit := aFlag ;
//    gb1.Enabled := aFlag ;
    gb2.Enabled := aFlag ;
//		gb3.Enabled := aFlag ;
//		gb4.Enabled := aFlag ;
end;
procedure TfrmUkeSiryou.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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

procedure TfrmUkeSiryou.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ADOTable1.Close;
end;

{�w��T���v���ԍ��Ɉړ�}
procedure TfrmUkeSiryou.LocateNo( pSmplNo : string );
begin
  //�ҏW���łȂ���΃T���v���ԍ��Ɉړ�
	if ds1.DataSet.State in [dsEdit	,dsInsert] then exit;
  ADOTable1.locate('�T���v���ԍ�',pSmplNo,[]);
end;
{�V�K�{�^��}
procedure TfrmUkeSiryou.btnNewClick(Sender: TObject);
var
  bNewRec : Boolean ;
begin

//ScaleBy(1,10);
    //�ő�T���v���ԍ����蓖��
    FNewNO := GetMaxSampleNo(bNewRec,'3') ;   {Version 0.6 #38}
    if FNewNO = '' then exit ;   {Version 0.6 #36}
    {Version 0.6 #46 : �폜���R�[�h���g��}
    if not bNewRec then begin
      {���ۂɃ��R�[�h���폜����B�łȂ��ƕύX�ʁi��ʃ����N���ځAFiltere�����j���傫��}
      with DataModule1.QueryWrite do begin
        SQL.Text := 'delete from T_UKETUKE3 where �T���v���ԍ�='''+FNewNO+'''';
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
procedure TfrmUkeSiryou.btnCloseClick(Sender: TObject);
begin
//	if ds1.DataSet.State in [dsEdit	,dsInsert] then
//		ds1.DataSet.Cancel;
	Close;
end;
{�L�����Z���{�^��}
procedure TfrmUkeSiryou.btnCancelClick(Sender: TObject);
begin
	ds1.DataSet.Cancel;
end;
{�o�^�{�^��}
procedure TfrmUkeSiryou.btnPostClick(Sender: TObject);
var
stmp : String;
begin
  {���̓`�F�b�N}
  if not ChkEditLength(txtSampleNo,4) then exit;
//  if not ChkEditLength(txtHojouNo,7) then exit;


  stmp := DBSName.Text; //ds1.DataSet.FieldByName('������').asString;
  if stmp = '' then begin
     showMessage('����������͂��Ă��������B');
     exit;
  end;

  stmp := DBSName2.Text; //ds1.DataSet.FieldByName('�������').asString;
  if stmp = '' then begin
     showMessage('������ނ���͂��Ă��������B');
     exit;
  end;



	ds1.DataSet.Post;
end;
//�V�K�̏ꍇ��t���Z�b�g
procedure TfrmUkeSiryou.Table1aaaAfterInsert(DataSet: TDataSet);
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
procedure TfrmUkeSiryou.Table1aaaBeforePost(DataSet: TDataSet);
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



  {�����l�̐ݒ�}
//  ds1.DataSet.FieldByName('��t�N����').asDateTime := dtUketuke.Date ;
  ds1.DataSet.FieldByName('�̎�N����').asDateTime := dtUketuke2.Date ;
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
procedure TfrmUkeSiryou.Table1aaaAfterPost(DataSet: TDataSet);
begin
  //�����A�V�K�쐬�Ȃ�A�f�f�e�[�u�����쐬����B {Version 0.6 #38}

//  if FNewNO <> '' then
//    InsertSindanTable(DataSet.FieldByName('�T���v���ԍ�').asString);  //��FNewNO�ɂ��Ȃ�����

  FNewNO:=''; //Post,Cancel������̓N���A
end;

{�폜�{�^��}
procedure TfrmUkeSiryou.btnDelClick(Sender: TObject);
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
procedure TfrmUkeSiryou.btnEditClick(Sender: TObject);
begin
	if ds1.DataSet.Bof and  ds1.DataSet.Eof then exit ;
	ds1.DataSet.Edit;
end;
{�X�e�[�^�X�ύX�C�x���g�ő���{�^���̐���}
procedure TfrmUkeSiryou.ds1StateChange(Sender: TObject);
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

    DBNavigator1.Enabled := false;

//    BtTitenIn.Enabled := True;
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
procedure TfrmUkeSiryou.btnSNoClick(Sender: TObject);
var
	SNO : string ;
begin
  SNO := DspUkeList(txtSampleNo.Text, '3');
  if SNO <> '' then begin
  	ADOTable1.Locate('�T���v���ԍ�',SNO,[]);
  end;
end;
//���R�[�h�̈ړ��łc�a�����N�łȂ����ڂ��Z�b�g
procedure TfrmUkeSiryou.Table1aaaAfterScroll(DataSet: TDataSet);
var
stmp : String;
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

  if not DataSet.FieldByName('���n�J�n�N����').IsNull then
    DateTimePicker5.Date := DataSet.FieldByName('���n�J�n�N����').asDateTime ;

  if not DataSet.FieldByName('���n�I���N����').IsNull then
    DateTimePicker7.Date := DataSet.FieldByName('���n�I���N����').asDateTime ;

  if not DataSet.FieldByName('�l���J�n�N����').IsNull then
    DateTimePicker6.Date := DataSet.FieldByName('�l���J�n�N����').asDateTime ;

  if not DataSet.FieldByName('�l���I���N����').IsNull then
    DateTimePicker8.Date := DataSet.FieldByName('�l���I���N����').asDateTime ;


  //�X�e�[�W
  DBSt01.OnChange(nil);
  DBSt02.ItemIndex := DBSt02.Items.IndexOf( DataSet.FieldByName('����X�e�[�W').AsString);

   //
   DBSName.OnChange(Nil);
  DBSName2.ItemIndex := DBSName2.Items.IndexOf( DataSet.FieldByName('�������').AsString);


  //���͎���
//  cmbJiki.ItemIndex := StrtoIntDef(DataSet.FieldByName('���͎���').asString,0);

  {Version 0.6 #27 : ��PC�G���g���[�ԍ��͈͓��̂ݕҏW��}
	if not (ds1.DataSet.State  in [dsEdit	,dsInsert]) then
    SetEditEnable(
      IsEditRec(DataSet.FieldByName('�T���v���ԍ�').asString)  and IsEntryYear
    );
end;

//DB�񃊃��N���ڕҏW�����΁A�����G�f�B�b�g����B
procedure TfrmUkeSiryou.cmbJikiChange(Sender: TObject);
begin
	if ds1.DataSet.Bof and  ds1.DataSet.Eof then exit ;
	if not (ds1.DataSet.State  in [dsEdit	,dsInsert]) then
    ds1.DataSet.Edit ;
//  ds1.DataSet.FieldByName('���͎���').asString := InttoStr(cmbJiki.ItemIndex);

end;
//DB�񃊃��N���ڕҏW�����΁A�����G�f�B�b�g����B
procedure TfrmUkeSiryou.dtUketukeChange(Sender: TObject);
begin
end;

//�L�����Z��������񃊃��N���ڂ�߂�
procedure TfrmUkeSiryou.Table1aaaAfterCancel(DataSet: TDataSet);
begin
  FNewNO := '';     //Post,Cancel������̓N���A {Version 0.6 #38}
//   Table1AfterScroll(DataSet);
//2003/5/6 ��x�Ă΂�邽�߃R�����g
end;
{�f�[�^�ҏW�C�x���g}
procedure TfrmUkeSiryou.ds1DataChange(Sender: TObject; Field: TField);
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
procedure TfrmUkeSiryou.EnterKeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 then  //Enter�L�[�������ꂽ��
  begin
    Key:=#0; //�L�[���͂𖳌��ɂ�
    Keybd_event(VK_TAB,0,0,0) //Tab�L�[�𔭐�������B
  end;
end;

procedure TfrmUkeSiryou.BtnClrClick(Sender: TObject);
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


procedure TfrmUkeSiryou.txtSampleNoExit(Sender: TObject);
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
        SQL.Text := 'select * from T_UKETUKE3 where �T���v���ԍ�='''+txtSampleNo.Text+'''';
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


procedure TfrmUkeSiryou.BtSakuCls0Click(Sender: TObject);

begin
//  aBuff := InttoStr( (Sender as TButton).Tag ) ;
	if ds1.DataSet.Bof and  ds1.DataSet.Eof then exit ;
	if not (ds1.DataSet.State  in [dsEdit	,dsInsert]) then
    ds1.DataSet.Edit ;
    ds1.DataSet.FieldByName('�O��ڃR�[�h').Clear ;
    ds1.DataSet.FieldByName('�O�앨�R�[�h').Clear ;
    ds1.DataSet.FieldByName('�O��^�R�[�h').Clear ;

end;

procedure TfrmUkeSiryou.BtSakuCls1Click(Sender: TObject);
begin
	if ds1.DataSet.Bof and  ds1.DataSet.Eof then exit ;
	if not (ds1.DataSet.State  in [dsEdit	,dsInsert]) then
    ds1.DataSet.Edit ;
    ds1.DataSet.FieldByName('��ڃR�[�h').Clear ;
    ds1.DataSet.FieldByName('�앨�R�[�h').Clear ;
    ds1.DataSet.FieldByName('��^�R�[�h').Clear ;

end;

procedure TfrmUkeSiryou.dtUketuke2Change(Sender: TObject);
begin
	if ds1.DataSet.Bof and  ds1.DataSet.Eof then exit ;
	if not (ds1.DataSet.State in [dsEdit	,dsInsert]) then
    ds1.DataSet.Edit ;
    ds1.DataSet.FieldByName('�̎�N����').asDateTime := dtUketuke2.Date ;

end;

procedure TfrmUkeSiryou.btnSHojouClick(Sender: TObject);
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

procedure TfrmUkeSiryou.FormShow(Sender: TObject);
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


end;

procedure TfrmUkeSiryou.DateTimePicker1Change(Sender: TObject);
begin
	if ds1.DataSet.Bof and  ds1.DataSet.Eof then exit ;
	if not (ds1.DataSet.State in [dsEdit	,dsInsert]) then
    ds1.DataSet.Edit ;
    ds1.DataSet.FieldByName('�T���v��������').asDateTime := DateTimePicker1.Date ;

end;

procedure TfrmUkeSiryou.DateTimePicker4Change(Sender: TObject);
begin
	if ds1.DataSet.Bof and  ds1.DataSet.Eof then exit ;
	if not (ds1.DataSet.State in [dsEdit	,dsInsert]) then
    ds1.DataSet.Edit ;
    ds1.DataSet.FieldByName('�Z���^�[��t��').asDateTime := DateTimePicker4.Date ;

end;

procedure TfrmUkeSiryou.DateTimePicker5Change(Sender: TObject);
begin
	if ds1.DataSet.Bof and  ds1.DataSet.Eof then exit ;
	if not (ds1.DataSet.State in [dsEdit	,dsInsert]) then
    ds1.DataSet.Edit ;
    ds1.DataSet.FieldByName('���n�J�n�N����').asDateTime := DateTimePicker5.Date ;

end;

procedure TfrmUkeSiryou.DateTimePicker7Change(Sender: TObject);
begin
	if ds1.DataSet.Bof and  ds1.DataSet.Eof then exit ;
	if not (ds1.DataSet.State in [dsEdit	,dsInsert]) then
    ds1.DataSet.Edit ;
    ds1.DataSet.FieldByName('���n�I���N����').asDateTime := DateTimePicker7.Date ;

end;

procedure TfrmUkeSiryou.DateTimePicker6Change(Sender: TObject);
begin
	if ds1.DataSet.Bof and  ds1.DataSet.Eof then exit ;
	if not (ds1.DataSet.State in [dsEdit	,dsInsert]) then
    ds1.DataSet.Edit ;
    ds1.DataSet.FieldByName('�l���J�n�N����').asDateTime := DateTimePicker6.Date ;

end;

procedure TfrmUkeSiryou.DateTimePicker8Change(Sender: TObject);
begin
	if ds1.DataSet.Bof and  ds1.DataSet.Eof then exit ;
	if not (ds1.DataSet.State in [dsEdit	,dsInsert]) then
    ds1.DataSet.Edit ;
    ds1.DataSet.FieldByName('�l���I���N����').asDateTime := DateTimePicker8.Date ;

end;

procedure TfrmUkeSiryou.DBSt01Change(Sender: TObject);
begin
   DBSt02.Items.Clear;

   if DBSt01.Text = '�C�l��' then begin
      DBSt02.Items.Add('�o��n');
      DBSt02.Items.Add('�o���');
      DBSt02.Items.Add('�䑵��');
      DBSt02.Items.Add('�J�Ԋ�');
      DBSt02.Items.Add('���n��');

   end
   else if DBSt01.Text = '�}����' then begin
      DBSt02.Items.Add('�J�ԑO');
      DBSt02.Items.Add('�J�Ԋ�');
      DBSt02.Items.Add('���n��');

   end
   else if DBSt01.Text = '�g�E�����R�V' then begin
      DBSt02.Items.Add('�����n��');
      DBSt02.Items.Add('���n��');
      DBSt02.Items.Add('�Џn��');
      DBSt02.Items.Add('���n��');
      DBSt02.Items.Add('���n��');

   end;

end;

procedure TfrmUkeSiryou.DBSNameChange(Sender: TObject);
begin

     DBSName2.Items.Clear;
     if DBSName.Text = '�g�E�����R�V' then begin
         DBSName2.Items.Add('�T�C���[�W');
         DBSName2.Items.Add('���n��');

     end
     else begin
         DBSName2.Items.Add('����');
         DBSName2.Items.Add('�T�C���[�W');
         DBSName2.Items.Add('����');

     end;
end;

procedure TfrmUkeSiryou.ADOTable1AfterCancel(DataSet: TDataSet);
begin
  FNewNO := '';     //Post,Cancel������̓N���A {Version 0.6 #38}

end;

procedure TfrmUkeSiryou.ADOTable1AfterInsert(DataSet: TDataSet);
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

procedure TfrmUkeSiryou.ADOTable1AfterPost(DataSet: TDataSet);
begin
  FNewNO:=''; //Post,Cancel������̓N���A

end;

procedure TfrmUkeSiryou.ADOTable1AfterScroll(DataSet: TDataSet);
var
stmp : String;
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

  if not DataSet.FieldByName('���n�J�n�N����').IsNull then
    DateTimePicker5.Date := DataSet.FieldByName('���n�J�n�N����').asDateTime ;

  if not DataSet.FieldByName('���n�I���N����').IsNull then
    DateTimePicker7.Date := DataSet.FieldByName('���n�I���N����').asDateTime ;

  if not DataSet.FieldByName('�l���J�n�N����').IsNull then
    DateTimePicker6.Date := DataSet.FieldByName('�l���J�n�N����').asDateTime ;

  if not DataSet.FieldByName('�l���I���N����').IsNull then
    DateTimePicker8.Date := DataSet.FieldByName('�l���I���N����').asDateTime ;


  //�X�e�[�W
  DBSt01.OnChange(nil);
  DBSt02.ItemIndex := DBSt02.Items.IndexOf( DataSet.FieldByName('����X�e�[�W').AsString);

   //
   DBSName.OnChange(Nil);
  DBSName2.ItemIndex := DBSName2.Items.IndexOf( DataSet.FieldByName('�������').AsString);


  //���͎���
//  cmbJiki.ItemIndex := StrtoIntDef(DataSet.FieldByName('���͎���').asString,0);

  {Version 0.6 #27 : ��PC�G���g���[�ԍ��͈͓��̂ݕҏW��}
	if not (ds1.DataSet.State  in [dsEdit	,dsInsert]) then
    SetEditEnable(
      IsEditRec(DataSet.FieldByName('�T���v���ԍ�').asString)  and IsEntryYear
    );

end;

procedure TfrmUkeSiryou.ADOTable1BeforePost(DataSet: TDataSet);
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



  {�����l�̐ݒ�}
//  ds1.DataSet.FieldByName('��t�N����').asDateTime := dtUketuke.Date ;
  ds1.DataSet.FieldByName('�̎�N����').asDateTime := dtUketuke2.Date ;
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

procedure TfrmUkeSiryou.BtKingakuClick(Sender: TObject);
var
stmp : String;
skubun : String;
skoumoku : String;
itmp : Integer;
begin
  //���z�Z�b�g
  skubun := QNouka.FieldByName('�敪').asString;
  if skubun <> '' then begin

     skoumoku := '�e����';

     QKingaku.Close;
     stmp := 'select ���,'+skoumoku+' as ���z from M_KINGAKU where ��� = "'+skubun+'"';
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
