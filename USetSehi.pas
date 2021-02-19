unit USetSehi;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Db, Grids, DBGrids, DBTables, ComCtrls, ExtCtrls, ADODB,
  PrnCanvasU,
  DBCtrls, NumEdit,DMU, Mask,Usehisekkei;

type
  TFSetSehi = class(TForm)
    Panel2: TPanel;
    btnPost: TBitBtn;
    btnCancel: TBitBtn;
    btnClose: TBitBtn;
    EditPanel: TPanel;
    Ds1: TDataSource;
    PageHiryoDest: TPageControl;
    TabSheet6: TTabSheet;
    Label2: TLabel;
    ListSehiY: TListBox;
    TabSheet7: TTabSheet;
    Label15: TLabel;
    ListSehiM: TListBox;
    TabSheet8: TTabSheet;
    Label3: TLabel;
    ListSehiB: TListBox;
    TabSheet9: TTabSheet;
    Label6: TLabel;
    ListSehiB2: TListBox;
    TabYuukisitu: TTabSheet;
    Label62: TLabel;
    ListSehiM2: TListBox;
    NumM21: TNumEdit;
    NumM22: TNumEdit;
    NumM23: TNumEdit;
    NumM24: TNumEdit;
    NumM25: TNumEdit;
    RLPanel: TPanel;
    BtnDel: TButton;
    btnAdd: TButton;
    Panel1: TPanel;
    chkSim: TDBCheckBox;
    PageHiryoSource: TPageControl;
    TabSheet3: TTabSheet;
    Bevel4: TBevel;
    ListYuuki: TListBox;
    btnSakuhi: TButton;
    TabSheet4: TTabSheet;
    grKasei: TRadioGroup;
    ListKasei: TListBox;
    btnSakuhi2: TButton;
    TabSheet5: TTabSheet;
    ListTanpi: TListBox;
    btnTanpi: TButton;
    grTanpi: TRadioGroup;
    Label13: TLabel;
    DBEdit1: TDBEdit;
    Bevel5: TBevel;
    Label8: TLabel;
    Bevel6: TBevel;
    Bevel7: TBevel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label50: TLabel;
    Bevel16: TBevel;
    Label55: TLabel;
    Label61: TLabel;
    Bevel18: TBevel;
    txtNBuld1: TDBEdit;
    txtPBuld1: TDBEdit;
    txtKBuld1: TDBEdit;
    txtMBuld1: TDBEdit;
    txtNBuld2: TDBEdit;
    txtPBuld2: TDBEdit;
    txtKBuld2: TDBEdit;
    txtNBuld3: TDBEdit;
    txtPBuld3: TDBEdit;
    txtKBuld3: TDBEdit;
    txtCntBuld: TDBEdit;
    txtNBuldSum: TDBEdit;
    txtPBuldSum: TDBEdit;
    txtKBuldSum: TDBEdit;
    txtMBuldSum: TDBEdit;
    txtNyBuldSum: TDBEdit;
    txtPyBuldSum: TDBEdit;
    txtKyBuldSum: TDBEdit;
    QueryWork: TADOQuery;
    ADOSindan: TADOQuery;
    ADOUketuke: TADOQuery;
    Ds2: TDataSource;
    DBCd1: TDBEdit;
    DBCd2: TDBEdit;
    DBcd3: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    ADOSindanサンプル番号: TWideStringField;
    ADOSindan編集日: TDateTimeField;
    ADOSindanコメント: TWideMemoField;
    ADOSindanpH診断不足量: TFloatField;
    ADOSindanP診断不足量: TFloatField;
    ADOSindanMg診断不足量: TFloatField;
    ADOSindanK診断不足量: TFloatField;
    ADOSindan土改材コード1: TWideStringField;
    ADOSindan土改材量1: TFloatField;
    ADOSindan土改材コード2: TWideStringField;
    ADOSindan土改材量2: TFloatField;
    ADOSindan土改材コード3: TWideStringField;
    ADOSindan土改材量3: TFloatField;
    ADOSindan土改材コード4: TWideStringField;
    ADOSindan土改材量4: TFloatField;
    ADOSindan土改材コード5: TWideStringField;
    ADOSindan土改材量5: TFloatField;
    ADOSindanN施肥不足量: TFloatField;
    ADOSindanP施肥不足量: TFloatField;
    ADOSindanK施肥不足量: TFloatField;
    ADOSindanMg施肥不足量: TFloatField;
    ADOSindan分施回数: TSmallintField;
    ADOSindanN施肥不足量2: TFloatField;
    ADOSindanP施肥不足量2: TFloatField;
    ADOSindanK施肥不足量2: TFloatField;
    ADOSindanN施肥不足量3: TFloatField;
    ADOSindanP施肥不足量3: TFloatField;
    ADOSindanK施肥不足量3: TFloatField;
    ADOSindanN施肥不足量合計: TFloatField;
    ADOSindanP施肥不足量合計: TFloatField;
    ADOSindanK施肥不足量合計: TFloatField;
    ADOSindanMg施肥不足量合計: TFloatField;
    ADOSindan基肥1: TWideStringField;
    ADOSindan基肥量1: TFloatField;
    ADOSindan基肥2: TWideStringField;
    ADOSindan基肥量2: TFloatField;
    ADOSindan基肥3: TWideStringField;
    ADOSindan基肥量3: TFloatField;
    ADOSindan基肥4: TWideStringField;
    ADOSindan基肥量4: TFloatField;
    ADOSindan基肥5: TWideStringField;
    ADOSindan基肥量5: TFloatField;
    ADOSindan分施11: TWideStringField;
    ADOSindan分施1量1: TFloatField;
    ADOSindan分施12: TWideStringField;
    ADOSindan分施1量2: TFloatField;
    ADOSindan分施13: TWideStringField;
    ADOSindan分施1量3: TFloatField;
    ADOSindan分施14: TWideStringField;
    ADOSindan分施1量4: TFloatField;
    ADOSindan分施15: TWideStringField;
    ADOSindan分施1量5: TFloatField;
    ADOSindan分施21: TWideStringField;
    ADOSindan分施2量1: TFloatField;
    ADOSindan分施22: TWideStringField;
    ADOSindan分施2量2: TFloatField;
    ADOSindan分施23: TWideStringField;
    ADOSindan分施2量3: TFloatField;
    ADOSindan分施24: TWideStringField;
    ADOSindan分施2量4: TFloatField;
    ADOSindan分施25: TWideStringField;
    ADOSindan分施2量5: TFloatField;
    ADOSindan有機1: TWideStringField;
    ADOSindan有機量1: TFloatField;
    ADOSindan有機2: TWideStringField;
    ADOSindan有機量2: TFloatField;
    ADOSindan有機3: TWideStringField;
    ADOSindan有機量3: TFloatField;
    ADOSindan有機4: TWideStringField;
    ADOSindan有機量4: TFloatField;
    ADOSindan有機5: TWideStringField;
    ADOSindan有機量5: TFloatField;
    ADOSindanSIM計算済: TBooleanField;
    ADOSindan設計コメント: TWideMemoField;
    ADOSindan削除フラグ: TBooleanField;
    ADOSindanNy施肥不足量合計: TFloatField;
    ADOSindanPy施肥不足量合計: TFloatField;
    ADOSindanKy施肥不足量合計: TFloatField;
    ADOSindan所見土壌: TWideMemoField;
    ADOSindan所見施肥: TWideMemoField;
    procedure Ds1StateChange(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MakeKaseiList;
    procedure MakeTanpiList;
    procedure grTanpiClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DspHiryoList(aType : THiryoType);
    procedure BtnDelClick(Sender: TObject);
    procedure SehiGoukei;
    procedure btnAddClick(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure ADOSindanBeforePost(DataSet: TDataSet);
    procedure NumChange(Sender: TObject);
    function SetEdit:Boolean;
    procedure btnSakuhi2Click(Sender: TObject);
    procedure btnSakuhiClick(Sender: TObject);
    procedure btnTanpiClick(Sender: TObject);
    procedure ListSehiMDblClick(Sender: TObject);
    procedure NumM1Change(Sender: TObject);
    procedure NumExit(Sender: TObject);
    procedure EnterKeyPress(Sender: TObject; var Key: Char);


  private
    { Private 宣言 }




    IsKazan : Boolean ;
    SehiList : TSehiHiryo ;   {施肥肥量リスト}

    lsTanpi : TStringList ;

    txtSehiValue : array[Ord(Low(THiryoType))..Ord(High(THiryoType)),1..5] of TNumEdit ;

    procedure SetHiryoField(DataSet: TDataSet; aField: string;
      aCnt: integer; aRecHiryo: TRecHiryo);
    function SetHiryoList( aMode :TSetMode; aHiryo :THiryoType  ; aDelNum: integer ; aCode: string ):Boolean;

  public
     SNo : String;
    { Public 宣言 }
  end;

var
  FSetSehi: TFSetSehi;

implementation

uses M_SakuhiU, M_TanpiU;

{$R *.dfm}

procedure TFSetSehi.ADOSindanBeforePost(DataSet: TDataSet);
var
  aCnt : integer ;
  stmp : string;
begin


//肥料設定情報
  for aCnt := 1 to 5 do begin
    SetHiryoField (DataSet,'有機',aCnt,SehiList.GetHiryo(htYuuki,aCnt)) ;
    SetHiryoField (DataSet,'基肥',aCnt,SehiList.GetHiryo(htHiryo1,aCnt)) ;
    SetHiryoField (DataSet,'分施1',aCnt,SehiList.GetHiryo(htHiryo2,aCnt)) ;
    SetHiryoField (DataSet,'分施2',aCnt,SehiList.GetHiryo(htHiryo3,aCnt)) ;
  end;


end;

procedure TFSetSehi.btnAddClick(Sender: TObject);
var
  aCode : string ;
begin
  if not SetEdit then exit ;
  Ds1.DataSet.FieldByName('SIM計算済').asBoolean := True ;

  {肥料コードを設定}
  case PageHiryoSource.ActivePageIndex of
  0: begin //有機肥料
    if ListYuuki.ItemIndex < 0 then exit;
    aCode := Copy(ListYuuki.Items[ListYuuki.ItemIndex],1,2);
  end;
  1: begin //化成肥料
    if ListKasei.ItemIndex < 0 then exit;
    aCode := Copy(ListKasei.Items[ListKasei.ItemIndex],1,4);
  end;
  2: begin //単肥肥料
    if ListTanpi.ItemIndex < 0 then exit;
    aCode := Copy(ListTanpi.Items[ListTanpi.ItemIndex],1,2);
  end;
  end;

  case PageHiryoSource.ActivePageIndex of
  0: begin
    PageHiryoDest.ActivePageIndex := 0 ; {後の計算で用いるので先にページ設定}
    if SetHiryoList(smIns,htYuuki,0,aCode) then begin
      {設定値表示}
      DspHiryoList(htYuuki);
    end;
  end;
  else  {左の基肥、追肥の表示頁に追加する}
    if PageHiryoDest.ActivePageIndex = 0 then PageHiryoDest.ActivePageIndex := 1;{基肥にする}
    case PageHiryoDest.ActivePageIndex of
    1: if SetHiryoList(smIns,htHiryo1,0,aCode) then DspHiryoList(htHiryo1);
    2: if SetHiryoList(smIns,htHiryo2,0,aCode) then DspHiryoList(htHiryo2);
    3: if SetHiryoList(smIns,htHiryo3,0,aCode) then DspHiryoList(htHiryo3);
    end;
  end;


  SehiGoukei;

end;

procedure TFSetSehi.btnCloseClick(Sender: TObject);
begin

Close;

end;

procedure TFSetSehi.BtnDelClick(Sender: TObject);
var
  aCnt : integer ;
begin
  if not SetEdit then exit ;

  //ADOSindan.edit;
  Ds1.DataSet.FieldByName('SIM計算済').asBoolean := True ;


  case PageHiryoDest.ActivePageIndex of
  0:begin
    SehiList.DelHiryo(htYuuki,ListSehiY.ItemIndex+1);
    DspHiryoList(htYuuki);
    {肥料設定情報}
    for aCnt := 1 to 5 do
      SetHiryoField (Ds1.DataSet,'有機',aCnt,SehiList.GetHiryo(htYuuki,aCnt)) ;
  end;
  1:begin
    SehiList.DelHiryo(htHiryo1,ListSehiM.ItemIndex+1);
    DspHiryoList(htHiryo1);
    for aCnt := 1 to 5 do
      SetHiryoField (Ds1.DataSet,'基肥',aCnt,SehiList.GetHiryo(htHiryo1,aCnt)) ;
  end;
  2:begin
    SehiList.DelHiryo(htHiryo2,ListSehiB.ItemIndex+1);
    DspHiryoList(htHiryo2);
    for aCnt := 1 to 5 do
      SetHiryoField (Ds1.DataSet,'分施1',aCnt,SehiList.GetHiryo(htHiryo2,aCnt)) ;
  end;
  3:begin
    SehiList.DelHiryo(htHiryo3,ListSehiB2.ItemIndex+1);
    DspHiryoList(htHiryo3);
    for aCnt := 1 to 5 do
      SetHiryoField (Ds1.DataSet,'分施2',aCnt,SehiList.GetHiryo(htHiryo3,aCnt)) ;
  end;

  end;

  SehiGoukei;


end;



procedure TFSetSehi.btnPostClick(Sender: TObject);
begin


 	if ADOSindan.State in [dsEdit	,dsInsert] then
    ADOSindan.Post ;


end;

procedure TFSetSehi.btnSakuhi2Click(Sender: TObject);
begin
  Application.CreateForm(TmstSakuhiForm, mstSakuhiForm);
  {Version 0.6 #48 作物を特定させる}
  with ADOUketuke do begin
//     stmp := FieldByName('作目コード').asString;
//     stmp := FieldByName('作物コード').asString;
//     stmp := FieldByName('作型コード').asString;

    mstSakuhiForm.SelectRecord(
      FieldByName('作目コード').asString,
      FieldByName('作物コード').asString,
      FieldByName('作型コード').asString);
  end;
  mstSakuhiForm.ShowModal ;
  mstSakuhiForm.Release ;
  MakeKaseiList;

end;

procedure TFSetSehi.btnSakuhiClick(Sender: TObject);
begin
  Application.CreateForm(TmstSakuhiForm, mstSakuhiForm);
  {Version 0.6 #48 作物を特定させる}
  with ADOUketuke do begin
//     stmp := FieldByName('作目コード').asString;
//     stmp := FieldByName('作物コード').asString;
//     stmp := FieldByName('作型コード').asString;

    mstSakuhiForm.SelectRecord(
      FieldByName('作目コード').asString,
      FieldByName('作物コード').asString,
      FieldByName('作型コード').asString);
  end;
  mstSakuhiForm.ShowModal ;
  mstSakuhiForm.Release ;
  MakeKaseiList;

end;

procedure TFSetSehi.btnTanpiClick(Sender: TObject);
begin
  Application.CreateForm(TmstTanpiForm, mstTanpiForm);
  mstTanpiForm.ShowModal ;
  mstTanpiForm.Release ;
  MakeTanpiList;

end;

procedure TFSetSehi.Ds1StateChange(Sender: TObject);
begin
	case ds1.DataSet.State of
	dsEdit	,dsInsert	: begin
//  	EditPanel.Enabled := True ;
    btnPost.Enabled := True ;
    btnCancel.Enabled := True ;
//    DBGrid1.Enabled := False;    時々statechangeするため不可
//    GridPanel.Enabled := False;
  end;
  else begin
//  	EditPanel.Enabled := False ;
    btnPost.Enabled := False ;
    btnCancel.Enabled := False ;
//    DBGrid1.Enabled := True;
//    GridPanel.Enabled := True;
  end;
  end;

end;

procedure TFSetSehi.FormCreate(Sender: TObject);
var
aCnt : integer;
stmp : String;
begin
  TabYuukisitu.TabVisible := false;


  lsTanpi := TStringList.Create ;


	Color := BackColor ;
  SehiList := TSehiHiryo.Create ;  {施肥肥量リスト}

 {配列コンポーネントの登録}
  for aCnt := 1 to 5 do begin
    txtSehiValue[Ord(htYuuki)][aCnt] := TNumEdit(FindComponent('NumY'+InttoStr(aCnt)) );
    txtSehiValue[Ord(htHiryo1)][aCnt] := TNumEdit(FindComponent('NumM'+InttoStr(aCnt))  );
    txtSehiValue[Ord(htHiryo2)][aCnt] := TNumEdit(FindComponent('NumB'+InttoStr(aCnt))  );
    txtSehiValue[Ord(htHiryo3)][aCnt] := TNumEdit(FindComponent('NumB2'+InttoStr(aCnt))  );
  end;


  //PageSehiValues.ActivePageIndex := 0 ;
  PageHiryoDest.ActivePageIndex := 0 ;
  PageHiryoSource.ActivePageIndex := 1 ;


end;
procedure TFSetSehi.FormShow(Sender: TObject);
var
stmp : String;
  aCnt : integer ;
  aCode : string ;

begin






ADOSindan.close;
ADOSindan.SQL.Clear;
stmp := 'select * from T_SINDAN where サンプル番号 = "'+SNO+'"';
ADOSindan.SQL.Add(stmp);
ADOSindan.open;



ADOUketuke.close;
ADOUketuke.SQL.Clear;
stmp := 'select * from T_UKETUKE where サンプル番号 = "'+SNO+'"';
ADOUketuke.SQL.Add(stmp);
ADOUketuke.open;




  //データのメモリにセット
  SehiList.Clear ;
  for aCnt := 1 to 5 do begin
    aCode := ADOSindan.FieldByName('有機'+InttoStr(aCnt)).asString ;
    if aCode <> '' then
      SehiList.SetHiryo(htYuuki,aCode,
        ADOSindan.FieldByName('有機量'+InttoStr(aCnt)).asFloat, IsKazan);

    aCode := ADOSindan.FieldByName('基肥'+InttoStr(aCnt)).asString ;
    if aCode <> '' then
      SehiList.SetHiryo(htHiryo1,aCode,
        ADOSindan.FieldByName('基肥量'+InttoStr(aCnt)).asFloat, IsKazan);

    aCode := ADOSindan.FieldByName('分施1'+InttoStr(aCnt)).asString ;
    if aCode <> '' then
      SehiList.SetHiryo(htHiryo2,aCode,
        ADOSindan.FieldByName('分施1量'+InttoStr(aCnt)).asFloat, IsKazan);

    aCode := ADOSindan.FieldByName('分施2'+InttoStr(aCnt)).asString ;
    if aCode <> '' then
      SehiList.SetHiryo(htHiryo3,aCode,
        ADOSindan.FieldByName('分施2量'+InttoStr(aCnt)).asFloat, IsKazan);
  end;



  DspHiryoList(htYuuki);
  DspHiryoList(htHiryo1);
  DspHiryoList(htHiryo2);
  DspHiryoList(htHiryo3);


  MakeKaseiList;
  MakeTanpiList;

end;

{肥料設定を表示}
procedure TFSetSehi.DspHiryoList(aType : THiryoType);
var
  aCnt : integer ;
  aRecHiryo : TRecHiryo ;
  aListBox : TListBox ;
  sfield : String;
begin
  case aType of
  htYuuki: begin
            aListBox  := ListSehiY ;
            sfield := '有機量';
           end;
  htHiryo1: begin
             aListBox := ListSehiM ;
             sfield := '基肥量';
           end;
  htHiryo2: begin
             aListBox := ListSehiB ;
             sfield := '分施1量';
           end;
  htHiryo3: begin
             aListBox := ListSehiB2 ;
             sfield := '分施2量';
           end;
  end;
  aListBox.Clear ;
  for aCnt := 1 to 5 do begin
    aRecHiryo := SehiList.GetHiryo(aType,aCnt) ;
    if aRecHiryo.CD <> '' then begin
      aListBox.Items.Add( aRecHiryo.CD + ' ' + aRecHiryo.Name );
//      txtSehiValue[Ord(aType)][aCnt].Value := aRecHiryo.V ;
ds1.Edit;
      ds1.DataSet.FieldByName(sfield+inttostr(aCnt)).asfloat := aRecHiryo.V ;
    end;
//     else
//    txtSehiValue[Ord(aType)][aCnt].Text := '' ;
  end;
end;


procedure TFSetSehi.MakeKaseiList;
var
  aCnt : integer ;
  cd1,cd2,cd3 : String;

begin
  ListKasei.Clear ;
  ListYuuki.Clear ;
//  lsKasei.Clear ;


  cd1 := ADOUketuke.FieldByName('作目コード').AsString;
  cd2 := ADOUketuke.FieldByName('作物コード').AsString;
  cd3 := ADOUketuke.FieldByName('作型コード').AsString;



  QueryWork.Close;


  with QueryWork do begin
    SQL.Text := 'Select * from M_SAKHI where 作目コード="'+cd1+'" and 作物コード="'+cd2+'" and 作型コード="'+cd3+'"';
    Open;
    if RecordCount > 0 then begin
      for aCnt := 1 to 10 do begin
        ListKasei.Items.Add(FieldByName('化成'+inttoStr(aCnt)).asString+' '+
            GetHiryoName(FieldByName('化成'+inttoStr(aCnt)).asString ) );
        ListYuuki.Items.Add(FieldByName('有機'+inttoStr(aCnt)).asString+' '+
            GetHiryoName(FieldByName('有機'+inttoStr(aCnt)).asString ) );
      end;
    end;
    Close;
    DataSource := nil ;
  end;
end;
{単肥リストの作成->メモリ}
procedure TFSetSehi.MakeTanpiList;
begin
  lsTanpi.Clear ;
  with QueryWork do begin
    SQL.Text := 'Select * from M_TANPI';
    Open;
    While not Eof do begin
//      ListTanpi.Items.Add(FieldByName('肥料名').asString );
      lsTanpi.Add(FieldByName('CODE').asString+' '+FieldByName('肥料名').asString) ;
      Next;
    end;
    Close;
  end;
  grTanpiClick(self);  //リストボックスにリスト作成
end;
{メモリ－＞指定成分のみリストボックスに展開}
procedure TFSetSehi.grTanpiClick(Sender: TObject);
var
  aCnt : integer ;
begin
{単肥種別選択}
  ListTanpi.Clear ;
  for aCnt := 0 to lsTanpi.Count -1 do begin
    if lsTanpi[aCnt][1] = InttoStr(grTanpi.ItemIndex + 1) then
      ListTanpi.Items.Add(lsTanpi[aCnt]);
  end;
end;

procedure TFSetSehi.ListSehiMDblClick(Sender: TObject);
var
  aCnt : integer ;
begin
  if not SetEdit then exit ;

  case PageHiryoDest.ActivePageIndex of
  0:begin
    SehiList.DelHiryo(htYuuki,ListSehiY.ItemIndex+1);
    DspHiryoList(htYuuki);
    {肥料設定情報}
    for aCnt := 1 to 5 do
      SetHiryoField (Ds1.DataSet,'有機',aCnt,SehiList.GetHiryo(htYuuki,aCnt)) ;
  end;
  1:begin
    SehiList.DelHiryo(htHiryo1,ListSehiM.ItemIndex+1);
    DspHiryoList(htHiryo1);
    for aCnt := 1 to 5 do
      SetHiryoField (Ds1.DataSet,'基肥',aCnt,SehiList.GetHiryo(htHiryo1,aCnt)) ;
  end;
  2:begin
    SehiList.DelHiryo(htHiryo2,ListSehiB.ItemIndex+1);
    DspHiryoList(htHiryo2);
    for aCnt := 1 to 5 do
      SetHiryoField (Ds1.DataSet,'分施1',aCnt,SehiList.GetHiryo(htHiryo2,aCnt)) ;
  end;
  3:begin
    SehiList.DelHiryo(htHiryo3,ListSehiB2.ItemIndex+1);
    DspHiryoList(htHiryo3);
    for aCnt := 1 to 5 do
      SetHiryoField (Ds1.DataSet,'分施2',aCnt,SehiList.GetHiryo(htHiryo3,aCnt)) ;
  end;
//  4:begin
//    SehiList.DelHiryo(htHiryo1,ListSehiM2.ItemIndex+1);
//    DspHiryoList(htHiryo1);
//    for aCnt := 1 to 5 do
//      SetHiryoField (DataSource2.DataSet,'基肥',aCnt,SehiList.GetHiryo(htHiryo1,aCnt)) ;
//  end;

  end;

  SehiGoukei;

end;

{指定フィールドの条件付きデータ書き込み。}
procedure TFSetSehi.SetHiryoField( DataSet: TDataSet; aField : string; aCnt : integer ;aRecHiryo : TRecHiryo );
begin
  if aRecHiryo.CD <> '' then begin
    DataSet.FieldByName(aField+InttoStr(aCnt)).asString :=  aRecHiryo.CD ;
   // DataSet.FieldByName(aField+'量'+InttoStr(aCnt)).asFloat :=  aRecHiryo.V ;
  end else begin
    DataSet.FieldByName(aField+InttoStr(aCnt)).Clear ;
    DataSet.FieldByName(aField+'量'+InttoStr(aCnt)).Clear ;
  end;
end;

///////////////////////////////////////////////////////////////////////////
procedure TFSetSehi.SehiGoukei;
begin
    //合計の再計算

    if ADOSindan.State <> dsEdit then ADOSindan.Edit;


    if ADOSindan.FieldByName('分施回数').asInteger > 0 then begin
       ADOSindan.FieldByName('N施肥不足量合計').asfloat := ADOSindan.FieldByName('N施肥不足量').asfloat + ADOSindan.FieldByName('N施肥不足量2').asfloat + (ADOSindan.FieldByName('N施肥不足量3').asfloat * (ADOSindan.FieldByName('分施回数').asInteger - 1))+ADOSindan.FieldByName('Ny施肥不足量合計').asfloat;
       ADOSindan.FieldByName('P施肥不足量合計').asfloat := ADOSindan.FieldByName('P施肥不足量').asfloat + ADOSindan.FieldByName('P施肥不足量2').asfloat + (ADOSindan.FieldByName('P施肥不足量3').asfloat * (ADOSindan.FieldByName('分施回数').asInteger - 1))+ADOSindan.FieldByName('Py施肥不足量合計').asfloat;
       ADOSindan.FieldByName('K施肥不足量合計').asfloat := ADOSindan.FieldByName('K施肥不足量').asfloat + ADOSindan.FieldByName('K施肥不足量2').asfloat + (ADOSindan.FieldByName('K施肥不足量3').asfloat * (ADOSindan.FieldByName('分施回数').asInteger - 1))+ADOSindan.FieldByName('Ky施肥不足量合計').asfloat;
       ADOSindan.FieldByName('Mg施肥不足量合計').asfloat := ADOSindan.FieldByName('Mg施肥不足量').asfloat;
    end
    else begin
       ADOSindan.FieldByName('N施肥不足量合計').asfloat := ADOSindan.FieldByName('N施肥不足量').asfloat + ADOSindan.FieldByName('N施肥不足量2').asfloat + ADOSindan.FieldByName('Ny施肥不足量合計').asfloat;
       ADOSindan.FieldByName('P施肥不足量合計').asfloat := ADOSindan.FieldByName('P施肥不足量').asfloat + ADOSindan.FieldByName('P施肥不足量2').asfloat + ADOSindan.FieldByName('Py施肥不足量合計').asfloat;
       ADOSindan.FieldByName('K施肥不足量合計').asfloat := ADOSindan.FieldByName('K施肥不足量').asfloat + ADOSindan.FieldByName('K施肥不足量2').asfloat + ADOSindan.FieldByName('Ky施肥不足量合計').asfloat;
       ADOSindan.FieldByName('Mg施肥不足量合計').asfloat := ADOSindan.FieldByName('Mg施肥不足量').asfloat;
    end;


    //if ADOSindan.State = dsEdit then ADOSindan.Post;




end;

function TFSetSehi.SetHiryoList( aMode :TSetMode; aHiryo :THiryoType  ; aDelNum: integer ; aCode: string ):Boolean;
var
  aNum,aIndex : integer ;    {登録できた配列番号}
  aSetVal,aValue : double ;
//  stmp : String;
begin
  result := False ;

  //ウィンドウの描画を完了する。
//  Application.ProcessMessages();
//stmp := txtNSet1.Text;


  case aMode of
  smIns:begin
    aNum := SehiList.SetHiryo(aHiryo,aCode,0,IsKazan );
    if aNum > 0 then begin
      {目標値を画面の状態から割り出す}
      aSetVal := 0;
      aIndex := 0 ;
      case PageHiryoSource.ActivePageIndex of   {どの肥料種か}
      0: {有機} aIndex := 0;  {有機の場合は全て窒素で計算}
      1: {化成} aIndex := grKasei.ItemIndex;
      2: {単肥} aIndex := grTanpi.ItemIndex;
      end;
      {有機以外は選んだ肥料種で計算}
      if  aHiryo in [htHiryo1,htHiryo2,htHiryo3] then begin
        case aIndex of {化成と単肥のインデックス同じ}
        0: {N}
          case PageHiryoDest.ActivePageIndex of {施肥の何回目}
          1: aSetVal := StrToFloat(txtNBuld1.Text) ;
          2: aSetVal := StrToFloat(txtNBuld2.Text) ;
          3: aSetVal := StrToFloat(txtNBuld3.Text) ;
          end;
        1: {P}
          case PageHiryoDest.ActivePageIndex of {施肥の何回目}
          1: aSetVal := StrToFloat(txtPBuld1.Text);
          2: aSetVal := StrToFloat(txtPBuld2.Text);
          3: aSetVal := StrToFloat(txtPBuld3.Text);
          end;
        2: {K}
          case PageHiryoDest.ActivePageIndex of {施肥の何回目}
          1: aSetVal := StrToFloat(txtKBuld1.Text);
          2: aSetVal := StrToFloat(txtKBuld2.Text);
          3: aSetVal := StrToFloat(txtKBuld3.Text);
          end;
        3: {Mg}
          case PageHiryoDest.ActivePageIndex of {施肥の何回目}
          1: aSetVal := StrToFloat(txtMBuld1.Text);
//  ない    2: aSetVal := txtMSet2.Value ;
//          3: aSetVal := txtMSet3.Value ;
          end;
        end;
      end else begin
        aSetVal := StrToFloat(txtNyBuldSum.Text); //txtNySetSum.Value ;  {有機の場合は全て窒素で計算}
      end;
      {施容量を算出する}
      aValue := SehiList.CalcValue(aHiryo,aNum,aSetVal,aIndex+1);
      SehiList.SetValue(aHiryo,aNum,aValue);
    end;
    result := aNum > 0 ;
  end;
  smDel:begin
    SehiList.DelHiryo(aHiryo,aDelNum );
    result := True ;
  end;
  end;
end;

{
  肥料設計の用量の変更
}
procedure TFSetSehi.NumChange(Sender: TObject);
begin
  {直接編集されたか}
  if Sender is TNumEdit then
    if (Sender as TNumEdit).Focused then
      if not SetEdit then exit ;   //直接編集ならEditモードにして、更新時コンポーネント値を参照する
end;
procedure TFSetSehi.NumM1Change(Sender: TObject);
begin
  {直接編集されたか}
  if Sender is TNumEdit then
    if (Sender as TNumEdit).Focused then
      if not SetEdit then exit ;   //直接編集ならEditモードにして、更新時コンポーネント値を参照する

end;

procedure TFSetSehi.EnterKeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 then  //Enterキーが押されたら
  begin
    Key:=#0; //キー入力を無効にし
    Keybd_event(VK_TAB,0,0,0) //Tabキーを発生させる。
  end;
end;

procedure TFSetSehi.NumExit(Sender: TObject);
begin
//  SehiList.SetValue( THiryoType(PageHiryoDest.ActivePageIndex) ,
//    (Sender as TNumEdit).Tag , (Sender as TNumEdit).Value);

end;

function TFSetSehi.SetEdit:Boolean;
begin
  if Ds1.DataSet.Eof and Ds1.DataSet.Bof then begin
    result := false ;
    exit;
  end;
  {Version 0.6 #27 サンプル番号自PC範囲内のみ有効}
  result := IsEditRec(Ds1.DataSet.FieldByName('サンプル番号').asString);

  if (Ds1.State <> dsEdit) and result then
    Ds1.DataSet.edit;
end;

end.
