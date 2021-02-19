unit MHojouU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  mstU, DBTables, DBCtrls, StdCtrls, Mask, Db, Grids, DBGrids, Buttons,
  ComCtrls, ExtCtrls, ADODB;

type
  TmstHojouForm = class(TmstForm)
    DBEdit1: TDBEdit;
    DBNouka: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    Label6: TLabel;
    Label7: TLabel;
    ds2: TDataSource;
    ds3: TDataSource;
    btnNouka: TButton;
    DBLookupComboBox3: TDBLookupComboBox;
    DBLookupComboBox4: TDBLookupComboBox;
    DBLookupComboBox5: TDBLookupComboBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    ds4: TDataSource;
    ds5: TDataSource;
    ds6: TDataSource;
    btnCopy: TBitBtn;
    btnFind: TBitBtn;
    BtHarituke: TBitBtn;
    ENo: TEdit;
    BtCityTiku: TButton;
    ADOTable2: TADOTable;
    ADOTable3: TADOTable;
    ADOTable4: TADOTable;
    ADOQuery2: TADOQuery;
    ADOQuery3: TADOQuery;
    QNouka: TADOQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNoukaClick(Sender: TObject);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure ds1StateChange(Sender: TObject);
    procedure Table1BeforePost(DataSet: TDataSet);
    procedure BtHaritukeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtCityTikuClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private �錾 }
    FCityCD : string ;
		fKeep : Boolean ;
  	sF1,sF2,sF3,sF4,sF5,sF6,sF7,sF8 : string ;
  public
    { Public �錾 }
  end;

var
  mstHojouForm: TmstHojouForm;

implementation

{$R *.DFM}
uses DMU, SNoukaU;


procedure TmstHojouForm.FormCreate(Sender: TObject);
begin
  inherited;
  FCityCD := ds1.DataSet.FieldByName('�s�����R�[�h').asString ;
  with ADOQuery2 do begin
  	Close;
    SQL.Text := 'select M_CITY.* from M_CITY,M_CENTER  '+
    						'where M_CITY.�Z���^�[�R�[�h = M_CENTER.�Z���^�[�R�[�h and '+
								'�Z���^�[�L�� = "'+ EntryCenter +'"';
    Open;
  end;
  with ADOQuery3 do begin
  	Close;
    SQL.Text := 'select M_TIKU.* from M_TIKU  '+
    						'where M_TIKU.�s�����R�[�h = :�s�����R�[�h' ;
    Open;
  end;
  ADOTable2.Open;
  ADOTable3.Open;
	ADOTable4.Open;

end;

procedure TmstHojouForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ADOQuery3.close;
	ADOQuery2.Close;
  ADOTable4.Close;
  ADOTable3.Close;
	ADOTable2.Close;

end;

procedure TmstHojouForm.btnNoukaClick(Sender: TObject);
var
	aBuff :string;
begin
	aBuff := DBNouka.Text;
	if DspSNouka(aBuff) then begin
//    DBEdit2.Text := aBuff ;   ���ꂾ�ƁA�ҏW���[�h�Ɏ����I�ɂȂ�Ȃ�
    if not( ds1.DataSet.State in [dsEdit	,dsInsert] ) then ds1.DataSet.Edit;
    ds1.DataSet.FieldByName('�_�Ɣԍ�').asString :=  aBuff;
  end;
end;

procedure TmstHojouForm.DBLookupComboBox1Exit(Sender: TObject);
begin
  inherited;
  if ds1.DataSet.FieldByName('�s�����R�[�h').asString = FCityCD then
  	exit;
  FCityCD := ds1.DataSet.FieldByName('�s�����R�[�h').asString ;
	if ds1.DataSet.State in [dsEdit	,dsInsert] then
		ds1.DataSet.FieldByName('�n��R�[�h').asString := '' ;
	if  DBLookupComboBox1.Text<>'' then
  	with ADOQuery3 do begin
    	close;
      open;
    end;

end;

procedure TmstHojouForm.btnPostClick(Sender: TObject);
var
keta : Integer;
begin

//  keta := 7;
//  if JMode = 'Douou' then keta := 9;
//  if not ChkEditLength(DBEdit1, keta ) then exit;
//  if not ChkEditLength(DBNouka, 7 ) then exit;
  inherited;

end;


procedure TmstHojouForm.btnCopyClick(Sender: TObject);
begin
  inherited;

  //�����̑������̂͌��ݕ\�����Ă�����e���R�s�[���ĐV�K���R�[�h�ɔ��f����
  fKeep := false ;
  if not ds1.DataSet.Eof and not ds1.DataSet.Bof then begin
  	sF1 := ds1.DataSet.FieldByName('�ޏ�ԍ�').asString ;
  	sF2 := ds1.DataSet.FieldByName('�_�Ɣԍ�').asString ;
  	sF3 := ds1.DataSet.FieldByName('�ޏꖼ').asString ;
  	sF4 := ds1.DataSet.FieldByName('�s�����R�[�h').asString ;
  	sF5 := ds1.DataSet.FieldByName('�n��R�[�h').asString ;
  	sF6 := ds1.DataSet.FieldByName('�y��R�[�h').asString ;
  	sF7 := ds1.DataSet.FieldByName('�y���R�[�h').asString ;
  	sF8 := ds1.DataSet.FieldByName('���A�R�[�h').asString ;
  	fKeep := True ;
  end;

end;

procedure TmstHojouForm.btnFindClick(Sender: TObject);
var
  NoukaCd : string ;
begin
  inherited;
  //�����̌���
  NoukaCd := '';
  if DspSNouka(NoukaCd) then begin
    ADOTable1.Filter :='�_�Ɣԍ�='+NoukaCd;
    ADOTable1.Filtered := True ;
    ADOTable1.FindFirst ;
  end else begin
    ADOTable1.Filtered := false ;
  end;
end;

procedure TmstHojouForm.ds1StateChange(Sender: TObject);
begin
  inherited;
   btnFind.Enabled :=  not( ds1.DataSet.State in [dsEdit	,dsInsert] );

end;

procedure TmstHojouForm.Table1BeforePost(DataSet: TDataSet);
begin
  inherited;
  if ADOTable1.State <> dsEdit then begin
     ADOTable1.Edit;
  end;
  if (JMode = 'Douou') or (JMode = 'Sinsino') then
     ADOTable1.FieldByName('�ҏW��').asDateTime := now;

end;

procedure TmstHojouForm.BtHaritukeClick(Sender: TObject);
begin
  inherited;
  if fKeep then begin
//  	ds1.DataSet.FieldByName('�ޏ�ԍ�').asString := sF1 ;
        if ds1.State <> dsEdit then ds1.Edit;
  	ds1.DataSet.FieldByName('�_�Ɣԍ�').asString := sF2 ;
  	ds1.DataSet.FieldByName('�ޏꖼ').asString := sF3 ;
  	ds1.DataSet.FieldByName('�s�����R�[�h').asString := sF4 ;
  	ds1.DataSet.FieldByName('�n��R�[�h').asString := sF5 ;
  	ds1.DataSet.FieldByName('�y��R�[�h').asString := sF6 ;
  	ds1.DataSet.FieldByName('�y���R�[�h').asString := sF7 ;
  	ds1.DataSet.FieldByName('���A�R�[�h').asString := sF8 ;
  end;

end;

procedure TmstHojouForm.FormShow(Sender: TObject);
begin
  inherited;

  if not (Eno.Text = '') then begin

     ADOTable1.Locate('�ޏ�ԍ�',Eno.Text,[]);

  end;

  DBEdit1.ReadOnly := true;
   DBEdit1.Color := TColor($E0E0E0);

end;

procedure TmstHojouForm.BtCityTikuClick(Sender: TObject);
var
no : String;
stmp : String;
begin
   //�s�����A�n��

   no := DBNouka.Text;
   if no <> '' then begin
      QNouka.Close;
      QNouka.SQL.Clear;
      stmp := 'select * from M_NOUKA where �_�Ɣԍ� = "'+no+'"';
      QNouka.SQL.Add(stmp);
      Qnouka.Open;

      if QNouka.RecordCount > 0 then begin
          if not( ds1.DataSet.State in [dsEdit	,dsInsert] ) then ds1.DataSet.Edit;

          ds1.DataSet.FieldByName('�s�����R�[�h').asString :=
              QNouka.FieldByName('�s�����R�[�h').asString;

          ds1.DataSet.FieldByName('�n��R�[�h').asString :=
              QNouka.FieldByName('�n��R�[�h').asString;


      end
      else begin
         ShowMessage('�_�Ɣԍ�����_�Ƃ�I���ł��܂���B');
      end;

   end
   else begin

      ShowMessage('�_�Ɣԍ��ɔ_�Ƃ��w�肵�Ă��������B');

   end;








end;

procedure TmstHojouForm.btnNewClick(Sender: TObject);
begin
  inherited;


  DBEdit1.ReadOnly := false;
  DBEdit1.Color := clWindow;

end;

procedure TmstHojouForm.btnCancelClick(Sender: TObject);
begin
  inherited;
  DBEdit1.ReadOnly := true;
  DBEdit1.Color := TColor($E0E0E0);
end;

end.
