unit UBukai;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  mstU, Db, DBTables, Grids, DBGrids, StdCtrls, Buttons, ComCtrls, ExtCtrls,
  Mask, DBCtrls, ADODB;

type
  TmstBukaiForm = class(TmstForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
  private
    { Private �錾 }
  public
    { Public �錾 }
  end;

var
  mstBukaiForm: TmstBukaiForm;

implementation

{$R *.DFM}

end.
