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
    { Private �錾 }
    function GetKaseiCode : string ;
  public
    { Public �錾 }
  end;

var
  mstKaseiForm: TmstKaseiForm;

implementation

uses DMU;

{$R *.DFM}

procedure TmstKaseiForm.Table1AfterInsert(DataSet: TDataSet);
begin
  inherited;
//�R�[�h�ԍ������蓖�Ă� 1000�Ԉȏ�̃J�E���^�^
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

//����

  if Eken.Text <> '' then begin

    stmp := 'Select �엿�R�[�h,�i��,* From M_KASEI6 Where �i�� like "%' + EKen.Text + '%"';
  end
  else begin
    stmp := 'Select �엿�R�[�h,�i��,* From M_KASEI6 Order BY �엿�R�[�h';
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
  stmp := 'Select �엿�R�[�h,�i��,* from M_KASEI6 Order BY �엿�R�[�h';
  ADOQuery1.SQL.Add(stmp);

  ADOQuery1.Open;


end;

end.
