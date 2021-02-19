unit MNoukaU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  mstU, Db, DBTables, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, ExtCtrls,
  DBCtrls, Mask, ADODB;

type
  TmstNoukaForm = class(TmstForm)
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    ds2: TDataSource;
    btnFind: TBitBtn;
    Label8: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    Label9: TLabel;
    DBEdit7: TDBEdit;
    ds3: TDataSource;
    Label10: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    ds4: TDataSource;
    Label11: TLabel;
    DBLookupComboBox4: TDBLookupComboBox;
    Label12: TLabel;
    DBLookupComboBox5: TDBLookupComboBox;
    ds5: TDataSource;
    ds6: TDataSource;
    ADOTable2: TADOTable;
    ADOTable3: TADOTable;
    ADOTable4: TADOTable;
    QCity: TADOQuery;
    QTiku: TADOQuery;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPostClick(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure ds1StateChange(Sender: TObject);
    procedure Table1BeforePost(DataSet: TDataSet);
    procedure DBLookupComboBox4Exit(Sender: TObject);
    procedure ADOTable1BeforePost(DataSet: TDataSet);
  private
    FCityCD : string ;
    { Private 宣言 }
  public
    { Public 宣言 }
  end;

var
  mstNoukaForm: TmstNoukaForm;

implementation

uses	DMU, SNoukaU;

{$R *.DFM}

procedure TmstNoukaForm.FormShow(Sender: TObject);
begin
  inherited;

  FCityCD := ds1.DataSet.FieldByName('市町村コード').asString ;
  with QCity do begin
  	Close;
    SQL.Text := 'select M_CITY.* from M_CITY,M_CENTER  '+
    						'where M_CITY.センターコード = M_CENTER.センターコード and '+
								'センター記号 = "'+ EntryCenter +'"';
    Open;
  end;
  with QTiku do begin
  	Close;
    SQL.Text := 'select M_TIKU.* from M_TIKU  '+
    						'where M_TIKU.市町村コード = :市町村コード' ;
    Open;
  end;

	ADOTable2.Open;
        ADOTable3.Open;
        ADOTable4.Open;
end;

procedure TmstNoukaForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
	ADOTable2.Close;
        ADOTable3.Close;
        ADOTable4.Close;
end;

procedure TmstNoukaForm.btnPostClick(Sender: TObject);
begin
	if not ChkEditLength(DBEdit1, 6 ) then exit;
  inherited;

end;

procedure TmstNoukaForm.ADOTable1BeforePost(DataSet: TDataSet);
begin
  inherited;
  if ADOTable1.State <> dsEdit then begin
     ADOTable1.Edit;
  end;
  if (JMode = 'Douou') or (JMode = 'Sinsino') then
  ADOTable1.FieldByName('編集日').asDateTime := now;

end;

procedure TmstNoukaForm.btnFindClick(Sender: TObject);
var
  NoukaCd : string ;
begin
  inherited;
  //自分の検索
  NoukaCd := '';
  if DspSNouka(NoukaCd) then begin
    ADOTable1.Locate('農家番号',NoukaCd,[]);
  end;
end;

procedure TmstNoukaForm.ds1StateChange(Sender: TObject);
begin
  inherited;
   btnFind.Enabled :=  not( ds1.DataSet.State in [dsEdit	,dsInsert] );
end;

procedure TmstNoukaForm.Table1BeforePost(DataSet: TDataSet);
begin
  inherited;
  if ADOTable1.State <> dsEdit then begin
     ADOTable1.Edit;
  end;
  if (JMode = 'Douou') or (JMode = 'Sinsino') then
  ADOTable1.FieldByName('編集日').asDateTime := now;

end;

procedure TmstNoukaForm.DBLookupComboBox4Exit(Sender: TObject);
begin
  inherited;
  if ds1.DataSet.FieldByName('市町村コード').asString = FCityCD then
  	exit;
  FCityCD := ds1.DataSet.FieldByName('市町村コード').asString ;
	if ds1.DataSet.State in [dsEdit	,dsInsert] then
		ds1.DataSet.FieldByName('地区コード').asString := '' ;
	if  DBLookupComboBox1.Text<>'' then
  	with QTiku do begin
    	close;
      open;
    end;

end;

end.
