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
    { Private �錾 }
  public
    { Public �錾 }
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
    //�앨�ꗗ�����B
    SQL.Text := 'select * from M_SAKUMOTU';
    Open;
    cmbSakumotu.Items.Clear ;
    cmbSakumotu.Items.Add('�w�薳��');
    while not eof do begin
       cmbSakumotu.Items.Add(
        FieldByName('��ڃR�[�h').asString +' '+
        FieldByName('�앨�R�[�h').asString +' '+
        FieldByName('�앨��').asString
        );
      Next ;
    end;
    cmbSakumotu.ItemIndex := 0 ;
    Close;
//    SQL.Text := 'select * from M_SAKUMOTU where ��ڃR�[�h = :��ڃR�[�h';
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
    Table3.Filter :='��ڃR�[�h='+ strParts(cmbSakumotu.Text,1)+ ' and �앨�R�[�h='+strParts(cmbSakumotu.Text,2);
    Table3.Filtered := True ;
    Table3.FindFirst ;

    ADOTable1.Filter :='��ڃR�[�h='+ Table3.FieldByName('��ڃR�[�h').asString
        + ' and �앨�R�[�h='+Table3.FieldByName('�앨�R�[�h').asString
        + ' and ��^�R�[�h='+Table3.FieldByName('��^�R�[�h').asString;

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
    ADOTable1.Filter :='��ڃR�[�h='+ Table3.FieldByName('��ڃR�[�h').asString
        + ' and �앨�R�[�h='+Table3.FieldByName('�앨�R�[�h').asString
        + ' and ��^�R�[�h='+Table3.FieldByName('��^�R�[�h').asString;

    ADOTable1.Filtered := True ;
    ADOTable1.FindFirst ;

    if ADOTable1.RecordCount <= 0 then begin
       ADOTable1.Insert;
       ADOTable1.Edit;
       ADOTable1.FieldByname('��ڃR�[�h').AsString := Table3.FieldByName('��ڃR�[�h').asString;
       ADOTable1.FieldByname('�앨�R�[�h').AsString := Table3.FieldByName('�앨�R�[�h').asString;
       ADOTable1.FieldByname('��^�R�[�h').AsString := Table3.FieldByName('��^�R�[�h').asString;
    end;
 }
  end;


end;

end.
