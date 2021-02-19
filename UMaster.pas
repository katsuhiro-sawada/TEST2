unit UMaster;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BitBtnEx, Vcl.StdCtrls, ButtonEx;

type
  TfrmMaster = class(TForm)
    ButtonEx0: TButtonEx;
    Label1: TLabel;
    Label3: TLabel;
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
    procedure ButtonEx3Click(Sender: TObject);
    procedure ButtonEx4Click(Sender: TObject);
  private
    { Private êÈåæ }
  public
    { Public êÈåæ }
  end;

var
  frmMaster: TfrmMaster;

implementation

{$R *.dfm}

uses
  UMaterials, UArea;

procedure TfrmMaster.btnExitClick(Sender: TObject);
begin

	Close;

end;

procedure TfrmMaster.ButtonEx3Click(Sender: TObject);
var
  oldColor : TColor;
begin

    oldColor := ButtonEx3.Color;
    ButtonEx3.Color := clAqua;

    Application.CreateForm(TfrmMaterials, frmMaterials);
    frmMaterials.ShowModal ;
    frmMaterials.Release ;

    ButtonEx3.Color := oldColor;

end;

procedure TfrmMaster.ButtonEx4Click(Sender: TObject);
var
  oldColor : TColor;
begin

    oldColor := ButtonEx4.Color;
    ButtonEx4.Color := clAqua;

    Application.CreateForm(TfrmArea, frmArea);
    frmArea.ShowModal ;
    frmArea.Release ;

    ButtonEx4.Color := oldColor;

end;

end.
