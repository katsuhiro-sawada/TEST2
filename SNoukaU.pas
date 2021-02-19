unit SNoukaU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Buttons, Grids, DBGrids, StdCtrls, ExtCtrls, ADODB;

type
  TfrmNouka = class(TForm)
    GroupBox1: TGroupBox;
    txtNouka: TEdit;
    Label1: TLabel;
    txtTel: TEdit;
    Label2: TLabel;
    txtKana: TEdit;
    Label3: TLabel;
    Button1: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Bevel1: TBevel;
    btnClose: TBitBtn;
    ADOQuery1: TADOQuery;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure txtKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCloseClick(Sender: TObject);
    procedure EnterKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private �錾 }
    FNoukaCD : string ;
    FOrder : string ; //�\�[�g����
    FWhere : string ;
    function MakeSQL: string; //��������
  public
    { Public �錾 }
  end;

var
  frmNouka: TfrmNouka;
function DspSNouka(var NoukaCD : string ): Boolean ;

implementation

uses DMU;

const sSQL = 'Select �_�Ɣԍ�,�_�Ɩ�,�_�ƃJ�i,�Z��,�d�b�ԍ� from M_NOUKA ';

{$R *.DFM}

{
  �_�ƌ������
  IN: NoukaCD �_�Ɣԍ�
  OUT:NoukaCD �_�Ɣԍ�
  result : �^�F�I������
}
function DspSNouka(var NoukaCD : string ): Boolean ;
begin
  Application.CreateForm(TfrmNouka, frmNouka);
  frmNouka.FNoukaCD := NoukaCD ;
  frmNouka.ShowModal ;
  NoukaCD := frmNouka.FNoukaCD ;
  result := frmNouka.FNoukaCD <> '';
  frmNouka.Release ;
end;

procedure TfrmNouka.FormCreate(Sender: TObject);
begin
	Color := BackColor ;
//	FNoukaCD := '';
  FOrder := '�_�Ɣԍ�';
  FWhere := '';
end;

procedure TfrmNouka.FormShow(Sender: TObject);
//var
//	aBuff : string ;
begin
	with ADOQuery1 do begin
    Close;
//		if FNoukaCD <> '' then FWhere := ' where �_�Ɣԍ�="' + FNoukaCD +'"'  ;
  	SQL.Text := MakeSQL ;
    Open;
    if (RecordCount > 0 )and(FNoukaCD <>'')then
      Locate('�_�Ɣԍ�',FNoukaCD,[]);
  end;

end;

procedure TfrmNouka.Button1Click(Sender: TObject);
var
	aBuff : string ;
begin
	aBuff := '';
	if txtNouka.Text <> '' then
  	aBuff := '�_�Ɩ� like "%'+txtNouka.Text+'%"';
	if txtKana.Text <> '' then begin
  	if aBuff <> '' then aBUff := aBuff + ' and ';
  	aBuff := '�_�ƃJ�i like "%'+txtKana.Text+'%"';
	end;
  if txtTel.Text <> '' then begin
  	if aBuff <> '' then aBUff := aBuff + ' and ';
  	aBuff := '�d�b�ԍ� like "%'+txtTel.Text+'%"';
  end;
  if aBuff <> '' then FWhere := ' where ' + aBuff
  else FWhere := '';

	with ADOQuery1 do begin
    Close;
  	SQL.Text := MakeSQL ;
    Open;
  end;
end;


procedure TfrmNouka.BitBtn1Click(Sender: TObject);
begin
	if ADOQuery1.Active then
		FNoukaCD := ADOQuery1.FieldByName('�_�Ɣԍ�').asString ;
  Close;
end;

procedure TfrmNouka.BitBtn2Click(Sender: TObject);
begin
	FNoukaCD := '';
  Close;
end;


procedure TfrmNouka.txtKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	if (Key in [VK_RETURN] ) then  Button1Click(self);

end;

procedure TfrmNouka.btnCloseClick(Sender: TObject);
begin
	Close;
end;
{Enter�L�[�Ń^�u�ړ�}
procedure TfrmNouka.EnterKeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 then  //Enter�L�[�������ꂽ��
  begin
    Key:=#0; //�L�[���͂𖳌��ɂ�
    Keybd_event(VK_TAB,0,0,0) //Tab�L�[�𔭐�������B
  end;
end;

procedure TfrmNouka.DBGrid1TitleClick(Column: TColumn);
begin
  with ADOQuery1 do begin
  	Close;
    FOrder := Column.FieldName ;
    SQL.Text :=MakeSQL ;
    Open;
  end;

end;
function TfrmNouka.MakeSQL :string;
begin
  result := sSQL + FWhere + ' order by ' + FOrder ;
end;
end.
