unit UFSakumokuSel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TFSakumokuSel = class(TForm)
    CbSaku: TComboBox;
    BtSet: TBitBtn;
    CbSNo: TComboBox;
    CbENo: TComboBox;
    Label1: TLabel;
    procedure CbSakuChange(Sender: TObject);
    procedure CbSNoChange(Sender: TObject);
    procedure CbENoChange(Sender: TObject);
    procedure BtSetClick(Sender: TObject);
  private
    { Private êÈåæ }
  public
    { Public êÈåæ }
  end;

var
  FSakumokuSel: TFSakumokuSel;

implementation

{$R *.DFM}

procedure TFSakumokuSel.CbSakuChange(Sender: TObject);
begin
    CbSNo.ItemIndex := CbSaku.ItemIndex;
    CbENo.ItemIndex := CbSaku.ItemIndex;

end;

procedure TFSakumokuSel.CbSNoChange(Sender: TObject);
begin
    CbSaku.ItemIndex := CbSNo.ItemIndex;
    CbENo.ItemIndex := CbSNo.ItemIndex;

end;

procedure TFSakumokuSel.CbENoChange(Sender: TObject);
begin
    CbSNo.ItemIndex := CbENo.ItemIndex;
    CbSaku.ItemIndex := CbENo.ItemIndex;

end;

procedure TFSakumokuSel.BtSetClick(Sender: TObject);
begin

  if CbSaku.Text = '' then begin
      ShowMessage('çÏñ⁄ÇëIëÇµÇƒÇ≠ÇæÇ≥Ç¢ÅB' );
      exit;
  end;



  close;
end;

end.
