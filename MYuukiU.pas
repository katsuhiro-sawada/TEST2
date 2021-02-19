unit MYuukiU;
{
  有機マスタメンテフォーム
}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  mstU, StdCtrls, Mask, DBCtrls, Db, DBTables, Buttons, Grids, DBGrids,
  ComCtrls, ExtCtrls,IniFiles, ADODB;

type
  TmstYuukiForm = class(TmstForm)
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    Label4: TLabel;
    ESisyoNo: TEdit;
    ADOQuery1: TADOQuery;
    procedure btnPostClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Table1AfterPost(DataSet: TDataSet);
  private
    { Private 宣言 }
  public
    { Public 宣言 }
  end;

var
  mstYuukiForm: TmstYuukiForm;

implementation

{$R *.DFM}
uses	DMU;

procedure TmstYuukiForm.btnPostClick(Sender: TObject);
begin
	if not ChkEditLength(DBEdit1, 2 ) then exit;
  inherited;

end;

procedure TmstYuukiForm.btnNewClick(Sender: TObject);
var
  aCode,aCnt : integer ;
  sCode : string ;
begin
  {コードを二桁で自動割り当てする}
  with ADOQuery1 do begin
    SQL.Text := 'Select 有機物コード CODE from M_YUUKI order by CODE';
    Open;
    aCode := 1 ;
    aCnt := 1 ;
    while not Eof do begin
      if aCnt < FieldByName('CODE').asInteger then begin
        aCode := aCnt ;
        break;
      end;
      INC(aCnt);
      Next;
    end;
    Close;
  end;
  {空きがなければエラー}
  if aCnt >= 100 then begin
    ShowMessage('登録するコードに空きが有りません。');
    exit;
  end;

  sCode := Format('%.2d',[aCode]);
  inherited;
  ADOTable1.FieldByName('有機物コード').asString := sCode ;
end;

procedure TmstYuukiForm.FormCreate(Sender: TObject);
begin


{
  if JMode = 'Douou' then begin
      Query1.DatabaseName := 'DOJO2';
      ADOTable1.DatabaseName := 'DOJO2';
  end
  else begin
      Query1.DatabaseName := 'DOJO';
      ADOTable1.DatabaseName := 'DOJO';
  end;
}
  inherited;

end;

procedure TmstYuukiForm.Table1AfterPost(DataSet: TDataSet);
var
  MasterIni: TIniFile;
  stmp : String;
begin

  if JMode = 'Douou' then begin

    stmp := AppPath +	EntryCenter + '\' + EntryYear+'\'+SyncFile;
    MasterIni := TIniFile.Create(stmp);
    if MasterIni = nil then begin
  	showmessage('同期設定ファイルが見つかりません。');
      exit;
    end;
    stmp := 'update'+ESisyoNO.Text;
    MasterIni.WriteDateTime( 'm_yuuki', stmp,now ) ;

    MasterIni.Free ;
  end
  else begin
    inherited;
  end;

end;

end.
