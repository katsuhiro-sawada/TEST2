unit MSakumokuU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  mstU, StdCtrls, Mask, DBCtrls, Db, DBTables, Buttons, Grids, DBGrids,
  ComCtrls, ExtCtrls, ADODB;

type
  TmstSakumokuForm = class(TmstForm)
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    AddQuery: TADOQuery;
  private
    { Private �錾 }
  public
    { Public �錾 }
  end;

var
  mstSakumokuForm: TmstSakumokuForm;

implementation

uses DMU;

{$R *.DFM}


end.
