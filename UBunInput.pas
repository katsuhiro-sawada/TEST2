unit UBunInput;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Spin, StdCtrls, Buttons, ExtCtrls,DMU;

type
  TFBunInput = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Esample: TEdit;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    SpHako: TSpinEdit;
    Label4: TLabel;
    SpKazu: TSpinEdit;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label3: TLabel;
    ETantou: TEdit;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBunInput: TFBunInput;

implementation

{$R *.dfm}

procedure TFBunInput.BitBtn1Click(Sender: TObject);
var
stmp : string;

begin

//本日の日付　＋０１ を追加


   DateTImeToString(stmp, 'mmdd', now );

   stmp := stmp + '01';

   Esample.Text := stmp;


end;

procedure TFBunInput.BitBtn2Click(Sender: TObject);
var
itmp : integer;
begin

  itmp := StrToIntDef(Esample.Text, 0);
  if itmp = 0 then begin

    showmessage('サンプル番号が正しい入力ではありません。');
    exit;
  end;


  if spHako.Text = '' then begin
    showmessage('箱番号を入力してください。');
    exit;
  end;

  if spKazu.Text = '' then begin
    showmessage('追加サンプル数を入力してください。');
    exit;
  end;


  //iniファイルに
  SystemIni.WriteString('BUNSEKI','SAMPLENO',Esample.Text);
  SystemIni.WriteString('BUNSEKI','HAKONO',spHako.Text);
  SystemIni.WriteString('BUNSEKI','KAZU',spKazu.Text);

  SystemIni.WriteString('BUNSEKI','TANTOU',ETantou.Text);




  Tag := 1;
  close;

end;

procedure TFBunInput.BitBtn3Click(Sender: TObject);
begin
  Tag := 0;
  close;
end;

procedure TFBunInput.FormShow(Sender: TObject);
begin
   Tag := 0;

  Esample.Text := Systemini.ReadString('BUNSEKI','SAMPLENO','000001');
  spHako.Text := Systemini.ReadString('BUNSEKI','HAKONO','1');
  spKazu.Text := Systemini.ReadString('BUNSEKI','KAZU','1');

  ETantou.Text := Systemini.ReadString('BUNSEKI','TANTOU','XXXXXXX');

end;

end.
