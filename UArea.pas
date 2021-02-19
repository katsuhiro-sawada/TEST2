unit UArea;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ButtonEx;

type
  TfrmArea = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    ButtonEx0: TButtonEx;
    ButtonEx1: TButtonEx;
    btnExit: TButtonEx;
    Label2: TLabel;
    procedure btnExitClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ButtonEx0Click(Sender: TObject);
    procedure ButtonEx1Click(Sender: TObject);
  private
    { Private êÈåæ }
  public
    { Public êÈåæ }
  end;

var
  frmArea: TfrmArea;

implementation

{$R *.dfm}

uses
  MNoukyouU, MTikuU;

procedure TfrmArea.btnExitClick(Sender: TObject);
begin

  Close;

end;

procedure TfrmArea.ButtonEx0Click(Sender: TObject);
var
  oldColor : TColor;
begin

  oldColor := ButtonEx0.Color;
  ButtonEx0.Color := clMoneyGreen;

  Application.CreateForm(TmstNoukyouForm, mstNoukyouForm);
	mstNoukyouForm.ShowModal ;
  mstNoukyouForm.Release ;

  ButtonEx0.Color := oldColor;

end;

procedure TfrmArea.ButtonEx1Click(Sender: TObject);
var
  oldColor : TColor;
begin

  oldColor := ButtonEx1.Color;
  ButtonEx1.Color := clMoneyGreen;

  Application.CreateForm(TmstTikuForm, mstTikuForm);
  mstTikuForm.ShowModal ;
  mstTikuForm.Release ;

  ButtonEx1.Color := oldColor;

end;

procedure TfrmArea.FormActivate(Sender: TObject);
begin

  frmArea.Left := frmArea.Left + 100;
  frmArea.top := frmArea.top + 100;

end;

end.
