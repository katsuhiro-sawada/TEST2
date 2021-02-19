unit USousin;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TFSousin = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Btkanni: TBitBtn;
    BtKanzen: TBitBtn;
    Btsyuuryou: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure BtsyuuryouClick(Sender: TObject);
    procedure BtkanniClick(Sender: TObject);
    procedure BtKanzenClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private êÈåæ }
  public
    { Public êÈåæ }
  end;

var
  FSousin: TFSousin;

implementation

uses DMU;

{$R *.DFM}

procedure TFSousin.BtsyuuryouClick(Sender: TObject);
begin
   Tag := 0;
   close;
end;

procedure TFSousin.BtkanniClick(Sender: TObject);
begin
   Tag := 1;
   close;
end;

procedure TFSousin.BtKanzenClick(Sender: TObject);
begin
   Tag := 2;
   close;
end;

procedure TFSousin.FormShow(Sender: TObject);
begin

	Color := BackColor ;

end;

end.
