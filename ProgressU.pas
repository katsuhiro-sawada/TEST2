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
    { Private �錾 }
    FSCL : integer ;
    FCancel : Boolean ;
  public
    { Public �錾 }
    function Scale( scl : integer ):Boolean;
    function  Progress( prog : integer ):Boolean;
    function Next:Boolean;
  end;

var
  frmProgress: TfrmProgress;
procedure OpenProgress;        {�v���O���X�Ăяo���ɕK�v}
procedure CloseProgress;       {�I�����Ăяo��}
function NextProgress:Boolean; {�W���I�ɏ�������֐����ŗ��p�A���O�ɃX�e�b�v�����w����.Scale}
                              {���̍ہA�߂�l��False�Ȃ珈�����f����BApplication.Processmessage�����O�Ăяo��}

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
{���̃t�H�[�����ӎ����Ȃ��Ńv���O���X���Ăяo���֐�}
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
{�v���O���X�ʒu�̋����w��F�ő�l�P�O�O�O���̉��Z�� ��F�P�O�O���ƂP�O�����A�P�O���ƂP�O�O����}
function  TfrmProgress.Progress( prog : integer ):Boolean;
begin
  ProgressBar1.Position := prog ;
  Repaint;
  result := not FCancel ;
end;
{�v���O���X���Z���̉��Z�v�f���̎w��}
function  TfrmProgress.Scale( scl : integer ):Boolean;
begin
  FSCL := scl ;
  result := not FCancel ;
end;
{�v���O���X��i�ށF�f�t�H���g�P�O�O�O���̂P�O�i��}
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
