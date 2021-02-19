unit M_SakuhiU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Buttons, ExtCtrls, DBTables, Db,IniFiles, ADODB,Variants;

type
  TmstSakuhiForm = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    Label77: TLabel;
    lblDositu: TLabel;
    btnClose: TBitBtn;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ds1: TDataSource;
    Bevel1: TBevel;
    Bevel2: TBevel;
    KaseiMast: TListBox;
    YuukiMast: TListBox;
    KaseiList: TListBox;
    YuukiList: TListBox;
    btnKaseiDel: TButton;
    btnKaseiAdd: TButton;
    Label2: TLabel;
    Label3: TLabel;
    btnYuukiDel: TButton;
    btnYuukiAdd: TButton;
    Label4: TLabel;
    ESisyoNo: TEdit;
    Bttop: TButton;
    ADOTable1: TADOTable;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    Eken: TEdit;
    BtKensaku: TBitBtn;
    SuiList: TListBox;
    Label5: TLabel;
    btnSuiAdd: TButton;
    btnSuiDel: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnKaseiAddClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnYuukiAddClick(Sender: TObject);
    procedure btnKaseiDelClick(Sender: TObject);
    procedure btnYuukiDelClick(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure Table1AfterScroll(DataSet: TDataSet);
    procedure Table1AfterPost(DataSet: TDataSet);
    procedure BttopClick(Sender: TObject);
    procedure ADOTable1AfterScroll(DataSet: TDataSet);
    procedure ADOTable1AfterPost(DataSet: TDataSet);
    procedure BtKensakuClick(Sender: TObject);
    procedure btnSuiAddClick(Sender: TObject);
    procedure btnSuiDelClick(Sender: TObject);
    procedure SuiListDblClick(Sender: TObject);
  private
    { Private 宣言 }
    SakumokuCDList : TStringList ;
    SakumotuCDList : TStringList ;
    SakugataCDList : TStringList ;
    FIsPost : Boolean;        {同期用マスタ更新フラグ}
    FIsEdit : Boolean ; //編集したか？
    procedure GetSakumotuList(SakumokuCD: string);
    procedure GetSakugataList(SakumokuCD, SakumotuCD: string);
    procedure SetEditFlag(bFlag: Boolean);
    procedure PostData;
    function AlReadyList(aList: TListBox; aCode: string): Boolean;
  public
    { Public 宣言 }
    property IsEdit : Boolean read FIsEdit write SetEditFlag;
    procedure SelectRecord(pCd1,pCd2,pCd3 : string );
  end;

var
  mstSakuhiForm: TmstSakuhiForm;

implementation

uses DMU;

{$R *.DFM}
{Version 0.6 #48 所定作目の指定:レコード移動する}
procedure TmstSakuhiForm.SelectRecord(pCd1,pCd2,pCd3 : string );
var
  aCnt : integer ;
begin
  {作目コード一致を探す}
  for aCnt := 0 to SakumokuCDList.Count -1 do begin
    if SakumokuCDList[aCnt] = pCd1 then begin
      ComboBox1.ItemIndex := aCnt ;
      ComboBox1Change(self);
      break;
    end;
  end;
  {作物コード一致を探す}
  for aCnt := 0 to SakumotuCDList.Count -1 do begin
    if SakumotuCDList[aCnt] = pCd2 then begin
      ComboBox2.ItemIndex := aCnt ;
      ComboBox2Change(self);
      break;
    end;
  end;
  {作型コード一致を探す}
  for aCnt := 0 to SakugataCDList.Count -1 do begin
    if SakugataCDList[aCnt] = pCd3 then begin
      ComboBox3.ItemIndex := aCnt ;
      ComboBox3Change(self);
      break;
    end;
  end;

end;

procedure TmstSakuhiForm.SetEditFlag(bFlag :Boolean);
begin
  case bFlag of
  false :  FisEdit := False ;
  true : begin
    ADOTable1.Edit ;
    FisEdit := True ;
  end;
  end;
end;

procedure TmstSakuhiForm.SuiListDblClick(Sender: TObject);
begin
  if SuiList.itemindex < 0 then exit;
   SuiList.Items.Delete( SuiList.itemindex);
  SetEditFlag(True);  //autoedit

end;

procedure TmstSakuhiForm.FormCreate(Sender: TObject);
begin

{
  if JMode = 'Douou' then begin
      ADOQuery1.DatabaseName := 'DOJO';
      ADOQuery2.DatabaseName := 'DOJO2';
      ADOTable1.DatabaseName := 'DOJO2';
  end
  else begin
      ADOQuery1.DatabaseName := 'DOJO';
      ADOQuery2.DatabaseName := 'DOJO';
      ADOTable1.DatabaseName := 'DOJO';
  end;
}

  FIsPost:=False;
	Color := BackColor ;
  FIsEdit := False ;
  ADOTable1.Open;
  SakumokuCDList := TStringList.Create ;
  SakumotuCDList := TStringList.Create ;
  SakugataCDList := TStringList.Create ;
//  if  not IsEntryYear then begin
//    btnKaseiAdd.Enabled := False  ;	//操作可能年度で無ければ編集不可
//    btnKaseiDel.Enabled := False  ;	//操作可能年度で無ければ編集不可
//    btnYuukiAdd.Enabled := False  ;	//操作可能年度で無ければ編集不可
//    btnYuukiDel.Enabled := False  ;	//操作可能年度で無ければ編集不可
//    KaseiList.OnDblClick := nil ;
//    YuukiList.OnDblClick := nil ;
//    KaseiMast.OnDblClick := nil ;
//    YuukiMast.OnDblClick := nil ;
//  end;
  {以下旧Onshow}
 	ComboBox1.Items.Clear ;
  SakumokuCDList.Clear ;
	with ADOQuery1 do begin
		SQL.Text := 'select 作目名,作目コード from M_SAKUMOKU';
    Open;
	  while not Eof do begin
  	  ComboBox1.Items.Add(FieldByname('作目名').asString );
      SakumokuCDList.Add( FieldByname('作目コード').asString );
  		Next;
  	end;
    Close;
  end;
  KaseiMast.Items.Clear;
 	with ADOQuery2 do begin
		SQL.Text := 'select CODE,肥料名 from M_KASEI';
    Open;
	  while not Eof do begin
  	  KaseiMast.Items.Add(FieldByname('CODE').asString + ' ' +
             FieldByname('肥料名').asString );
  		Next;
  	end;
    Close;
  end;
  YuukiMast.Items.Clear;
 	with ADOQuery2 do begin
		SQL.Text := 'select 有機物コード,有機物名称 from M_YUUKI';
    Open;
	  while not Eof do begin
  	  YuukiMast.Items.Add(FieldByname('有機物コード').asString + ' ' +
             FieldByname('有機物名称').asString );
  		Next;
  	end;
    Close;
  end;
end;

procedure TmstSakuhiForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  MasterIni: TIniFile;
  stmp : String;

begin
  if IsEdit then PostData ; //フィールドにデータ登録する
  ADOTable1.Close;
  SakumokuCDList.Free;
  SakumotuCDList.Free ;
  SakugataCDList.Free ;


  if FIsPost then begin
    if JMode = 'Douou' then begin

      stmp := AppPath +	EntryCenter + '\' + EntryYear+'\'+SyncFile;
      MasterIni := TIniFile.Create(stmp);
      if MasterIni = nil then begin
  	showmessage('同期設定ファイルが見つかりません。');
        exit;
      end;
      stmp := 'update'+ESisyoNO.Text;
      MasterIni.WriteDateTime( 'm_sakhi', stmp,now ) ;

      MasterIni.Free ;
    end
    else begin
      UpdateSyncFile(DataPath+SYNCFILE,ChangeFileExt(ExtractFileName(ADOTable1.TableName),''));
    end;
  end;

end;

procedure TmstSakuhiForm.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TmstSakuhiForm.GetSakumotuList( SakumokuCD : string );
var
stmp : String;
begin
	ComboBox2.Items.Clear ;
  SakumotuCDList.Clear ;
	with ADOQuery1 do begin
    close;
    SQL.Clear;
    stmp := 'select 作物名,作物コード from M_SAKUMOTU where 作目コード="'+SakumokuCD+'"';
    SQL.Add(stmp);
    Open;
	  while not Eof do begin
  	  ComboBox2.Items.Add(FieldByname('作物名').asString );
      SakumotuCDList.Add( FieldByname('作物コード').asString );
  		Next;
  	end;
    Close;
  end;
end;
procedure TmstSakuhiForm.GetSakugataList( SakumokuCD,SakumotuCD : string );
var
stmp : String;
begin
	ComboBox3.Items.Clear ;
  SakugataCDList.Clear ;
	with ADOQuery1 do begin
    close;
    SQL.Clear;
    stmp := 'select 作型名,作型コード from M_SAKUGATA where 作目コード="'+SakumokuCD+'" and 作物コード="'+ SakumotuCD+'"';
    SQL.Add(stmp);
    Open;
	  while not Eof do begin
  	  ComboBox3.Items.Add(FieldByname('作型名').asString );
      SakugataCDList.Add( FieldByname('作型コード').asString );
  		Next;
  	end;
    Close;
  end;
end;
{リストにすでに登録されているか}
procedure TmstSakuhiForm.ADOTable1AfterPost(DataSet: TDataSet);
begin
FIsPost := True ;
end;

procedure TmstSakuhiForm.ADOTable1AfterScroll(DataSet: TDataSet);
var
  aCnt : integer ;
  Code : String;
begin
 {画面状態からデータ取得有効か確認}
  KaseiList.Items.Clear ;
  YuukiList.Items.Clear ;
  if ComboBox3.ItemIndex < 0 then exit ;
  for aCnt := 1 to 10 do begin
    Code := DataSet.FieldByName('化成'+InttoStr(aCnt)).asString ;
    if Code <> '' then
      KaseiList.Items.Add( Code + ' ' +   GetHiryoName(Code));
  end;
    for aCnt := 1 to 5 do begin
    Code := DataSet.FieldByName('推奨'+InttoStr(aCnt)).asString ;
    if Code <> '' then
      SuiList.Items.Add( Code + ' ' +   GetHiryoName(Code));
  end;

  for aCnt := 1 to 5 do begin
    Code := DataSet.FieldByName('有機'+InttoStr(aCnt)).asString ;
    if Code <> '' then
      YuukiList.Items.Add( Code + ' ' +GetHiryoName(Code));
  end;

end;

function  TmstSakuhiForm.AlReadyList( aList : TListBox; aCode : string ) : Boolean;
var
  aCnt : integer ;
begin
  result := False ;
  for aCnt := 0 to aList.Items.count-1 do begin
    if  Copy(aList.Items[aCnt],1,length(aCode)) = aCode then begin
      result := True ;
      exit;
    end;
  end;
end;
procedure TmstSakuhiForm.BtKensakuClick(Sender: TObject);
var
stmp : String;

begin
  inherited;

//検索

  if Eken.Text <> '' then begin

    stmp := 'Select * From M_KASEI Where 肥料名 like "%' + EKen.Text + '%"';
  end
  else begin
    stmp := 'Select * From M_KASEI';
  end;

  KaseiMast.Items.Clear;
 	with ADOQuery2 do begin
		SQL.Text := stmp;
    Open;
	  while not Eof do begin
  	  KaseiMast.Items.Add(FieldByname('CODE').asString + ' ' +
             FieldByname('肥料名').asString );
  		Next;
  	end;
    Close;
  end;





end;

{化成追加}
procedure TmstSakuhiForm.btnKaseiAddClick(Sender: TObject);
begin
  if ComboBox3.ItemIndex < 0 then exit;
  if KaseiList.Items.Count >= 15 then exit ;
  if KaseiMast.itemindex < 0 then exit;
  {既存チェック}
  if AlReadyList(KaseiList,KaseiMast.Items[KaseiMast.itemindex]) then exit ;
  KaseiList.Items.Add( KaseiMast.Items[KaseiMast.itemindex]);
  SetEditFlag(True);  //autoedit
end;

{有機追加}
procedure TmstSakuhiForm.btnYuukiAddClick(Sender: TObject);
begin
  if ComboBox3.ItemIndex < 0 then exit;
  if YuukiList.Items.Count >= 5 then exit ;
  if YuukiMast.itemindex < 0 then exit;
  if AlReadyList(YuukiList,YuukiMast.Items[YuukiMast.itemindex]) then exit ;
  YuukiList.Items.Add( YuukiMast.Items[YuukiMast.itemindex]);
  SetEditFlag(True);  //autoedit
end;
{化成削除}
procedure TmstSakuhiForm.btnKaseiDelClick(Sender: TObject);
begin
  if KaseiList.itemindex < 0 then exit;
  KaseiList.Items.Delete( KaseiList.itemindex);
  SetEditFlag(True);  //autoedit
end;
procedure TmstSakuhiForm.btnSuiAddClick(Sender: TObject);
begin

  if ComboBox3.ItemIndex < 0 then exit;
  if SuiList.Items.Count >= 5 then exit ;
  if KaseiMast.itemindex < 0 then exit;
  {既存チェック}
  if AlReadyList(SuiList,KaseiMast.Items[KaseiMast.itemindex]) then exit ;
  SuiList.Items.Add( KaseiMast.Items[KaseiMast.itemindex]);
  SetEditFlag(True);  //autoedit

end;

procedure TmstSakuhiForm.btnSuiDelClick(Sender: TObject);
begin
  if SuiList.itemindex < 0 then exit;
  SuiList.Items.Delete( SuiList.itemindex);
  SetEditFlag(True);  //autoedit

end;

{有機削除}
procedure TmstSakuhiForm.btnYuukiDelClick(Sender: TObject);
begin
  if YuukiList.itemindex < 0 then exit;
  YuukiList.Items.Delete( YuukiList.itemindex);
  SetEditFlag(True);  //autoedit
end;

procedure TmstSakuhiForm.ComboBox1Change(Sender: TObject);
begin
  if IsEdit then PostData ; //フィールドにデータ登録する
  ComboBox2.Enabled := ComboBox1.Itemindex >= 0 ;
  GetSakumotuList(SakumokuCDList[ComboBox1.Itemindex]);
  ComboBox3.Clear ;
  ComboBox3.Enabled := false ;
  Table1AfterScroll(ADOTable1);  {リストクリア}
end;

procedure TmstSakuhiForm.ComboBox2Change(Sender: TObject);
begin
  if IsEdit then PostData ; //フィールドにデータ登録する
  ComboBox3.Enabled := ComboBox2.Itemindex >= 0 ;
  GetSakugataList(SakumokuCDList[ComboBox1.Itemindex],SakumotuCDList[ComboBox2.Itemindex]);
  Table1AfterScroll(ADOTable1);  {リストクリア}
end;
{作物別肥料マスタのレコード選択}
procedure TmstSakuhiForm.ComboBox3Change(Sender: TObject);
begin
  if IsEdit then PostData ; //フィールドにデータ登録する
  if ComboBox3.ItemIndex < 0 then exit ;
  //レコードを選択する。なければレコード作成
  with ADOTable1 do begin
    if not Locate('作目コード;作物コード;作型コード',
      VarArrayOf([SakumokuCDList[ComboBox1.ItemIndex],
                  SakumotuCDList[ComboBox2.ItemIndex],
                  SakugataCDList[ComboBox3.ItemIndex]]),[]) then begin
        KaseiList.Items.Clear ;    {無かったら以前のデータクリア}
        YuukiList.Items.Clear ;
        SuiList.Items.Clear;
//        if IsEntryYear then begin
          Append ;
          FieldByName('作目コード').asString := SakumokuCDList[ComboBox1.ItemIndex];
          FieldByName('作物コード').asString := SakumotuCDList[ComboBox2.ItemIndex];
          FieldByName('作型コード').asString := SakugataCDList[ComboBox3.ItemIndex];
          SetEditFlag(True);  //autoedit
//        end;
    end;
  end;
end;

{画面データの登録}
procedure TmstSakuhiForm.PostData;
var
  aCnt : integer ;
  aCode : string ;
begin
  with ADOTable1 do begin
    for aCnt := 1 to 10 do begin
      if KaseiList.Items.Count >= aCnt then begin
        aCode := Copy(KaseiList.Items[aCnt-1],1,4);
        FieldByName('化成'+InttoStr(aCnt)).asString := aCode  ;
      end else
        FieldByName('化成'+InttoStr(aCnt)).Clear ;
    end;

    for aCnt := 1 to 5 do begin
      if SuiList.Items.Count >= aCnt then begin
        aCode := Copy(SuiList.Items[aCnt-1],1,4);
        FieldByName('推奨'+InttoStr(aCnt)).asString := aCode  ;
      end else
        FieldByName('推奨'+InttoStr(aCnt)).Clear ;
    end;

    for aCnt := 1 to 5 do begin
      if YuukiList.Items.Count >= aCnt then begin
        aCode := Copy(YuukiList.Items[aCnt-1],1,2);
        FieldByName('有機'+InttoStr(aCnt)).asString := aCode ;
      end else
        FieldByName('有機'+InttoStr(aCnt)).Clear ;
    end;
    Post;
    SetEditFlag(False);  //autoedit
  end;
end;
procedure TmstSakuhiForm.Table1AfterScroll(DataSet: TDataSet);
var
  aCnt : integer ;
  Code : string ;
begin
  {画面状態からデータ取得有効か確認}
  KaseiList.Items.Clear ;
  YuukiList.Items.Clear ;
  SuiList.Items.Clear;
  if ComboBox3.ItemIndex < 0 then exit ;
  for aCnt := 1 to 10 do begin
    Code := DataSet.FieldByName('化成'+InttoStr(aCnt)).asString ;
    if Code <> '' then
      KaseiList.Items.Add( Code + ' ' +   GetHiryoName(Code));
  end;
  for aCnt := 1 to 5 do begin
    Code := DataSet.FieldByName('推奨'+InttoStr(aCnt)).asString ;
    if Code <> '' then
      SuiList.Items.Add( Code + ' ' +   GetHiryoName(Code));
  end;

  for aCnt := 1 to 5 do begin
    Code := DataSet.FieldByName('有機'+InttoStr(aCnt)).asString ;
    if Code <> '' then
      YuukiList.Items.Add( Code + ' ' +GetHiryoName(Code));
  end;

end;

procedure TmstSakuhiForm.Table1AfterPost(DataSet: TDataSet);
begin
  FIsPost := True ;
end;

procedure TmstSakuhiForm.BttopClick(Sender: TObject);
var
stmp : String;
begin
  if KaseiList.itemindex < 0 then exit;

   stmp := KaseiList.Items.Strings[KaseiList.itemindex];
  KaseiList.Items.Delete( KaseiList.itemindex);

  KaseiList.Items.Insert( 0, stmp );


  SetEditFlag(True);  //autoedit

end;

end.
