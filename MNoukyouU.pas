unit MNoukyouU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  mstU, Db, DBTables, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, ExtCtrls,
  Mask, DBCtrls, ADODB;

type
  TmstNoukyouForm = class(TmstForm)
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
  private
    { Private êÈåæ }
  public
    { Public êÈåæ }
  end;

var
  mstNoukyouForm: TmstNoukyouForm;

implementation

uses DMU;

{$R *.DFM}

end.
