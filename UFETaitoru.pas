unit UFETaitoru;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,DMU, ExtCtrls, StdCtrls, Buttons;

type
  TFETaitoru = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    ENo: TEdit;
    Label2: TLabel;
    EJA: TEdit;
    Label3: TLabel;
    ESisyo: TEdit;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    JaName : String;
  end;

var
  FETaitoru: TFETaitoru;

implementation

{$R *.dfm}

procedure TFETaitoru.BitBtn1Click(Sender: TObject);
begin
    Close;

end;

procedure TFETaitoru.FormShow(Sender: TObject);
begin

  Color := BackColor ;

  EJa.Text := JaName;


end;

end.
