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
    { Private 宣言 }
    SakumotuCDList : TStringList ;
  public
    { Public 宣言 }
    SakumokuCD : string ;
  end;

var
  mstKijun2Form: TmstKijun2Form;

implementation

uses DMU,USelectSaku;

{$R *.DFM}

procedure TmstKijun2Form.FormCreate(Sender: TObject);
begin
//	if not IsEntryYear then begin		//操作可能年度で無ければ編集不可
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
//  SyncUpdate;  //マスタ更新日記録
//  SakumotuCDList.Free ;

end;


procedure TmstKijun2Form.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin

	if ds1.DataSet.State in [dsEdit	,dsInsert] then
			ds1.DataSet.Post;

end;

procedure TmstKijun2Form.FormShow(Sender: TObject);
begin
  //作目コードからテーブルを指定する
  if SakumokuCD = BokusouCode then begin
    ADOTable1.TableName := 'm_bokugata' ;
//    lblDositu.Visible := true ;
//    cmbDositu.Visible := true ;
    //土質コードからコンボボックスリストを合わせる
///////草地    cmbDositu.ItemIndex := strtoint(FDOSEICD)-1;
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
//作物の指定
procedure TmstKijun2Form.ComboBox1Change(Sender: TObject);
begin
	if ds1.DataSet.State in [dsEdit	,dsInsert] then
		if CheckBeforePost then ds1.DataSet.Post
    else exit ;
  //作型リストの作成
	ComboBox2.Items.Clear ;
	with ADOQuery1 do begin
    //作型名の取得なので、テーブルの切り替えはしなくていい -> データ外部作成の時関連が無いとき有るのでテーブル個別変更する
    //Ver 0.42
		if SakumokuCD = BokusouCode then  //牧草の場合参照テーブルが違う
		  SQL.Text := 'select distinct 作型名 from m_bokugata where 作目コード=:作目コード and 作物コード=:作物コード'
//		  SQL.Text := 'select * from m_bokugata where 作目コード=:作目コード and 作物コード=:作物コード'
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
	'pHA上限','pHA下限','pHA目標','pHAグラフ上限','pHAグラフ下限',
	'ECA上限','ECA下限','ECA目標','ECAグラフ上限','ECAグラフ下限',
  'リン酸A上限','リン酸A下限','リン酸A目標','リン酸Aグラフ上限','リン酸Aグラフ下限',
  '石灰A上限','石灰A下限','石灰A目標','石灰Aグラフ上限','石灰Aグラフ下限',
  '苦土A上限','苦土A下限','苦土A目標','苦土Aグラフ上限','苦土Aグラフ下限',
  '加里A上限','加里A下限','加里A目標','加里Aグラフ上限','加里Aグラフ下限',

	'pHB上限','pHB下限','pHB目標','pHBグラフ上限','pHBグラフ下限',
	'ECB上限','ECB下限','ECB目標','ECBグラフ上限','ECBグラフ下限',
  'リン酸B上限','リン酸B下限','リン酸B目標','リン酸Bグラフ上限','リン酸Bグラフ下限',
  '石灰B上限','石灰B下限','石灰B目標','石灰Bグラフ上限','石灰Bグラフ下限',
  '苦土B上限','苦土B下限','苦土B目標','苦土Bグラフ上限','苦土Bグラフ下限',
  '加里B上限','加里B下限','加里B目標','加里Bグラフ上限','加里Bグラフ下限',

	'pHC上限','pHC下限','pHC目標','pHCグラフ上限','pHCグラフ下限',
	'ECC上限','ECC下限','ECC目標','ECCグラフ上限','ECCグラフ下限',
  'リン酸C上限','リン酸C下限','リン酸C目標','リン酸Cグラフ上限','リン酸Cグラフ下限',
  '石灰C上限','石灰C下限','石灰C目標','石灰Cグラフ上限','石灰Cグラフ下限',
  '苦土C上限','苦土C下限','苦土C目標','苦土Cグラフ上限','苦土Cグラフ下限',
  '加里C上限','加里C下限','加里C目標','加里Cグラフ上限','加里Cグラフ下限',
  {91}
  '石灰苦土A上限','石灰苦土A下限','石灰苦土A目標','石灰苦土Aグラフ上限','石灰苦土Aグラフ下限',
  '苦土加里A上限','苦土加里A下限','苦土加里A目標','苦土加里Aグラフ上限','苦土加里Aグラフ下限',
  '石灰飽和A上限','石灰飽和A下限','石灰飽和A目標','石灰飽和Aグラフ上限','石灰飽和Aグラフ下限',
  '加里飽和A上限','加里飽和A下限','加里飽和A目標','加里飽和Aグラフ上限','加里飽和Aグラフ下限',
  '塩基飽和A上限','塩基飽和A下限','塩基飽和A目標','塩基飽和Aグラフ上限','塩基飽和Aグラフ下限',
  'リン酸苦土A上限','リン酸苦土A下限','リン酸苦土A目標',{'リン酸苦土Aグラフ上限','リン酸苦土Aグラフ下限',}

  '石灰苦土B上限','石灰苦土B下限','石灰苦土B目標','石灰苦土Bグラフ上限','石灰苦土Bグラフ下限',
  '苦土加里B上限','苦土加里B下限','苦土加里B目標','苦土加里Bグラフ上限','苦土加里Bグラフ下限',
  '石灰飽和B上限','石灰飽和B下限','石灰飽和B目標','石灰飽和Bグラフ上限','石灰飽和Bグラフ下限',
  '加里飽和B上限','加里飽和B下限','加里飽和B目標','加里飽和Bグラフ上限','加里飽和Bグラフ下限',
  '塩基飽和B上限','塩基飽和B下限','塩基飽和B目標','塩基飽和Bグラフ上限','塩基飽和Bグラフ下限',
  'リン酸苦土B上限','リン酸苦土B下限','リン酸苦土B目標',{'リン酸苦土Bグラフ上限','リン酸苦土Bグラフ下限',}

  '石灰苦土C上限','石灰苦土C下限','石灰苦土C目標','石灰苦土Cグラフ上限','石灰苦土Cグラフ下限',
  '苦土加里C上限','苦土加里C下限','苦土加里C目標','苦土加里Cグラフ上限','苦土加里Cグラフ下限',
  '石灰飽和C上限','石灰飽和C下限','石灰飽和C目標','石灰飽和Cグラフ上限','石灰飽和Cグラフ下限',
  '加里飽和C上限','加里飽和C下限','加里飽和C目標','加里飽和Cグラフ上限','加里飽和Cグラフ下限',
  '塩基飽和C上限','塩基飽和C下限','塩基飽和C目標','塩基飽和Cグラフ上限','塩基飽和Cグラフ下限',
  'リン酸苦土C上限','リン酸苦土C下限','リン酸苦土C目標',{'リン酸苦土Cグラフ上限','リン酸苦土Cグラフ下限',}

  'ケイ酸上限','ケイ酸下限','ケイ酸目標',
  '鉄上限','鉄下限','鉄目標',
  'ホウ素上限','ホウ素下限','ホウ素目標',
  '亜鉛上限','亜鉛下限','亜鉛目標',
  'マンガン上限','マンガン下限','マンガン目標',
  '銅上限','銅下限','銅目標',
  'ニッケル上限','ニッケル下限','ニッケル目標',
  'ケイ酸グラフ上限','ケイ酸グラフ下限'
);

procedure TmstKijun2Form.BitBtn2Click(Sender: TObject);
var
cnt,cnt2 : integer;
stmp : String;
begin

     if not ds1.DataSet.Active then  exit;

     stmp := 'CEC:0～10　を　CEC:10～20、CEC:20～ にコピーします。よろしいですか？';
     if Application.MessageBox(Pchar(stmp),'基準値コピー',MB_YESNO) <> ID_YES then
       exit ;

      //A → B
      cnt2 := 0;
    	for cnt := 31 to 60 do begin //一度でPostするとエラーになる。文字数オーバか
        ds1.DataSet.Edit ;
        cnt2 := cnt2 + 1;
    		ds1.DataSet.FieldByName( FieldN[cnt] ).asFloat := ds1.DataSet.FieldByName( FieldN[cnt2] ).asFloat ;
        ds1.DataSet.Post ;
      end;

      //A → C
      cnt2 := 0;
    	for cnt := 61 to 90 do begin //一度でPostするとエラーになる。文字数オーバか
        ds1.DataSet.Edit ;
        cnt2 := cnt2 + 1;
    		ds1.DataSet.FieldByName( FieldN[cnt] ).asFloat := ds1.DataSet.FieldByName( FieldN[cnt2] ).asFloat ;
        ds1.DataSet.Post ;
      end;


      //A → B
      cnt2 := 90; //～118
    	for cnt := 119 to 146 do begin //一度でPostするとエラーになる。文字数オーバか
        ds1.DataSet.Edit ;
        cnt2 := cnt2 + 1;
    		ds1.DataSet.FieldByName( FieldN[cnt] ).asFloat := ds1.DataSet.FieldByName( FieldN[cnt2] ).asFloat ;
        ds1.DataSet.Post ;
      end;


      //A → C
      cnt2 := 90;
    	for cnt := 147 to 174 do begin //一度でPostするとエラーになる。文字数オーバか
        ds1.DataSet.Edit ;
        cnt2 := cnt2 + 1;
    		ds1.DataSet.FieldByName( FieldN[cnt] ).asFloat := ds1.DataSet.FieldByName( FieldN[cnt2] ).asFloat ;
        ds1.DataSet.Post ;
      end;




end;

procedure TmstKijun2Form.Table1BeforePost(DataSet: TDataSet);
begin
  inherited;
  //土質コードのセット
	if SakumokuCD = BokusouCode then begin //牧草の場合参照テーブルが違う
    DataSet.FieldByName('土質コード').asString := FDOSEICD;
  end;
end;

end.
