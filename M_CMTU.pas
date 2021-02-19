unit M_CMTU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  mstU, StdCtrls, DBCtrls, DBTables, Db, Grids, DBGrids, Buttons, ComCtrls,
  ExtCtrls, ADODB;

type
  TmstCMTForm = class(TmstForm)
    DBMemo1: TDBMemo;
    Label1: TLabel;
    DataSource1: TDataSource;
    Panel1: TPanel;
    Label5: TLabel;
    cmbSakumotu: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmbSakumotuChange(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    { Private 宣言 }
  public
    { Public 宣言 }
  end;

var
  mstCMTForm: TmstCMTForm;

implementation


{$R *.DFM}
uses	DMU;

procedure TmstCMTForm.FormCreate(Sender: TObject);
begin
  inherited;

{

  ADOTable2.Open;
  ADOTable3.Open;
  with ADOQuery1 do begin
    //作物一覧を作る。
    SQL.Text := 'select * from M_SAKUMOTU';
    Open;
    cmbSakumotu.Items.Clear ;
    cmbSakumotu.Items.Add('指定無し');
    while not eof do begin
       cmbSakumotu.Items.Add(
        FieldByName('作目コード').asString +' '+
        FieldByName('作物コード').asString +' '+
        FieldByName('作物名').asString
        );
      Next ;
    end;
    cmbSakumotu.ItemIndex := 0 ;
    Close;
//    SQL.Text := 'select * from M_SAKUMOTU where 作目コード = :作目コード';
//    Open;
  end;
}
  //
end;

procedure TmstCMTForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
//
end;

procedure TmstCMTForm.cmbSakumotuChange(Sender: TObject);
begin
  inherited;
  if cmbSakumotu.ItemIndex > 0 then begin
{
    Table3.Filter :='作目コード='+ strParts(cmbSakumotu.Text,1)+ ' and 作物コード='+strParts(cmbSakumotu.Text,2);
    Table3.Filtered := True ;
    Table3.FindFirst ;

    ADOTable1.Filter :='作目コード='+ Table3.FieldByName('作目コード').asString
        + ' and 作物コード='+Table3.FieldByName('作物コード').asString
        + ' and 作型コード='+Table3.FieldByName('作型コード').asString;

    ADOTable1.Filtered := True ;
    ADOTable1.FindFirst ;

}
  end else begin
    ADOTable1.Filtered := False ;
  end;

end;

procedure TmstCMTForm.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  if cmbSakumotu.ItemIndex > 0 then begin

 {
    ADOTable1.Filter :='作目コード='+ Table3.FieldByName('作目コード').asString
        + ' and 作物コード='+Table3.FieldByName('作物コード').asString
        + ' and 作型コード='+Table3.FieldByName('作型コード').asString;

    ADOTable1.Filtered := True ;
    ADOTable1.FindFirst ;

    if ADOTable1.RecordCount <= 0 then begin
       ADOTable1.Insert;
       ADOTable1.Edit;
       ADOTable1.FieldByname('作目コード').AsString := Table3.FieldByName('作目コード').asString;
       ADOTable1.FieldByname('作物コード').AsString := Table3.FieldByName('作物コード').asString;
       ADOTable1.FieldByname('作型コード').AsString := Table3.FieldByName('作型コード').asString;
    end;
 }
  end;


end;

end.
