unit MTikuU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  mstU, StdCtrls, Mask, DBCtrls, Db, DBTables, Buttons, Grids, DBGrids,
  ComCtrls, ExtCtrls, Data.Win.ADODB;

type
  TmstTikuForm = class(TmstForm)
    ds2: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    ADOTable2: TADOTable;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPostClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
  private
    { Private êÈåæ }
  public
    { Public êÈåæ }
  end;

var
  mstTikuForm: TmstTikuForm;

implementation

{$R *.DFM}
uses	DMU;

procedure TmstTikuForm.FormCreate(Sender: TObject);
begin
  inherited;
	//Table2.Open;
end;

procedure TmstTikuForm.FormShow(Sender: TObject);
begin
  inherited;

  ADOTable1.Close;
  ADOTable2.Close;


  ADOTable1.Open;
  ADOTable2.Open;


end;

procedure TmstTikuForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
	//Table2.Close;

end;

procedure TmstTikuForm.btnNewClick(Sender: TObject);
begin
  inherited;


//  ADOTable1.Insert;




end;

procedure TmstTikuForm.btnPostClick(Sender: TObject);
begin
	if not ChkEditLength(DBEdit1, 4 ) then exit;
  inherited;

end;

end.
