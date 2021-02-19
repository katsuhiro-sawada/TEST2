unit M_Sehi_EU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  MSehiU, Db, DBTables, StdCtrls, Buttons, ExtCtrls, ComCtrls, Mask,
  DBCtrls, Variants,DBValCbx, ADODB;

type
  TmstSehi_EForm = class(TmstSehiBasicForm)
    Label1: TLabel;
    ComboBox2: TComboBox;
    Label10: TLabel;
    ComboBox1: TComboBox;
    Label11: TLabel;
    ComboBox3: TComboBox;
    Label3: TLabel;
    ComboBox5: TComboBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBEditN: TDBEdit;
    DBEditP: TDBEdit;
    DBEditK: TDBEdit;
    DBEditM: TDBEdit;
    DBEditTotal: TDBEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Bevel5: TBevel;
    Label2: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Bevel7: TBevel;
    Label15: TLabel;
    TuihiNLabel: TLabel;
    TuihiN2Label: TLabel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel6: TBevel;
    Bevel8: TBevel;
    Bevel9: TBevel;
    Bevel10: TBevel;
    Bevel11: TBevel;
    Label18: TLabel;
    Label19: TLabel;
    Bevel12: TBevel;
    Bevel13: TBevel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    cmbN1: TDBValComboBox;
    grN: TRadioGroup;
    DBENM1: TDBEdit;
    DBENT1: TDBEdit;
    DBENF2: TDBEdit;
    DBEN11: TDBEdit;
    DBEN21: TDBEdit;
    DBENF3: TDBEdit;
    DBENT2: TDBEdit;
    DBENF4: TDBEdit;
    DBENT3: TDBEdit;
    DBENF5: TDBEdit;
    DBENT4: TDBEdit;
    DBENM2: TDBEdit;
    DBEN12: TDBEdit;
    DBEN22: TDBEdit;
    DBENM3: TDBEdit;
    DBEN13: TDBEdit;
    DBEN23: TDBEdit;
    DBENM4: TDBEdit;
    DBEN14: TDBEdit;
    DBEN24: TDBEdit;
    DBENM5: TDBEdit;
    DBEN15: TDBEdit;
    DBEN25: TDBEdit;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Bevel1: TBevel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Bevel14: TBevel;
    Label32: TLabel;
    TuihiPLabel: TLabel;
    TuihiP2Label: TLabel;
    Bevel15: TBevel;
    Bevel16: TBevel;
    Bevel17: TBevel;
    Bevel18: TBevel;
    Bevel19: TBevel;
    Bevel20: TBevel;
    Bevel21: TBevel;
    Bevel22: TBevel;
    Label35: TLabel;
    Label36: TLabel;
    Bevel23: TBevel;
    Bevel24: TBevel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    cmbP1: TDBValComboBox;
    DBEPM1: TDBEdit;
    DBEPT1: TDBEdit;
    DBEPF2: TDBEdit;
    DBEP11: TDBEdit;
    DBEP21: TDBEdit;
    DBEPF3: TDBEdit;
    DBEPT2: TDBEdit;
    DBEPF4: TDBEdit;
    DBEPT3: TDBEdit;
    DBEPF5: TDBEdit;
    DBEPT4: TDBEdit;
    DBEPM2: TDBEdit;
    DBEP12: TDBEdit;
    DBEP22: TDBEdit;
    DBEPM3: TDBEdit;
    DBEP13: TDBEdit;
    DBEP23: TDBEdit;
    DBEPM4: TDBEdit;
    DBEP14: TDBEdit;
    DBEP24: TDBEdit;
    DBEPM5: TDBEdit;
    DBEP15: TDBEdit;
    DBEP25: TDBEdit;
    Bevel25: TBevel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Bevel26: TBevel;
    Label49: TLabel;
    TuihiKLabel: TLabel;
    TuihiK2Label: TLabel;
    Bevel27: TBevel;
    Bevel28: TBevel;
    Bevel29: TBevel;
    Bevel30: TBevel;
    Bevel31: TBevel;
    Bevel32: TBevel;
    Bevel33: TBevel;
    Bevel34: TBevel;
    Label52: TLabel;
    Label53: TLabel;
    Bevel35: TBevel;
    Bevel36: TBevel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    cmbK1: TDBValComboBox;
    DBEKM1: TDBEdit;
    DBEKT1: TDBEdit;
    DBEKF2: TDBEdit;
    DBEK11: TDBEdit;
    DBEK21: TDBEdit;
    DBEKF3: TDBEdit;
    DBEKT2: TDBEdit;
    DBEKF4: TDBEdit;
    DBEKT3: TDBEdit;
    DBEKF5: TDBEdit;
    DBEKT4: TDBEdit;
    DBEKM2: TDBEdit;
    DBEK12: TDBEdit;
    DBEK22: TDBEdit;
    DBEKM3: TDBEdit;
    DBEK13: TDBEdit;
    DBEK23: TDBEdit;
    DBEKM4: TDBEdit;
    DBEK14: TDBEdit;
    DBEK24: TDBEdit;
    DBEKM5: TDBEdit;
    DBEK15: TDBEdit;
    DBEK25: TDBEdit;
    DBEM: TDBEdit;
    Label62: TLabel;
    Label63: TLabel;
    grK: TRadioGroup;
    DBKSui: TDBEdit;
    BtTeitiCopy: TBitBtn;
    BitBtn1: TBitBtn;
    DBN2: TDBEdit;
    DBP2: TDBEdit;
    DBK2: TDBEdit;
    Label16: TLabel;
    Label17: TLabel;
    Label33: TLabel;
    ADOQuery1: TADOQuery;
    ADOTable2: TADOTable;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox5Change(Sender: TObject);
    procedure Table1AfterScroll(DataSet: TDataSet);
    procedure DBENCmbChange(Sender: TObject);
    procedure grNClick(Sender: TObject);
    procedure DBEPCmbChange(Sender: TObject);
    procedure grKClick(Sender: TObject);
    procedure CalcTotal(Sender: TObject);
    procedure Table1BeforePost(DataSet: TDataSet);
    procedure BtTeitiCopyClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBN2Change(Sender: TObject);
    procedure DBP2Change(Sender: TObject);
    procedure DBK2Change(Sender: TObject);
  private
    { Private 宣言 }
    SakumokuCDList : TStringList ;
    SakumotuCDList : TStringList ;
    SakugataCDList : TStringList ;
    DojoCDList : TStringList ;
    procedure AllEnabledBDE( aType : string );
  public
    { Public 宣言 }
  end;

var
  mstSehi_EForm: TmstSehi_EForm;

implementation

uses DMU;

{$R *.DFM}

procedure TmstSehi_EForm.FormCreate(Sender: TObject);
begin
  SakumokuCDList := TStringList.Create ;
  SakumotuCDList := TStringList.Create ;
  SakugataCDList := TStringList.Create ;
  DojoCDList := TStringList.Create ;
  inherited;
	if not IsEntryYear then begin		//操作可能年度で無ければ編集不可
    TabSheet1.Enabled := ds1.DataSet.State in [dsEdit	,dsInsert] ;
    TabSheet2.Enabled := ds1.DataSet.State in [dsEdit	,dsInsert] ;
    TabSheet3.Enabled := ds1.DataSet.State in [dsEdit	,dsInsert] ;
    TabSheet4.Enabled := ds1.DataSet.State in [dsEdit	,dsInsert] ;
  end;
  with ADOQuery1 do begin
    SQL.Text := 'Select 作目コード,作目名 from M_Sakumoku where 作目コード in (''3'',''4'',''5'')';
    Open;
    while not Eof do begin
      ComboBox1.Items.Add( fieldByname('作目名').asString );
      SakumokuCDList.Add(fieldByname('作目コード').asString);
      Next;
    end;
    Close;

    SQL.Text := 'Select Distinct 畑牧土壌コード,畑牧土壌名 from M_DOJOU';
    Open;
    while not Eof do begin
      ComboBox5.Items.Add( fieldByname('畑牧土壌名').asString );
      DojoCDList.Add(fieldByname('畑牧土壌コード').asString);
      Next;
    end;
    Close;
  end;
  PageControl1.ActivePageIndex := 0;

  //
  //cmbP2Change(nil);
//  DBEdit1Change(nil);
//  cmbN2Change(Nil);

end;

procedure TmstSehi_EForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  SakumokuCDList.Free ;
  SakumotuCDList.Free ;
  SakugataCDList.Free ;
  DojoCDList.Free ;

end;

procedure TmstSehi_EForm.ComboBox1Change(Sender: TObject);
begin
  inherited;
  ComboBox2.Clear;
  SakumotuCDList.Clear;
  if ComboBox1.ItemIndex >= 0 then begin
    with ADOQuery1 do begin
      SQL.Text := 'Select 作物コード,作物名 from M_Sakumotu where 作目コード='''+SakumokuCDList[ComboBox1.ItemIndex]+'''';
      Open;
      while not Eof do begin
        ComboBox2.Items.Add( fieldByname('作物名').asString );
        SakumotuCDList.Add(fieldByname('作物コード').asString);
        Next;
      end;
      Close;
    end;
  end;
  ComboBox2.ItemIndex := -1 ;
  ComboBox2Change(self);
end;

procedure TmstSehi_EForm.ComboBox2Change(Sender: TObject);
begin
  inherited;
  ComboBox3.Clear;
  SakugataCDList.Clear;
  if ComboBox2.ItemIndex >= 0 then begin
    with ADOQuery1 do begin
      SQL.Text := 'Select 作型コード,作型名 from M_Sakugata where 作目コード='''+SakumokuCDList[ComboBox1.ItemIndex]+
      ''' and 作物コード='''+SakumotuCDList[ComboBox2.ItemIndex]+'''';
      Open;
      while not Eof do begin
        ComboBox3.Items.Add( fieldByname('作型名').asString );
        SakugataCDList.Add(fieldByname('作型コード').asString);
        Next;
      end;
      Close;
    end;
  end;
  ComboBox3.ItemIndex := -1 ;
  ComboBox3Change(self);
end;

procedure TmstSehi_EForm.ComboBox3Change(Sender: TObject);
begin
  inherited;
  ComboBox5.ItemIndex := -1 ;
  ComboBox5Change(self);
end;

procedure TmstSehi_EForm.ComboBox5Change(Sender: TObject);
begin
  inherited;
  {編集が有ればポスト}
	if ds1.DataSet.State in [dsEdit	,dsInsert] then
    ds1.DataSet.Post ;
  {レコードの移動}
  if (ComboBox3.ItemIndex < 0)or (ComboBox5.ItemIndex < 0) then begin
    ADOTable1.Close;
    exit ;
  end;

  if not IsEntryYear then begin		//操作可能年度で無ければ編集不可
    btnEdit.Enabled := False ;
    btnDel.Enabled := False ;
    EditPanel.Enabled := False ;
    ds1.AutoEdit := false;
  end;

  with ADOTable1 do begin
    Open;
    if not Locate('作目コード;作物コード;作型コード;土壌区分',
      VarArrayOf([SakumokuCDList[ComboBox1.ItemIndex],
                  SakumotuCDList[ComboBox2.ItemIndex],
                  SakugataCDList[ComboBox3.ItemIndex],
                  DojoCDList[ComboBox5.ItemIndex]]),[]) then begin
        {もしなければ新規レコード}
        if IsEntryYear then begin
          Append ;
          FieldByName('作目コード').asString := SakumokuCDList[ComboBox1.ItemIndex];
          FieldByName('作物コード').asString := SakumotuCDList[ComboBox2.ItemIndex];
          FieldByName('作型コード').asString := SakugataCDList[ComboBox3.ItemIndex];
          FieldByName('土壌区分').asString := DojoCDList[ComboBox5.ItemIndex];
        end;
    end
    else begin  //水準分類をセット

           cmbN1.ItemIndex := FieldByName('水準分類N').asInteger;
//           cmbN2.ItemIndex := FieldByName('追分分類N').asInteger + 2;


    end;
  end;

end;

procedure TmstSehi_EForm.Table1AfterScroll(DataSet: TDataSet);
begin
  inherited;
  {表示有効項目の制御}
//cmbN2Change(self);
//cmbP2Change(self);
//cmbK2Change(self);



  DBN2Change(self);
  DBP2Change(self);
  DBK2Change(self);
//  DBEPCmbChange(self);
//  DBEKCmbChange(self);
end;



{窒素水準の変更、入力制御}
procedure TmstSehi_EForm.DBENCmbChange(Sender: TObject);
begin
end;
{該当成分入力フィールドオールクリア}
procedure TmstSehi_EForm.AllEnabledBDE( aType : string );
begin
    SetEnableBDE(self,'DBE'+aType+'F',True);
    SetEnableBDE(self,'DBE'+aType+'T',True);
    SetEnableBDE(self,'DBE'+aType+'M',True);
    SetEnableBDE(self,'DBE'+aType+'1',True);
    SetEnableBDE(self,'DBE'+aType+'2',True);
end;

{窒素基準値フィールドの割り当て}
procedure TmstSehi_EForm.grNClick(Sender: TObject);
begin
  inherited;
  if grN.Visible and  (grN.ItemIndex = 1 )then begin
     DBENT1.DataField := '基準N21';
     DBENT2.DataField := '基準N22';
     DBENT3.DataField := '基準N23';
     DBENT4.DataField := '基準N24';
  end else begin
     DBENT1.DataField := '基準N11';
     DBENT2.DataField := '基準N12';
     DBENT3.DataField := '基準N13';
     DBENT4.DataField := '基準N14';
  end;
  DBENF2.DataField := DBENT1.DataField ;
  DBENF3.DataField := DBENT2.DataField ;
  DBENF4.DataField := DBENT3.DataField ;
  DBENF5.DataField := DBENT4.DataField ;

end;
{リン酸水準の変更、入力制御}
procedure TmstSehi_EForm.DBEPCmbChange(Sender: TObject);
begin
  inherited;
end;
{加里水準の変更、入力制御}
procedure TmstSehi_EForm.grKClick(Sender: TObject);
begin
  inherited;
  if grK.Visible then begin
     DBEKT1.DataField := '基準K'+InttoStr(grK.ItemIndex+1)+'1';
     DBEKT2.DataField := '基準K'+InttoStr(grK.ItemIndex+1)+'2';
     DBEKT3.DataField := '基準K'+InttoStr(grK.ItemIndex+1)+'3';
     DBEKT4.DataField := '基準K'+InttoStr(grK.ItemIndex+1)+'4';
  end else begin
     DBEKT1.DataField := '基準K11';
     DBEKT2.DataField := '基準K12';
     DBEKT3.DataField := '基準K13';
     DBEKT4.DataField := '基準K14';
  end;
  DBEKF2.DataField := DBEKT1.DataField ;
  DBEKF3.DataField := DBEKT2.DataField ;
  DBEKF4.DataField := DBEKT3.DataField ;
  DBEKF5.DataField := DBEKT4.DataField ;

end;
{
  合計施肥量の算出：窒素は標準＝２，リン酸、加里は基準＝３の列を採用
  分施回数で加算
}
procedure TmstSehi_EForm.CalcTotal(Sender: TObject);
var
  aCnt : integer ;
  aType,aNum : string ;
  aTotal : double ;
//  cmbBunse : TDBValComboBox ;
  cmbBunse : TComboBox ;
begin
	if not( ds1.DataSet.State in [dsEdit	,dsInsert]) then exit;
  {直接操作イベントでないと処理しない} {DataSetの場合はそのデータセットから算出}
  if not ((Sender is TDBValComboBox) or (Sender is TDBEdit)or(Sender is TDataSet)) then exit ;

  for aCnt := 1 to 3 do begin
    case aCnt of
    1: begin  aType := 'N'; aNum := '2' ;// cmbBunse := cmbN2 ;
       end;
    2: begin  aType := 'P'; aNum := '3' ;// cmbBunse := cmbP2 ;
       end;
    3: begin  aType := 'K'; aNum := '3' ;// cmbBunse := cmbK2 ;
       end;
    end;
//    aTotal := 0;
    if (Sender is TDataSet) then begin
      //  フィールドから計算する場合
      with TDataSet(Sender) do begin
        aTotal := FieldByName('基肥'+aType+aNum).asFloat ;
        if  FieldByName('追分分類'+aType).asInteger >= 1 then  //分施１回以上
          aTotal := aTotal + FieldByName('分施1'+aType+aNum).asFloat ;
        if  FieldByName('追分分類'+aType).asInteger >= 2 then  //分施２回以上 分施２×(分施回数-1)
          aTotal := aTotal + FieldByName('分施2'+aType+aNum).asFloat * (Abs(FieldByName('追分分類'+aType).asInteger)-1 );
        FieldByName(aType).asFloat := aTotal ;
      end;
    end;
(*
    end else begin
      //画面コンポーネントからの場合
      aTotal := myStrtoFloat(TDBEdit(FindComponent('DBE'+aType+'M'+aNum)).Text) ;
      if  cmbBunse.ItemIndex >= 2 then  //分施１回以上
        aTotal := aTotal + myStrtoFloat(TDBEdit(FindComponent('DBE'+aType+'1'+aNum)).Text) ;
      if  cmbBunse.ItemIndex >= 3 then  //分施２回以上 分施２×(分施回数-1)
        aTotal := aTotal + myStrtoFloat(TDBEdit(FindComponent('DBE'+aType+'2'+aNum)).Text) * (cmbBunse.ItemIndex-2 );
      TDBEdit(FindComponent('DBEdit'+aType)).Text := FloatToStr(aTotal) ;
    end;
*)
  end;
end;
procedure TmstSehi_EForm.Table1BeforePost(DataSet: TDataSet);
begin
  inherited;
  //  フィールドから計算する場合
  CalcTotal(DataSet);
end;
procedure TmstSehi_EForm.BtTeitiCopyClick(Sender: TObject);
Var
stmp : String;
skigou : String;
i,j : integer;
begin
  inherited;


  {編集が有ればポスト}
	if ds1.DataSet.State in [dsEdit	,dsInsert] then
    ds1.DataSet.Post ;
  {レコードの移動}
  if (ComboBox3.ItemIndex < 0)or (ComboBox5.ItemIndex < 0) then begin
    ADOTable1.Close;
    exit ;
  end;

  //低地土からコピー
  if ComboBox5.Text = '' then begin
      ShowMessage('土壌区分が選択されていません。' );
      exit;
  end;

  if ComboBox5.Text = '低地土' then begin
      ShowMessage('低地土から低地土へは、コピーできません。' );
      exit;
  end;


  if Application.MessageBox ('低地土からデータをコピーします。よろしいですか？','確認', MB_YESNO ) = ID_NO then
    exit;

  with ADOTable2 do begin
    Open;
    if not Locate('作目コード;作物コード;作型コード;土壌区分',
      VarArrayOf([SakumokuCDList[ComboBox1.ItemIndex],
                  SakumotuCDList[ComboBox2.ItemIndex],
                  SakugataCDList[ComboBox3.ItemIndex],
                  DojoCDList[0]]),[]) then begin
        {もしなければ}
        if IsEntryYear then begin
           ShowMessage('低地土のデータがない為、コピーできません。' );
            exit;
        end;
    end;

  ADOTable1.Edit;
  skigou := 'N';
  stmp := '水準分類'+skigou;
  ADOTable1.FieldByName(stmp).asFloat := ADOTable2.FieldByName(stmp).asFloat;
  stmp := '追分分類'+skigou;
  ADOTable1.FieldByName(stmp).asFloat := ADOTable2.FieldByName(stmp).asFloat;
  for i := 1 to 3 do begin
      for j := 1 to 4 do begin

          stmp := '基準'+skigou+ IntToStr(i)+IntToStr( j );
          ADOTable1.FieldByName(stmp).asFloat := ADOTable2.FieldByName(stmp).asFloat;
      end;
  end;
  for i := 1 to 5 do begin
          stmp := '基肥'+skigou+IntToStr( i );
          ADOTable1.FieldByName(stmp).asFloat := ADOTable2.FieldByName(stmp).asFloat;
  end;
  for i := 1 to 2 do begin
      for j := 1 to 5 do begin

          stmp := '分施'+IntToStr( i )+skigou+IntToStr( j );
          ADOTable1.FieldByName(stmp).asFloat := ADOTable2.FieldByName(stmp).asFloat;
      end;
  end;


  skigou := 'P';
  stmp := '水準分類'+skigou;
  ADOTable1.FieldByName(stmp).asFloat := ADOTable2.FieldByName(stmp).asFloat;
  stmp := '追分分類'+skigou;
  ADOTable1.FieldByName(stmp).asFloat := ADOTable2.FieldByName(stmp).asFloat;
  for i := 1 to 3 do begin
      for j := 1 to 4 do begin

          stmp := '基準'+skigou+IntToStr( i )+IntToStr( j );
          ADOTable1.FieldByName(stmp).asFloat := ADOTable2.FieldByName(stmp).asFloat;
      end;
  end;
  for i := 1 to 5 do begin
          stmp := '基肥'+skigou+IntToStr( i );
          ADOTable1.FieldByName(stmp).asFloat := ADOTable2.FieldByName(stmp).asFloat;
  end;
  for i := 1 to 2 do begin
      for j := 1 to 5 do begin

          stmp := '分施'+IntToStr( i )+skigou+IntToStr( j );
          ADOTable1.FieldByName(stmp).asFloat := ADOTable2.FieldByName(stmp).asFloat;
      end;
  end;


  skigou := 'K';
  stmp := '水準分類'+skigou;
  ADOTable1.FieldByName(stmp).asFloat := ADOTable2.FieldByName(stmp).asFloat;
  stmp := '追分分類'+skigou;
  ADOTable1.FieldByName(stmp).asFloat := ADOTable2.FieldByName(stmp).asFloat;
  for i := 1 to 3 do begin
      for j := 1 to 4 do begin

          stmp := '基準'+skigou+IntToStr( i )+IntToStr( j );
          ADOTable1.FieldByName(stmp).asFloat := ADOTable2.FieldByName(stmp).asFloat;
      end;
  end;
  for i := 1 to 5 do begin
          stmp := '基肥'+skigou+IntToStr( i );
          ADOTable1.FieldByName(stmp).asFloat := ADOTable2.FieldByName(stmp).asFloat;
  end;
  for i := 1 to 2 do begin
      for j := 1 to 5 do begin

          stmp := '分施'+IntToStr( i )+skigou+IntToStr( j );
          ADOTable1.FieldByName(stmp).asFloat := ADOTable2.FieldByName(stmp).asFloat;
      end;
  end;

  ADOTable1.FieldByName('Mg').asFloat := ADOTable2.FieldByName('Mg').asFloat;

  ADOTable1.FieldByName('目標収量').asFloat := ADOTable2.FieldByName('目標収量').asFloat;


//  DBEditN.Text := Table2.FieldByName('N').asString;
  ADOTable1.Post;

  close;
 end;

  ComboBox5.OnChange( Sender );
end;

procedure TmstSehi_EForm.BitBtn1Click(Sender: TObject);
Var
stmp : String;
skigou : String;
i,j : integer;
begin
  inherited;


  {編集が有ればポスト}
	if ds1.DataSet.State in [dsEdit	,dsInsert] then
    ds1.DataSet.Post ;
  {レコードの移動}
  if (ComboBox3.ItemIndex < 0)or (ComboBox5.ItemIndex < 0) then begin
    ADOTable1.Close;
    exit ;
  end;

  //低地土からコピー
  if ComboBox5.Text = '' then begin
      ShowMessage('土壌区分が選択されていません。' );
      exit;
  end;

//  if ComboBox5.Text = '低地土' then begin
//      ShowMessage('低地土から低地土へは、コピーできません。' );
//      exit;
//  end;


  if Application.MessageBox ('最初の作型からデータをコピーします。よろしいですか？','確認', MB_YESNO ) = ID_NO then
    exit;

  with ADOTable2 do begin
    Open;
    if not Locate('作目コード;作物コード;作型コード;土壌区分',
      VarArrayOf([SakumokuCDList[ComboBox1.ItemIndex],
                  SakumotuCDList[ComboBox2.ItemIndex],
                  SakugataCDList[0],
                  DojoCDList[0]]),[]) then begin
        {もしなければ}
        if IsEntryYear then begin
           ShowMessage('作型データがない為、コピーできません。' );
            exit;
        end;
    end;

  ADOTable1.Edit;
  skigou := 'N';
  stmp := '水準分類'+skigou;
  ADOTable1.FieldByName(stmp).asFloat := ADOTable2.FieldByName(stmp).asFloat;
  stmp := '追分分類'+skigou;
  ADOTable1.FieldByName(stmp).asFloat := ADOTable2.FieldByName(stmp).asFloat;
  for i := 1 to 3 do begin
      for j := 1 to 4 do begin

          stmp := '基準'+skigou+ IntToStr(i)+IntToStr( j );
          ADOTable1.FieldByName(stmp).asFloat := ADOTable2.FieldByName(stmp).asFloat;
      end;
  end;
  for i := 1 to 5 do begin
          stmp := '基肥'+skigou+IntToStr( i );
          ADOTable1.FieldByName(stmp).asFloat := ADOTable2.FieldByName(stmp).asFloat;
  end;
  for i := 1 to 2 do begin
      for j := 1 to 5 do begin

          stmp := '分施'+IntToStr( i )+skigou+IntToStr( j );
          ADOTable1.FieldByName(stmp).asFloat := ADOTable2.FieldByName(stmp).asFloat;
      end;
  end;


  skigou := 'P';
  stmp := '水準分類'+skigou;
  ADOTable1.FieldByName(stmp).asFloat := ADOTable2.FieldByName(stmp).asFloat;
  stmp := '追分分類'+skigou;
  ADOTable1.FieldByName(stmp).asFloat := ADOTable2.FieldByName(stmp).asFloat;
  for i := 1 to 3 do begin
      for j := 1 to 4 do begin

          stmp := '基準'+skigou+IntToStr( i )+IntToStr( j );
          ADOTable1.FieldByName(stmp).asFloat := ADOTable2.FieldByName(stmp).asFloat;
      end;
  end;
  for i := 1 to 5 do begin
          stmp := '基肥'+skigou+IntToStr( i );
          ADOTable1.FieldByName(stmp).asFloat := ADOTable2.FieldByName(stmp).asFloat;
  end;
  for i := 1 to 2 do begin
      for j := 1 to 5 do begin

          stmp := '分施'+IntToStr( i )+skigou+IntToStr( j );
          ADOTable1.FieldByName(stmp).asFloat := ADOTable2.FieldByName(stmp).asFloat;
      end;
  end;


  skigou := 'K';
  stmp := '水準分類'+skigou;
  ADOTable1.FieldByName(stmp).asFloat := ADOTable2.FieldByName(stmp).asFloat;
  stmp := '追分分類'+skigou;
  ADOTable1.FieldByName(stmp).asFloat := ADOTable2.FieldByName(stmp).asFloat;
  for i := 1 to 3 do begin
      for j := 1 to 4 do begin

          stmp := '基準'+skigou+IntToStr( i )+IntToStr( j );
          ADOTable1.FieldByName(stmp).asFloat := ADOTable2.FieldByName(stmp).asFloat;
      end;
  end;
  for i := 1 to 5 do begin
          stmp := '基肥'+skigou+IntToStr( i );
          ADOTable1.FieldByName(stmp).asFloat := ADOTable2.FieldByName(stmp).asFloat;
  end;
  for i := 1 to 2 do begin
      for j := 1 to 5 do begin

          stmp := '分施'+IntToStr( i )+skigou+IntToStr( j );
          ADOTable1.FieldByName(stmp).asFloat := ADOTable2.FieldByName(stmp).asFloat;
      end;
  end;

  ADOTable1.FieldByName('Mg').asFloat := ADOTable2.FieldByName('Mg').asFloat;

  ADOTable1.FieldByName('目標収量').asFloat := ADOTable2.FieldByName('目標収量').asFloat;


//  DBEditN.Text := Table2.FieldByName('N').asString;
  ADOTable1.Post;

  close;
 end;

  ComboBox5.OnChange( Sender );

end;

procedure TmstSehi_EForm.DBN2Change(Sender: TObject);
begin
  inherited;
  AllEnabledBDE('N'); {一度全て有効}
  {水準分類による表示制御}
  if cmbN1.ItemIndex =0 then begin
    SetEnableBDE(DBENT1, False );
    SetEnableBDE(DBENF2, False );
    SetEnableBDE(DBENT2, False );
    SetEnableBDE(DBENF3, False );
    SetEnableBDE(DBENM1, False );
    SetEnableBDE(DBENM3, False );
    SetEnableBDE(DBEN11, False );
    SetEnableBDE(DBEN13, False );
    SetEnableBDE(DBEN21, False );
    SetEnableBDE(DBEN23, False );

    SetEnableBDE(DBENT3, False );
    SetEnableBDE(DBENF4, False );
    SetEnableBDE(DBENT4, False );
    SetEnableBDE(DBENF5, False );
    SetEnableBDE(DBENM4, False );
    SetEnableBDE(DBENM5, False );
    SetEnableBDE(DBEN14, False );
    SetEnableBDE(DBEN15, False );
    SetEnableBDE(DBEN24, False );
    SetEnableBDE(DBEN25, False );
  end
  else if cmbN1.ItemIndex =2 then begin
    SetEnableBDE(DBENT3, False );
    SetEnableBDE(DBENF4, False );
    SetEnableBDE(DBENT4, False );
    SetEnableBDE(DBENF5, False );
    SetEnableBDE(DBENM4, False );
    SetEnableBDE(DBENM5, False );
    SetEnableBDE(DBEN14, False );
    SetEnableBDE(DBEN15, False );
    SetEnableBDE(DBEN24, False );
    SetEnableBDE(DBEN25, False );
  end;
  {可給態窒素の時、基準値フィールド表示制御}
  grN.Visible := cmbN1.ItemIndex = 2;
  {基準値フィールドの割り当て}
  grNClick(self);
  {窒素施肥回数の変更}

  if ds1.DataSet.FieldByNAme('追分分類N').asInteger = -1 then begin  //追肥1
    SetEnableBDE(self,'DBEN2',False);
  end;
  if ds1.DataSet.FieldByNAme('追分分類N').asInteger = 0 then begin  //なし
    SetEnableBDE(self,'DBEN2',False);
    SetEnableBDE(self,'DBEN1',False);
  end;
  if ds1.DataSet.FieldByNAme('追分分類N').asInteger = 1 then begin  //分施1
    SetEnableBDE(self,'DBEN2',False);
  end;

  if ds1.DataSet.FieldByNAme('追分分類N').asInteger < 0 then begin  //追肥
    TuihiNLabel.caption := '追肥１回目';
    TuihiN2Label.caption := '追肥２回目';
  end
  else begin
    TuihiNLabel.caption := '分施１回目';
    TuihiN2Label.caption := '分施２回目';

  end;

  //  if cmbN2.ItemIndex = 1 then
//    TuihiNLabel.caption := '追肥'
//  else
//    TuihiNLabel.caption := '分施量１回目';




  CalcTotal(Sender);  //合計施肥量の算出

end;

procedure TmstSehi_EForm.DBP2Change(Sender: TObject);
begin
  inherited;
  AllEnabledBDE('P'); {一度全て有効}
  {水準分類による表示制御}
  if cmbP1.ItemIndex <=0 then begin
    SetEnableBDE(DBEPT1, False );
    SetEnableBDE(DBEPF2, False );
    SetEnableBDE(DBEPT2, False );
    SetEnableBDE(DBEPF3, False );
    SetEnableBDE(DBEPT3, False );
    SetEnableBDE(DBEPF4, False );
    SetEnableBDE(DBEPT4, False );
    SetEnableBDE(DBEPF5, False );
    SetEnableBDE(DBEPM1, False );
    SetEnableBDE(DBEPM2, False );
    SetEnableBDE(DBEPM4, False );
    SetEnableBDE(DBEPM5, False );
    SetEnableBDE(DBEP11, False );
    SetEnableBDE(DBEP12, False );
    SetEnableBDE(DBEP14, False );
    SetEnableBDE(DBEP15, False );
    SetEnableBDE(DBEP21, False );
    SetEnableBDE(DBEP22, False );
    SetEnableBDE(DBEP24, False );
    SetEnableBDE(DBEP25, False );
  end;

  if ds1.DataSet.FieldByNAme('追分分類P').asInteger = -1 then begin  //追肥1
    SetEnableBDE(self,'DBEP2',False);
  end;
  if ds1.DataSet.FieldByNAme('追分分類P').asInteger = 0 then begin  //なし
    SetEnableBDE(self,'DBEP2',False);
    SetEnableBDE(self,'DBEP1',False);
  end;
  if ds1.DataSet.FieldByNAme('追分分類P').asInteger = 1 then begin  //分施1
    SetEnableBDE(self,'DBEP2',False);
  end;

  if ds1.DataSet.FieldByNAme('追分分類P').asInteger < 0 then begin  //追肥
    TuihiPLabel.caption := '追肥１回目';
    TuihiP2Label.caption := '追肥２回目';
  end
  else begin
    TuihiPLabel.caption := '分施１回目';
    TuihiP2Label.caption := '分施２回目';

  end;

  CalcTotal(Sender);  //合計施肥量の算出

end;

procedure TmstSehi_EForm.DBK2Change(Sender: TObject);
begin
  inherited;
  AllEnabledBDE('K'); {一度全て有効}
  {水準分類による表示制御}
  if cmbK1.ItemIndex <=0 then begin
    SetEnableBDE(DBEKT1, False );
    SetEnableBDE(DBEKF2, False );
    SetEnableBDE(DBEKT2, False );
    SetEnableBDE(DBEKF3, False );
    SetEnableBDE(DBEKT3, False );
    SetEnableBDE(DBEKF4, False );
    SetEnableBDE(DBEKT4, False );
    SetEnableBDE(DBEKF5, False );
    SetEnableBDE(DBEKM1, False );
    SetEnableBDE(DBEKM2, False );
    SetEnableBDE(DBEKM4, False );
    SetEnableBDE(DBEKM5, False );
    SetEnableBDE(DBEK11, False );
    SetEnableBDE(DBEK12, False );
    SetEnableBDE(DBEK14, False );
    SetEnableBDE(DBEK15, False );
    SetEnableBDE(DBEK21, False );
    SetEnableBDE(DBEK22, False );
    SetEnableBDE(DBEK24, False );
    SetEnableBDE(DBEK25, False );
  end;
  {有りの時、基準値フィールド表示制御}
//  grK.Visible := cmbK1.ItemIndex = 1;
  grK.Visible := cmbK1.ItemIndex = 3;
  {基準値フィールドの割り当て}
  grKClick(self);

  if ds1.DataSet.FieldByNAme('追分分類K').asInteger = -1 then begin  //追肥1
    SetEnableBDE(self,'DBEK2',False);
  end;
  if ds1.DataSet.FieldByNAme('追分分類K').asInteger = 0 then begin  //なし
    SetEnableBDE(self,'DBEK2',False);
    SetEnableBDE(self,'DBEK1',False);
  end;
  if ds1.DataSet.FieldByNAme('追分分類K').asInteger = 1 then begin  //分施1
    SetEnableBDE(self,'DBEK2',False);
  end;

  if ds1.DataSet.FieldByNAme('追分分類K').asInteger < 0 then begin  //追肥
    TuihiKLabel.caption := '追肥１回目';
    TuihiK2Label.caption := '追肥２回目';
  end
  else begin
    TuihiKLabel.caption := '分施１回目';
    TuihiK2Label.caption := '分施２回目';

  end;

  CalcTotal(Sender);  //合計施肥量の算出

end;

end.
