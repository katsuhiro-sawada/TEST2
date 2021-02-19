unit M_BAI_S_K;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  MSehiU, StdCtrls, Mask, DBCtrls, ExtCtrls, Db, DBTables, ComCtrls,
  Buttons, ADODB;

type
  TmstBai_S_KForm = class(TmstSehiBasicForm)
    Shape1: TShape;
    Shape6: TShape;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Shape2: TShape;
    Shape3: TShape;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit17: TDBEdit;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private êÈåæ }
  public
    { Public êÈåæ }
  end;

var
  mstBai_S_KForm: TmstBai_S_KForm;

implementation

{$R *.DFM}

procedure TmstBai_S_KForm.FormCreate(Sender: TObject);
begin
  inherited;
   ADOTable1.Open;

end;

end.
