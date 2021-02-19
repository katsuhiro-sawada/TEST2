unit M_KIJUN2U;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  mstKIJUNU, Db, DBTables, StdCtrls, Buttons, ExtCtrls, ComCtrls, Mask, Variants,
  DBCtrls, ADODB;

type
  TmstKijun2Form = class(TmstKijunForm)
    Label1: TLabel;
    Label77: TLabel;
    Button1: TButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    DBCheckBox1: TDBCheckBox;
    ADOQuery1: TADOQuery;
    BitBtn1: TBitBtn;
    ADOQCopy: TADOQuery;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure cmbDosituChange(Sender: TObject);
    procedure Table1BeforePost(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private �錾 }
    SakumotuCDList : TStringList ;
  public
    { Public �錾 }
    SakumokuCD : string ;
  end;

var
  mstKijun2Form: TmstKijun2Form;

implementation

uses DMU,USelectSaku;

{$R *.DFM}

procedure TmstKijun2Form.FormCreate(Sender: TObject);
begin
//	if not IsEntryYear then begin		//����\�N�x�Ŗ�����ΕҏW�s��
//    Button1.Enabled := false ;
//    DBCheckBox1.Enabled := false ;
//  end;
  inherited;
  SakumotuCDList := TStringList.Create ;

end;

procedure TmstKijun2Form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  inherited;
//  SyncUpdate;  //�}�X�^�X�V���L�^
//  SakumotuCDList.Free ;

end;


procedure TmstKijun2Form.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin

	if ds1.DataSet.State in [dsEdit	,dsInsert] then
			ds1.DataSet.Post;

end;

procedure TmstKijun2Form.FormShow(Sender: TObject);
begin
  //��ڃR�[�h����e�[�u�����w�肷��
  if SakumokuCD = BokusouCode then begin
    ADOTable1.TableName := 'm_bokugata' ;
//    lblDositu.Visible := true ;
//    cmbDositu.Visible := true ;
    //�y���R�[�h����R���{�{�b�N�X���X�g�����킹��
///////���n    cmbDositu.ItemIndex := strtoint(FDOSEICD)-1;
  end else begin
    ADOTable1.TableName := 'm_sakugata' ;
  end;
 	ADOTable1.Open;

  inherited;
	ComboBox1.Items.Clear ;
  SakumotuCDList.Clear ;
	with ADOQuery1 do begin
		SQL.Text := 'select * from M_SAKUMOTU where ��ڃR�[�h=:��ڃR�[�h';
//  ParamByName('��ڃR�[�h').asString := SakumokuCD ;
  	Parameters.ParamByName('��ڃR�[�h').Value := SakumokuCD ;
    Open;
	  while not Eof do begin
  	  ComboBox1.Items.Add(FieldByname('�앨��').asString );
      SakumotuCDList.Add( FieldByname('�앨�R�[�h').asString );
  		Next;
  	end;
    Close;
  end;
  if ComboBox1.Items.Count > 0 then begin
  	ComboBox1.ItemIndex := 0 ;
    ComboBox1Change(self);
  end;

end;
//�앨�̎w��
procedure TmstKijun2Form.ComboBox1Change(Sender: TObject);
begin
	if ds1.DataSet.State in [dsEdit	,dsInsert] then
		if CheckBeforePost then ds1.DataSet.Post
    else exit ;
  //��^���X�g�̍쐬
	ComboBox2.Items.Clear ;
	with ADOQuery1 do begin
    //��^���̎擾�Ȃ̂ŁA�e�[�u���̐؂�ւ��͂��Ȃ��Ă��� -> �f�[�^�O���쐬�̎��֘A�������Ƃ��L��̂Ńe�[�u���ʕύX����
    //Ver 0.42
		if SakumokuCD = BokusouCode then  //�q���̏ꍇ�Q�ƃe�[�u�����Ⴄ
		  SQL.Text := 'select distinct ��^�� from m_bokugata where ��ڃR�[�h=:��ڃR�[�h and �앨�R�[�h=:�앨�R�[�h'
//		  SQL.Text := 'select * from m_bokugata where ��ڃR�[�h=:��ڃR�[�h and �앨�R�[�h=:�앨�R�[�h'
    else
		  SQL.Text := 'select * from m_sakugata where ��ڃR�[�h=:��ڃR�[�h and �앨�R�[�h=:�앨�R�[�h';
//	 	ParamByName('��ڃR�[�h').asString := SakumokuCD ;
//  	ParamByName('�앨�R�[�h').asString := SakumotuCDList[ComboBox1.ItemIndex] ;
	 	  Parameters.ParamByName('��ڃR�[�h').Value := SakumokuCD ;
  	  Parameters.ParamByName('�앨�R�[�h').Value := SakumotuCDList[ComboBox1.ItemIndex] ;
    Open;
	  while not Eof do begin
  	  ComboBox2.Items.Add(FieldByname('��^��').asString );
  		Next;
  	end;
    Close;
  end;
  if ComboBox2.Items.Count > 0 then begin
  	ComboBox2.ItemIndex := 0 ;
    ComboBox2Change(self);
  end;
end;

procedure TmstKijun2Form.ComboBox2Change(Sender: TObject);
var res : boolean;
begin
end;

procedure TmstKijun2Form.cmbDosituChange(Sender: TObject);
begin
  ComboBox2Change(self);
  inherited;
end;

const NUMOFFIELDS = 197;
const FieldN : array[1..NUMOFFIELDS] of string = (
	'pHA���','pHA����','pHA�ڕW','pHA�O���t���','pHA�O���t����',
	'ECA���','ECA����','ECA�ڕW','ECA�O���t���','ECA�O���t����',
  '�����_A���','�����_A����','�����_A�ڕW','�����_A�O���t���','�����_A�O���t����',
  '�ΊDA���','�ΊDA����','�ΊDA�ڕW','�ΊDA�O���t���','�ΊDA�O���t����',
  '��yA���','��yA����','��yA�ڕW','��yA�O���t���','��yA�O���t����',
  '����A���','����A����','����A�ڕW','����A�O���t���','����A�O���t����',

	'pHB���','pHB����','pHB�ڕW','pHB�O���t���','pHB�O���t����',
	'ECB���','ECB����','ECB�ڕW','ECB�O���t���','ECB�O���t����',
  '�����_B���','�����_B����','�����_B�ڕW','�����_B�O���t���','�����_B�O���t����',
  '�ΊDB���','�ΊDB����','�ΊDB�ڕW','�ΊDB�O���t���','�ΊDB�O���t����',
  '��yB���','��yB����','��yB�ڕW','��yB�O���t���','��yB�O���t����',
  '����B���','����B����','����B�ڕW','����B�O���t���','����B�O���t����',

	'pHC���','pHC����','pHC�ڕW','pHC�O���t���','pHC�O���t����',
	'ECC���','ECC����','ECC�ڕW','ECC�O���t���','ECC�O���t����',
  '�����_C���','�����_C����','�����_C�ڕW','�����_C�O���t���','�����_C�O���t����',
  '�ΊDC���','�ΊDC����','�ΊDC�ڕW','�ΊDC�O���t���','�ΊDC�O���t����',
  '��yC���','��yC����','��yC�ڕW','��yC�O���t���','��yC�O���t����',
  '����C���','����C����','����C�ڕW','����C�O���t���','����C�O���t����',
  {91}
  '�ΊD��yA���','�ΊD��yA����','�ΊD��yA�ڕW','�ΊD��yA�O���t���','�ΊD��yA�O���t����',
  '��y����A���','��y����A����','��y����A�ڕW','��y����A�O���t���','��y����A�O���t����',
  '�ΊD�O�aA���','�ΊD�O�aA����','�ΊD�O�aA�ڕW','�ΊD�O�aA�O���t���','�ΊD�O�aA�O���t����',
  '�����O�aA���','�����O�aA����','�����O�aA�ڕW','�����O�aA�O���t���','�����O�aA�O���t����',
  '����O�aA���','����O�aA����','����O�aA�ڕW','����O�aA�O���t���','����O�aA�O���t����',
  '�����_��yA���','�����_��yA����','�����_��yA�ڕW',{'�����_��yA�O���t���','�����_��yA�O���t����',}

  '�ΊD��yB���','�ΊD��yB����','�ΊD��yB�ڕW','�ΊD��yB�O���t���','�ΊD��yB�O���t����',
  '��y����B���','��y����B����','��y����B�ڕW','��y����B�O���t���','��y����B�O���t����',
  '�ΊD�O�aB���','�ΊD�O�aB����','�ΊD�O�aB�ڕW','�ΊD�O�aB�O���t���','�ΊD�O�aB�O���t����',
  '�����O�aB���','�����O�aB����','�����O�aB�ڕW','�����O�aB�O���t���','�����O�aB�O���t����',
  '����O�aB���','����O�aB����','����O�aB�ڕW','����O�aB�O���t���','����O�aB�O���t����',
  '�����_��yB���','�����_��yB����','�����_��yB�ڕW',{'�����_��yB�O���t���','�����_��yB�O���t����',}

  '�ΊD��yC���','�ΊD��yC����','�ΊD��yC�ڕW','�ΊD��yC�O���t���','�ΊD��yC�O���t����',
  '��y����C���','��y����C����','��y����C�ڕW','��y����C�O���t���','��y����C�O���t����',
  '�ΊD�O�aC���','�ΊD�O�aC����','�ΊD�O�aC�ڕW','�ΊD�O�aC�O���t���','�ΊD�O�aC�O���t����',
  '�����O�aC���','�����O�aC����','�����O�aC�ڕW','�����O�aC�O���t���','�����O�aC�O���t����',
  '����O�aC���','����O�aC����','����O�aC�ڕW','����O�aC�O���t���','����O�aC�O���t����',
  '�����_��yC���','�����_��yC����','�����_��yC�ڕW',{'�����_��yC�O���t���','�����_��yC�O���t����',}

  '�P�C�_���','�P�C�_����','�P�C�_�ڕW',
  '�S���','�S����','�S�ڕW',
  '�z�E�f���','�z�E�f����','�z�E�f�ڕW',
  '�������','��������','�����ڕW',
  '�}���K�����','�}���K������','�}���K���ڕW',
  '�����','������','���ڕW',
  '�j�b�P�����','�j�b�P������','�j�b�P���ڕW',
  '�P�C�_�O���t���','�P�C�_�O���t����'
);

procedure TmstKijun2Form.BitBtn2Click(Sender: TObject);
var
cnt,cnt2 : integer;
stmp : String;
begin

     if not ds1.DataSet.Active then  exit;

     stmp := 'CEC:0�`10�@���@CEC:10�`20�ACEC:20�` �ɃR�s�[���܂��B��낵���ł����H';
     if Application.MessageBox(Pchar(stmp),'��l�R�s�[',MB_YESNO) <> ID_YES then
       exit ;

      //A �� B
      cnt2 := 0;
    	for cnt := 31 to 60 do begin //��x��Post����ƃG���[�ɂȂ�B�������I�[�o��
        ds1.DataSet.Edit ;
        cnt2 := cnt2 + 1;
    		ds1.DataSet.FieldByName( FieldN[cnt] ).asFloat := ds1.DataSet.FieldByName( FieldN[cnt2] ).asFloat ;
        ds1.DataSet.Post ;
      end;

      //A �� C
      cnt2 := 0;
    	for cnt := 61 to 90 do begin //��x��Post����ƃG���[�ɂȂ�B�������I�[�o��
        ds1.DataSet.Edit ;
        cnt2 := cnt2 + 1;
    		ds1.DataSet.FieldByName( FieldN[cnt] ).asFloat := ds1.DataSet.FieldByName( FieldN[cnt2] ).asFloat ;
        ds1.DataSet.Post ;
      end;


      //A �� B
      cnt2 := 90; //�`118
    	for cnt := 119 to 146 do begin //��x��Post����ƃG���[�ɂȂ�B�������I�[�o��
        ds1.DataSet.Edit ;
        cnt2 := cnt2 + 1;
    		ds1.DataSet.FieldByName( FieldN[cnt] ).asFloat := ds1.DataSet.FieldByName( FieldN[cnt2] ).asFloat ;
        ds1.DataSet.Post ;
      end;


      //A �� C
      cnt2 := 90;
    	for cnt := 147 to 174 do begin //��x��Post����ƃG���[�ɂȂ�B�������I�[�o��
        ds1.DataSet.Edit ;
        cnt2 := cnt2 + 1;
    		ds1.DataSet.FieldByName( FieldN[cnt] ).asFloat := ds1.DataSet.FieldByName( FieldN[cnt2] ).asFloat ;
        ds1.DataSet.Post ;
      end;




end;

procedure TmstKijun2Form.Table1BeforePost(DataSet: TDataSet);
begin
  inherited;
  //�y���R�[�h�̃Z�b�g
	if SakumokuCD = BokusouCode then begin //�q���̏ꍇ�Q�ƃe�[�u�����Ⴄ
    DataSet.FieldByName('�y���R�[�h').asString := FDOSEICD;
  end;
end;

end.
