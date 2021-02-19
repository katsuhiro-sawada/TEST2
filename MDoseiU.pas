unit MDoseiU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  mstU, StdCtrls, Mask, DBCtrls, Db, DBTables, Buttons, Grids, DBGrids,
  ComCtrls, ExtCtrls, Data.Win.ADODB;

type
  TmstDoseiForm = class(TmstForm)
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
  mstDoseiForm: TmstDoseiForm;

implementation

{$R *.DFM}

end.
