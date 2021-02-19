unit UFDokaiChenge;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, mstU, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons,
  ComCtrls, ExtCtrls, Mask, DBCtrls, DMU,FDokaizaiMasU,PrnCanvasU,UBunTaihi;

type
  TFDokaiChenge = class(TmstForm)
    DBEdit1: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    ADOQuery1: TADOQuery;
    Button2: TButton;
    E11: TEdit;
    E12: TEdit;
    E13: TEdit;
    E14: TEdit;
    Button1: TButton;
    Button3: TButton;
    Button4: TButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    ETaihi: TEdit;
    Button5: TButton;
    BitBtn5: TBitBtn;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    EKasei1: TEdit;
    Button6: TButton;
    BitBtn6: TBitBtn;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    EKasei2: TEdit;
    Button7: TButton;
    BitBtn7: TBitBtn;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    ADOTable3: TADOTable;
    DsKouryo: TDataSource;
    Button8: TButton;
    Button9: TButton;
    DBEdit9: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
  Vsample : String;
    { Public declarations }
  end;

var
  FDokaiChenge: TFDokaiChenge;

implementation

uses UFTaihiMas,USakhiSel;

{$R *.dfm}

procedure TFDokaiChenge.BitBtn1Click(Sender: TObject);
begin
  inherited;

  //クリア1
  if ds1.State <> dsEdit then ds1.Edit;
  ds1.DataSet.FieldByName('リン酸資材コード').AsString := '';
  E11.Text := '';

end;

procedure TFDokaiChenge.BitBtn2Click(Sender: TObject);
begin
  inherited;
  if ds1.State <> dsEdit then ds1.Edit;
  ds1.DataSet.FieldByName('石灰資材コード').AsString := '';
   E12.Text := '';

end;

procedure TFDokaiChenge.BitBtn3Click(Sender: TObject);
begin
  inherited;
  if ds1.State <> dsEdit then ds1.Edit;
     ds1.DataSet.FieldByName('苦土資材コード').AsString := '';
     E13.Text := '';

end;

procedure TFDokaiChenge.BitBtn4Click(Sender: TObject);
begin
  inherited;
  if ds1.State <> dsEdit then ds1.Edit;
  ds1.DataSet.FieldByName('加里資材コード').AsString := ''; //FDokaizaiMas.Sizaicode;
  E14.Text := ''; //FDokaizaiMas.Sizaimei;

end;

procedure TFDokaiChenge.BitBtn5Click(Sender: TObject);
begin
  inherited;
  if ds1.State <> dsEdit then ds1.Edit;
  ds1.DataSet.FieldByName('堆肥コード').AsString := ''; //FDokaizaiMas.Sizaicode;
  ETaihi.Text := ''; //FDokaizaiMas.Sizaimei;

end;

procedure TFDokaiChenge.BitBtn6Click(Sender: TObject);
begin
  inherited;
  if ds1.State <> dsEdit then ds1.Edit;
  ds1.DataSet.FieldByName('肥料1コード').AsString := ''; //FDokaizaiMas.Sizaicode;
  EKasei1.Text := ''; //FDokaizaiMas.Sizaimei;

end;

procedure TFDokaiChenge.BitBtn7Click(Sender: TObject);
begin
  inherited;
  if ds1.State <> dsEdit then ds1.Edit;
  ds1.DataSet.FieldByName('肥料2コード').AsString := ''; //FDokaizaiMas.Sizaicode;
  EKasei2.Text := ''; //FDokaizaiMas.Sizaimei;

end;

procedure TFDokaiChenge.Button1Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFDokaizaiMas, FDokaizaiMas);
  FDokaizaiMas.Mode := 1;
  FDokaizaiMas.ShowModal;

  if FDokaizaiMas.Sizaicode <> '' then begin
    if ds1.State <> dsEdit then ds1.Edit;

     ds1.DataSet.FieldByName('石灰資材コード').AsString := FDokaizaiMas.Sizaicode;

     E12.Text := FDokaizaiMas.Sizaimei;
  end;

  FDokaizaiMas.Release ;

end;

procedure TFDokaiChenge.Button2Click(Sender: TObject);
begin
  inherited;

  Application.CreateForm(TFDokaizaiMas, FDokaizaiMas);
  FDokaizaiMas.Mode := 1;
  FDokaizaiMas.ShowModal;

  if FDokaizaiMas.Sizaicode <> '' then begin
    if ds1.State <> dsEdit then ds1.Edit;

     ds1.DataSet.FieldByName('リン酸資材コード').AsString := FDokaizaiMas.Sizaicode;

     E11.Text := FDokaizaiMas.Sizaimei;
  end;

  FDokaizaiMas.Release ;


end;

procedure TFDokaiChenge.Button3Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFDokaizaiMas, FDokaizaiMas);
  FDokaizaiMas.Mode := 1;
  FDokaizaiMas.ShowModal;

  if FDokaizaiMas.Sizaicode <> '' then begin
    if ds1.State <> dsEdit then ds1.Edit;

     ds1.DataSet.FieldByName('苦土資材コード').AsString := FDokaizaiMas.Sizaicode;

     E13.Text := FDokaizaiMas.Sizaimei;
  end;

  FDokaizaiMas.Release ;

end;

procedure TFDokaiChenge.Button4Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFDokaizaiMas, FDokaizaiMas);
  FDokaizaiMas.Mode := 1;
  FDokaizaiMas.ShowModal;

  if FDokaizaiMas.Sizaicode <> '' then begin
    if ds1.State <> dsEdit then ds1.Edit;

     ds1.DataSet.FieldByName('加里資材コード').AsString := FDokaizaiMas.Sizaicode;

     E14.Text := FDokaizaiMas.Sizaimei;
  end;

  FDokaizaiMas.Release ;

end;

procedure TFDokaiChenge.Button5Click(Sender: TObject);
begin
  inherited;
  //分析堆肥選択
  Application.CreateForm(TFBunTaihi, FBunTaihi);
  //最初の一覧表示
  FBunTaihi.sampleNO := Vsample;
  FBunTaihi.ShowModal ;


  if FBunTaihi.TaihiName <> '' then begin
    if ds1.State <> dsEdit then ds1.Edit;

     ds1.DataSet.FieldByName('堆肥コード').AsString := FBunTaihi.TaihiCode;

     ETaihi.Text := FBunTaihi.TaihiName;

  end;


  FBunTaihi.Release;


end;

procedure TFDokaiChenge.Button6Click(Sender: TObject);
begin
  inherited;
  //ワンタッチ
  Application.CreateForm(TFSakhiSel, FSakhiSel);
  FSakhiSel.HiryouNO := 1;
  FSakhiSel.SakumotuCD := ds1.DataSet.FieldByName('作物コード').AsString;
  FSakhiSel.SakugataCD := ds1.DataSet.FieldByName('作型コード').AsString;
  FSakhiSel.ShowModal ;


  if FSakhiSel.HiryouCD <> '' then begin
     if ds1.State <> dsEdit then ds1.Edit;
     ds1.DataSet.FieldByName('肥料1コード').AsString := FSakhiSel.HiryouCD;
     EKasei1.Text :=  FSakhiSel.HiryouName;

  end;

end;

procedure TFDokaiChenge.Button7Click(Sender: TObject);
begin
  inherited;
  //基肥
  Application.CreateForm(TFSakhiSel, FSakhiSel);
  FSakhiSel.HiryouNO := 2;
  FSakhiSel.SakumotuCD := ds1.DataSet.FieldByName('作物コード').AsString;
  FSakhiSel.SakugataCD := ds1.DataSet.FieldByName('作型コード').AsString;
  FSakhiSel.ShowModal ;


  if FSakhiSel.HiryouCD <> '' then begin
     if ds1.State <> dsEdit then ds1.Edit;
     ds1.DataSet.FieldByName('肥料2コード').AsString := FSakhiSel.HiryouCD;
     EKasei2.Text :=  FSakhiSel.HiryouName;

  end;




end;

procedure TFDokaiChenge.Button8Click(Sender: TObject);
begin
  inherited;

  Application.CreateForm(TFTaihiMas, FTaihiMas);
  FTaihiMas.SelFlg := True;
  FTaihiMas.ShowModal ;

  if FTaihiMas.Name <> '' then begin
    ETaihi.Text := FTaihiMas.TaihiName;
    if ds1.State <> dsEdit then ds1.Edit;
    ds1.DataSet.FieldByName('堆肥コード').AsString := FTaihiMas.TaihiCD;
  end;
  FTaihiMas.Release ;

end;

procedure TFDokaiChenge.Button9Click(Sender: TObject);
begin
  inherited;

  if ds1.State <> dsEdit then ds1.Edit;

  ds1.DataSet.FieldByName('堆肥コード').AsString := 'FF';

  ETaihi.Text := '腐植から判定';



end;

procedure TFDokaiChenge.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  if ds1.DataSet.State in [dsEdit,dsInsert] then
		ds1.DataSet.Post;


end;

procedure TFDokaiChenge.FormShow(Sender: TObject);
var
stmp : string;
code : string;
//sakumokucd : String;

begin
  inherited;

  ADOTable3.Close;
  ADOTable3.Open;

  ADOQuery1.Close;


  stmp := 'select * From T_UKETUKE where サンプル番号 = "' + Vsample + '"';

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add(stmp);
  ADOQuery1.open;

  code := ADOQuery1.FieldByName('リン酸資材コード').asString;
  E11.Text := GetDokaizaiName001(JVal.DokaiGNo, code );

  code := ADOQuery1.FieldByName('石灰資材コード').asString;
  E12.Text := GetDokaizaiName001(JVal.DokaiGNo, code );


  code := ADOQuery1.FieldByName('苦土資材コード').asString;
  E13.Text := GetDokaizaiName001(JVal.DokaiGNo, code );

  code := ADOQuery1.FieldByName('加里資材コード').asString;
  E14.Text := GetDokaizaiName001(JVal.DokaiGNo, code );


  code := ADOQuery1.FieldByName('堆肥コード').asString;
  stmp := '';
  if code = 'T1' then begin
     stmp := ADOQuery1.FieldByName('堆肥名1').asString;
  end
  else if code = 'T2' then begin
     stmp := ADOQuery1.FieldByName('堆肥名2').asString;
  end
  else if code = 'T3' then begin
     stmp := ADOQuery1.FieldByName('堆肥名3').asString;
  end
  else if code <> '' then begin
     //堆肥マスタから

     stmp :=  DMU.GetHiryoName(code);

  end;

  ETaihi.Text := stmp;



  code := ADOQuery1.FieldByName('肥料1コード').asString;
  if code <> '' then begin
     stmp :=  DMU.GetHiryoName(code);
     EKasei1.Text := stmp;
  end;


  code := ADOQuery1.FieldByName('肥料2コード').asString;
  if code <> '' then begin
     stmp :=  DMU.GetHiryoName(code);
     EKasei2.Text := stmp;
  end;




end;

end.
