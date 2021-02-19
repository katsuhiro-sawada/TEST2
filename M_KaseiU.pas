unit M_KaseiU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  mstU, StdCtrls, Mask, DBCtrls, Db, Grids, DBGrids, Buttons,
  ComCtrls, ExtCtrls,IniFiles, ADODB;

type
  TmstKaseiForm = class(TmstForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit8: TDBEdit;
    Eken: TEdit;
    BtKensaku: TBitBtn;
    ADOQuery1: TADOQuery;
    procedure Table1AfterInsert(DataSet: TDataSet);
    procedure BtKensakuClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private 宣言 }
    function GetKaseiCode : string ;
  public
    { Public 宣言 }
  end;

var
  mstKaseiForm: TmstKaseiForm;

implementation

uses DMU;

{$R *.DFM}

procedure TmstKaseiForm.Table1AfterInsert(DataSet: TDataSet);
begin
  inherited;
//コード番号を割り当てる 1000番以上のカウンタ型
  DataSet.FieldByName('CODE').asString := GetKaseiCode ;
end;

function TmstKaseiForm.GetKaseiCode: string ;
var
  aCount : integer ;
begin
  aCount := 1000 ;
  result := inttostr(aCount);
end;

procedure TmstKaseiForm.BtKensakuClick(Sender: TObject);
var
stmp : String;

begin
  inherited;

//検索

  if Eken.Text <> '' then begin

    stmp := 'Select 肥料コード,品名,* From M_KASEI6 Where 品名 like "%' + EKen.Text + '%"';
  end
  else begin
    stmp := 'Select 肥料コード,品名,* From M_KASEI6 Order BY 肥料コード';
  end;


  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add(stmp);
  ADOQuery1.Open;



end;

procedure TmstKaseiForm.FormShow(Sender: TObject);
var
stmp : String;
begin
  inherited;

  ADOTable1.Close;
//  ADOTable2.Close;

  ADOQuery1.Close;

  ADOQuery1.SQL.Clear;
  stmp := 'Select 肥料コード,品名,* from M_KASEI6 Order BY 肥料コード';
  ADOQuery1.SQL.Add(stmp);

  ADOQuery1.Open;


end;

end.
