unit USelectSaku;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls,ADODB, DB;

type
  TFSelectSaku = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Label77: TLabel;
    ComboBox2: TComboBox;
    ADOQuery1: TADOQuery;
    ADOTable1: TADOTable;
    lblDositu: TLabel;
    cmbDositu: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    SakumotuCDList : TStringList ;
  public
     SakumokuCD : String;
     SakuCD1 : String;
     SakuCD2 : String;
     SakuName1 : String;
     SakuName2 : String;
    { Public declarations }
  end;

var
  FSelectSaku: TFSelectSaku;

implementation

uses DMU;

{$R *.dfm}

procedure TFSelectSaku.BitBtn1Click(Sender: TObject);
begin
    SakuName1 := ComboBox1.Text;
    SakuName2 := ComboBox2.Text;

    if SakuName1 = '' then begin
      ShowMessage('�앨��I�����ĉ������B');
      exit;
    end;
    if SakuName2 = '' then begin
      ShowMessage('��^��I�����ĉ������B');
      exit;
    end;

    SakuCD1 := ADOTable1.FieldByName('��ڃR�[�h').asString;
    SakuCD2 := ADOTable1.FieldByName('�앨�R�[�h').asString;

    close;

end;

procedure TFSelectSaku.BitBtn2Click(Sender: TObject);
begin

SakuCD1 := '';
SakuCD2 := '';
SakuName1 := '';
SakuName2 := '';

close;

end;

procedure TFSelectSaku.ComboBox1Change(Sender: TObject);
begin
  //��^���X�g�̍쐬
	ComboBox2.Items.Clear ;
	with ADOQuery1 do begin
    //��^���̎擾�Ȃ̂ŁA�e�[�u���̐؂�ւ��͂��Ȃ��Ă��� -> �f�[�^�O���쐬�̎��֘A�������Ƃ��L��̂Ńe�[�u���ʕύX����
    //Ver 0.42
		if SakumokuCD = BokusouCode then  //�q���̏ꍇ�Q�ƃe�[�u�����Ⴄ
		  SQL.Text := 'select distinct ��^�� from m_bokugata where ��ڃR�[�h=:��ڃR�[�h and �앨�R�[�h=:�앨�R�[�h'
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

procedure TFSelectSaku.ComboBox2Change(Sender: TObject);
var res : boolean;
begin
		if SakumokuCD = BokusouCode then  //�q���̏ꍇ�Q�ƃe�[�u�����Ⴄ
		  res := ADOTable1.Locate('��ڃR�[�h;�앨�R�[�h;��^��;�y���R�[�h',VarArrayOf([SakumokuCD,SakumotuCDList[ComboBox1.ItemIndex],comboBox2.Text,strParts(cmbDositu.Text ,1)]), [])
    else
		  res := ADOTable1.Locate('��ڃR�[�h;�앨�R�[�h;��^��',VarArrayOf([SakumokuCD,SakumotuCDList[ComboBox1.ItemIndex],comboBox2.Text]), []);
    if not res then showmessage('��^������܂���F���R�[�h�ړ��ł��܂���.');

end;

procedure TFSelectSaku.FormCreate(Sender: TObject);
begin

  SakumotuCDList := TStringList.Create ;

end;

procedure TFSelectSaku.FormShow(Sender: TObject);
begin

  //��ڃR�[�h����e�[�u�����w�肷��
  if SakumokuCD = BokusouCode then begin
    ADOTable1.TableName := 'm_bokugata' ;
    lblDositu.Visible := true ;
    cmbDositu.Visible := true ;
    //�y���R�[�h����R���{�{�b�N�X���X�g�����킹��
///////    cmbDositu.ItemIndex := strtoint(FDOSEICD)-1;
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

end.
