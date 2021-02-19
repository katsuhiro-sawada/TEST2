unit PreviewU;



interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, ComCtrls,IniFiles, Db, Grids, DBGrids,ComObj,
  Spin,UFETaitoru,UFSetHiryou;
type
	TReportType = (rtSindan,rtTaihi,rtSiryou,rtSekkei,rtBunseki);
type
  TfrmPreview = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Panel3: TPanel;
    BitBtn3: TBitBtn;
    btnAll: TBitBtn;
    BitBtn2: TBitBtn;
    FontBtn: TBitBtn;
    ScrollBox1: TScrollBox;
    Panel2: TPanel;
    Image1: TImage;
    PrinterSetupDialog1: TPrinterSetupDialog;
    FontDialog1: TFontDialog;
    btnCMT: TBitBtn;
    btnSaveAs: TBitBtn;
    SaveDialog1: TSaveDialog;
    SpDojyou: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Image2: TImage;
    BtSetHiryou: TBitBtn;
    BitBtn4: TBitBtn;
    SPE: TSpinEdit;
    SaveDialog2: TSaveDialog;
    SpeedButton2: TSpeedButton;
    BitBtn1: TBitBtn;
    BtHiryou: TBitBtn;
    btnPrev: TBitBtn;
    btnNext: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
		procedure btnAllClick(Sender: TObject);
		procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNextClick(Sender: TObject);
    procedure btnPrevClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FontBtnClick(Sender: TObject);
    procedure btnCMTClick(Sender: TObject);
    procedure btnSaveAsClick(Sender: TObject);
    procedure SpDojyouClick(Sender: TObject);
    procedure SpSehiClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BtSetHiryouClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BtHiryouClick(Sender: TObject);
  private
    { Private 宣言 }
		FZoomScale: Integer;
//		Image : TImage;
		myRect : TRect;
    FReportType : TReportType ;
		procedure FormReset;
		procedure MakeImage;
		procedure DspData;
    function FtoStr(aValue : double; aPrec : integer ):string;
    function FtoStr000(aField : TField; aPrec : integer ):string;
    {苦土me/100mg}
    function KudoMe( aValue : double ) : double;
    function SekkaiMe( aValue : double ) : double;
    function KariMe( aValue : double ) : double;
    function RinsanMe( aValue : double ) : double;

	public
		{ Public 宣言 }

		Pages,PageCnt: Integer;
		CanvasList: TList;
    KeyCodeList : TStringList ;
		property ZoomScale: Integer read FZoomScale write FZoomScale;
  end;

type
	TDeviceType = (dvDISP,dvPRNT);
	TLineMode 		=	(lmClear,lmNONE,lmUNDER,lmRECTLINENOT,lmRECT,lmRECTFILL,lmRECTFILLBLUE,lmRECTFILLRED,lmRECTFILLYELLOW);      //矩形印刷タイプ
	TTextLayout 	= (tlBOTTOM,tlTOP,tlCENTER);    //文字配置天地
	TTextAlignment = (taLEFT,taCENTER,taRIGHT);   //文字配置左右
	TFontType = (ftNORMAL,ftBOLD); 					{文字種}
const
	DefPenSize = 0.1;
  MidPenSize = 0.3;
  BoldPenSize = 0.5;

var
  frmPreview: TfrmPreview;
	LeftMargin : Integer;       { 左の余白(mm) - 印刷不能領域を含まない }
	TopMargin : Integer;        { 上の余白(mm) - 印刷不能領域を含まない }
	PrintCanvas : TCanvas;
	PixelsPerInch: Integer;
  HSpc,VSpc : integer ;
  PrintFontName : string ;    {印刷用フォント名}
  PrintFontResize : integer ; {相対フォントサイズ size=8,9,10,11対象}
  DeviceType : TDeviceType;   {呼び出しもとデバイスタイプ}

procedure DspPrnReport(AOwner: TForm; RType : TReportType ; RecCnt : Integer);
function HorzSize(w: Longint): Integer;
function VertSize(h: Longint): Integer;
function HorzPos(xp: Integer): Integer;
function VertPos(yp: Integer): Integer;
function PixToMMSize(value : Integer) : Integer;
procedure FontSize(pt: Integer);
procedure PenSize(pt4: Extended	);
function GetTrign( cx, cy , radius , angle : integer ): TPoint ;

procedure SlantLine(fX,fY,tX,tY : Integer);
procedure SlantLine2(mode,fX,fY,tX,tY : Integer);

procedure PictSlantLine(start, stop : TPoint);
procedure PictSlantLine2(start, stop : TPoint);
procedure PictSlantLine3(start, stop : TPoint);
procedure CircleLine( aStyle: integer ; cX,cY,radius : Integer );
procedure RectLine(RectMode : TLineMode ; fX,fY,Width,Height : Integer );
{矩形内テキスト印字：印刷ライン(mm)、文字位置、矩形サイズ、フォントサイズ、文字列}
procedure RectAndText(RectMode : TLineMode;TextLoc :TTextLayout;TextSide:TTextAlignment ;
			fX,fY,Width,Height,tsize : Integer; text : string ;Fonttype : TFontType );
function RectAndMemo(RectMode : TLineMode;fX,fY,Width,Height, tsize : Integer;
						text : string ;Fonttype : TFontType; var MaxHeight :Integer ):Boolean;

function PrintReport( RType : TReportType; prmPrintCanvas: TCanvas;
                      prmDeviceType : TDeviceType; prmPixelsPerInch: Integer;
                      PageCnt : Integer; var KeyCode : string ):boolean;
procedure PrintStretchBitmap(PrintCanvas: TCanvas;
												 X, Y, DestWidth, DestHeight: Integer; Bitmap: TBitmap);

implementation

uses
 Math,PrnCanvasU,Printers, DMU, EntCMTU, ProgressU, jpeg, MainU, DojouU,UFMsg,
  UFDokaiChenge, USetSehi;

{$R *.DFM}

const
  LeftStart = 15 ;	{印刷左開始位置}
  TopStart = 10 ;	{印刷上開始位置}

procedure DspPrnReport( AOwner: TForm ; RType : TReportType ; RecCnt : Integer);
var
	PrnDlg : TfrmPreview;
begin
	PrnDlg := TfrmPreview.Create(AOwner );
  PrnDlg.FReportType := RType ;
{
  if (RType = rtTaihi) or (RType = rtSiryou) then begin
     PrnDlg.SpDojyou.Visible := false;
     //PrnDlg.SpSehi.Visible := false;
     PrnDlg.btnCMT.Visible := false;
  end
  else begin
     PrnDlg.SpDojyou.Visible := false; //true;
     //PrnDlg.SpSehi.Visible := true;
     PrnDlg.btnCMT.Visible := true;

  end;
}

  //PrnDlg.btnCMT.Visible := false;

  PrnDlg.Pages := RecCnt;  //ページ数
	PrnDlg.ShowModal;
	PrnDlg.Release;
end;


procedure TfrmPreview.FormCreate(Sender: TObject);
begin
//	inherited;
	Color := BackColor ;
	PageCnt := 1;
	ZoomScale := 100;
//	CanvasList := TList.Create;
//  KeyCodeList := TStringList.Create ;
//  btnCMT.Enabled := IsEntryYear ;
end;
procedure TfrmPreview.FormReset;
//var
//	cnt : Integer;
begin
//	for cnt := 0 to (CanvasList.count -1) do begin
//		Image := CanvasList.Items[cnt] ;
//		Image.Free;
//	end;
//  CanvasList.clear ;
end;
{データをイメージに貼り付ける}
procedure TfrmPreview.MakeImage;
var
	Scale: Double;
	PhysPageSize, PrintingOffset: TPoint;
  KeyCd : string ;
  Pages : Integer;
begin
	FormReset;
//	inherited;
	Pages := 1;
  KeyCd := '';


  { プリンタの用紙サイズ }
  Escape(Printer.Handle, GETPHYSPAGESIZE, 0, nil, @PhysPageSize);
  { プリンタの印字開始位置 }
	Escape(Printer.Handle, GETPRINTINGOFFSET, 0, nil, @PrintingOffset);
	with Printer do begin
  	//プリンタの解像度と画面の解像度の比率
		Scale := Longint(PixelsPerInch)/GetDeviceCaps(Handle, LOGPIXELSY) * FZoomScale/100;
    { PreviewPanel を用紙サイズに、PreviewArea を印字可能サイズに合わせる }
		Panel2.Width := Round(PhysPageSize.X * Scale);
		Panel2.Height := Round(PhysPageSize.Y * Scale);
		Image1.SetBounds(Round(PrintingOffset.X * Scale), Round(PrintingOffset.Y * Scale),
													Round(PageWidth * Scale), Round(PageHeight * Scale));
		myRect := Rect(0,0,Image1.width,Image1.Height);
//		Image := TImage.Create(self);
//		Image.SetBounds(Round(PrintingOffset.X * Scale), Round(PrintingOffset.Y * Scale),
//													Round(PageWidth * Scale), Round(PageHeight * Scale));

        //診断票描画 //H150828 Aki
		PrintReport( FReportType, Image1.Canvas, dvDISP,MulDiv(PixelsPerInch, FZoomScale, 100),Pages,KeyCD);
            //プログレス一つ進む。中断なら処理止める
//            if not NextProgress then break;
//			CanvasList.add(Image);   // 成功したらリストに加える
//    	    KeyCodeList.add( KeyCd ) ;

//			INC(Pages);
//			Image := TImage.Create(self);
//			Image.SetBounds(Round(PrintingOffset.X * Scale), Round(PrintingOffset.Y * Scale),
//													Round(PageWidth * Scale), Round(PageHeight * Scale));

//    	    KeyCodeList.add( KeyCd ) ;
{*
		while PrintReport( FReportType, Image.Canvas, dvDISP,MulDiv(PixelsPerInch, FZoomScale, 100),Pages,KeyCD)
		do begin
            //プログレス一つ進む。中断なら処理止める
            if not NextProgress then break;
			CanvasList.add(Image);   // 成功したらリストに加える
    	    KeyCodeList.add( KeyCd ) ;

			INC(Pages);
			Image := TImage.Create(self);
			Image.SetBounds(Round(PrintingOffset.X * Scale), Round(PrintingOffset.Y * Scale),
													Round(PageWidth * Scale), Round(PageHeight * Scale));
		end;
*}
		{最後の呼び出しはfalseなのでimageとPagesを減算}
//    Image.Free ;
//    DEC(Pages);
	end;
end;
procedure TfrmPreview.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  KeyCodeList.Free ;
	FormReset;    {イメージリストの解放}
//	CanvasList.Free;
//---ここから---------------------------------------
  if P_MODE then     {MainFormの処理と同じ}
    CloseDataBase;
//--------------------------------------------------
end;

procedure TfrmPreview.DspData;
begin
{
}
end;
{
  P.D メインフォーム
}
procedure TfrmPreview.FormShow(Sender: TObject);
//var
//SysFileName : String;
//SystemIni : TIniFile;
begin



 JVal.PrnLeftX := 0;


//印刷モード　PRNMODE　の時
{$IFDEF PRNMODE}
    // 所見入力非表示
    btnCMT.Visible := false;


    //ini ファイル読み込み
    SysFileName := AppPath + SYSFILE;

    //設定ﾌｧｲﾙの取り込み
    if FileExists( SysFileName ) then
      SystemIni := TIniFile.Create( SysFileName );

    if SystemIni = nil then begin
  	  showmessage('システム設定ファイルが見つかりません。');
      PostQuitMessage(0);
      exit;
    end;
  //値を取得
//  Debug := SystemIni.ReadBool('system', 'debug', false );
    EntryCenter := SystemIni.ReadString('Print', 'center', '' );
    EntryYear := SystemIni.ReadString('Print', 'thisyear', '' );
    P_SMPNO := SystemIni.ReadString('Print', 'sampleno', '' );


    ChangeDataBase( EntryCenter, EntryYear );
    P_MODE := false;
    P_TYPE := '1';
    FReportType := rtSindan;
//  P_SMPNO := '0001';
//  P_CENTER := 'youtei';
    P_CENTER := EntryCenter;

    P_YEAR := EntryYear; //'2003';
//    SQLCondition := 'サンプル番号 in ('''+P_SMPNO+''')';
    SQLCondition := 'サンプル番号='''+P_SMPNO+'''';

    Application.CreateForm(TSindanForm, SindanForm);

//    PrintModule1.QueryUketuke.SQL.Text := 'Select T_UKETUKE.*,M_HOJOU.土壌コード,M_HOJOU.土性コード,M_HOJOU.腐植コード '+
//    'from T_UKETUKE INNER JOIN M_HOJOU '+
//   	'ON  (T_UKETUKE.圃場番号 = M_HOJOU.圃場番号) where T_UKETUKE.削除フラグ<>True and ' + SQLCondition ;
//    PrintModule1.QueryUketuke.Open;
    //    MakeSQL;




{$ENDIF}
//---ここから---------------------------------------
  if P_MODE then begin    {MainFormの処理と同じ}
    if not ChangeDataBase(P_CENTER,P_YEAR) then begin
      PostQuitMessage(0);
      exit;
    end;
    SQLCondition := 'サンプル番号='''+P_SMPNO+'''';
    if P_TYPE = '1' then    FReportType := rtSindan
    else                    FReportType := rtSekkei ;
  end;
//--------------------------------------------------
  case FReportType of
  rtSindan: Caption := '土壌診断票';
  rtSekkei: Caption := '施肥設計票';
  rtBunseki: Caption := '分析値一覧';
  end;
//  btnCMT.Visible := FReportType = rtSindan ;
//  DspTitle.Caption := Caption ;
	MakeImage;
//	DspData;


  SPE.MaxValue := Pages;

end;

procedure TfrmPreview.btnAllClick(Sender: TObject);
var
	myPageCnt : Integer;
  KeyCd : string ;
begin

    JVal.PrnLeftX := 0;

    Application.CreateForm(TFMsg, FMsg);
    FMsg.Show;
    Application.ProcessMessages();


	with Printer do
	begin
		Title := Application.ExeName ;
    //プレビューがPrintReportの戻り値でCanvas listを作成しているので
    //NewPageのタイミングを呼べない。
		BeginDoc;
		myPageCnt := 1;
		while	PrintReport( FReportType, Canvas,dvPRNT,
						GetDeviceCaps(Handle, LOGPIXELSY),myPageCnt,KeyCD) do begin
			NewPage;
			INC(myPageCnt);
		end;
		EndDoc;
	end;
    FMsg.Release;

    //20110822 このメッセージを入れると終わらない。
    //showMessage('印刷を終了しました。');
end;
procedure TfrmPreview.BtSetHiryouClick(Sender: TObject);
var
KeyCD : String;
stmp : String;
begin

  //肥料変更
{
  Application.CreateForm(TFDokaiChenge, FDokaiChenge);

  FDokaiChenge.Vsample := MainForm.VSample;

  FDokaiChenge.ShowModal ;
  FDokaiChenge.Release ;
}

  Application.CreateForm(TFSetSehi, FSetSehi);

  FSetSehi.SNo := MainForm.VSample;

   //シミュレーション

  FSetSehi.ShowModal;
  FSetSehi.Release;


//  Application.CreateForm(TSimuForm, SimuForm);

//  SimuForm.FindNo(MainForm.VSample);
//  SimuForm.ShowModal ;
//  SimuForm.Release;








  //再描画
    Application.CreateForm(TFMsg, FMsg);
    FMsg.Show;
    Application.ProcessMessages();


    btnPrev.Enabled := false;
    btnNext.Enabled := false;


    PrintReport( FReportType, Image1.Canvas, dvDISP,MulDiv(PixelsPerInch, FZoomScale, 100),PageCnt,KeyCD);

    btnPrev.Enabled := true;
    btnNext.Enabled := true;

    FMsg.Release;





end;

procedure TfrmPreview.BitBtn1Click(Sender: TObject);
var
	myPageCnt : Integer;
  KeyCd : string ;
  flg : boolean;
begin

   //連続印刷

   if Application.MessageBox('プリンタを両面印刷に設定しましたか？','確認',MB_YESNO) = ID_NO then begin

   exit;

   end;




    Application.CreateForm(TFMsg, FMsg);
    FMsg.Show;
    Application.ProcessMessages();


	with Printer do
	begin
		Title := Application.ExeName ;
    //プレビューがPrintReportの戻り値でCanvas listを作成しているので
    //NewPageのタイミングを呼べない。
		BeginDoc;
		myPageCnt := 1;
    flg := true;
		while flg do begin
      JVal.PrnLeftX := -12;
      PrintReport( rtSindan, Canvas,dvPRNT,
						GetDeviceCaps(Handle, LOGPIXELSY),myPageCnt,KeyCD);
			NewPage;
      JVal.PrnLeftX := -12;
      flg := PrintReport( rtSekkei, Canvas,dvPRNT,
						GetDeviceCaps(Handle, LOGPIXELSY),myPageCnt,KeyCD);
			NewPage;
			INC(myPageCnt);
		end;
		EndDoc;
	end;
    FMsg.Release;

end;

procedure TfrmPreview.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmPreview.btnNextClick(Sender: TObject);
var
   KeyCD : String;

begin
 JVal.PrnLeftX := 0;

    Application.CreateForm(TFMsg, FMsg);
    FMsg.Show;
    Application.ProcessMessages();


    btnPrev.Enabled := false;
    btnNext.Enabled := false;



	 INC(PageCnt);

    if Pages < PageCnt then  begin
        DEC(PageCnt);
    end;

    PrintReport( FReportType, Image1.Canvas, dvDISP,MulDiv(PixelsPerInch, FZoomScale, 100),PageCnt,KeyCD);

    btnPrev.Enabled := true;
    btnNext.Enabled := true;

    FMsg.Release;

    SPE.Text := inttoStr(PageCnt);


//	DspData;
end;

procedure TfrmPreview.btnPrevClick(Sender: TObject);
var
   KeyCD : String;
   
begin

 JVal.PrnLeftX := 0;


    Application.CreateForm(TFMsg, FMsg);
    FMsg.Show;
    Application.ProcessMessages();

    btnPrev.Enabled := false;
    btnNext.Enabled := false;

	DEC(PageCnt);
    if PageCnt < 1 then  begin
        PageCnt := 1;
    end;
    PrintReport( FReportType, Image1.Canvas, dvDISP,MulDiv(PixelsPerInch, FZoomScale, 100),PageCnt,KeyCD);
//	DspData;

    btnPrev.Enabled := true;
    btnNext.Enabled := true;

    SPE.Text := inttoStr(PageCnt);

    FMsg.Release;

end;

procedure TfrmPreview.BitBtn3Click(Sender: TObject);
begin
	PrinterSetupDialog1.Execute;
end;

procedure TfrmPreview.BitBtn4Click(Sender: TObject);
var
KeyCD : String;

begin

//ページ移動

    Application.CreateForm(TFMsg, FMsg);
    FMsg.Show;
    Application.ProcessMessages();


    btnPrev.Enabled := false;
    btnNext.Enabled := false;



	 PageCnt := strtoint(SPE.Text);


//   if Pages < PageCnt then  begin
//        DEC(PageCnt);
//   end;

    PrintReport( FReportType, Image1.Canvas, dvDISP,MulDiv(PixelsPerInch, FZoomScale, 100),PageCnt,KeyCD);

    btnPrev.Enabled := true;
    btnNext.Enabled := true;

    FMsg.Release;







end;

procedure TfrmPreview.BtHiryouClick(Sender: TObject);
var
stmp : string;
begin

//推奨肥料設定



   Application.CreateForm(TFSetHiryou, FSetHiryou);
   FSetHiryou.ShowModal;
   FSetHiryou.Release;


    //再描画
   stmp := '';
   PrintReport( FReportType, Image1.Canvas, dvDISP,MulDiv(PixelsPerInch, FZoomScale, 100),PageCnt,stmp);



end;

procedure TfrmPreview.FontBtnClick(Sender: TObject);
begin
  FontDialog1.Font.Name := PrintFontName ;
  FontDialog1.Font.Size := 9 + PrintFontResize ;
  if FontDialog1.Execute then begin
    PrintFontName := FontDialog1.Font.Name ;
    PrintFontResize := FontDialog1.Font.Size - 9 ;
    MakeImage;
    DspData;
  end;
end;


//  ---------------------------------------------------------------------------
//	以下データ表示関数
//
{mmをピクセルに変換する}
function HorzSize(w: Longint): Integer;
begin
	Result := Round(w * PixelsPerInch / 25.4);
end;

function VertSize(h: Longint): Integer;
begin
	Result := Round(h * PixelsPerInch / 25.4);
end;

function HorzPos(xp: Integer): Integer;
begin
	Result := HorzSize(xp+LeftMargin);
end;

function VertPos(yp: Integer): Integer;
begin
	Result := VertSize(yp+TopMargin) ;
end;
procedure FontSize(pt: Integer);
begin
	PrintCanvas.Font.PixelsPerInch := PixelsPerInch;
	PrintCanvas.Font.Size := pt;
end;
{
	線幅はミリで指定。それをピクセルに変換：画面と、プリンタを統一するため
}
procedure PenSize(pt4: Extended	);
var
	Psize: integer;
begin
	PSize := Round(pt4 * PixelsPerInch / 25.4);
  if PSize <= 0 then PSize := 1;
	PrintCanvas.Pen.Width := PSize;
end;
{ピクセルをｍｍに返す}
function PixToMMSize(value : Integer) : Integer;
begin
	result := Round( value / PixelsPerInch * 25.4);
end;

{三角点位置を返す中心座標、距離、角度(右水平=0-360時計回り)}
function GetTrign( cx, cy , radius , angle : integer ): TPoint ;
var
	clu : double ;
begin
	clu := cos( angle / 360 * pi * 2 ) * radius + cx ;
  result.x := round( clu ) ;
  clu := sin( angle / 360 * pi * 2 ) * radius + cy ;
  result.y := round(  clu ) ;
end;
{円表示 ブラシスタイル、中心座標、半径}
{
  aStyle=1:灰色、2:白、以外：透明
}
procedure CircleLine( aStyle: integer ; cX,cY,radius : Integer );
var
	fx,fy,tX,tY : Integer;
        I :array of integer;
        LogBrush :TLogBrush;


begin
	fx := cx - radius ;
	fy := cy - radius ;
	tX := cx + radius ;
	tY := cY + radius ;
//	PrintCanvas.Brush.Color := clBlack;
//	PrintCanvas.Brush.Style := bsStyle;
    PrintCanvas.Brush.Bitmap := nil;
  case aStyle of
  1:begin
//::    if JMode_Brush then begin
      PrintCanvas.Brush.Color := TColor($C0C0C0);
      PrintCanvas.Brush.Style := bsSolid	;
	PenSize( MidPenSize );
  end;
  2:begin
  //PrintCanvas.Brush.Bitmap := MainForm.Image2.Picture.Bitmap ;
    //白で描画

  PrintCanvas.Pen.Width := 1;

  SetLength(I,2);
  I[0] :=5;   //一番目の破線の長さ
  I[1] :=0;   //一番目の空白の長さ
//  I[2] :=30;   //二番目の破線の長さ
//  I[3] :=10;   //二番目の空白の長さ
//  I[4] :=50;   //三番目の破線の長さ
//  I[5] :=10;   //三番目の空白の長さ

  LogBrush.lbStyle :=BS_SOLID;
  LogBrush.lbColor :=RGB(0,0,0);
  LogBrush.lbHatch :=0;
  PrintCanvas.Pen.Handle :=ExtCreatePen(PS_GEOMETRIC
                              or PS_USERSTYLE
                              or PS_ENDCAP_SQUARE,
                              1,
                              LogBrush,
                              Length(I),I);








    PrintCanvas.Brush.Color := TColor($FFFFFF);  //TColor($D0D0D0);
    PrintCanvas.Brush.Style := bsSolid	;
 //	PenSize( MidPenSize );
 	PenSize( DefPenSize );
  end;
  3:begin
  //PrintCanvas.Brush.Bitmap := MainForm.Image2.Picture.Bitmap ;
    //点線 AAAAAAAAAAAAAAAA
  PrintCanvas.Pen.Width := 1;

  SetLength(I,2);
  I[0] :=3;   //一番目の破線の長さ
  I[1] :=5;   //一番目の空白の長さ
//  I[2] :=30;   //二番目の破線の長さ
//  I[3] :=10;   //二番目の空白の長さ
//  I[4] :=50;   //三番目の破線の長さ
//  I[5] :=10;   //三番目の空白の長さ

  LogBrush.lbStyle :=BS_SOLID;
  LogBrush.lbColor :=RGB(0,0,0);
  LogBrush.lbHatch :=0;
  PrintCanvas.Pen.Handle :=ExtCreatePen(PS_GEOMETRIC
                              or PS_USERSTYLE
                              or PS_ENDCAP_SQUARE,
                              1,
                              LogBrush,
                              Length(I),I);
                              //or PS_SOLID



//    PrintCanvas.Pen.Handle :=CreatePen(PS_DOT,1,RGB(0,0,0));   //PS_DOT PS_DASHDO
    PrintCanvas.Brush.Color := TColor($FFFFFF);  //TColor($D0D0D0);
    PrintCanvas.Brush.Style := bsClear	;
  end;
  else begin
    //透明で描画
		PrintCanvas.Brush.Style := bsClear;
  	PrintCanvas.Brush.Bitmap := nil;
	PenSize( MidPenSize );
  end;
  end;

	PrintCanvas.Ellipse(HorzPos(fX),VertPos(fY),HorzPos(tX),VertPos(tY));

	PenSize( DefPenSize );
//	PrintCanvas.Brush.Color := clBlack;
	PrintCanvas.Brush.Style := bsClear;
  PrintCanvas.Brush.Bitmap := nil;
end;
{ライン表示:二点間直線描画}
procedure SlantLine(fX,fY,tX,tY : Integer);
begin
		PrintCanvas.MoveTo(HorzPos(fX),VertPos(fY));
		PrintCanvas.LineTo(HorzPos(tX),VertPos(tY));
end;

procedure SlantLine2(mode,fX,fY,tX,tY : Integer);
var
        I :array of integer;
        LogBrush :TLogBrush;

begin

if mode = 2 then begin
     PrintCanvas.Pen.Width := 1;

  SetLength(I,2);
  I[0] :=3;   //一番目の破線の長さ
  I[1] :=5;   //一番目の空白の長さ

//  I[2] :=30;   //二番目の破線の長さ
//  I[3] :=10;   //二番目の空白の長さ
//  I[4] :=50;   //三番目の破線の長さ
//  I[5] :=10;   //三番目の空白の長さ

  LogBrush.lbStyle :=BS_SOLID;
  LogBrush.lbColor :=RGB(0,0,0);
  LogBrush.lbHatch :=0;
  PrintCanvas.Pen.Handle :=ExtCreatePen(PS_GEOMETRIC
                              or PS_USERSTYLE
                              or PS_ENDCAP_SQUARE,
                              1,
                              LogBrush,
                              Length(I),I);
                              //or PS_SOLID



//    PrintCanvas.Pen.Handle :=CreatePen(PS_DOT,1,RGB(0,0,0));   //PS_DOT PS_DASHDO
    PrintCanvas.Brush.Color := TColor($FFFFFF);  //TColor($D0D0D0);
    PrintCanvas.Brush.Style := bsClear	;

end
else begin
       PrintCanvas.Pen.Width := 1;

  SetLength(I,2);
  I[0] :=5;   //一番目の破線の長さ
  I[1] :=0;   //一番目の空白の長さ

//  I[2] :=30;   //二番目の破線の長さ
//  I[3] :=10;   //二番目の空白の長さ
//  I[4] :=50;   //三番目の破線の長さ
//  I[5] :=10;   //三番目の空白の長さ

  LogBrush.lbStyle :=BS_SOLID;
  LogBrush.lbColor :=RGB(0,0,0);
  LogBrush.lbHatch :=0;
  PrintCanvas.Pen.Handle :=ExtCreatePen(PS_GEOMETRIC
                              or PS_USERSTYLE
                              or PS_ENDCAP_SQUARE,
                              1,
                              LogBrush,
                              Length(I),I);
                              //or PS_SOLID



//    PrintCanvas.Pen.Handle :=CreatePen(PS_DOT,1,RGB(0,0,0));   //PS_DOT PS_DASHDO
    PrintCanvas.Brush.Color := TColor($FFFFFF);  //TColor($D0D0D0);
    PrintCanvas.Brush.Style := bsClear	;

end;




		PrintCanvas.MoveTo(HorzPos(fX),VertPos(fY));
		PrintCanvas.LineTo(HorzPos(tX),VertPos(tY));




	PenSize( DefPenSize );
//	PrintCanvas.Brush.Color := clBlack;
	PrintCanvas.Brush.Style := bsClear;
  PrintCanvas.Brush.Bitmap := nil;

end;

{同：ピクト値}
procedure PictSlantLine(start, stop : TPoint);
begin
		PenSize( BoldPenSize );
		PrintCanvas.MoveTo(start.X,start.Y);
		PrintCanvas.LineTo(stop.X,stop.Y);
		PenSize( DefPenSize );
end;

procedure PictSlantLine2(start, stop : TPoint);
var
        I :array of integer;
        LogBrush :TLogBrush;

begin

		PenSize( BoldPenSize );

     PrintCanvas.Pen.Width := 2;

  SetLength(I,2);
  I[0] :=3;   //一番目の破線の長さ
  I[1] :=5;   //一番目の空白の長さ

//  I[2] :=30;   //二番目の破線の長さ
//  I[3] :=10;   //二番目の空白の長さ
//  I[4] :=50;   //三番目の破線の長さ
//  I[5] :=10;   //三番目の空白の長さ

  LogBrush.lbStyle :=BS_SOLID;
  LogBrush.lbColor :=RGB(0,0,0);
  LogBrush.lbHatch :=0;
  PrintCanvas.Pen.Handle :=ExtCreatePen(PS_GEOMETRIC
                              or PS_USERSTYLE
                              or PS_ENDCAP_SQUARE,
                              1,
                              LogBrush,
                              Length(I),I);
                              //or PS_SOLID



//    PrintCanvas.Pen.Handle :=CreatePen(PS_DOT,1,RGB(0,0,0));   //PS_DOT PS_DASHDO
    PrintCanvas.Brush.Color := TColor($FFFFFF);  //TColor($D0D0D0);
    PrintCanvas.Brush.Style := bsClear	;


		PrintCanvas.MoveTo(start.X,start.Y);
		PrintCanvas.LineTo(stop.X,stop.Y);



	PenSize( DefPenSize );
	PrintCanvas.Brush.Style := bsClear;
  PrintCanvas.Brush.Bitmap := nil;
end;
///////////////////////////////////
procedure PictSlantLine3(start, stop : TPoint);
var
        I :array of integer;
        LogBrush :TLogBrush;

begin

		PenSize( BoldPenSize );

     PrintCanvas.Pen.Width := 2;

  SetLength(I,2);
  I[0] :=10;   //一番目の破線の長さ
  I[1] :=5;   //一番目の空白の長さ

//  I[2] :=30;   //二番目の破線の長さ
//  I[3] :=10;   //二番目の空白の長さ
//  I[4] :=50;   //三番目の破線の長さ
//  I[5] :=10;   //三番目の空白の長さ

  LogBrush.lbStyle :=BS_SOLID;
  LogBrush.lbColor :=RGB(255,0,0);
  LogBrush.lbHatch :=0;
  PrintCanvas.Pen.Handle :=ExtCreatePen(PS_GEOMETRIC
                              or PS_USERSTYLE
                              or PS_ENDCAP_SQUARE,
                              1,
                              LogBrush,
                              Length(I),I);
                              //or PS_SOLID



//    PrintCanvas.Pen.Handle :=CreatePen(PS_DOT,1,RGB(0,0,0));   //PS_DOT PS_DASHDO
    PrintCanvas.Brush.Color := TColor($FFFFFF);  //TColor($D0D0D0);
    PrintCanvas.Brush.Style := bsClear	;


		PrintCanvas.MoveTo(start.X,start.Y);
		PrintCanvas.LineTo(stop.X,stop.Y);



	PenSize( DefPenSize );
	PrintCanvas.Brush.Style := bsClear;
  PrintCanvas.Brush.Bitmap := nil;
end;

{矩形表示}
procedure RectLine(RectMode : TLineMode ; fX,fY,Width,Height : Integer );
var
	tX,tY : Integer;
begin
	tX := fx+Width;
	tY := fY+Height;

  PenSize( BoldPenSize );

	{矩形の表示}
	case RectMode of
	lmUNDER:begin
		PrintCanvas.MoveTo(HorzPos(fX),VertPos(tY));
		PrintCanvas.LineTo(HorzPos(tX),VertPos(tY));
	end;
	lmRECT:begin
    PrintCanvas.Brush.Bitmap := nil;
    PrintCanvas.Brush.Style := bsClear;
//    PrintCanvas.Brush.Color := clWhite;
		PrintCanvas.Rectangle(HorzPos(fX),VertPos(fY),HorzPos(tX),VertPos(tY));
	end;
  end;
end;
{
矩形内テキスト印字：
矩形タイプ、文字配置天地、文字配置左右、
矩形位置、矩形サイズ、
印字文字列、フォントサイズ、文字修飾 、背景色
}
procedure RectAndText( RectMode : TLineMode; TextLoc :TTextLayout; TextSide:TTextAlignment ;
			fX,fY,Width,Height,tsize : Integer; text : string ;Fonttype : TFontType );  {テキスト印字制御対象フィールド}
var
	TheRect: TRect;
	tX,tY,FontHp,TextWp,LocXp,LocYp: Integer;
begin

	tX := fx+Width;
	tY := fY+Height;
	TheRect := Rect(HorzPos(fX),VertPos(fY),HorzPos(tX),VertPos(tY));

  PrintCanvas.Font.Name := PrintFontName ;
  {Ver. 1.3.1 印刷が画面の時フォント相対サイズ指定}
  if (DeviceType = dvDISP )and((tsize >= 8) and (tsize <=11)) then
	  FontSize(tsize +  PrintFontResize )
  else
    FontSize(tsize );
  {半角文字だとなぜか表示されない事がある}
	FontHp := PrintCanvas.TextHeight(text);
	TextWp := PrintCanvas.TextWidth(text);

	{天地位置}
	case TextLoc of
	tlBOTTOM:{下付け}begin
		LocYp := VertPos(tY)-FontHp - VSpc;
	end;
	tlTOP:   {上付け}begin
		LocYp := VertPos(fY) + VSpc;
	end;
	else{中央}  begin
		LocYp := Round((VertSize(tY-fY)-FontHp)/2)+VertPos(fY) ;
	end;
	end;
	{左右位置}
	case TextSide of
	taLeft:{左寄せ}begin
		LocXp := HorzPos(fX) + HSpc;
	end;
	taRight:{右寄せ}begin
		LocXp := HorzPos(tX)-TextWp - HSpc;
	end;
	else{中央}  begin
		LocXp := Round((HorzSize(tX-fX)-TextWp)/2)+HorzPos(fX)-1 ;
	end;
	end;
//	TLineMode 		=	(lmClear,lmNONE,lmUNDER,lmRECT);      //矩形印刷タイプ
	case RectMode of
  lmClear: begin//テキストのみ背景消さない
    PrintCanvas.TextFlags :=  0 ;
    PrintCanvas.Brush.Style := bsClear;
		PrintCanvas.TextOut(LocXp,LocYp, text ) ;
  end;
  lmNONE: begin
    PrintCanvas.TextFlags :=  ETO_CLIPPED ;
		PrintCanvas.TextRect(TheRect,LocXp,LocYp, text );
  end;
  lmUNDER: begin
    PrintCanvas.TextFlags :=  ETO_CLIPPED ;
		PrintCanvas.TextRect(TheRect,LocXp,LocYp, text );
		RectLine(lmUNDER,fx,fy,Width,Height);
  end;
  lmRECTLINENOT: begin
    {矩形}
//    PrintCanvas.Brush.Color := clBlack;
//    PrintCanvas.FrameRect(TheRect);
    PrintCanvas.Brush.Color := clWhite;
    PrintCanvas.Brush.Style := bsClear;
    PrintCanvas.TextFlags :=  ETO_CLIPPED ;
		PrintCanvas.TextRect(TheRect,LocXp,LocYp, text );
  end;
  lmRECT: begin
    {矩形}
    PrintCanvas.Brush.Color := clBlack;
    PrintCanvas.FrameRect(TheRect);
    PrintCanvas.Brush.Color := clWhite;
    PrintCanvas.Brush.Style := bsClear;
    PrintCanvas.TextFlags :=  ETO_CLIPPED ;
		PrintCanvas.TextRect(TheRect,LocXp,LocYp, text );
  end;
  lmRECTFILLBLUE:begin
    {背景を描画}
    if JMode_Brush then begin
      PrintCanvas.Brush.Bitmap := nil;
      PrintCanvas.Brush.Color := TColor($FF0000);
      PrintCanvas.Brush.Style := bsSolid	;
      PrintCanvas.FillRect(TheRect);
    end
    else begin
      PrintCanvas.Brush.Bitmap := nil;
      PrintCanvas.Brush.Color := clWhite;
      PrintCanvas.Brush.Style := bsClear;
      PrintCanvas.FillRect(TheRect);
    end;
//    PrintCanvas.TextFlags :=  ETO_CLIPPED or ETO_OPAQUE; {フォント背景も同色指定}
    PrintCanvas.TextFlags :=  ETO_CLIPPED ;
		PrintCanvas.TextRect(TheRect,LocXp,LocYp, text );
    PrintCanvas.Brush.Style := bsClear;
    PrintCanvas.Brush.Color := clWhite;
    {矩形}
    PrintCanvas.Brush.Color := clBlack;
    PrintCanvas.FrameRect(TheRect);
    PrintCanvas.Brush.Color := clWhite;
  end;
  lmRECTFILLRED:begin
    {背景を描画}
    if JMode_Brush then begin
      PrintCanvas.Brush.Bitmap := nil;
      PrintCanvas.Brush.Color := TColor($0000FF);
      PrintCanvas.Brush.Style := bsSolid	;
      PrintCanvas.FillRect(TheRect);
    end
    else begin
      PrintCanvas.Brush.Bitmap := nil;
      PrintCanvas.Brush.Color := clWhite;
      PrintCanvas.Brush.Style := bsClear;
      PrintCanvas.FillRect(TheRect);
    end;
//    PrintCanvas.TextFlags :=  ETO_CLIPPED or ETO_OPAQUE; {フォント背景も同色指定}
    PrintCanvas.TextFlags :=  ETO_CLIPPED ;
		PrintCanvas.TextRect(TheRect,LocXp,LocYp, text );
    PrintCanvas.Brush.Style := bsClear;
    PrintCanvas.Brush.Color := clWhite;
    {矩形}
    PrintCanvas.Brush.Color := clBlack;
    PrintCanvas.FrameRect(TheRect);
    PrintCanvas.Brush.Color := clWhite;
  end;
  lmRECTFILLYELLOW:begin
    {背景を描画}
    if JMode_Brush then begin
      PrintCanvas.Brush.Bitmap := nil;
      PrintCanvas.Brush.Color := TColor($00FFFF);
      PrintCanvas.Brush.Style := bsSolid	;
      PrintCanvas.FillRect(TheRect);
    end
    else begin
      PrintCanvas.Brush.Bitmap := nil;
      PrintCanvas.Brush.Color := clWhite;
      PrintCanvas.Brush.Style := bsClear;
      PrintCanvas.FillRect(TheRect);
    end;
//    PrintCanvas.TextFlags :=  ETO_CLIPPED or ETO_OPAQUE; {フォント背景も同色指定}
    PrintCanvas.TextFlags :=  ETO_CLIPPED ;
		PrintCanvas.TextRect(TheRect,LocXp,LocYp, text );
    PrintCanvas.Brush.Style := bsClear;
    PrintCanvas.Brush.Color := clWhite;
    {矩形}
    PrintCanvas.Brush.Color := clBlack;
    PrintCanvas.FrameRect(TheRect);
    PrintCanvas.Brush.Color := clWhite;
  end;
  lmRECTFILL:begin
    {背景を描画}
    if JMode_Brush then begin
      PrintCanvas.Brush.Bitmap := nil;
      PrintCanvas.Brush.Color := TColor($D0D0D0);
      PrintCanvas.Brush.Style := bsSolid	;
      PrintCanvas.FillRect(TheRect);
    end
    else begin
      PrintCanvas.Brush.Bitmap := nil;
      PrintCanvas.Brush.Color := clWhite;
      PrintCanvas.Brush.Style := bsClear;
      PrintCanvas.FillRect(TheRect);
    end;
//    PrintCanvas.TextFlags :=  ETO_CLIPPED or ETO_OPAQUE; {フォント背景も同色指定}
    PrintCanvas.TextFlags :=  ETO_CLIPPED ;
		PrintCanvas.TextRect(TheRect,LocXp,LocYp, text );
    PrintCanvas.Brush.Style := bsClear;
    PrintCanvas.Brush.Color := clWhite;
    {矩形}
    PrintCanvas.Brush.Color := clBlack;
    PrintCanvas.FrameRect(TheRect);
    PrintCanvas.Brush.Color := clWhite;
  end;
  end;

end;

{
	改行文字列印字    Height:通常高さ
}
function RectAndMemo(RectMode : TLineMode;fX,fY,Width,Height, tsize : Integer;
						text : string ;Fonttype : TFontType; var MaxHeight :Integer ):Boolean;
var
	aFormat : Integer;
	aRect : TRect;
	tX,tY,MaxH: Integer;
	Buff : string;
begin
	tX := fx+Width;
	tY := fY+Height;
	MaxH := VertPos(fY+MaxHeight);
  Buff := text;
//	SHOWMESSAGE( 'Y='+INTTOSTR(VERTPOS(TY))+'MAX='+INTTOSTR(MAXH));
	aRect := Rect(HorzPos(fX+1),VertPos(fY+1),HorzPos(tX),VertPos(tY));
  //Ver. 1.3.1 フォント設定、画面の時任意指定あり
  PrintCanvas.Font.Name := PrintFontName ;

  {Ver. 1.3.1 印刷が画面の時フォント相対サイズ指定}
  if (DeviceType = dvDISP )and((tsize >= 8) and (tsize <=11)) then
	  FontSize(tsize +  PrintFontResize )
  else
    FontSize(tsize );

	aFormat := DT_LEFT or DT_WORDBREAK or DT_CALCRECT;
	{配置サイズを確認}
	DrawText( PrintCanvas.Handle,PChar(Buff),Length(Buff),aRect,aFormat);

    //A.Nishimura 収まる収まらないに係わらずに書く
	aFormat := DT_LEFT or DT_WORDBREAK;
	aRect.Right := HorzPos(tX);	{元に戻す}
	aRect.Bottom := VertSize(PixToMMSize(aRect.Bottom)); {下段をｍｍオーダーに戻す}
	if RectMode = lmRECT then begin
//		書いたところで枠線を引く場合下のコメントはずす
//				PrintCanvas.Rectangle(HorzPos(fX),VertPos(fY),aRect.Right,aRect.Bottom);

		PrintCanvas.Rectangle(HorzPos(fX),VertPos(fY),aRect.Right,MaxH);
        end
        else if RectMode = lmRECTFILL then begin
                PrintCanvas.Brush.Bitmap := nil;
                PrintCanvas.Brush.Color := clWhite;
                PrintCanvas.Brush.Style := bsSolid	;

		PrintCanvas.Rectangle(HorzPos(fX),VertPos(fY),aRect.Right,MaxH);
        end;
	DrawText( PrintCanvas.Handle,PChar(Buff),Length(Buff),aRect,aFormat);
	result := True ;
	MaxHeight := PixToMMSize(aRect.Bottom - aRect.Top);

(*
	{範囲内でなければｆａｌｓｅを返す}
	if (aRect.Bottom <= VertPos(tY)) or     {通常サイズ内に収まるか}
		 (aRect.Bottom <= MaxH )then begin     {最大サイズ内に収まるか} {Ver 2.0 Add'='}
			{収まる場合そのまま印刷して使用領域を返す}
			aFormat := DT_LEFT or DT_WORDBREAK;
			aRect.Right := HorzPos(tX);	{元に戻す}
			aRect.Bottom := VertSize(PixToMMSize(aRect.Bottom)); {下段をｍｍオーダーに戻す}
			if RectMode = lmRECT then
//		書いたところで枠線を引く場合下のコメントはずす
//				PrintCanvas.Rectangle(HorzPos(fX),VertPos(fY),aRect.Right,aRect.Bottom);
				PrintCanvas.Rectangle(HorzPos(fX),VertPos(fY),aRect.Right,MaxH);
			DrawText( PrintCanvas.Handle,PChar(Buff),Length(Buff),aRect,aFormat);
			result := True ;
			MaxHeight := PixToMMSize(aRect.Bottom - aRect.Top);
	end else begin
			{収まらない場合エラーを返して使用領域を返す}
			result := False ;
      {2003/02/18：add +1/100 VertPosの算出との誤差の微調整}
			MaxHeight := PixToMMSize(aRect.Bottom - aRect.Top+Ceil((aRect.Bottom - aRect.Top)/100));
	end;
*)

end;
procedure PrintStretchBitmap(PrintCanvas: TCanvas;
												 X, Y, DestWidth, DestHeight: Integer; Bitmap: TBitmap);
var
	Info: PBitmapInfo;
  InfoSize: DWord;
  Image: Pointer;
  ImageSize: DWord;
begin
	if not((GetDeviceCaps(PrintCanvas.Handle,RASTERCAPS)and RC_STRETCHDIB) <> 0 ) then
	begin
		ShowMessage('This printer device is StretchDIBits not support.');
		//ストレッチ機能がない場合の書き出し処理

		exit;
	end;
  with Bitmap do
  begin
    { DIB の大きさを取得 }
    GetDIBSizes(Handle, InfoSize, ImageSize);
    Info := AllocMem(InfoSize);
    try
      Image := AllocMem(ImageSize);
      try
        { DIB データを取得 }
        GetDIB(Handle, Palette, Info^, Image^);
        with Info^.bmiHeader do
          StretchDIBits(PrintCanvas.Handle, X, Y, DestWidth, DestHeight,
            0, 0, biWidth, biHeight, Image, Info^, DIB_RGB_COLORS, SRCCOPY);
			finally
        FreeMem(Image, ImageSize);
      end;
    finally
      FreeMem(Info, InfoSize);
    end;
  end;
end;

function PrintReport( RType : TReportType; prmPrintCanvas: TCanvas;
                      prmDeviceType : TDeviceType; prmPixelsPerInch: Integer;
                      PageCnt : Integer ; var KeyCode : string ):boolean;
begin
	PrintCanvas := prmPrintCanvas;
	PixelsPerInch :=prmPixelsPerInch;
  DeviceType := prmDeviceType ;   {Ver. 1.3.1}
	result := False;


  {Ver. 1.3.1 解像度により寄せ位置を変更する}
//showmessage('pixels '+inttostr(PixelsPerInch));
  if PixelsPerInch < 100 then begin
    {画面}
    VSpc := 0;
    HSpc := 2;
  end else begin
    {印刷}
    if PixelsPerInch < 250 then begin
      VSpc := 1;
      HSpc := 3;
    end else begin
      VSpc := 1;
      HSpc := 4;
    end;
  end;

  with PrintCanvas do begin
		{ 用紙サイズの左上からの余白を求める場合は、Windows API の Escape 関数に }
		{ GETPRINTINGOFFSET を与える。 得られる結果はピクセル数なので、 }
		{ mm に換算する場合は、(25.4 / PixelsPerInch) を掛けること }
		{ 用紙サイズそのものを求めるときは、GETPHYSPAGESIZE を使う }
		{ プリンタの用紙サイズ }
		{ 左の余白(mm) - 印刷不能領域を含まない }
      LeftMargin := round(GetDeviceCaps(handle,PHYSICALOFFSETX)*2.54/100);
      LeftMargin := LeftMargin+LeftStart; //左余白15ミリ
      TopMargin := round(GetDeviceCaps(handle,PHYSICALOFFSETY)*2.54/100);        { 上の余白(mm) - 印刷不能領域を含まない }
      TopMargin := TopMargin + TopStart;
		{ フォームに設定されたフォントを印刷にも使う }
//		Font.Assign(self.Font);{呼出フォームが成立してなければならない}
//	Showmessage(Font.Name);

      //画面のクリア
      Pen.Color := clWhite;
//        Brush.Color := clRed;
      Brush.Color := clWhite;
      Rectangle(0,0,748,1086);
      Pen.Color := clBlack;
      Brush.Color := clBlack;

		{共通設定}
		FontSize(9);
		PenSize( DefPenSize );
		Pen.Color := clBlack;
		Pen.Style := psSolid;
		Brush.Color := clBlack;
		Brush.Style := bsClear;

  end;
  //調書の表示
     case RType of
//        rtSindan: result := PrintSindan(prmDeviceType,SQLCondition,PageCnt,KeyCode);
        rtSindan: result := PrintSindan(prmDeviceType,SQLCondition,PageCnt,KeyCode);
//        rtSindan: result := PrintSindan_kita(prmDeviceType,SQLCondition,PageCnt,KeyCode);


//        rtSekkei: result := PrintSekkeiSin(prmDeviceType,SQLCondition,PageCnt,KeyCode);
        rtSekkei: result := PrintSekkei(prmDeviceType,SQLCondition,PageCnt,KeyCode);


        //        rtTaihi: result := PrintTaihi(prmDeviceType,SQLCondition,PageCnt,KeyCode);
//        rtSiryou: result := PrintSiryou(prmDeviceType,SQLCondition,PageCnt,KeyCode);

     end;
//  end;
end;
//所見入力
procedure TfrmPreview.btnCMTClick(Sender: TObject);
var
stmp : String;
begin

   //PrintModule1.ADOSindan.Close;

   Application.CreateForm(TEntryCMTForm, EntryCMTForm);




  //stmp := PrintModule1.ADOQueryUketuke.FieldByName('作物名').asString;

  //EntryCMTForm.sakuname := stmp; //Jval2[1].sakuname;    //'アスパラガス'; //stmp;
  EntryCMTForm.KeyCode := JVal.SNO;
  
  EntryCMTForm.SetReport( FReportType );

   EntryCMTForm.ShowModal;
//   Application.ProcessMessages();

   EntryCMTForm.Release;



   //再描画
   stmp := '';
   PrintReport( FReportType, Image1.Canvas, dvDISP,MulDiv(PixelsPerInch, FZoomScale, 100),PageCnt,stmp);

{
  case FReportType of
  rtSindan: //'土壌診断票';
//  	if EntComment( FReportType , KeyCodeList[PageCnt-1]) then begin
  	if EntComment( FReportType , MainForm.VSample) then begin
    	MakeImage;
	    DspData;
    end;
  rtSekkei: //'施肥設計票';
  	if EntComment( FReportType , MainForm.VSample) then begin
//  	if EntComment( FReportType , KeyCodeList[PageCnt-1]) then begin
    	MakeImage;
	    DspData;
    end;
  end;
}
//  stmp := MainForm.VSample;
//  stmp := PrintModule1.QueryUketuke.FieldByName('サンプル番号').AsString;

end;
{Version 0.6 #44 メタファイル保存機能の追加}
// XXXXX jpg保存
procedure TfrmPreview.btnSaveAsClick(Sender: TObject);
var
//  Meta : TMetaFile ;
  jpg: TJPEGImage;
  FileName,aExt : string ;
begin
//
  case FReportType of
  rtSindan: //'土壌診断票';
    //SaveDialog1.FileName := 'D'+KeyCodeList[PageCnt-1]+'.jpg';
    SaveDialog1.FileName := 'D0000001.jpg';

  rtSekkei: //'施肥設計票';
    SaveDialog1.FileName := 'S'+KeyCodeList[PageCnt-1]+'.jpg';
  end;

  if not SaveDialog1.Execute then exit ;
//  Meta := TMetaFile.Create ;
  jpg :=  TJPEGImage.Create ;
  try
//    Meta.Assign(Image.Canvas);
//    Meta.SaveToFile(SaveDialog1.FileName);                      <- 無理
//    Image1.Picture.MetaFile.SaveToFile(SaveDialog1.FileName);   <-元Bitmapが破棄される
    FileName := SaveDialog1.FileName ;
    //フィルター変更で拡張子を手動で変更する。＜ここでないと反映しない
    //ofOverwritePrompt	= False にしないと、保存ボタン時点では、SaveDialog1.FileNameの拡張子で
    //確認をするため、混乱する
    case SaveDialog1.FilterIndex of
    1:  aExt := 'jpg';
    2:  aExt := 'bmp';
    end;
    FileName := ChangeFileExt(FileName,'.'+aExt) ;
    if LowerCase(ExtractFileExt(FileName)) = '.jpg' then begin
      jpg.Assign(Image1.Picture.Bitmap);
      jpg.SaveToFile(SaveDialog1.FileName);
    end else
      Image1.Picture.SaveToFile(SaveDialog1.FileName);            //<- ビットマップ保存でOK
  finally
//    Meta.Free ;
    jpg.Free;
  end;
end;

procedure TfrmPreview.SpDojyouClick(Sender: TObject);
var
   KeyCD : String;
begin


    BtHiryou.Enabled := false ;
    BtSetHiryou.Enabled := false;
  JVal.PrnLeftX := 0;


    Application.CreateForm(TFMsg, FMsg);
    FMsg.Show;

    Application.ProcessMessages();

    FReportType := rtSindan;
    PrintReport( FReportType, Image1.Canvas, dvDISP,MulDiv(PixelsPerInch, FZoomScale, 100),PageCnt,KeyCD);

    FMsg.Release;






end;

//エクセルへの出力

//エクセルへの出力
procedure TfrmPreview.SpeedButton1Click(Sender: TObject);
var
infile : String;
outfile : String;
    Excel: Variant;
xApp : Variant;
    WorkBook: Variant;
    WorkSheet: Variant;
    WorkSheetNew: Variant;
//    Aftertmp: Variant;

    Workimage : Variant;

    //image2 : TImage;
    RR1,RR2 : TRect;

scount : integer;
I : integer;

stmp : String;
stmp2 : String;

btmp,btmp2 : double;

typCEC : String;

kmin, kmax : double;
sAns2 : string;

aBuff : string;

gmin,gmax,bcec : double;


SekkaiHouwa : double;
KudoHouwa : double;
KariHouwa : double;
EnkiHouwa : double;
SekkaiKudo : double;
KudoKari : double;
RinsanKudo : double;

dblRinsan : double;

sakumokucd : string;
dokaino : string;

KeyCD : String;

stmp2com : String; //コメント


hsY : integer;
XX1,sY : integer;


taitoru : String;
hakono : String;

hiryouhyoujiflg : boolean;

begin

  //タイトルの入力
  Application.CreateForm(TFETaitoru, FETaitoru);

  FETaitoru.JaName :=  'ＪＡ'+FTPTiku;

  FETaitoru.ShowModal ;


  hakono := FETaitoru.ENo.Text;
  taitoru := 'No.' + FETaitoru.ENo.Text + ' ' + FETaitoru.EJA.Text + ' ' + FETaitoru.ESisyo.Text;


  FETaitoru.Release ;







  //出力ファイル名を出力
  SaveDialog2.FileName := 'No' + hakono + '.xls';

  if not SaveDialog2.Execute then exit ;
  outfile := SaveDialog2.FileName;

  //エクセルファイルの型をコピー
  infile :=  FTPServer + '\帳票型.xls';
  CopyFile(  PChar(infile) , PChar(outfile) ,  false ) ;


  Excel := CreateOleObject('Excel.Application');
  xApp := Excel.Application;


  WorkBook := xApp.Workbooks.Open( outfile );

  //画面を表示
  xApp.Visible := true;

  //シートの追加
  //WorkSheet := WorkBook.WorkSheets['DATA'];


  //サンプル
  with PrintModule1.ADOQueryUketuke do begin
  	Close;
    //SQL.Text :=


//  あいち用


SQL.Text := 'SELECT T_UKETUKE.*, '+
//'M_FUSHOKU.腐植名, M_DOJOU.水稲土壌コード, M_DOJOU.畑牧土壌コード, M_DOJOU.土壌名, '+
'M_DOJOU.土壌名, '+
'M_DOSEI.土性名, M_DOSEI.リン酸利用率 AS リン酸利用率,M_DOSEI.水田ＣＥＣ値 as 水田ＣＥＣ値,'+
'M_sakumotu.作物名, M_sakugata.作型名'+
',M_NOUKA.* '+
'FROM (((('+
'T_UKETUKE '+
'LEFT JOIN M_SAKUMOTU ON (T_UKETUKE.作物コード = M_sakumotu.作物コード)) '+
'LEFT JOIN M_SAKUGATA ON (T_UKETUKE.作物コード = M_sakugata.作物コード) AND (T_UKETUKE.作型コード = M_sakugata.作型コード)) '+
'LEFT JOIN M_DOJOU ON T_UKETUKE.土壌コード = M_DOJOU.土壌コード) '+
'LEFT JOIN M_DOSEI ON T_UKETUKE.土性コード = M_DOSEI.土性コード) '+
'LEFT JOIN M_NOUKA ON T_UKETUKE.農家番号 = M_NOUKA.農家番号 '+
'WHERE '+SQLCondition +
' ORDER BY サンプル番号';



   Open;



 end;

 for I := 1 to Pages do begin


  PrintReport( FReportType, Image1.Canvas, dvDISP,MulDiv(PixelsPerInch, FZoomScale, 100),I,KeyCD);


  WorkSheet := WorkBook.WorkSheets[I];

  //グラフをイメージにする

  image2.Width := 300;
  image2.Height := 320;
  RR1.Top := 1;
  RR1.Left := 1;
  RR1.Right:= 300;
  RR1.Bottom := 320;
  RR2.Top := 150;
  RR2.Left := 350;
  RR2.Right:= 650;
  RR2.Bottom := 468;
  image2.Canvas.CopyRect(RR1,image1.Canvas,RR2);


  stmp := TempPath+'aaaaa.jpg';

  image2.Picture.SaveToFile(stmp);


//  WorkSheetNew.Activate;
//  WorkSheet.Range['K8'].Select;
   WorkSheet.Activate;
    WorkSheet.Range['I8:I8'].Select;
//    WorkSheet.Range['I8:I8'].Activate;

    //xApp.Range['I8:M24'].Select;
  Workimage := WorkSheet.Pictures.insert(TempPath+'aaaaa.jpg'); //.select;

  Workimage.Left := 260.0;
  Workimage.Top := 110.0;

  //Workimage.select;

  //大きさの変更
  //Workimage.ShapeRange.ScaleWidth(0.5, False);


 end;




  //型ページを削除する。///////////////////////////

  //削除しますかのメッセージをけす。
  xApp.DisplayAlerts := False;
  WorkSheetNew := WorkBook.WorkSheets['DATA'];
  WorkSheetNew.Delete;
  //メッセージ表示を元に戻す。
  xApp.DisplayAlerts := True;


  //終了
  //Workbook.Disconnect;
  //xApp.Disconnect;
  //showmessage('Excel Version input macro Error !');


end;

procedure TfrmPreview.SpeedButton2Click(Sender: TObject);
var
   KeyCD : String;
begin

BtHiryou.Enabled := true ;

    BtSetHiryou.Enabled := true;
    JVal.PrnLeftX := 0;

    Application.CreateForm(TFMsg, FMsg);
    FMsg.Show;
    Application.ProcessMessages();

    FReportType := rtSekkei;
    PrintReport( FReportType, Image1.Canvas, dvDISP,MulDiv(PixelsPerInch, FZoomScale, 100),PageCnt,KeyCD);

    FMsg.Release;

end;

procedure TfrmPreview.SpSehiClick(Sender: TObject);
var
   KeyCD : String;
begin

    Application.CreateForm(TFMsg, FMsg);
    FMsg.Show;
    Application.ProcessMessages();

    FReportType := rtSekkei;
    PrintReport( FReportType, Image1.Canvas, dvDISP,MulDiv(PixelsPerInch, FZoomScale, 100),PageCnt,KeyCD);

    FMsg.Release;

end;
 //0は、表示しない
function TfrmPreview.FtoStr(aValue : double; aPrec : integer ):string;
begin
	if aValue <= 0.000 then result := ' '
  else
		result := Format('%.*n',[aPrec,aValue]);
end;

function TfrmPreview.FtoStr000(aField : TField; aPrec : integer ):string;
begin
	if aField.isNull then result := ' ' // '－'     {Version 0.6 #49}
  else
		result := Format('%.*n',[aPrec,aField.asFloat]);
end;

{苦土me/100mg}
function TfrmPreview.KudoMe( aValue : double ) : double;
begin
	result := aValue / 20.2 ;
end;
{石灰me/100mg}
function TfrmPreview.SekkaiMe( aValue : double ) : double;
begin
	result := aValue / 28.0 ;
end;
{加里me/100mg}
function TfrmPreview.KariMe( aValue : double ) : double;
begin
	result := aValue / 47.1 ;
end;
{リン酸me/100mg}
function TfrmPreview.RinsanMe( aValue : double ) : double;
begin
	result := aValue / 62.97 ;
end;






end.
