unit FDokaizaiMasU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  mstU, StdCtrls, Mask, DBCtrls, Db, Grids, DBGrids, Buttons,
  ComCtrls, ExtCtrls,IniFiles, ADODB;

type
  TFDokaizaiMas = class(TmstForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Label9: TLabel;
    DBEdit10: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    LTanka: TLabel;
    Label10: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBTanka: TDBEdit;
    DBEdit9: TDBEdit;
    BtSentaku: TBitBtn;
    procedure BtSentakuClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private �錾 }
//    function GetKaseiCode : string ;
  public
    Mode : INteger;
    SizaiCode : String;
    Sizaimei : String;
    koumoku1 : double;
    koumoku2 : double;
    koumoku3 : double;
    koumoku4 : double;
    koumoku5 : double;
    koumoku6 : double;
    koumoku7 : double;
    koumoku8 : double;
    //koumoku9 : double;




    { Public �錾 }
  end;

var
  FDokaizaiMas: TFDokaizaiMas;

implementation

uses DMU;

{$R *.DFM}

procedure TFDokaizaiMas.BtSentakuClick(Sender: TObject);
begin

  SizaiCode := ds1.DataSet.FieldByName('�R�[�h').asString;
  Sizaimei := ds1.DataSet.FieldByName('���ޖ�').asString;

  koumoku1 := ds1.DataSet.FieldByName('�A���J����').asfloat;
  koumoku2 := ds1.DataSet.FieldByName('�����_').asfloat;
  koumoku3 := ds1.DataSet.FieldByName('��y').asfloat;
  koumoku4 := ds1.DataSet.FieldByName('�ΊD').asfloat;
  koumoku5 := ds1.DataSet.FieldByName('����').asfloat;
  koumoku6 := ds1.DataSet.FieldByName('�P�C�_').asfloat;
  koumoku7 := ds1.DataSet.FieldByName('�S').asfloat;
  koumoku8 := ds1.DataSet.FieldByName('�ő�{�p��').asfloat;

  close;

end;

procedure TFDokaizaiMas.FormShow(Sender: TObject);
begin

  SizaiCode := '';
  Sizaimei := '';
  koumoku1 := 0;
  koumoku2 := 0;
  koumoku3 := 0;
  koumoku4 := 0;
  koumoku5 := 0;
  koumoku6 := 0;
  koumoku7 := 0;
  koumoku8 := 0;
  //koumoku9 := 0;

 if Mode <> 0  then begin
   BtSentaku.Visible := true;
 end
 else begin
   BtSentaku.Visible := false;
 end;


end;

end.
