unit MDokaizaiU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  mstU, StdCtrls, Mask, DBCtrls, Db, DBTables, Grids, DBGrids, Buttons,
  ComCtrls, ExtCtrls,IniFiles, ADODB;

type
  TmstDokaizaiForm = class(TmstForm)
    DBCheckBox1: TDBCheckBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    LTanka: TLabel;
    DBTanka: TDBEdit;
    ESisyoNo: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure Table1AfterPost(DataSet: TDataSet);
  private
    { Private 宣言 }
  public
    { Public 宣言 }
  end;

var
  mstDokaizaiForm: TmstDokaizaiForm;

implementation
uses DMU;

{$R *.DFM}

procedure TmstDokaizaiForm.FormCreate(Sender: TObject);
begin

{
  if JMode = 'Douou' then begin
      ADOTable1.DatabaseName := 'DOJO2';
  end
  else begin
      Table1.DatabaseName := 'DOJO';
  end;
}
  inherited;

end;

procedure TmstDokaizaiForm.Table1AfterPost(DataSet: TDataSet);
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
    MasterIni.WriteDateTime( 'm_dokaizai', stmp,now ) ;

    MasterIni.Free ;
  end
  else begin
    inherited;
  end;

end;

end.
