unit MSakugataU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  mstU, DBCtrls, StdCtrls, Mask, Db, DBTables, Buttons, Grids, DBGrids,
  ComCtrls, ExtCtrls, ADODB;

type
  TmstSakugataForm = class(TmstForm)
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    Label4: TLabel;
    btnCopy: TBitBtn;
    Btharituke: TBitBtn;
    ds2: TDataSource;
    ADOTable2: TADOTable;
    procedure FormShow(Sender: TObject);
  private
    { Private êÈåæ }
    FSakumotu : string ;
		fKeep : Boolean ;
  	sF1,sF2,sF3,sF4 : string ;
  public
    { Public êÈåæ }
  end;

var
  mstSakugataForm: TmstSakugataForm;

implementation

{$R *.DFM}
uses	DMU;

procedure TmstSakugataForm.FormShow(Sender: TObject);
begin
  inherited;

  ADOTable1.Close;
  ADOTable2.Close;


  ADOTable1.Open;
  ADOTable2.Open;





end;

end.
