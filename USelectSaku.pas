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
      ShowMessage('作物を選択して下さい。');
      exit;
    end;
    if SakuName2 = '' then begin
      ShowMessage('作型を選択して下さい。');
      exit;
    end;

    SakuCD1 := ADOTable1.FieldByName('作目コード').asString;
    SakuCD2 := ADOTable1.FieldByName('作物コード').asString;

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
  //作型リストの作成
	ComboBox2.Items.Clear ;
	with ADOQuery1 do begin
    //作型名の取得なので、テーブルの切り替えはしなくていい -> データ外部作成の時関連が無いとき有るのでテーブル個別変更する
    //Ver 0.42
		if SakumokuCD = BokusouCode then  //牧草の場合参照テーブルが違う
		  SQL.Text := 'select distinct 作型名 from m_bokugata where 作目コード=:作目コード and 作物コード=:作物コード'
    else
		  SQL.Text := 'select * from m_sakugata where 作目コード=:作目コード and 作物コード=:作物コード';
//	 	ParamByName('作目コード').asString := SakumokuCD ;
//  	ParamByName('作物コード').asString := SakumotuCDList[ComboBox1.ItemIndex] ;
	 	  Parameters.ParamByName('作目コード').Value := SakumokuCD ;
  	  Parameters.ParamByName('作物コード').Value := SakumotuCDList[ComboBox1.ItemIndex] ;
    Open;
	  while not Eof do begin
  	  ComboBox2.Items.Add(FieldByname('作型名').asString );
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
		if SakumokuCD = BokusouCode then  //牧草の場合参照テーブルが違う
		  res := ADOTable1.Locate('作目コード;作物コード;作型名;土質コード',VarArrayOf([SakumokuCD,SakumotuCDList[ComboBox1.ItemIndex],comboBox2.Text,strParts(cmbDositu.Text ,1)]), [])
    else
		  res := ADOTable1.Locate('作目コード;作物コード;作型名',VarArrayOf([SakumokuCD,SakumotuCDList[ComboBox1.ItemIndex],comboBox2.Text]), []);
    if not res then showmessage('作型がありません：レコード移動できません.');

end;

procedure TFSelectSaku.FormCreate(Sender: TObject);
begin

  SakumotuCDList := TStringList.Create ;

end;

procedure TFSelectSaku.FormShow(Sender: TObject);
begin

  //作目コードからテーブルを指定する
  if SakumokuCD = BokusouCode then begin
    ADOTable1.TableName := 'm_bokugata' ;
    lblDositu.Visible := true ;
    cmbDositu.Visible := true ;
    //土質コードからコンボボックスリストを合わせる
///////    cmbDositu.ItemIndex := strtoint(FDOSEICD)-1;
  end else begin
    ADOTable1.TableName := 'm_sakugata' ;
  end;
 	ADOTable1.Open;

  inherited;
	ComboBox1.Items.Clear ;
  SakumotuCDList.Clear ;
	with ADOQuery1 do begin
		SQL.Text := 'select * from M_SAKUMOTU where 作目コード=:作目コード';
//  ParamByName('作目コード').asString := SakumokuCD ;
  	Parameters.ParamByName('作目コード').Value := SakumokuCD ;
    Open;
	  while not Eof do begin
  	  ComboBox1.Items.Add(FieldByname('作物名').asString );
      SakumotuCDList.Add( FieldByname('作物コード').asString );
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
