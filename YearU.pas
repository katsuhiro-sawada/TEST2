unit YearU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls,IniFiles;

type
  TfrmYear = class(TForm)
    Bevel1: TBevel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private 宣言 }
    FYear:string;
  public
    { Public 宣言 }
  end;

var
  frmYear: TfrmYear;
function DspYear(var Year : string ) : Boolean;

implementation

{$R *.DFM}

uses DMU;

function DspYear(var Year : string ) : Boolean;
begin
  Application.CreateForm(TfrmYear, frmYear);
  frmYear.FYear := Year ;
  frmYear.ShowModal ;
  result := Year <> frmYear.FYear ;
  if result then Year := frmYear.FYear ;

  frmYear.Release ;
end;

procedure TfrmYear.FormCreate(Sender: TObject);
var
  aYears,cnt : integer ;
  bEnableOldYear : boolean;
begin
	Color := BackColor ;
	GroupBox1.Caption := EntryCenterName + 'の操作年度';
  //年度リストの取得
  //該当センターの登録年度数を取得する
  aYears := SystemIni.ReadInteger( EntryCenter , 'years', 0 );
  //[V2.1]  旧年操作可能フラグ取得、無ければ操作年のみ
//  if SystemIni.ReadBool( 'system' , 'EnableOldYear', false ) then begin
    for cnt := Strtoint(ThisYear)-aYears+1 to Strtoint(ThisYear) do
  	  ComboBox1.Items.Add( inttostr( cnt ));
//  end
//  else begin
    //登録可能年度のみ選択可
// 	  ComboBox1.Items.Add( ThisYear );
//  end;
end;

procedure TfrmYear.FormShow(Sender: TObject);
var
	cnt : integer ;
begin
  for cnt:=0 to ComboBox1.Items.Count -1 do begin
  	if ComboBox1.Items[cnt] = FYear then begin
      ComboBox1.ItemIndex := cnt ;
    	break;
    end;
  end;

end;


procedure TfrmYear.Button2Click(Sender: TObject);
begin
	Close;
end;

procedure TfrmYear.Button1Click(Sender: TObject);
begin
	FYear := ComboBox1.text ;
	Close;
end;

end.
