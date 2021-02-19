unit M_TanpiU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  mstU, Db, DBTables, Grids, DBGrids, StdCtrls, Buttons, ComCtrls, ExtCtrls,
  Mask, DBCtrls,IniFiles, ADODB;

type
  TmstTanpiForm = class(TmstForm)
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    Label9: TLabel;
    DBEdit8: TDBEdit;
    ESisyoNo: TEdit;
    ADOQuery1: TADOQuery;
    gr1: TRadioGroup;
    BtTanpi: TBitBtn;
    procedure gr1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Table1AfterPost(DataSet: TDataSet);
    procedure BtTanpiClick(Sender: TObject);
  private
    procedure SetFilter;
    { Private 宣言 }
  public
    gr1index : integer;     //NPKMの初期
    btTanpiview : boolean;  //選択ボタンの表示
    tanpicode : String;
    tanpiname : String;
    { Public 宣言 }
  end;

var
  mstTanpiForm: TmstTanpiForm;

implementation

uses DMU;

{$R *.DFM}

procedure TmstTanpiForm.FormShow(Sender: TObject);
begin
  inherited;

  gr1.ItemIndex := gr1index;
  btTanpi.Visible := btTanpiview;

  tanpicode := '';
  tanpiname := '';


  SetFilter;
end;

procedure TmstTanpiForm.SetFilter;
var
  aBuff : string ;
begin
//  aBuff := 'CODE = '+ QuotedStr(IntToStr(gr1.ItemIndex + 1 ) +'*');
//  ADOTable2.Filter := aBuff ;
//  ADOTable2.Filtered := True ;

  //ADOTableでFilterがつかえないので　SQLで行う。
  aBuff := 'select * from M_TANPI where CODE LIKE "'+ IntToStr(gr1.ItemIndex + 1 ) + '%%"';
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add(aBuff);
  ADOQuery1.Open;

end;

procedure TmstTanpiForm.gr1Click(Sender: TObject);
begin
  inherited;
  SetFilter;
end;


procedure TmstTanpiForm.BtTanpiClick(Sender: TObject);
begin
  inherited;


  tanpicode := ADOQuery1.FieldByName('CODE').AsString;
  tanpiname := ADOQuery1.FieldByName('肥料名').AsString;

  close;



end;

procedure TmstTanpiForm.Table1AfterPost(DataSet: TDataSet);
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
    MasterIni.WriteDateTime( 'm_tanpi', stmp,now ) ;

    MasterIni.Free ;
  end
  else begin
    inherited;
  end;

end;

end.
