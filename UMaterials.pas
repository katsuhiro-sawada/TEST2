unit UMaterials;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BitBtnEx, Vcl.StdCtrls, ButtonEx;

type
  TfrmMaterials = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    ButtonEx0: TButtonEx;
    ButtonEx1: TButtonEx;
    ButtonEx2: TButtonEx;
    ButtonEx3: TButtonEx;
    ButtonEx4: TButtonEx;
    btnExit: TButtonEx;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure btnExitClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private êÈåæ }
  public
    { Public êÈåæ }
  end;

var
  frmMaterials: TfrmMaterials;

implementation

{$R *.dfm}

procedure TfrmMaterials.btnExitClick(Sender: TObject);
begin

  Close;

end;

procedure TfrmMaterials.FormActivate(Sender: TObject);
begin

  frmMaterials.Left := frmMaterials.Left + 100;
  frmMaterials.top := frmMaterials.top + 100;

end;

end.
