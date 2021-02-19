unit UFTaihiMas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, mstU, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons,
  ComCtrls, ExtCtrls, Mask, DBCtrls;

type
  TFTaihiMas = class(TmstForm)
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit12: TDBEdit;
    Label10: TLabel;
    DBEdit13: TDBEdit;
    BtSentaku: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtSentakuClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    SelFlg : Boolean;
    TaihiName : String;
    TaihiCD : String;

  end;

var
  FTaihiMas: TFTaihiMas;

implementation

{$R *.dfm}

procedure TFTaihiMas.BtSentakuClick(Sender: TObject);
begin
  inherited;

  //選択実行


  TaihiCD := ADOTable1.FieldByName('堆肥コード').AsString;
  TaihiName := ADOTable1.FieldByName('名称').AsString;

  Close;

end;

procedure TFTaihiMas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  ADOTable1.Close;

end;

procedure TFTaihiMas.FormShow(Sender: TObject);
begin
  inherited;


  //選択ボタンの表示有無
  BtSentaku.Visible := SelFlg;
  TaihiName := '';
  TaihiCD := '';



  ADOTable1.Close;
  ADOTable1.TableName := 'M_TAIHI';
  ADOTable1.Open;


end;

end.
