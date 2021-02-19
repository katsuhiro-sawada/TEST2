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
    { Private 宣言 }
    FHojouCD : string ;
    FOrder : string ;
    FWhere : string ;
    function MakeSQL: string;
  public
    { Public 宣言 }
  end;

var
  frmSHojou: TfrmSHojou;
function DspSHojou(var HojouCD : string ): Boolean ;

implementation

uses DMU, MHojouU;

const sSQL = 'Select * from M_HOJOU,M_NOUKA where M_HOJOU.農家番号=M_NOUKA.農家番号 ';

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
  FOrder := '圃場番号';
  FWhere := '';
end;

procedure TfrmSHojou.FormShow(Sender: TObject);
//var
//	aBuff : string ;
begin
	with ADOQuery1 do begin
    Close;
//		if FHojouCD <> '' then aBUff := 'and M_HOJOU.圃場番号="' + FHojouCD +'"'
//    else aBuff := ' ORDER by M_NOUKA.農家カナ';
  	SQL.Text := MakeSQL ;

    Open;
    if RecordCount > 0 then begin
//    	txtCode.Text := FieldByName('農家番号').asString ;
      //その農家の圃場リストを表示
//      btnFindClick(self);
      Locate('圃場番号', FHojouCD,[]);
    end;
  end;
end;

procedure TfrmSHojou.btnFindClick(Sender: TObject);
var
	aBuff : string ;
begin
	aBuff := '';
	if txtNouka.Text <> '' then
  	aBuff := '農家名 like "%'+txtNouka.Text+'%"';
	if txtKana.Text <> '' then begin
  	if aBuff <> '' then aBUff := aBuff + ' and ';
  	aBuff := '農家カナ like "%'+txtKana.Text+'%"';
	end;
  if txtCode.Text <> '' then begin
  	if aBuff <> '' then aBUff := aBuff + ' and ';
  	aBuff := 'M_NOUKA.農家番号 like "%'+txtCode.Text+'%"';
  end;
//  if aBuff <> '' then aBuff := ' and ' + aBuff ;
  if aBuff <> '' then FWhere := ' and ' + aBuff
  else FWhere := '';
	with ADOQuery1 do begin
    Close;
  	SQL.Text := MakeSQL ;
    Open;
    //呼び出したの圃場にカーソル移動
    if (RecordCount > 0) and (FHojouCD <> '' )then
      Locate('圃場番号',FHojouCD,[]);
  end;
end;

procedure TfrmSHojou.BitBtn1Click(Sender: TObject);
begin
	if ADOQuery1.Active then
		FHojouCD := ADOQuery1.FieldByName('圃場番号').asString ;
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

//圃場マスタ呼び出し
procedure TfrmSHojou.btnNewClick(Sender: TObject);
begin
  Application.CreateForm(TmstHojouForm, mstHojouForm);
//  mstHojouForm.btnNewClick(mstHojouForm);    この順で呼び出すと、新規レコード操作時に勝手にキャンセルされるので
// 手動で新規してもらう
  mstHojouForm.ENo.Text := ADOQuery1.FieldByName('圃場番号').asString;
  mstHojouForm.ShowModal ;
  mstHojouForm.Release ;
  FormShow(self);  {再オープン}
end;

procedure TfrmSHojou.btnAllClick(Sender: TObject);
begin
	txtNouka.Text := '';
  txtKana.Text := '';
  txtCode.Text := '';
  btnFindClick(self);
end;

{Enterキーでタブ移動}
procedure TfrmSHojou.EnterKeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 then  //Enterキーが押されたら
  begin
    Key:=#0; //キー入力を無効にし
    Keybd_event(VK_TAB,0,0,0) //Tabキーを発生させる。
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
        ShowMessage( '地点番号は、9桁です。' );

    end
    else begin
       if ADOQuery1.Locate('圃場番号',ETiten.Text,[]) then begin
	       FHojouCD := ETiten.Text;
           close;
       end
       else begin

           ShowMessage( '番号がありません。' );

       end;

    end;
end;

procedure TfrmSHojou.ETitenKeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 then  //Enterキーが押されたら
  begin
    Key:=#0; //キー入力を無効にし
    Keybd_event(VK_TAB,0,0,0) //Tabキーを発生させる。
  end;

end;

end.
