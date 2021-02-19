unit MFushokuU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  mstU, Db, DBTables, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, ExtCtrls,
  Mask, DBCtrls;

type
  TmstFushokuForm = class(TmstForm)
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
  private
    { Private êÈåæ }
  public
    { Public êÈåæ }
  end;

var
  mstFushokuForm: TmstFushokuForm;

implementation

{$R *.DFM}

end.
