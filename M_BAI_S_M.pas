unit M_BAI_S_M;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  MSehiU, StdCtrls, Mask, DBCtrls, ExtCtrls, Db, DBTables, ComCtrls,
  Buttons, ADODB;

type
  TmstBai_S_MForm = class(TmstSehiBasicForm)
    Shape1: TShape;
    Shape6: TShape;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Shape3: TShape;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit9: TDBEdit;
    Label3: TLabel;
    Shape2: TShape;
    procedure FormCreate(Sender: TObject);
  private
    { Private êÈåæ }
  public
    { Public êÈåæ }
  end;

var
  mstBai_S_MForm: TmstBai_S_MForm;

implementation

{$R *.DFM}

procedure TmstBai_S_MForm.FormCreate(Sender: TObject);
begin
  inherited;
  ADOTable1.Open;
end;

end.
