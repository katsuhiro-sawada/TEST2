unit MCityU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  mstU, DBCtrls, StdCtrls, Mask, Db, DBTables, Buttons, Grids, DBGrids,
  ComCtrls, ExtCtrls, ADODB;

type
  TmstCityForm = class(TmstForm)
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    ds2: TDataSource;
    Label4: TLabel;
    Label5: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    DataSource1: TDataSource;
    DBLookupComboBox3: TDBLookupComboBox;
    DataSource2: TDataSource;
    BtClsCenter: TBitBtn;
    ADOTable2: TADOTable;
    TableTitaiH: TADOTable;
    TableTitaiS: TADOTable;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPostClick(Sender: TObject);
    procedure BtClsCenterClick(Sender: TObject);
  private
    { Private 宣言 }
  public
    { Public 宣言 }
  end;

var
  mstCityForm: TmstCityForm;

implementation

{$R *.DFM}
uses	DMU;

procedure TmstCityForm.FormCreate(Sender: TObject);
begin
  inherited;
	ADOTable2.Open;
  TableTitaiH.Open;
  TableTitaiS.Open;
end;

procedure TmstCityForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
	ADOTable2.Close;
  TableTitaiH.Close;
  TableTitaiS.Close;

end;

procedure TmstCityForm.btnPostClick(Sender: TObject);
begin
	if not ChkEditLength(DBEdit1, 3 ) then exit;

  inherited;

end;

procedure TmstCityForm.BtClsCenterClick(Sender: TObject);
begin
  if ADOTable1.State = dsEdit then begin
     ADOTable1.FieldByName( 'センターコード' ).AsString := '';
  end;
  inherited;
end;

end.
