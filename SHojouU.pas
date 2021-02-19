unit SHojouU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Db, DBTables, Buttons, Grids, DBGrids, StdCtrls, ADODB;

type
  TfrmSHojou = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    txtNouka: TEdit;
    txtCode: TEdit;
    txtKana: TEdit;
    btnFind: TButton;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DataSource1: TDataSource;
    Bevel1: TBevel;
    btnClose: TBitBtn;
    Bevel2: TBevel;
    btnAll: TButton;
    BitBtn3: TBitBtn;
    Label4: TLabel;
    ETiten: TEdit;
    BtBan: TBitBtn;
    ADOQuery1: TADOQuery;
    procedure btnFindClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure txtKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnAllClick(Sender: TObject);
    procedure EnterKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure BtBanClick(Sender: TObject);
    procedure ETitenKeyPress(Sender: TObject; var Key: Char);
  private
    { Private �錾 }
    FHojouCD : string ;
    FOrder : string ;
    FWhere : string ;
    function MakeSQL: string;
  public
    { Public �錾 }
  end;

var
  frmSHojou: TfrmSHojou;
function DspSHojou(var HojouCD : string ): Boolean ;

implementation

uses DMU, MHojouU;

const sSQL = 'Select * from M_HOJOU,M_NOUKA where M_HOJOU.�_�Ɣԍ�=M_NOUKA.�_�Ɣԍ� ';

{$R *.DFM}
function DspSHojou(var HojouCD : string ): Boolean ;
begin
  Application.CreateForm(TfrmSHojou, frmSHojou);
  frmSHojou.FHojouCD := HojouCD ;
  frmSHojou.ShowModal ;
  HojouCD := frmSHojou.FHojouCD ;
  result := frmSHojou.FHojouCD <> '';
  frmSHojou.Release ;
end;

procedure TfrmSHojou.FormCreate(Sender: TObject);
begin
	Color := BackColor ;
  FOrder := '�ޏ�ԍ�';
  FWhere := '';
end;

procedure TfrmSHojou.FormShow(Sender: TObject);
//var
//	aBuff : string ;
begin
	with ADOQuery1 do begin
    Close;
//		if FHojouCD <> '' then aBUff := 'and M_HOJOU.�ޏ�ԍ�="' + FHojouCD +'"'
//    else aBuff := ' ORDER by M_NOUKA.�_�ƃJ�i';
  	SQL.Text := MakeSQL ;

    Open;
    if RecordCount > 0 then begin
//    	txtCode.Text := FieldByName('�_�Ɣԍ�').asString ;
      //���̔_�Ƃ̕ޏꃊ�X�g��\��
//      btnFindClick(self);
      Locate('�ޏ�ԍ�', FHojouCD,[]);
    end;
  end;
end;

procedure TfrmSHojou.btnFindClick(Sender: TObject);
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
  if txtCode.Text <> '' then begin
  	if aBuff <> '' then aBUff := aBuff + ' and ';
  	aBuff := 'M_NOUKA.�_�Ɣԍ� like "%'+txtCode.Text+'%"';
  end;
//  if aBuff <> '' then aBuff := ' and ' + aBuff ;
  if aBuff <> '' then FWhere := ' and ' + aBuff
  else FWhere := '';
	with ADOQuery1 do begin
    Close;
  	SQL.Text := MakeSQL ;
    Open;
    //�Ăяo�����̕ޏ�ɃJ�[�\���ړ�
    if (RecordCount > 0) and (FHojouCD <> '' )then
      Locate('�ޏ�ԍ�',FHojouCD,[]);
  end;
end;

procedure TfrmSHojou.BitBtn1Click(Sender: TObject);
begin
	if ADOQuery1.Active then
		FHojouCD := ADOQuery1.FieldByName('�ޏ�ԍ�').asString ;
  Close;

end;

procedure TfrmSHojou.BitBtn2Click(Sender: TObject);
begin
	FHojouCD := '';
  Close;

end;

procedure TfrmSHojou.txtKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	if (Key in [VK_RETURN] ) then  btnFindClick(self);
end;

procedure TfrmSHojou.btnCloseClick(Sender: TObject);
begin
	Close;
end;

//�ޏ�}�X�^�Ăяo��
procedure TfrmSHojou.btnNewClick(Sender: TObject);
begin
  Application.CreateForm(TmstHojouForm, mstHojouForm);
//  mstHojouForm.btnNewClick(mstHojouForm);    ���̏��ŌĂяo���ƁA�V�K���R�[�h���쎞�ɏ���ɃL�����Z�������̂�
// �蓮�ŐV�K���Ă��炤
  mstHojouForm.ENo.Text := ADOQuery1.FieldByName('�ޏ�ԍ�').asString;
  mstHojouForm.ShowModal ;
  mstHojouForm.Release ;
  FormShow(self);  {�ăI�[�v��}
end;

procedure TfrmSHojou.btnAllClick(Sender: TObject);
begin
	txtNouka.Text := '';
  txtKana.Text := '';
  txtCode.Text := '';
  btnFindClick(self);
end;

{Enter�L�[�Ń^�u�ړ�}
procedure TfrmSHojou.EnterKeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 then  //Enter�L�[�������ꂽ��
  begin
    Key:=#0; //�L�[���͂𖳌��ɂ�
    Keybd_event(VK_TAB,0,0,0) //Tab�L�[�𔭐�������B
  end;
end;
function TfrmSHojou.MakeSQL :string;
begin
  result := sSQL + FWhere + ' order by ' + FOrder ;
end;

procedure TfrmSHojou.DBGrid1TitleClick(Column: TColumn);
begin
  with ADOQuery1 do begin
  	Close;
    FOrder := Column.FieldName ;
    SQL.Text :=MakeSQL ;
    Open;
  end;


end;

procedure TfrmSHojou.BtBanClick(Sender: TObject);
//Var
// stmp : String;
begin

    if Length(ETiten.Text) <> 9 then begin
        ShowMessage( '�n�_�ԍ��́A9���ł��B' );

    end
    else begin
       if ADOQuery1.Locate('�ޏ�ԍ�',ETiten.Text,[]) then begin
	       FHojouCD := ETiten.Text;
           close;
       end
       else begin

           ShowMessage( '�ԍ�������܂���B' );

       end;

    end;
end;

procedure TfrmSHojou.ETitenKeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 then  //Enter�L�[�������ꂽ��
  begin
    Key:=#0; //�L�[���͂𖳌��ɂ�
    Keybd_event(VK_TAB,0,0,0) //Tab�L�[�𔭐�������B
  end;

end;

end.
