unit USakhiSel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,DMU, StdCtrls, Buttons, Mask, DBCtrls, DB, ADODB, ExtCtrls;

type
  TFSakhiSel = class(TForm)
    Panel1: TPanel;
    ADOQuery1: TADOQuery;
    ds1: TDataSource;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    DBE1: TDBEdit;
    DBE2: TDBEdit;
    DBE3: TDBEdit;
    DBE4: TDBEdit;
    DBE5: TDBEdit;
    DBE6: TDBEdit;
    DBE7: TDBEdit;
    DBE8: TDBEdit;
    DBE9: TDBEdit;
    DBE10: TDBEdit;
    Label2: TLabel;
    EName1: TEdit;
    EName2: TEdit;
    EName3: TEdit;
    EName4: TEdit;
    EName5: TEdit;
    EName6: TEdit;
    EName7: TEdit;
    EName8: TEdit;
    EName9: TEdit;
    EName10: TEdit;
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    HiryouNO : integer;   //2 基肥　1 ワンタッチ
    SakumotuCD : String;
    SakugataCD : String;

    HiryouCD : String;
    HiryouName : String;
  end;

var
  FSakhiSel: TFSakhiSel;

implementation

{$R *.dfm}

procedure TFSakhiSel.BitBtn10Click(Sender: TObject);
begin
     HiryouCD := DBE9.Text;
     HiryouName := EName9.Text;
     close;

end;

procedure TFSakhiSel.BitBtn11Click(Sender: TObject);
begin
     HiryouCD := DBE10.Text;
     HiryouName := EName10.Text;
     close;

end;

procedure TFSakhiSel.BitBtn1Click(Sender: TObject);
begin

     HiryouCD := DBE1.Text;
     HiryouName := EName1.Text;
     close;
end;

procedure TFSakhiSel.BitBtn2Click(Sender: TObject);
begin

     HiryouCD := '';
     HiryouName := '';

close;
end;

procedure TFSakhiSel.BitBtn3Click(Sender: TObject);
begin
     HiryouCD := DBE2.Text;
     HiryouName := EName2.Text;
     close;

end;

procedure TFSakhiSel.BitBtn4Click(Sender: TObject);
begin
     HiryouCD := DBE3.Text;
     HiryouName := EName3.Text;
     close;

end;

procedure TFSakhiSel.BitBtn5Click(Sender: TObject);
begin
     HiryouCD := DBE4.Text;
     HiryouName := EName4.Text;
     close;

end;

procedure TFSakhiSel.BitBtn6Click(Sender: TObject);
begin
     HiryouCD := DBE5.Text;
     HiryouName := EName5.Text;
     close;

end;

procedure TFSakhiSel.BitBtn7Click(Sender: TObject);
begin
     HiryouCD := DBE6.Text;
     HiryouName := EName6.Text;
     close;

end;

procedure TFSakhiSel.BitBtn8Click(Sender: TObject);
begin
     HiryouCD := DBE7.Text;
     HiryouName := EName7.Text;
     close;

end;

procedure TFSakhiSel.BitBtn9Click(Sender: TObject);
begin
     HiryouCD := DBE8.Text;
     HiryouName := EName8.Text;
     close;

end;

procedure TFSakhiSel.FormShow(Sender: TObject);
var
stmp : String;
begin
	Color := BackColor ;

  if HiryouNO = 2 then begin
     DBE1.DataField := '化成1';
     DBE2.DataField := '化成2';
     DBE3.DataField := '化成3';
     DBE4.DataField := '化成4';
     DBE5.DataField := '化成5';
     DBE6.DataField := '化成6';
     DBE7.DataField := '化成7';
     DBE8.DataField := '化成8';
     DBE9.DataField := '化成9';
     DBE10.DataField := '化成10';

  end
  else begin
     DBE1.DataField := 'ワンタッチ1';
     DBE2.DataField := 'ワンタッチ2';
     DBE3.DataField := 'ワンタッチ3';
     DBE4.DataField := 'ワンタッチ4';
     DBE5.DataField := 'ワンタッチ5';
     DBE6.DataField := 'ワンタッチ6';
     DBE7.DataField := 'ワンタッチ7';
     DBE8.DataField := 'ワンタッチ8';
     DBE9.DataField := 'ワンタッチ9';
     DBE10.DataField := 'ワンタッチ10';
  end;


  if SakugataCD = '' then SakugataCD := '00';


  stmp := 'select * from M_SAKHI where 作物コード = ''' + SakumotuCD + ''' and 作型コード = ''' + SakugataCD + '''';

  ADOQuery1.CLose;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add(stmp);
  ADOQuery1.Open;


  stmp := DMU.GetHiryoName(DBE1.Text);
  if stmp <> '' then begin
    EName1.Text := stmp;
  end
  else begin
    EName1.Text := '';
  end;

  stmp := DMU.GetHiryoName(DBE2.Text);
  if stmp <> '' then begin
    EName2.Text := stmp;
  end
  else begin
    EName2.Text := '';
  end;

  stmp := DMU.GetHiryoName(DBE3.Text);
  if stmp <> '' then begin
    EName3.Text := stmp;
  end
  else begin
    EName3.Text := '';
  end;

  stmp := DMU.GetHiryoName(DBE4.Text);
  if stmp <> '' then begin
    EName4.Text := stmp;
  end
  else begin
    EName4.Text := '';
  end;

  stmp := DMU.GetHiryoName(DBE5.Text);
  if stmp <> '' then begin
    EName5.Text := stmp;
  end
  else begin
    EName5.Text := '';
  end;

  stmp := DMU.GetHiryoName(DBE6.Text);
  if stmp <> '' then begin
    EName6.Text := stmp;
  end
  else begin
    EName6.Text := '';
  end;

  stmp := DMU.GetHiryoName(DBE7.Text);
  if stmp <> '' then begin
    EName7.Text := stmp;
  end
  else begin
    EName7.Text := '';
  end;

  stmp := DMU.GetHiryoName(DBE8.Text);
  if stmp <> '' then begin
    EName8.Text := stmp;
  end
  else begin
    EName8.Text := '';
  end;

  stmp := DMU.GetHiryoName(DBE9.Text);
  if stmp <> '' then begin
    EName9.Text := stmp;
  end
  else begin
    EName9.Text := '';
  end;

  stmp := DMU.GetHiryoName(DBE10.Text);
  if stmp <> '' then begin
    EName10.Text := stmp;
  end
  else begin
    EName10.Text := '';
  end;



end;

end.
