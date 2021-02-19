unit UBunTaihi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,DMU, ExtCtrls, DB, StdCtrls, Buttons, Mask, DBCtrls, ADODB;

type
  TFBunTaihi = class(TForm)
    Panel1: TPanel;
    ADOQuery1: TADOQuery;
    DBName1: TDBEdit;
    Label1: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBName2: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    BitBtn3: TBitBtn;
    DBName3: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    BitBtn4: TBitBtn;
    ds1: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sampleNO : String;
    TaihiName : String;
    TaihiCode : String;
  end;

var
  FBunTaihi: TFBunTaihi;

implementation

{$R *.dfm}

procedure TFBunTaihi.BitBtn1Click(Sender: TObject);
begin

  TaihiName := DBName1.Text;
  TaihiCode := 'T1';

  close;

end;

procedure TFBunTaihi.BitBtn2Click(Sender: TObject);
begin
close;
end;

procedure TFBunTaihi.BitBtn3Click(Sender: TObject);
begin
  TaihiName := DBName2.Text;
  TaihiCode := 'T2';

  close;

end;

procedure TFBunTaihi.BitBtn4Click(Sender: TObject);
begin
  TaihiName := DBName3.Text;
  TaihiCode := 'T3';

  close;

end;

procedure TFBunTaihi.FormShow(Sender: TObject);
var
stmp : String;
begin

	Color := BackColor ;


  stmp := 'select * from T_UKETUKE where ÉTÉìÉvÉãî‘çÜ = ''' + sampleNO + '''';

  ADOQuery1.CLose;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add(stmp);
  ADOQuery1.Open;



end;

end.
