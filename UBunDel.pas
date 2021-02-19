unit UBunDel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,DMU, DB, ADODB, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons;

type
  TFBunDel = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Ds1: TDataSource;
    Panel2: TPanel;
    ADOTable1: TADOTable;
    ADOTable1WideStringField: TWideStringField;
    ADOTable1SmallintField: TSmallintField;
    ADOTable1WideStringField36: TWideStringField;
    ADOTable1WideStringField38: TWideStringField;
    ADOTable1Field: TStringField;
    ADOTable1WideStringField10: TWideStringField;
    ADOTable1Field2: TStringField;
    ADOTable1WideStringField2: TWideStringField;
    ADOTable1WideStringField3: TWideStringField;
    ADOTable1WideStringField37: TWideStringField;
    ADOTable1Field3: TStringField;
    ADOTable1SmallintField12: TSmallintField;
    ADOTable1SmallintField13: TSmallintField;
    ADOTable1WideStringField39: TWideStringField;
    ADOTable1Field4: TStringField;
    ADOTable1WideStringField40: TWideStringField;
    ADOTable1Field5: TStringField;
    ADOTable1WideStringField41: TWideStringField;
    ADOTable1WideStringField42: TWideStringField;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ADONouka: TADOTable;
    ADOSakumotu: TADOTable;
    ADODojyou: TADOTable;
    ADODosei: TADOTable;
    ADOSakuSyurui: TADOTable;
    ADOSakuSyuruiaaaaa: TADOQuery;
    ADODoseiaaaa: TADOQuery;
    ADODojyouaaaa: TADOQuery;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    UPFlg : Boolean;
    { Public declarations }
  end;

var
  FBunDel: TFBunDel;

implementation

{$R *.dfm}

procedure TFBunDel.BitBtn1Click(Sender: TObject);
begin
//選択したものすべて削除

if Application.MessageBox('データを削除します。よろしいですか？','確認',MB_YESNO) = ID_NO then begin

   exit;

end;



DBGrid1.SelectedRows.Delete;
UPFlg := true;

end;

procedure TFBunDel.BitBtn2Click(Sender: TObject);
begin
close;
end;

procedure TFBunDel.FormCreate(Sender: TObject);
begin
  Color := BackColor ;

end;

procedure TFBunDel.FormShow(Sender: TObject);
begin

  UPFlg := false;
  ADOTable1.Close;

 //ADOTable1.Open;

  ADOTAble1.Open;



end;

end.
