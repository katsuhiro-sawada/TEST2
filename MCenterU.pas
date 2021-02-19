unit MCenterU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  mstU, StdCtrls, Mask, DBCtrls, Db, DBTables, Buttons, Grids, DBGrids,
  ComCtrls, ExtCtrls, ADODB;

type
  TmstCenterForm = class(TmstForm)
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    procedure btnPostClick(Sender: TObject);
    procedure ds1StateChange(Sender: TObject);
  private
    { Private 宣言 }
  public
    { Public 宣言 }
  end;

var
  mstCenterForm: TmstCenterForm;

implementation

{$R *.DFM}
uses	DMU;

procedure TmstCenterForm.btnPostClick(Sender: TObject);
begin
	if not ChkEditLength(DBEdit1, 2 ) then exit;
  inherited;

end;

procedure TmstCenterForm.ds1StateChange(Sender: TObject);
begin
  inherited;
	//センターコードは新規時のみ操作可
// 	DBEdit3.Enabled := ds1.DataSet.State = dsInsert ;

end;

end.
