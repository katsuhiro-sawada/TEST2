unit UFSetHiryou;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls,DMU, StdCtrls, Mask, DBCtrls, DB, ADODB, Buttons,MainU;

type
  TFSetHiryou = class(TForm)
    Panel1: TPanel;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    DS1: TDataSource;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ADOQuery1: TADOQuery;
    DBEdit2: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit10: TDBEdit;
    Label13: TLabel;
    DBEdit11: TDBEdit;
    Label14: TLabel;
    DBEdit12: TDBEdit;
    Label15: TLabel;
    DBEdit13: TDBEdit;
    Label16: TLabel;
    DBEdit14: TDBEdit;
    Label17: TLabel;
    Label18: TLabel;
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private êÈåæ }
  public
    { Public êÈåæ }
    SNo : String;
  end;

var
  FSetHiryou: TFSetHiryou;

implementation

{$R *.dfm}

procedure TFSetHiryou.BitBtn1Click(Sender: TObject);
begin


  if ADOQuery1.State in [dsEdit] then  ADOQuery1.Post;


  close;

end;

procedure TFSetHiryou.BitBtn2Click(Sender: TObject);
begin

  ADOQuery1.close;
  close;


end;

procedure TFSetHiryou.FormShow(Sender: TObject);
var
stmp : string;
begin

Color := BackColor ;



 ADOQuery1.close;
 ADOQuery1.SQL.Clear;
 stmp := 'select * from T_SINDAN where ÉTÉìÉvÉãî‘çÜ = "'+MainForm.VSample+'"';
 ADOQuery1.SQL.Add(stmp);

 ADOQuery1.Open();




end;

end.
