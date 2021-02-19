unit ProgressU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls;

type
  TfrmProgress = class(TForm)
    ProgressBar1: TProgressBar;
    btnCancel: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private 宣言 }
    FSCL : integer ;
    FCancel : Boolean ;
  public
    { Public 宣言 }
    function Scale( scl : integer ):Boolean;
    function  Progress( prog : integer ):Boolean;
    function Next:Boolean;
  end;

var
  frmProgress: TfrmProgress;
procedure OpenProgress;        {プログレス呼び出しに必要}
procedure CloseProgress;       {終了時呼び出し}
function NextProgress:Boolean; {集中的に処理する関数内で利用、事前にステップ数を指示＝.Scale}
                              {その際、戻り値がFalseなら処理中断する。Application.Processmessageを事前呼び出し}

implementation

{$R *.DFM}
procedure OpenProgress;
begin
  Application.CreateForm(TfrmProgress, frmProgress);
  frmProgress.Show ;
  frmProgress.Repaint  ;
end;
procedure CloseProgress;
begin
  frmProgress.Close;
  frmProgress.Release ;
  frmProgress := nil ;
end;
{このフォームを意識しないでプログレスを呼び出す関数}
function NextProgress:Boolean;
begin
  if frmProgress <> nil then
    result := frmProgress.Next
  else result := True ;
end;
procedure TfrmProgress.FormCreate(Sender: TObject);
begin
  FSCL := 10 ;
  FCancel := False ;
end;
{プログレス位置の強制指定：最大値１０００分の加算分 例：１００だと１０分割、１０だと１００分割}
function  TfrmProgress.Progress( prog : integer ):Boolean;
begin
  ProgressBar1.Position := prog ;
  Repaint;
  result := not FCancel ;
end;
{プログレス加算時の加算要素数の指定}
function  TfrmProgress.Scale( scl : integer ):Boolean;
begin
  FSCL := scl ;
  result := not FCancel ;
end;
{プログレス一つ進む：デフォルト１０００分の１０進む}
function  TfrmProgress.Next:Boolean;
begin
  Progress ( ProgressBar1.Position + FSCL ) ;
  result := not FCancel ;
end;

procedure TfrmProgress.btnCancelClick(Sender: TObject);
begin
  FCancel := True ;
end;

end.
