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
    { Private �錾 }
    SakumokuCDList : TStringList ;
    SakumotuCDList : TStringList ;
    SakugataCDList : TStringList ;
    DojoCDList : TStringList ;
    procedure AllEnabledBDE( aType : string );
  public
    { Public �錾 }
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
	if not IsEntryYear then begin		//����\�N�x�Ŗ�����ΕҏW�s��
    TabSheet1.Enabled := ds1.DataSet.State in [dsEdit	,dsInsert] ;
    TabSheet2.Enabled := ds1.DataSet.State in [dsEdit	,dsInsert] ;
    TabSheet3.Enabled := ds1.DataSet.State in [dsEdit	,dsInsert] ;
    TabSheet4.Enabled := ds1.DataSet.State in [dsEdit	,dsInsert] ;
  end;
  with ADOQuery1 do begin
    SQL.Text := 'Select ��ڃR�[�h,��ږ� from M_Sakumoku where ��ڃR�[�h in (''3'',''4'',''5'')';
    Open;
    while not Eof do begin
      ComboBox1.Items.Add( fieldByname('��ږ�').asString );
      SakumokuCDList.Add(fieldByname('��ڃR�[�h').asString);
      Next;
    end;
    Close;

    SQL.Text := 'Select Distinct ���q�y��R�[�h,���q�y�떼 from M_DOJOU';
    Open;
    while not Eof do begin
      ComboBox5.Items.Add( fieldByname('���q�y�떼').asString );
      DojoCDList.Add(fieldByname('���q�y��R�[�h').asString);
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
      SQL.Text := 'Select �앨�R�[�h,�앨�� from M_Sakumotu where ��ڃR�[�h='''+SakumokuCDList[ComboBox1.ItemIndex]+'''';
      Open;
      while not Eof do begin
        ComboBox2.Items.Add( fieldByname('�앨��').asString );
        SakumotuCDList.Add(fieldByname('�앨�R�[�h').asString);
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
      SQL.Text := 'Select ��^�R�[�h,��^�� from M_Sakugata where ��ڃR�[�h='''+SakumokuCDList[ComboBox1.ItemIndex]+
      ''' and �앨�R�[�h='''+SakumotuCDList[ComboBox2.ItemIndex]+'''';
      Open;
      while not Eof do begin
        ComboBox3.Items.Add( fieldByname('��^��').asString );
        SakugataCDList.Add(fieldByname('��^�R�[�h').asString);
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
  {�ҏW���L��΃|�X�g}
	if ds1.DataSet.State in [dsEdit	,dsInsert] then
    ds1.DataSet.Post ;
  {���R�[�h�̈ړ�}
  if (ComboBox3.ItemIndex < 0)or (ComboBox5.ItemIndex < 0) then begin
    ADOTable1.Close;
    exit ;
  end;

  if not IsEntryYear then begin		//����\�N�x�Ŗ�����ΕҏW�s��
    btnEdit.Enabled := False ;
    btnDel.Enabled := False ;
    EditPanel.Enabled := False ;
    ds1.AutoEdit := false;
  end;

  with ADOTable1 do begin
    Open;
    if not Locate('��ڃR�[�h;�앨�R�[�h;��^�R�[�h;�y��敪',
      VarArrayOf([SakumokuCDList[ComboBox1.ItemIndex],
                  SakumotuCDList[ComboBox2.ItemIndex],
                  SakugataCDList[ComboBox3.ItemIndex],
                  DojoCDList[ComboBox5.ItemIndex]]),[]) then begin
        {�����Ȃ���ΐV�K���R�[�h}
        if IsEntryYear then begin
          Append ;
          FieldByName('��ڃR�[�h').asString := SakumokuCDList[ComboBox1.ItemIndex];
          FieldByName('�앨�R�[�h').asString := SakumotuCDList[ComboBox2.ItemIndex];
          FieldByName('��^�R�[�h').asString := SakugataCDList[ComboBox3.ItemIndex];
          FieldByName('�y��敪').asString := DojoCDList[ComboBox5.ItemIndex];
        end;
    end
    else begin  //�������ނ��Z�b�g

           cmbN1.ItemIndex := FieldByName('��������N').asInteger;
//           cmbN2.ItemIndex := FieldByName('�Ǖ�����N').asInteger + 2;


    end;
  end;

end;

procedure TmstSehi_EForm.Table1AfterScroll(DataSet: TDataSet);
begin
  inherited;
  {�\���L�����ڂ̐���}
//cmbN2Change(self);
//cmbP2Change(self);
//cmbK2Change(self);



  DBN2Change(self);
  DBP2Change(self);
  DBK2Change(self);
//  DBEPCmbChange(self);
//  DBEKCmbChange(self);
end;



{���f�����̕ύX�A���͐���}
procedure TmstSehi_EForm.DBENCmbChange(Sender: TObject);
begin
end;
{�Y���������̓t�B�[���h�I�[���N���A}
procedure TmstSehi_EForm.AllEnabledBDE( aType : string );
begin
    SetEnableBDE(self,'DBE'+aType+'F',True);
    SetEnableBDE(self,'DBE'+aType+'T',True);
    SetEnableBDE(self,'DBE'+aType+'M',True);
    SetEnableBDE(self,'DBE'+aType+'1',True);
    SetEnableBDE(self,'DBE'+aType+'2',True);
end;

{���f��l�t�B�[���h�̊��蓖��}
procedure TmstSehi_EForm.grNClick(Sender: TObject);
begin
  inherited;
  if grN.Visible and  (grN.ItemIndex = 1 )then begin
     DBENT1.DataField := '�N21';
     DBENT2.DataField := '�N22';
     DBENT3.DataField := '�N23';
     DBENT4.DataField := '�N24';
  end else begin
     DBENT1.DataField := '�N11';
     DBENT2.DataField := '�N12';
     DBENT3.DataField := '�N13';
     DBENT4.DataField := '�N14';
  end;
  DBENF2.DataField := DBENT1.DataField ;
  DBENF3.DataField := DBENT2.DataField ;
  DBENF4.DataField := DBENT3.DataField ;
  DBENF5.DataField := DBENT4.DataField ;

end;
{�����_�����̕ύX�A���͐���}
procedure TmstSehi_EForm.DBEPCmbChange(Sender: TObject);
begin
  inherited;
end;
{���������̕ύX�A���͐���}
procedure TmstSehi_EForm.grKClick(Sender: TObject);
begin
  inherited;
  if grK.Visible then begin
     DBEKT1.DataField := '�K'+InttoStr(grK.ItemIndex+1)+'1';
     DBEKT2.DataField := '�K'+InttoStr(grK.ItemIndex+1)+'2';
     DBEKT3.DataField := '�K'+InttoStr(grK.ItemIndex+1)+'3';
     DBEKT4.DataField := '�K'+InttoStr(grK.ItemIndex+1)+'4';
  end else begin
     DBEKT1.DataField := '�K11';
     DBEKT2.DataField := '�K12';
     DBEKT3.DataField := '�K13';
     DBEKT4.DataField := '�K14';
  end;
  DBEKF2.DataField := DBEKT1.DataField ;
  DBEKF3.DataField := DBEKT2.DataField ;
  DBEKF4.DataField := DBEKT3.DataField ;
  DBEKF5.DataField := DBEKT4.DataField ;

end;
{
  ���v�{��ʂ̎Z�o�F���f�͕W�����Q�C�����_�A�����͊���R�̗���̗p
  ���{�񐔂ŉ��Z
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
  {���ڑ���C�x���g�łȂ��Ə������Ȃ�} {DataSet�̏ꍇ�͂��̃f�[�^�Z�b�g����Z�o}
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
      //  �t�B�[���h����v�Z����ꍇ
      with TDataSet(Sender) do begin
        aTotal := FieldByName('���'+aType+aNum).asFloat ;
        if  FieldByName('�Ǖ�����'+aType).asInteger >= 1 then  //���{�P��ȏ�
          aTotal := aTotal + FieldByName('���{1'+aType+aNum).asFloat ;
        if  FieldByName('�Ǖ�����'+aType).asInteger >= 2 then  //���{�Q��ȏ� ���{�Q�~(���{��-1)
          aTotal := aTotal + FieldByName('���{2'+aType+aNum).asFloat * (Abs(FieldByName('�Ǖ�����'+aType).asInteger)-1 );
        FieldByName(aType).asFloat := aTotal ;
      end;
    end;
(*
    end else begin
      //��ʃR���|�[�l���g����̏ꍇ
      aTotal := myStrtoFloat(TDBEdit(FindComponent('DBE'+aType+'M'+aNum)).Text) ;
      if  cmbBunse.ItemIndex >= 2 then  //���{�P��ȏ�
        aTotal := aTotal + myStrtoFloat(TDBEdit(FindComponent('DBE'+aType+'1'+aNum)).Text) ;
      if  cmbBunse.ItemIndex >= 3 then  //���{�Q��ȏ� ���{�Q�~(���{��-1)
        aTotal := aTotal + myStrtoFloat(TDBEdit(FindComponent('DBE'+aType+'2'+aNum)).Text) * (cmbBunse.ItemIndex-2 );
      TDBEdit(FindComponent('DBEdit'+aType)).Text := FloatToStr(aTotal) ;
    end;
*)
  end;
end;
procedure TmstSehi_EForm.Table1BeforePost(DataSet: TDataSet);
begin
  inherited;
  //  �t�B�[���h����v�Z����ꍇ
  CalcTotal(DataSet);
end;
procedure TmstSehi_EForm.BtTeitiCopyClick(Sender: TObject);
Var
stmp : String;
skigou : String;
i,j : integer;
begin
  inherited;


  {�ҏW���L��΃|�X�g}
	if ds1.DataSet.State in [dsEdit	,dsInsert] then
    ds1.DataSet.Post ;
  {���R�[�h�̈ړ�}
  if (ComboBox3.ItemIndex < 0)or (ComboBox5.ItemIndex < 0) then begin
    ADOTable1.Close;
    exit ;
  end;

  //��n�y����R�s�[
  if ComboBox5.Text = '' then begin
      ShowMessage('�y��敪���I������Ă��܂���B' );
      exit;
  end;

  if ComboBox5.Text = '��n�y' then begin
      ShowMessage('��n�y�����n�y�ւ́A�R�s�[�ł��܂���B' );
      exit;
  end;


  if Application.MessageBox ('��n�y����f�[�^���R�s�[���܂��B��낵���ł����H','�m�F', MB_YESNO ) = ID_NO then
    exit;

  with ADOTable2 do begin
    Open;
    if not Locate('��ڃR�[�h;�앨�R�[�h;��^�R�[�h;�y��敪',
      VarArrayOf([SakumokuCDList[ComboBox1.ItemIndex],
                  SakumotuCDList[ComboBox2.ItemIndex],
                  SakugataCDList[ComboBox3.ItemIndex],
                  DojoCDList[0]]),[]) then begin
        {�����Ȃ����}
        if IsEntryYear then begin
           ShowMessage('��n�y�̃f�[�^���Ȃ��ׁA�R�s�[�ł��܂���B' );
            exit;
        end;
    end;

  ADOTable1.Edit;
  skigou := 'N';
  stmp := '��������'+skigou;
  ADOTable1.FieldByName(stmp).asFloat := ADOTable2.FieldByName(stmp).asFloat;
  stmp := '�Ǖ�����'+skigou;
  ADOTable1.FieldByName(stmp).asFloat := ADOTable2.FieldByName(stmp).asFloat;
  for i := 1 to 3 do begin
      for j := 1 to 4 do begin

          stmp := '�'+skigou+ IntToStr(i)+IntToStr( j );
          ADOTable1.FieldByName(stmp).asFloat := ADOTable2.FieldByName(stmp).asFloat;
      end;
  end;
  for i := 1 to 5 do begin
          stmp := '���'+skigou+IntToStr( i );
          ADOTable1.FieldByName(stmp).asFloat := ADOTable2.FieldByName(stmp).asFloat;
  end;
  for i := 1 to 2 do begin
      for j := 1 to 5 do begin

          stmp := '���{'+IntToStr( i )+skigou+IntToStr( j );
          ADOTable1.FieldByName(stmp).asFloat := ADOTable2.FieldByName(stmp).asFloat;
      end;
  end;


  skigou := 'P';
  stmp := '��������'+skigou;
  ADOTable1.FieldByName(stmp).asFloat := ADOTable2.FieldByName(stmp).asFloat;
  stmp := '�Ǖ�����'+skigou;
  ADOTable1.FieldByName(stmp).asFloat := ADOTable2.FieldByName(stmp).asFloat;
  for i := 1 to 3 do begin
      for j := 1 to 4 do begin

          stmp := '�'+skigou+IntToStr( i )+IntToStr( j );
          ADOTable1.FieldByName(stmp).asFloat := ADOTable2.FieldByName(stmp).asFloat;
      end;
  end;
  for i := 1 to 5 do begin
          stmp := '���'+skigou+IntToStr( i );
          ADOTable1.FieldByName(stmp).asFloat := ADOTable2.FieldByName(stmp).asFloat;
  end;
  for i := 1 to 2 do begin
      for j := 1 to 5 do begin

          stmp := '���{'+IntToStr( i )+skigou+IntToStr( j );
          ADOTable1.FieldByName(stmp).asFloat := ADOTable2.FieldByName(stmp).asFloat;
      end;
  end;


  skigou := 'K';
  stmp := '��������'+skigou;
  ADOTable1.FieldByName(stmp).asFloat := ADOTable2.FieldByName(stmp).asFloat;
  stmp := '�Ǖ�����'+skigou;
  ADOTable1.FieldByName(stmp).asFloat := ADOTable2.FieldByName(stmp).asFloat;
  for i := 1 to 3 do begin
      for j := 1 to 4 do begin

          stmp := '�'+skigou+IntToStr( i )+IntToStr( j );
          ADOTable1.FieldByName(stmp).asFloat := ADOTable2.FieldByName(stmp).asFloat;
      end;
  end;
  for i := 1 to 5 do begin
          stmp := '���'+skigou+IntToStr( i );
          ADOTable1.FieldByName(stmp).asFloat := ADOTable2.FieldByName(stmp).asFloat;
  end;
  for i := 1 to 2 do begin
      for j := 1 to 5 do begin

          stmp := '���{'+IntToStr( i )+skigou+IntToStr( j );
          ADOTable1.FieldByName(stmp).asFloat := ADOTable2.FieldByName(stmp).asFloat;
      end;
  end;

  ADOTable1.FieldByName('Mg').asFloat := ADOTable2.FieldByName('Mg').asFloat;

  ADOTable1.FieldByName('�ڕW����').asFloat := ADOTable2.FieldByName('�ڕW����').asFloat;


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


  {�ҏW���L��΃|�X�g}
	if ds1.DataSet.State in [dsEdit	,dsInsert] then
    ds1.DataSet.Post ;
  {���R�[�h�̈ړ�}
  if (ComboBox3.ItemIndex < 0)or (ComboBox5.ItemIndex < 0) then begin
    ADOTable1.Close;
    exit ;
  end;

  //��n�y����R�s�[
  if ComboBox5.Text = '' then begin
      ShowMessage('�y��敪���I������Ă��܂���B' );
      exit;
  end;

//  if ComboBox5.Text = '��n�y' then begin
//      ShowMessage('��n�y�����n�y�ւ́A�R�s�[�ł��܂���B' );
//      exit;
//  end;


  if Application.MessageBox ('�ŏ��̍�^����f�[�^���R�s�[���܂��B��낵���ł����H','�m�F', MB_YESNO ) = ID_NO then
    exit;

  with ADOTable2 do begin
    Open;
    if not Locate('��ڃR�[�h;�앨�R�[�h;��^�R�[�h;�y��敪',
      VarArrayOf([SakumokuCDList[ComboBox1.ItemIndex],
                  SakumotuCDList[ComboBox2.ItemIndex],
                  SakugataCDList[0],
                  DojoCDList[0]]),[]) then begin
        {�����Ȃ����}
        if IsEntryYear then begin
           ShowMessage('��^�f�[�^���Ȃ��ׁA�R�s�[�ł��܂���B' );
            exit;
        end;
    end;

  ADOTable1.Edit;
  skigou := 'N';
  stmp := '��������'+skigou;
  ADOTable1.FieldByName(stmp).asFloat := ADOTable2.FieldByName(stmp).asFloat;
  stmp := '�Ǖ�����'+skigou;
  ADOTable1.FieldByName(stmp).asFloat := ADOTable2.FieldByName(stmp).asFloat;
  for i := 1 to 3 do begin
      for j := 1 to 4 do begin

          stmp := '�'+skigou+ IntToStr(i)+IntToStr( j );
          ADOTable1.FieldByName(stmp).asFloat := ADOTable2.FieldByName(stmp).asFloat;
      end;
  end;
  for i := 1 to 5 do begin
          stmp := '���'+skigou+IntToStr( i );
          ADOTable1.FieldByName(stmp).asFloat := ADOTable2.FieldByName(stmp).asFloat;
  end;
  for i := 1 to 2 do begin
      for j := 1 to 5 do begin

          stmp := '���{'+IntToStr( i )+skigou+IntToStr( j );
          ADOTable1.FieldByName(stmp).asFloat := ADOTable2.FieldByName(stmp).asFloat;
      end;
  end;


  skigou := 'P';
  stmp := '��������'+skigou;
  ADOTable1.FieldByName(stmp).asFloat := ADOTable2.FieldByName(stmp).asFloat;
  stmp := '�Ǖ�����'+skigou;
  ADOTable1.FieldByName(stmp).asFloat := ADOTable2.FieldByName(stmp).asFloat;
  for i := 1 to 3 do begin
      for j := 1 to 4 do begin

          stmp := '�'+skigou+IntToStr( i )+IntToStr( j );
          ADOTable1.FieldByName(stmp).asFloat := ADOTable2.FieldByName(stmp).asFloat;
      end;
  end;
  for i := 1 to 5 do begin
          stmp := '���'+skigou+IntToStr( i );
          ADOTable1.FieldByName(stmp).asFloat := ADOTable2.FieldByName(stmp).asFloat;
  end;
  for i := 1 to 2 do begin
      for j := 1 to 5 do begin

          stmp := '���{'+IntToStr( i )+skigou+IntToStr( j );
          ADOTable1.FieldByName(stmp).asFloat := ADOTable2.FieldByName(stmp).asFloat;
      end;
  end;


  skigou := 'K';
  stmp := '��������'+skigou;
  ADOTable1.FieldByName(stmp).asFloat := ADOTable2.FieldByName(stmp).asFloat;
  stmp := '�Ǖ�����'+skigou;
  ADOTable1.FieldByName(stmp).asFloat := ADOTable2.FieldByName(stmp).asFloat;
  for i := 1 to 3 do begin
      for j := 1 to 4 do begin

          stmp := '�'+skigou+IntToStr( i )+IntToStr( j );
          ADOTable1.FieldByName(stmp).asFloat := ADOTable2.FieldByName(stmp).asFloat;
      end;
  end;
  for i := 1 to 5 do begin
          stmp := '���'+skigou+IntToStr( i );
          ADOTable1.FieldByName(stmp).asFloat := ADOTable2.FieldByName(stmp).asFloat;
  end;
  for i := 1 to 2 do begin
      for j := 1 to 5 do begin

          stmp := '���{'+IntToStr( i )+skigou+IntToStr( j );
          ADOTable1.FieldByName(stmp).asFloat := ADOTable2.FieldByName(stmp).asFloat;
      end;
  end;

  ADOTable1.FieldByName('Mg').asFloat := ADOTable2.FieldByName('Mg').asFloat;

  ADOTable1.FieldByName('�ڕW����').asFloat := ADOTable2.FieldByName('�ڕW����').asFloat;


//  DBEditN.Text := Table2.FieldByName('N').asString;
  ADOTable1.Post;

  close;
 end;

  ComboBox5.OnChange( Sender );

end;

procedure TmstSehi_EForm.DBN2Change(Sender: TObject);
begin
  inherited;
  AllEnabledBDE('N'); {��x�S�ėL��}
  {�������ނɂ��\������}
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
  {���Ԓ��f�̎��A��l�t�B�[���h�\������}
  grN.Visible := cmbN1.ItemIndex = 2;
  {��l�t�B�[���h�̊��蓖��}
  grNClick(self);
  {���f�{��񐔂̕ύX}

  if ds1.DataSet.FieldByNAme('�Ǖ�����N').asInteger = -1 then begin  //�ǔ�1
    SetEnableBDE(self,'DBEN2',False);
  end;
  if ds1.DataSet.FieldByNAme('�Ǖ�����N').asInteger = 0 then begin  //�Ȃ�
    SetEnableBDE(self,'DBEN2',False);
    SetEnableBDE(self,'DBEN1',False);
  end;
  if ds1.DataSet.FieldByNAme('�Ǖ�����N').asInteger = 1 then begin  //���{1
    SetEnableBDE(self,'DBEN2',False);
  end;

  if ds1.DataSet.FieldByNAme('�Ǖ�����N').asInteger < 0 then begin  //�ǔ�
    TuihiNLabel.caption := '�ǔ�P���';
    TuihiN2Label.caption := '�ǔ�Q���';
  end
  else begin
    TuihiNLabel.caption := '���{�P���';
    TuihiN2Label.caption := '���{�Q���';

  end;

  //  if cmbN2.ItemIndex = 1 then
//    TuihiNLabel.caption := '�ǔ�'
//  else
//    TuihiNLabel.caption := '���{�ʂP���';




  CalcTotal(Sender);  //���v�{��ʂ̎Z�o

end;

procedure TmstSehi_EForm.DBP2Change(Sender: TObject);
begin
  inherited;
  AllEnabledBDE('P'); {��x�S�ėL��}
  {�������ނɂ��\������}
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

  if ds1.DataSet.FieldByNAme('�Ǖ�����P').asInteger = -1 then begin  //�ǔ�1
    SetEnableBDE(self,'DBEP2',False);
  end;
  if ds1.DataSet.FieldByNAme('�Ǖ�����P').asInteger = 0 then begin  //�Ȃ�
    SetEnableBDE(self,'DBEP2',False);
    SetEnableBDE(self,'DBEP1',False);
  end;
  if ds1.DataSet.FieldByNAme('�Ǖ�����P').asInteger = 1 then begin  //���{1
    SetEnableBDE(self,'DBEP2',False);
  end;

  if ds1.DataSet.FieldByNAme('�Ǖ�����P').asInteger < 0 then begin  //�ǔ�
    TuihiPLabel.caption := '�ǔ�P���';
    TuihiP2Label.caption := '�ǔ�Q���';
  end
  else begin
    TuihiPLabel.caption := '���{�P���';
    TuihiP2Label.caption := '���{�Q���';

  end;

  CalcTotal(Sender);  //���v�{��ʂ̎Z�o

end;

procedure TmstSehi_EForm.DBK2Change(Sender: TObject);
begin
  inherited;
  AllEnabledBDE('K'); {��x�S�ėL��}
  {�������ނɂ��\������}
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
  {�L��̎��A��l�t�B�[���h�\������}
//  grK.Visible := cmbK1.ItemIndex = 1;
  grK.Visible := cmbK1.ItemIndex = 3;
  {��l�t�B�[���h�̊��蓖��}
  grKClick(self);

  if ds1.DataSet.FieldByNAme('�Ǖ�����K').asInteger = -1 then begin  //�ǔ�1
    SetEnableBDE(self,'DBEK2',False);
  end;
  if ds1.DataSet.FieldByNAme('�Ǖ�����K').asInteger = 0 then begin  //�Ȃ�
    SetEnableBDE(self,'DBEK2',False);
    SetEnableBDE(self,'DBEK1',False);
  end;
  if ds1.DataSet.FieldByNAme('�Ǖ�����K').asInteger = 1 then begin  //���{1
    SetEnableBDE(self,'DBEK2',False);
  end;

  if ds1.DataSet.FieldByNAme('�Ǖ�����K').asInteger < 0 then begin  //�ǔ�
    TuihiKLabel.caption := '�ǔ�P���';
    TuihiK2Label.caption := '�ǔ�Q���';
  end
  else begin
    TuihiKLabel.caption := '���{�P���';
    TuihiK2Label.caption := '���{�Q���';

  end;

  CalcTotal(Sender);  //���v�{��ʂ̎Z�o

end;

end.
