unit M_KIJUNU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  mstKIJUNU, StdCtrls, Db, DBTables, Buttons, ExtCtrls, ComCtrls, Mask,Variants,


  DBCtrls, ADODB;

type
  TmstKijun1Form = class(TmstKijunForm)
    Label1: TLabel;
    Panel1: TPanel;
    DBEdit5: TDBEdit;
    DBEdit1: TDBEdit;
    Label11: TLabel;
    ADODummy: TADOTable;
    DDummy: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private 宣言 }
//    cBox1Itemindex : integer ;
    FBokusouName : string ;
  public
    { Public 宣言 }
  end;

var
  mstKijun1Form: TmstKijun1Form;

implementation

uses M_KIJUN2U, DMU;

{$R *.DFM}

procedure TmstKijun1Form.FormCreate(Sender: TObject);
begin
  inherited;
  ADOTable1.TableName := 'm_sakumotu';
 if not JMaster then begin		//編集不可
    ds1.AutoEdit := False ;
    ADOTable1.ReadOnly := true;
  end;
  ADOTable1.Open;


//  while not ADOTable1.Eof do begin
//    ComboBox1.Items.Add(ADOTable1.fieldByname('作物名').asString );
//  	ADOTable1.Next;
//  end;




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


procedure TmstKijun1Form.FormShow(Sender: TObject);
begin
  inherited;


  ADODummy.close;

  ADODummy.TableName := 'T_DUMMY';

  ADODummy.Open;

  ADODummy.Edit;
  ADODummy.fieldbyname('コード2').asString := '01';




end;

//作目の指定
procedure TmstKijun1Form.ComboBox1Change(Sender: TObject);
var
  res : Boolean ;
  TableName : string ;
begin

end;

procedure TmstKijun1Form.BitBtn2Click(Sender: TObject);
var
stmp : String;
cnt,cnt2 : integer;

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

end.
