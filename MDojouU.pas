unit MDojouU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  mstU, StdCtrls, Mask, DBCtrls, Db, DBTables, Buttons, Grids, DBGrids,
  ComCtrls, ExtCtrls;

type
  TmstDojouForm = class(TmstForm)
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    DBEdit4: TDBEdit;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    procedure btnPostClick(Sender: TObject);
  private
    { Private êÈåæ }
  public
    { Public êÈåæ }
  end;

var
  mstDojouForm: TmstDojouForm;

implementation

{$R *.DFM}
uses	DMU;

procedure TmstDojouForm.btnPostClick(Sender: TObject);
begin
	if not ChkEditLength(DBEdit1, 2 ) then exit;
  inherited;

end;

end.
