unit BunsekiU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, ComCtrls, DBCtrls, Db, StdCtrls,
  Buttons, ADODB,SHojouU, Menus,Clipbrd,UMasSel,UBunInput,UBunDel,UCsvOut,
  plChgCompo, Vcl.Mask;

type

  TMyDBGrid = class(TDBGrid)
  protected
    procedure DrawCell(ACol: Integer; ARow: Integer; ARect: TRect; AState: TGridDrawState); override;
  end;


  TfrmBunseki = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    ds1: TDataSource;
    DBNavigator1: TDBNavigator;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    EMode: TEdit;
    ADODojyouaaaa: TADOQuery;
    ADODoseiaaaa: TADOQuery;
    ADOSakuSyuruiaaaaa: TADOQuery;
    PopupMenu1: TPopupMenu;
    D1: TMenuItem;
    V1: TMenuItem;
    ADOSakumotu: TADOQuery;
    A1: TMenuItem;
    ADOKOURYO: TADOTable;
    ADOUMU: TADOTable;
    ADODokaizai1: TADOQuery;
    ADODokaizai2: TADOQuery;
    ADODokaizai3: TADOQuery;
    ADODokaizai4: TADOQuery;
    ADONouka: TADOTable;
    ADOSakumoku: TADOTable;
    ADOSakuSyurui: TADOTable;
    ADODojyou: TADOTable;
    ADODosei: TADOTable;
    Label3: TLabel;
    Label4: TLabel;
    BtSiborikomi: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    EIdou: TEdit;
    BitBtn6: TBitBtn;
    Label6: TLabel;
    Label7: TLabel;
    ADOSakugata: TADOQuery;
    DBGrid2: TDBGrid;
    A2: TMenuItem;
    ADOJICHIKAI: TADOTable;
    ADOCity: TADOTable;
    EUketukeNo: TEdit;
    ADOQuery1: TADOQuery;
    ADOQuery1����NO: TWideStringField;
    ADOQuery1��tNO: TWideStringField;
    ADOQuery1�˗��Ҏ���: TWideStringField;
    ADOQuery1�̎�ꏊ: TWideStringField;
    ADOQuery1�앨�R�[�h: TWideStringField;
    ADOQuery1�앨��: TWideStringField;
    ADOQuery1pH: TFloatField;
    ADOQuery1EC: TFloatField;
    ADOQuery1�g���I�[�OP: TFloatField;
    ADOQuery1�u���CP: TFloatField;
    ADOQuery1CaO: TFloatField;
    ADOQuery1MgO: TFloatField;
    ADOQuery1K2O: TFloatField;
    ADOQuery1CEC: TFloatField;
    ADOQuery1���A: TFloatField;
    ADOQuery1�A�����j�A��N: TFloatField;
    ADOQuery1����N: TFloatField;
    ADOQuery1�M���oN: TFloatField;
    ADOQuery1�Ɏ_��N: TFloatField;
    ADOQuery1�P�C�_: TFloatField;
    ADOQuery1�S: TFloatField;
    ADOQuery1�����z: TFloatField;
    ADOQuery1����: TFloatField;
    ADOQuery1��: TFloatField;
    ADOQuery1�}���K��: TFloatField;
    ADOQuery1�z�E�f: TFloatField;
    ADOQuery1�j�b�P��: TFloatField;
    ADOQuery1pHKCL: TFloatField;
    ADOQuery1Y1: TFloatField;
    ADOQuery1���l: TWideStringField;
    ADOQuery1�e��3: TFloatField;
    ADOQuery1Mg3: TFloatField;
    ADOQuery1K3: TFloatField;
    ADOQuery1P3: TFloatField;
    ADOQuery1N3: TFloatField;
    ADOQuery1�엿��3: TWideStringField;
    ADOQuery1�e��2: TFloatField;
    ADOQuery1Mg2: TFloatField;
    ADOQuery1K2: TFloatField;
    ADOQuery1P2: TFloatField;
    ADOQuery1N2: TFloatField;
    ADOQuery1�엿��2: TWideStringField;
    ADOQuery1�e��1: TFloatField;
    ADOQuery1Mg1: TFloatField;
    ADOQuery1K1: TFloatField;
    ADOQuery1P1: TFloatField;
    ADOQuery1N1: TFloatField;
    ADOQuery1�엿��1: TWideStringField;
    ADOQuery1��^�R�[�h: TWideStringField;
    ADOQuery1��^��: TWideStringField;
    btnClose: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn5: TBitBtn;
    Label13: TLabel;
    Button1: TButton;
    Label1: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    procedure btnClose1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Table1BeforePost(DataSet: TDataSet);
    procedure Table1AfterInsert(DataSet: TDataSet);
    procedure Table1AfterEdit(DataSet: TDataSet);
    procedure DBGrid1ColEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ds1UpdateData(Sender: TObject);
    procedure ds1DataChange(Sender: TObject; Field: TField);
    procedure D1Click(Sender: TObject);
    procedure V1Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure A1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure ADOTable1AfterScroll(DataSet: TDataSet);
    procedure A2Click(Sender: TObject);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn51Click(Sender: TObject);
    procedure BitBtn8Click1(Sender: TObject);
    procedure BitBtn91Click(Sender: TObject);
    procedure ADOTable1BeforeInsert(DataSet: TDataSet);
    procedure ADOQuery1BeforeInsert(DataSet: TDataSet);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private �錾 }
    UpFlg : boolean;
    Colcount : integer;

    plDBGrid1 :  TMyDBGrid;
    plDBGrid2 :  TMyDBGrid;
  public
    { Public �錾 }
    FStartKey: String;
    FStartBM: TBookMarkStr;

    Procedure RangeSel;
  end;

var
  frmBunseki: TfrmBunseki;

implementation

uses DMU;

{$R *.DFM}


procedure TfrmBunseki.FormCreate(Sender: TObject);
begin


  // Color := BackColor ;

  Label1.Caption := '�\��' + #13#10 + '�J�n��:';
  Label5.Caption := '[enter]�L�[�ɂ��' + #13#10 + '�ړ������F';

  // �t�H�[���쐬���ɃR���|�[�l���g�̓���ւ�
  plDBGrid1 := TMyDBGrid(ChangeComponent(DBGrid1, TMyDBGrid));
  plDBGrid2 := TMyDBGrid(ChangeComponent(DBGrid2, TMyDBGrid));

end;

procedure TfrmBunseki.FormClose(Sender: TObject; var Action: TCloseAction);
var
i : Integer;
stmp : String;
begin


     //���ڂ̕��ѕۑ�
     stmp := AppPath + '\Bunkou.dat';
     //DBGrid1.Columns.SaveToFile(ExtractFilePath(ParamStr(0)) + 'col.dat');
     DBGrid1.Columns.SaveToFile(stmp);


       {
       i := DBGrid1.Columns.Count;



       for i := 1 to DBGrid1.Columns.Count - 1 do begin

          stmp := 'NO'+InttoStr(i);
          if EMode.Text = '1' then begin
             BunkouIni.WriteString('Data',stmp,DBGrid1.Columns.Items[i].FieldName);
          end
          else if EMode.Text = '2' then begin
             BunkouIni2.WriteString('Data',stmp,DBGrid1.Columns.Items[i].FieldName);
          end
          else if EMode.Text = '3' then begin
             BunkouIni3.WriteString('Data',stmp,DBGrid1.Columns.Items[i].FieldName);
          end
          else begin
             BunkouIni.WriteString('Data',stmp,DBGrid1.Columns.Items[i].FieldName);
          end;

       end;
}

	if ADOQuery1.State in  [dsEdit	,dsInsert] then
		ds1.DataSet.Post;
	//ds1.DataSet.Refresh;



{
  if UPFlg = True then begin
      if Application.MessageBox('�ύX���e��ۑ����܂����H','�m�F',MB_YESNO) = ID_NO then begin
	       ADOTable1.Close;
         //�f�[�^�x�[�X�����
         DataModule1.ADOConnection1.Close;


         //���Ƃ̃f�[�^���R�s�[
         CopyFile(PChar(TempPath+'nkpsoil.mdb'),PChar(DataPath+'nkpsoil.mdb'),false);

      end;
  end;
}



	ADOQuery1.Close;


  Systemini.WriteString( 'BUNSEKI','FIELD',EIdou.Text );
  Systemini.WriteInteger( 'BUNSEKI','HOUKOU',ComboBox1.ItemIndex );


end;

procedure TfrmBunseki.A1Click(Sender: TObject);
begin
//�I���������̂��ׂč폜

DBGrid1.SelectedRows.Delete;
UPFlg := true;



end;

procedure TfrmBunseki.A2Click(Sender: TObject);
var
st : Boolean;
begin
//�����s�@�폜

  Application.CreateForm(TFBunDel, FBunDel);
  FBunDel.ShowModal ;
  st := FBunDel.UPFlg;
  FBunDel.Release ;


  if st = True then begin

     UPFlg := st;
     //���͈ꗗ�̕\�����Ȃ���

      ADOQuery1.Close;
    ADOQuery1.SQL.Text := 'select * from T_BUNSEKI6 order by ����NO';

      ADOQuery1.Open;

  end;






end;

procedure TfrmBunseki.ADOQuery1BeforeInsert(DataSet: TDataSet);
begin


ADOQuery1.Cancel;
end;

procedure TfrmBunseki.ADOTable1AfterScroll(DataSet: TDataSet);
begin

//�X�N���[���o�[���Ȃ���
//ShowScrollBar(DBGrid2.Handle, SB_VERT, False);
//ShowScrollBar(DBGrid2.Handle, SB_HORZ, False);


end;

procedure TfrmBunseki.ADOTable1BeforeInsert(DataSet: TDataSet);
begin

ADOQuery1.Cancel;

end;

procedure TfrmBunseki.Button1Click(Sender: TObject);
begin
  if Edit1.Text <> '' then begin
  	ADOQuery1.Locate('����NO',Edit1.Text,[]);
  end;

end;

procedure TfrmBunseki.BitBtn2Click(Sender: TObject);
var
ssample : string;
ssamplein : string;
tantou : String;
itmp : integer;
sno : integer;
count : integer;
hakono : integer;
i : integer;

begin



    if ADOQuery1.Filtered = True then begin
       ADOQuery1.Cancel;

       ShowMessage('�V�K���͂́A�i�荞�݂��������ĉ������B');

       exit;
    end;


  //�����s����

     Application.CreateForm(TFBunInput, FBunInput);
     FBunInput.ShowModal ;


     if FBunInput.Tag <> 0 then begin

       sno := StrToIntDef(FBunInput.Esample.Text, 0);//trtoint(FBunInput.Esample.Text);
       count := sno + StrToIntDef(FBunInput.spKazu.Text, 0);
       hakono := StrToIntDef(FBunInput.spHako.Text, 0);
       tantou := FBunInput.ETantou.Text;

       for i := sno to count - 1 do begin

         ADOQuery1.Last;
         ssample := FormatFloat('0000',i);

         if ADOQuery1.Locate('�T���v���ԍ�',ssample,[]) then begin
           showmessage('�w�肳�ꂽ�T���v�������ɑ��݂���ׁA������r���ŏI�����܂��B');
           break;
         end;

         ADOQuery1.Append;
         ADOQuery1.Edit;
         ADOQuery1.FieldByName('�T���v���ԍ�').asString := ssample;
         ADOQuery1.FieldByName('���͔ԍ�').asInteger := hakono;
         ADOQuery1.FieldByName('�S����').asString := tantou;

       end;

     end;

     FBunInput.Release ;

end;

procedure TfrmBunseki.BitBtn3Click(Sender: TObject);
var
stmp : String;
begin

  //��x�Ō�̃t�B�[���h�ɂ���B���ꂩ��ړ�����ƈ�ԍŏ��Ɏw��t�B�[���h������B
//  DBGrid1.SelectedIndex :=  DBGrid1.FieldCount;
//  DBGrid1.SelectedField :=  ADOTable1.FieldByName('�T���v���ԍ�');

  stmp := DBGrid1.Columns.Items[0].FieldName;
  DBGrid1.SelectedIndex :=  DBGrid1.FieldCount;
  DBGrid1.SelectedField :=  ADOQuery1.FieldByName(stmp);


end;

procedure TfrmBunseki.BitBtn4Click(Sender: TObject);
begin

  //��x�Ō�̃t�B�[���h�ɂ���B���ꂩ��ړ�����ƈ�ԍŏ��Ɏw��t�B�[���h������B
  DBGrid1.SelectedIndex :=  DBGrid1.FieldCount;
  DBGrid1.SelectedField :=  ADOQuery1.FieldByName('pH');



end;

procedure TfrmBunseki.BitBtn51Click(Sender: TObject);
begin

//�o�^

 	if ADOQuery1.State in  [dsEdit	,dsInsert] then
		ds1.DataSet.Post;




end;

procedure TfrmBunseki.BitBtn6Click(Sender: TObject);
begin

  if EIdou.Text = '' then begin
    showmessage('�t�B�[���h������͂��Ă��������B');
    exit;
  end;

  //��x�Ō�̃t�B�[���h�ɂ���B���ꂩ��ړ�����ƈ�ԍŏ��Ɏw��t�B�[���h������B
  DBGrid1.SelectedIndex :=  DBGrid1.FieldCount;

  try
    DBGrid1.SelectedField :=  ADOQuery1.FieldByName(EIdou.Text);
//  finally
  except
   showmessage( '�w�肳�ꂽ�t�B�[���h���́A����܂���B' );
  end;



end;

procedure TfrmBunseki.BitBtn8Click1(Sender: TObject);
begin
//�f�[�^�o��
  Application.CreateForm(TFCsvOut, FCsvOut);
  FCsvOut.Mode := '��t';
  FCsvOut.ShowModal ;
  FCsvOut.Release ;

end;

procedure TfrmBunseki.BitBtn91Click(Sender: TObject);
var
stmp : String;
begin

	  if Application.MessageBox ('���݂̏�Ԃ��f�t�H���g�ɕۑ����܂��B��낵���ł����H','�m�F', MB_YESNO ) = ID_YES then begin

    //���ڂ̕��ѕۑ�
     stmp := AppPath + '\BunkouDEF.dat';
     //DBGrid1.Columns.SaveToFile(ExtractFilePath(ParamStr(0)) + 'col.dat');
     DBGrid1.Columns.SaveToFile(stmp);

     ShowMessage('�ۑ����܂����B');
    end;
end;

procedure TfrmBunseki.btnClose1Click(Sender: TObject);
begin
	Close;
end;

procedure TfrmBunseki.Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
	if (Key in [VK_RETURN] ) then  Button1Click(self);

end;

procedure TfrmBunseki.DBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
stmp,stmp2 : String;
begin

  //�Z����ŃL�[�������ꂽ
  if Key in [VK_F5] then begin

{
    if DBGrid1.SelectedField.FieldName = '��t�N����' then begin
      //�{���̓��t�����
      stmp :=  FormatDateTime('yyyy"/"m"/"d',Now);
      ADOTable1.Edit;
      ADOTable1.FieldByName('��t�N����').asString := stmp;

    end;



}


    if (DBGrid1.SelectedField.FieldName = '�앨�R�[�h')
       or (DBGrid1.SelectedField.FieldName = '�앨��') then begin
      //�앨�̑I��
        Application.CreateForm(TFMasSel, FMasSel);
        FMasSel.Mode := '�앨';
        FMasSel.SakuCD := ADOQuery1.FieldByName('�앨�R�[�h').asString;
        FMasSel.ShowModal ;
        stmp := FMasSel.SAns;
        FMasSel.Release ;
        if stmp <> '' then begin
          ADOQuery1.Edit;
          ADOQuery1.FieldByName('�앨�R�[�h').asString := stmp;
          ADOQuery1.FieldByName('�앨��').asString := FMasSel.SAns2;
        end;
    end;


     if (DBGrid1.SelectedField.FieldName = '��^�R�[�h')
       or (DBGrid1.SelectedField.FieldName = '��^��') then begin

      if (ADOQuery1.FieldByName('�앨�R�[�h').asString <> '') then begin

        Application.CreateForm(TFMasSel, FMasSel);
        FMasSel.Mode := '��^';
        FMasSel.SakuCD := ADOQuery1.FieldByName('�앨�R�[�h').asString;
        FMasSel.SakuCD2 := ADOQuery1.FieldByName('��^�R�[�h').asString;
        FMasSel.ShowModal ;
        stmp := FMasSel.SAns;
        if stmp <> '' then begin
          ADOQuery1.Edit;
          ADOQuery1.FieldByName('��^�R�[�h').asString := stmp;
          ADOQuery1.FieldByName('��^��').asString := FMasSel.SAns2;
        end;
        FMasSel.Release ;

      end;
    end;





    if (DBGrid1.SelectedField.FieldName = '�y��R�[�h')
       or (DBGrid1.SelectedField.FieldName = '�y�떼') then begin
      //�y��̑I��
      Application.CreateForm(TFMasSel, FMasSel);
      FMasSel.Mode := '�y��';
      FMasSel.ShowModal ;
      stmp := FMasSel.SAns;
      FMasSel.Release ;
      if stmp <> '' then begin
        ADOQuery1.Edit;
        ADOQuery1.FieldByName('�y��R�[�h').asString := stmp;
      end;
    end;





    //�R���{�̕\�����X�V���邽�߂Ƀ��R�[�h���ړ�
    //��ԏ�̏ꍇ�̏�����ǉ�����B
    ADOQuery1.Prior;
    ADOQuery1.Next;

{
    ADOTable2.Filter := '[�앨��] like ''�V%''';
   ADOTable2.Filtered := true;
}

  end;


  //��̃Z�����R�s�[
  if Key in [VK_F8] then begin

     if ADOQuery1.RecNo <> 1 then begin

       if (DBGrid1.SelectedField.FieldName = '�앨�R�[�h')
         or (DBGrid1.SelectedField.FieldName = '�앨��') then begin
         ADOQuery1.Prior;
         stmp := ADOQuery1.FieldByName('�앨�R�[�h').asString;
         stmp2 := ADOQuery1.FieldByName('�앨��').asString;
         ADOQuery1.Next;
         ADOQuery1.Edit;
         ADOQuery1.FieldByName('�앨�R�[�h').asString := stmp;
         ADOQuery1.FieldByName('�앨��').asString := stmp2;
       end
       else begin
         stmp := DBGrid1.SelectedField.FieldName;
         ADOQuery1.Prior;
         stmp2 := ADOQuery1.FieldByName(stmp).asString;
         ADOQuery1.Next;
         ADOQuery1.Edit;
         ADOQuery1.FieldByName(stmp).asString := stmp2;
       end;


     end;
  end;




  //
	if not (Key in [VK_RETURN] ) then exit;

  //���^�[���L�[�ŃZ���̈ړ�
  if ComboBox1.ItemIndex = 0 then begin //��
  	//�E�[�Ȃ���s
// 09.12.04 �폜   if (DBGrid1.SelectedIndex+1) >= DBGrid1.Columns.Count then begin
//    	ADOQuery1.Next ;
//    	DBGrid1.SelectedIndex := 1 ;
//    end else
  		DBGrid1.SelectedIndex := DBGrid1.SelectedIndex + 1 ;
  end else begin  //��
    //�ŉ��s�Ȃ�߂�
//09.12.04 �폜  	if ADOQuery1.Eof then begin
//    	ADOQuery1.First ;
//    	DBGrid1.SelectedIndex := DBGrid1.SelectedIndex + 1 ;
//    end else
    	ADOQuery1.Next ;
  end;
  Key := 0 ;


end;

procedure TfrmBunseki.DBGrid2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
stmp,stmp2 : String;
begin

  //�Z����ŃL�[�������ꂽ
  if Key in [VK_F5] then begin



    if (DBGrid2.SelectedField.FieldName = '�_�Ɣԍ�')
       or (DBGrid2.SelectedField.FieldName = '�_�Ɩ�') then begin
      //�_�Ƃ̑I��
      Application.CreateForm(TFMasSel, FMasSel);
      FMasSel.Mode := '�_��';
      FMasSel.ShowModal ;
      stmp := FMasSel.SAns;
      FMasSel.Release ;
      if stmp <> '' then begin
        ADONouka.Close;
        ADONouka.Open;

        ADOQuery1.Edit;
        ADOQuery1.FieldByName('�_�Ɣԍ�').asString := stmp;


      end;

    end;

  end;


  //��̃Z�����R�s�[
  if Key in [VK_F8] then begin

     if ADOQuery1.RecNo <> 1 then begin

       if (DBGrid2.SelectedField.FieldName = '�_�Ɣԍ�')
         or (DBGrid2.SelectedField.FieldName = '�_�Ɩ�') then begin
         ADOQuery1.Prior;
         stmp := ADOQuery1.FieldByName('�_�Ɣԍ�').asString;
         ADOQuery1.Next;
         ADOQuery1.Edit;
         ADOQuery1.FieldByName('�_�Ɣԍ�').asString := stmp;
       end
       else begin
         stmp := DBGrid2.SelectedField.FieldName;
         ADOQuery1.Prior;
         stmp2 := ADOQuery1.FieldByName(stmp).asString;
         ADOQuery1.Next;
         ADOQuery1.Edit;
         ADOQuery1.FieldByName(stmp).asString := stmp2;
       end;


     end;
  end;




  //
	if not (Key in [VK_RETURN] ) then exit;
  //���^�[���L�[�ŃZ���̈ړ�
  if ComboBox1.ItemIndex = 0 then begin //��
  	//�E�[�Ȃ���s
// 09.12.04 �폜   if (DBGrid1.SelectedIndex+1) >= DBGrid1.Columns.Count then begin
//    	ADOQuery1.Next ;
//    	DBGrid1.SelectedIndex := 1 ;
//    end else
  		DBGrid2.SelectedIndex := DBGrid2.SelectedIndex + 1 ;
  end else begin  //��
    //�ŉ��s�Ȃ�߂�
//09.12.04 �폜  	if ADOQuery1.Eof then begin
//    	ADOQuery1.First ;
//    	DBGrid1.SelectedIndex := DBGrid1.SelectedIndex + 1 ;
//    end else
    	ADOQuery1.Next ;
  end;
  Key := 0 ;

end;

procedure TfrmBunseki.ds1DataChange(Sender: TObject; Field: TField);
begin

//UPFlg := true;

end;

procedure TfrmBunseki.ds1UpdateData(Sender: TObject);
var
stmp : String;
begin

UPFlg := true;

   //KCL�ɒl�������Ă���Ǝ{�݂ɂ���B
{
  if (DBGrid1.SelectedField.FieldName = 'pHKCL') then begin

     stmp := ADOQuery1.FieldByName('pHKCL').asString;
     if stmp <> '' then begin

        ADOQuery1.Edit;
        ADOQuery1.FieldByName('�앨��ރR�[�h').asString := '3'; //�{�݂ɂ���B

     end;

  end;
}


end;

//�ۂߏ����A�����_�Q��
procedure TfrmBunseki.Table1BeforePost(DataSet: TDataSet);
var
	cnt : integer ;
  aBuff : string ;
begin
	//�O���b�h�̂Q�Ԗڈȍ~�̓��̓t�B�[���h�̊ۂߏ���
  {
	for cnt := 2 to  DBGrid1.Columns.Count do begin
  	aBuff := DBGrid1.Columns[cnt-1].FieldName;
        if DataSet.FieldByName(aBuff).asString <> '' then begin
	  	DataSet.FieldByName(aBuff).asString := Format('%7.2f',[DataSet.FieldByName(aBuff).asFloat]);
                DataSet.FieldByName('�ҏW��').asDatetime := now ;
        end;
  end;
  }
end;

procedure TfrmBunseki.V1Click(Sender: TObject);

const
Tab = #9;
CR = #13;
LF = #10;
var
aBuff : string;
S, Subs : string;
Cols,
Rows,
Col,
Row,
i : integer;
begin

Col := DBGrid1.SelectedIndex;
//ROw := DBGrid1.SelectedRows;

 aBuff := DBGrid1.Columns[Col].FieldName;
//Col:= DBGrid1.Columns.;
//Row:=ARow;

{Col,Row �����̒l�̂Ƃ��ɂ�0�ɏC������}
if Col < 0 then Col := 0;
if Row < 0 then Row := 0;

S := Clipboard.AsText;
Rows := 0;
Cols := Col;
Subs := '';
for i := 1 to Length(S) do
case S[i] of
Tab : begin
//  if (Col + Cols < DBGrid1.ColCount) and
//  (Row + Rows < DBGrid1.RowCount) then

  ADOQuery1.Edit;
             ADOQuery1.FieldByName(aBuff).AsString := Subs;
  Col := Col + 1;
  aBuff := DBGrid1.Columns[Col].FieldName;

             //  ADOQuery1.next;   //Inc(Cols);
  Subs := '';
end;
CR : begin
//  if (Col + Cols < StringGrid1.ColCount) and
//  (Row + Rows < StringGrid1.RowCount) then
   ADOQuery1.Edit;
             ADOQuery1.FieldByName(aBuff).AsString := Subs;
//             ADOQuery1.IndexFields[Col].Asfloat := 1;
  ADOQuery1.next;   //Inc(Cols);

//  StringGrid1.Cells[Col + Cols, Row + Rows] := Subs;
  Col := Cols;
  aBuff := DBGrid1.Columns[Col].FieldName;
//  Inc(Rows);
  Subs := '';
end;
LF : ;
else begin
  Subs := Subs + S[i];
end;




end; //for

//SendMessage(GetFocus,WM_PASTE,0,0);
UPFlg := true;

end;

//���R�[�h�ǉ��͋��ۂ��� {Version 0.6 #45}
procedure TfrmBunseki.Table1AfterInsert(DataSet: TDataSet);
begin
  DataSet.Cancel;
  DataSet.Last;
  DataSet.Refresh;
end;

procedure TfrmBunseki.Table1AfterEdit(DataSet: TDataSet);
begin
//     if JMode = 'Douou' then begin
//       if DataSet.FieldByName('�i�����͏I��').AsString = '��' then begin
//          DataSet.Cancel;
//       end;
//     end;
end;

procedure TfrmBunseki.D1Click(Sender: TObject);
begin

 UPFlg := True;
 ds1.DataSet.Delete;


end;

procedure TfrmBunseki.DBGrid1CellClick(Column: TColumn);
Var
  Rtn: Word;
begin
  { Shift �̔��� }
  Rtn := GetAsyncKeyState(VK_Shift);
  If (Rtn AND $8000) <> 0 Then
    RangeSel
  Else
  Begin
    FStartBM := Stringof(ADOQuery1.BookMark);
    FStartKey := ADOQuery1.FieldByName('����NO').AsString; {Key �͓K����}
  End;
end;
//�����I��
procedure TfrmBunseki.RangeSel;
Var
  WBM: TBookMarkStr;
  WNext: Boolean;
begin
  With ADOQuery1 Do
  Begin
    WBM := Stringof(BookMark);
    If ADOQuery1.FieldByName('����NO').AsString < FStartKey Then
      WNext := True
    Else
      WNext := False;
    DisableControls;
    Try
      While True Do
      Begin
        DBGrid1.SelectedRows.CurrentRowSelected := True;
        If (EOF) Or (BOF) Or(Stringof(BookMark) = FStartBM) Then
          Break;
        If WNext Then
          Next
        Else
          Prior;
      End;
      BookMark := BytesOF(WBM);
    Finally
      EnableControls;
    End;
  End;
end;

procedure TfrmBunseki.DBGrid1ColEnter(Sender: TObject);
begin
//	if(DBGrid1.SelectedIndex <= 1) then
//		DBGrid1.SelectedIndex := 1;

end;


procedure TfrmBunseki.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
i,j : integer;
col : integer;
stmp : String;
//itmp : integer;
begin




  if (gdSelected in State) then begin
    // �h��ׂ��̐F (TBrush.Color �Ŏw�肷��)
     TMyDBGrid(Sender).Canvas.Brush.Color := clSkyBlue;
    // �`�惋�[�`�������s
  end
  else begin
    if (Column.Field.DataSet.RecNo Mod 2) = 0 then begin
      TMyDBGrid(Sender).Canvas.Brush.Color := clMoneyGreen;
    end
    else begin
      TMyDBGrid(Sender).Canvas.Brush.Color := clWindow;
    end;
  end;
  TMyDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);








{
 if  gdSelected in  State then  begin
   DBGrid1.Canvas.Brush.Color := clAqua;
 end
 else begin
   DBGrid1.Canvas.Brush.Color := clWhite;

 end;



   DBGrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
}

  //�J�������Œ�
  //�\������Ă����ԍ��̃J�����ԍ����擾
  //with TMyDBGrid(DBGrid1) do begin
  //  col := LeftCol - IndicatorOffset;
  //end;

  //if col < 0  then col := 0;



{
  col := TMyDBGrid(DBGrid1).Leftcol;
  if ColCount <> col  then begin

    ColCount := col;

    for i := 0 to DBGrid1.Columns.Count - 1 do begin
      if DBGrid1.Columns.Items[i].FieldName = '�T���v���ԍ�' then break;
    end;

    //�J�����̈ړ�
    DBGrid1.Columns.items[i].Index := col - 1;

  end;
}


end;

procedure TfrmBunseki.FormShow(Sender: TObject);
var
i : Integer;
stmp : String;
begin

 ShowScrollBar(DBGrid2.Handle, SB_VERT, true);




  //�f�[�^���R�s�[
  //TempPath
  CopyFile(PChar(DataPath+'nkpsoil.mdb'), PChar(TempPath+'nkpsoil.mdb'), false );


  UPFlg := False;
  Colcount := 0;



 //XXXXXXXXX ���͒l
 ADOQuery1.Close;
 //ADOQuery1.Open;
    ADOQuery1.SQL.Text := 'select * from T_BUNSEKI6 order by ����NO';

  ADOQuery1.Open;



  //ini�t�@�C������ǂݍ���
  EIdou.Text := Systemini.ReadString('BUNSEKI','FIELD', '');
  ComboBox1.ItemIndex := Systemini.ReadInteger('BUNSEKI','HOUKOU', 0);


  //���ڃ��X�g�ǂ݂���
  stmp := AppPath + '\Bunkou.dat';

  if FileExists(stmp) then begin

     //��������
    DBGrid1.Columns.LoadFromFile(stmp);

  end;

  //�T���v���ԍ�����ɕ\�����邽�ߑI������B
//  DBGrid1.SelectedIndex :=  DBGrid1.FieldCount;
//  DBGrid1.SelectedField :=  ADOQuery1.FieldByName('�T���v���ԍ�');

 //
  if EMode.Text = '6' then begin

    ADOQuery1.Close;
    stmp := 'select * from T_BUNSEKI6 where ��tNO = '''+Euketukeno.Text+'''  order by ����NO';
    ADOQuery1.SQL.Text := stmp;
    ADOQuery1.open;

  end
  else begin

    ADOQuery1.Close;
    ADOQuery1.SQL.Text := 'select * from T_BUNSEKI6 order by ����NO';
    ADOQuery1.open;
  end;

  // DBGrid1�̃^�C�g���ݒ�
  for i := 0 to DBGrid1.Columns.Count - 1 do begin

    DBGrid1.Columns[i].Title.Alignment := taCenter;
    //DBGrid1.Columns[i].Title.Color := clYellow;
    DBGrid1.Columns[i].Title.Font.Color := clBlack;
    DBGrid1.Columns[i].Title.Font.Size := 12;
  end;
  //DBGrid1.RowHeights[0] := 30;

  // DBGrid2�̃^�C�g���ݒ�
  DBGrid2.Columns[0].Title.Alignment := taCenter;
  //DBGrid2.Columns[0].Title.Color := clAqua;
  DBGrid2.Columns[0].Title.Font.Color := clBlack;
  DBGrid2.Columns[0].Title.Font.Size := 12;
  DBGrid2.Columns[1].Title.Alignment := taCenter;
  //DBGrid2.Columns[1].Title.Color := clAqua;
  DBGrid2.Columns[1].Title.Font.Color := clBlack;
  DBGrid2.Columns[1].Title.Font.Size := 12;
  //DBGrid2.RowHeights[0] := 30;
end;

procedure TMyDBGrid.DrawCell(ACol, ARow: Integer; ARect: TRect; AState: TGridDrawState);
var
  LColor    : TColor;
  LRect     : TRect;
  LColumn   : TColumn;
  LColText  : string;
  LFormat   : TTextFormat;
begin
  inherited;


  // ACol = 0 �̓^�C�g���s
  // �f�[�^ ACol �� 1 ����
  if (ACol >= 1) and (ACol <= Columns.Count) and (ARow = 0) then begin

    RowHeights[0] := 30;

    LColor := clAqua;

    // �w�i�̓h��ׂ�
    LRect := ARect;
    Canvas.Brush.Color := LColor;
    Canvas.FillRect(LRect);

    // �J�����Ԃ̐�
    Canvas.Pen.Color := clSilver;
    Canvas.MoveTo(LRect.Left, LRect.Top + 1);
    Canvas.LineTo(LRect.Left, LRect.Bottom - 1);

    // �^�C�g���̃L���v�V������`��
    // ��̓h��ׂ��̎��s�ŕ�������h��ׂ���Ă���
    LColumn  := Columns[ACol-1];
    LColText := LColumn.Title.Caption;

    // �e�L�X�g�`��m�A���C�����g���擾
    case LColumn.Title.Alignment of
      taLeftJustify  : LFormat := [tfLeft];
      taRightJustify : LFormat := [tfRight];
    else
      LFormat := [tfCenter];
    end;

    // �e�L�X�g��`��
    LFormat := LFormat + [tfVerticalCenter, tfSingleLine];
    Canvas.TextRect(LRect, LColText, LFormat);
  end;
end;
end.
