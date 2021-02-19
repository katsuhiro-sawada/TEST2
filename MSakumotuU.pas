unit MSakumotuU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  mstU, DBCtrls, StdCtrls, Mask, Db, DBTables, Buttons, Grids, DBGrids,
  ComCtrls, ExtCtrls, ADODB;

type
  TmstSakumotuForm = class(TmstForm)
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Label3: TLabel;
    ds2: TDataSource;
    Label5: TLabel;
    cmbSakumoku: TComboBox;
    ADOTable2: TADOTable;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPostClick(Sender: TObject);
    procedure cmbSakumokuChange(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure ds1StateChange(Sender: TObject);
  private
    { Private 宣言 }
  public
    { Public 宣言 }
  end;

var
  mstSakumotuForm: TmstSakumotuForm;

implementation

{$R *.DFM}
uses	DMU;

procedure TmstSakumotuForm.FormCreate(Sender: TObject);
begin
	with ADOTable2 do begin
    Open;
    cmbSakumoku.Items.Clear ;
    cmbSakumoku.Items.Add('指定無し');
    while not eof do begin
       cmbSakumoku.Items.Add(
        FieldByName('作目コード').asString +' '+
        FieldByName('作目名').asString
        );
      Next ;
    end;
    cmbSakumoku.ItemIndex := 0 ;
  end;
  inherited;

end;

procedure TmstSakumotuForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
	ADOTable2.Close;

end;

procedure TmstSakumotuForm.btnPostClick(Sender: TObject);
begin
	if not ChkEditLength(DBEdit1, 2 ) then exit;
  inherited;

end;

procedure TmstSakumotuForm.cmbSakumokuChange(Sender: TObject);
//スペース区切りの指定パラメータ文字列を返す
begin
  inherited;
  if cmbSakumoku.ItemIndex > 0 then begin
//    ADOTable1.Filter :='作目コード='+ strParts(cmbSakumoku.Text,1);
    ADOTable1.Filter :='作目コード='+ Copy(cmbSakumoku.Text,1,1);
    ADOTable1.Filtered := True ;
    ADOTable1.FindFirst ;
  end else begin
    ADOTable1.Filtered := False ;
  end;
end;

procedure TmstSakumotuForm.btnNewClick(Sender: TObject);
begin
  inherited;
  //絞り込み条件があればこれをセット
  if cmbSakumoku.ItemIndex > 0 then begin
//    ds1.DataSet.FieldByName('作目コード').asString := strParts(cmbSakumoku.Text,1);
    ds1.DataSet.FieldByName('作目コード').asString := Copy(cmbSakumoku.Text,1,1);
  end;

end;

procedure TmstSakumotuForm.ds1StateChange(Sender: TObject);
begin
  inherited;
  {新規の時のみ作目変更可}
  DBLookupComboBox1.ReadOnly := not (ds1.DataSet.State in [dsInsert]) ;
end;

end.
