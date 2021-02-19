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
    { Private �錾 }
		FZoomScale: Integer;
//		Image : TImage;
		myRect : TRect;
    FReportType : TReportType ;
		procedure FormReset;
		procedure MakeImage;
		procedure DspData;
    function FtoStr(aValue : double; aPrec : integer ):string;
    function FtoStr000(aField : TField; aPrec : integer ):string;
    {��yme/100mg}
    function KudoMe( aValue : double ) : double;
    function SekkaiMe( aValue : double ) : double;
    function KariMe( aValue : double ) : double;
    function RinsanMe( aValue : double ) : double;

	public
		{ Public �錾 }

		Pages,PageCnt: Integer;
		CanvasList: TList;
    KeyCodeList : TStringList ;
		property ZoomScale: Integer read FZoomScale write FZoomScale;
  end;

type
	TDeviceType = (dvDISP,dvPRNT);
	TLineMode 		=	(lmClear,lmNONE,lmUNDER,lmRECTLINENOT,lmRECT,lmRECTFILL,lmRECTFILLBLUE,lmRECTFILLRED,lmRECTFILLYELLOW);      //��`����^�C�v
	TTextLayout 	= (tlBOTTOM,tlTOP,tlCENTER);    //�����z�u�V�n
	TTextAlignment = (taLEFT,taCENTER,taRIGHT);   //�����z�u���E
	TFontType = (ftNORMAL,ftBOLD); 					{������}
const
	DefPenSize = 0.1;
  MidPenSize = 0.3;
  BoldPenSize = 0.5;

var
  frmPreview: TfrmPreview;
	LeftMargin : Integer;       { ���̗]��(mm) - ����s�\�̈���܂܂Ȃ� }
	TopMargin : Integer;        { ��̗]��(mm) - ����s�\�̈���܂܂Ȃ� }
	PrintCanvas : TCanvas;
	PixelsPerInch: Integer;
  HSpc,VSpc : integer ;
  PrintFontName : string ;    {����p�t�H���g��}
  PrintFontResize : integer ; {���΃t�H���g�T�C�Y size=8,9,10,11�Ώ�}
  DeviceType : TDeviceType;   {�Ăяo�����ƃf�o�C�X�^�C�v}

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
{��`���e�L�X�g�󎚁F������C��(mm)�A�����ʒu�A��`�T�C�Y�A�t�H���g�T�C�Y�A������}
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
  LeftStart = 15 ;	{������J�n�ʒu}
  TopStart = 10 ;	{�����J�n�ʒu}

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

  PrnDlg.Pages := RecCnt;  //�y�[�W��
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
{�f�[�^���C���[�W�ɓ\��t����}
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


  { �v�����^�̗p���T�C�Y }
  Escape(Printer.Handle, GETPHYSPAGESIZE, 0, nil, @PhysPageSize);
  { �v�����^�̈󎚊J�n�ʒu }
	Escape(Printer.Handle, GETPRINTINGOFFSET, 0, nil, @PrintingOffset);
	with Printer do begin
  	//�v�����^�̉𑜓x�Ɖ�ʂ̉𑜓x�̔䗦
		Scale := Longint(PixelsPerInch)/GetDeviceCaps(Handle, LOGPIXELSY) * FZoomScale/100;
    { PreviewPanel ��p���T�C�Y�ɁAPreviewArea ���󎚉\�T�C�Y�ɍ��킹�� }
		Panel2.Width := Round(PhysPageSize.X * Scale);
		Panel2.Height := Round(PhysPageSize.Y * Scale);
		Image1.SetBounds(Round(PrintingOffset.X * Scale), Round(PrintingOffset.Y * Scale),
													Round(PageWidth * Scale), Round(PageHeight * Scale));
		myRect := Rect(0,0,Image1.width,Image1.Height);
//		Image := TImage.Create(self);
//		Image.SetBounds(Round(PrintingOffset.X * Scale), Round(PrintingOffset.Y * Scale),
//													Round(PageWidth * Scale), Round(PageHeight * Scale));

        //�f�f�[�`�� //H150828 Aki
		PrintReport( FReportType, Image1.Canvas, dvDISP,MulDiv(PixelsPerInch, FZoomScale, 100),Pages,KeyCD);
            //�v���O���X��i�ށB���f�Ȃ珈���~�߂�
//            if not NextProgress then break;
//			CanvasList.add(Image);   // ���������烊�X�g�ɉ�����
//    	    KeyCodeList.add( KeyCd ) ;

//			INC(Pages);
//			Image := TImage.Create(self);
//			Image.SetBounds(Round(PrintingOffset.X * Scale), Round(PrintingOffset.Y * Scale),
//													Round(PageWidth * Scale), Round(PageHeight * Scale));

//    	    KeyCodeList.add( KeyCd ) ;
{*
		while PrintReport( FReportType, Image.Canvas, dvDISP,MulDiv(PixelsPerInch, FZoomScale, 100),Pages,KeyCD)
		do begin
            //�v���O���X��i�ށB���f�Ȃ珈���~�߂�
            if not NextProgress then break;
			CanvasList.add(Image);   // ���������烊�X�g�ɉ�����
    	    KeyCodeList.add( KeyCd ) ;

			INC(Pages);
			Image := TImage.Create(self);
			Image.SetBounds(Round(PrintingOffset.X * Scale), Round(PrintingOffset.Y * Scale),
													Round(PageWidth * Scale), Round(PageHeight * Scale));
		end;
*}
		{�Ō�̌Ăяo����false�Ȃ̂�image��Pages�����Z}
//    Image.Free ;
//    DEC(Pages);
	end;
end;
procedure TfrmPreview.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  KeyCodeList.Free ;
	FormReset;    {�C���[�W���X�g�̉��}
//	CanvasList.Free;
//---��������---------------------------------------
  if P_MODE then     {MainForm�̏����Ɠ���}
    CloseDataBase;
//--------------------------------------------------
end;

procedure TfrmPreview.DspData;
begin
{
}
end;
{
  P.D ���C���t�H�[��
}
procedure TfrmPreview.FormShow(Sender: TObject);
//var
//SysFileName : String;
//SystemIni : TIniFile;
begin



 JVal.PrnLeftX := 0;


//������[�h�@PRNMODE�@�̎�
{$IFDEF PRNMODE}
    // �������͔�\��
    btnCMT.Visible := false;


    //ini �t�@�C���ǂݍ���
    SysFileName := AppPath + SYSFILE;

    //�ݒ�̧�ق̎�荞��
    if FileExists( SysFileName ) then
      SystemIni := TIniFile.Create( SysFileName );

    if SystemIni = nil then begin
  	  showmessage('�V�X�e���ݒ�t�@�C����������܂���B');
      PostQuitMessage(0);
      exit;
    end;
  //�l���擾
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
//    SQLCondition := '�T���v���ԍ� in ('''+P_SMPNO+''')';
    SQLCondition := '�T���v���ԍ�='''+P_SMPNO+'''';

    Application.CreateForm(TSindanForm, SindanForm);

//    PrintModule1.QueryUketuke.SQL.Text := 'Select T_UKETUKE.*,M_HOJOU.�y��R�[�h,M_HOJOU.�y���R�[�h,M_HOJOU.���A�R�[�h '+
//    'from T_UKETUKE INNER JOIN M_HOJOU '+
//   	'ON  (T_UKETUKE.�ޏ�ԍ� = M_HOJOU.�ޏ�ԍ�) where T_UKETUKE.�폜�t���O<>True and ' + SQLCondition ;
//    PrintModule1.QueryUketuke.Open;
    //    MakeSQL;




{$ENDIF}
//---��������---------------------------------------
  if P_MODE then begin    {MainForm�̏����Ɠ���}
    if not ChangeDataBase(P_CENTER,P_YEAR) then begin
      PostQuitMessage(0);
      exit;
    end;
    SQLCondition := '�T���v���ԍ�='''+P_SMPNO+'''';
    if P_TYPE = '1' then    FReportType := rtSindan
    else                    FReportType := rtSekkei ;
  end;
//--------------------------------------------------
  case FReportType of
  rtSindan: Caption := '�y��f�f�[';
  rtSekkei: Caption := '�{��݌v�[';
  rtBunseki: Caption := '���͒l�ꗗ';
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
    //�v���r���[��PrintReport�̖߂�l��Canvas list���쐬���Ă���̂�
    //NewPage�̃^�C�~���O���ĂׂȂ��B
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

    //20110822 ���̃��b�Z�[�W������ƏI���Ȃ��B
    //showMessage('������I�����܂����B');
end;
procedure TfrmPreview.BtSetHiryouClick(Sender: TObject);
var
KeyCD : String;
stmp : String;
begin

  //�엿�ύX
{
  Application.CreateForm(TFDokaiChenge, FDokaiChenge);

  FDokaiChenge.Vsample := MainForm.VSample;

  FDokaiChenge.ShowModal ;
  FDokaiChenge.Release ;
}

  Application.CreateForm(TFSetSehi, FSetSehi);

  FSetSehi.SNo := MainForm.VSample;

   //�V�~�����[�V����

  FSetSehi.ShowModal;
  FSetSehi.Release;


//  Application.CreateForm(TSimuForm, SimuForm);

//  SimuForm.FindNo(MainForm.VSample);
//  SimuForm.ShowModal ;
//  SimuForm.Release;








  //�ĕ`��
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

   //�A�����

   if Application.MessageBox('�v�����^�𗼖ʈ���ɐݒ肵�܂������H','�m�F',MB_YESNO) = ID_NO then begin

   exit;

   end;




    Application.CreateForm(TFMsg, FMsg);
    FMsg.Show;
    Application.ProcessMessages();


	with Printer do
	begin
		Title := Application.ExeName ;
    //�v���r���[��PrintReport�̖߂�l��Canvas list���쐬���Ă���̂�
    //NewPage�̃^�C�~���O���ĂׂȂ��B
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

//�y�[�W�ړ�

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

//�����엿�ݒ�



   Application.CreateForm(TFSetHiryou, FSetHiryou);
   FSetHiryou.ShowModal;
   FSetHiryou.Release;


    //�ĕ`��
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
//	�ȉ��f�[�^�\���֐�
//
{mm���s�N�Z���ɕϊ�����}
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
	�����̓~���Ŏw��B������s�N�Z���ɕϊ��F��ʂƁA�v�����^�𓝈ꂷ�邽��
}
procedure PenSize(pt4: Extended	);
var
	Psize: integer;
begin
	PSize := Round(pt4 * PixelsPerInch / 25.4);
  if PSize <= 0 then PSize := 1;
	PrintCanvas.Pen.Width := PSize;
end;
{�s�N�Z���������ɕԂ�}
function PixToMMSize(value : Integer) : Integer;
begin
	result := Round( value / PixelsPerInch * 25.4);
end;

{�O�p�_�ʒu��Ԃ����S���W�A�����A�p�x(�E����=0-360���v���)}
function GetTrign( cx, cy , radius , angle : integer ): TPoint ;
var
	clu : double ;
begin
	clu := cos( angle / 360 * pi * 2 ) * radius + cx ;
  result.x := round( clu ) ;
  clu := sin( angle / 360 * pi * 2 ) * radius + cy ;
  result.y := round(  clu ) ;
end;
{�~�\�� �u���V�X�^�C���A���S���W�A���a}
{
  aStyle=1:�D�F�A2:���A�ȊO�F����
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
    //���ŕ`��

  PrintCanvas.Pen.Width := 1;

  SetLength(I,2);
  I[0] :=5;   //��Ԗڂ̔j���̒���
  I[1] :=0;   //��Ԗڂ̋󔒂̒���
//  I[2] :=30;   //��Ԗڂ̔j���̒���
//  I[3] :=10;   //��Ԗڂ̋󔒂̒���
//  I[4] :=50;   //�O�Ԗڂ̔j���̒���
//  I[5] :=10;   //�O�Ԗڂ̋󔒂̒���

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
    //�_�� AAAAAAAAAAAAAAAA
  PrintCanvas.Pen.Width := 1;

  SetLength(I,2);
  I[0] :=3;   //��Ԗڂ̔j���̒���
  I[1] :=5;   //��Ԗڂ̋󔒂̒���
//  I[2] :=30;   //��Ԗڂ̔j���̒���
//  I[3] :=10;   //��Ԗڂ̋󔒂̒���
//  I[4] :=50;   //�O�Ԗڂ̔j���̒���
//  I[5] :=10;   //�O�Ԗڂ̋󔒂̒���

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
    //�����ŕ`��
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
{���C���\��:��_�Ԓ����`��}
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
  I[0] :=3;   //��Ԗڂ̔j���̒���
  I[1] :=5;   //��Ԗڂ̋󔒂̒���

//  I[2] :=30;   //��Ԗڂ̔j���̒���
//  I[3] :=10;   //��Ԗڂ̋󔒂̒���
//  I[4] :=50;   //�O�Ԗڂ̔j���̒���
//  I[5] :=10;   //�O�Ԗڂ̋󔒂̒���

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
  I[0] :=5;   //��Ԗڂ̔j���̒���
  I[1] :=0;   //��Ԗڂ̋󔒂̒���

//  I[2] :=30;   //��Ԗڂ̔j���̒���
//  I[3] :=10;   //��Ԗڂ̋󔒂̒���
//  I[4] :=50;   //�O�Ԗڂ̔j���̒���
//  I[5] :=10;   //�O�Ԗڂ̋󔒂̒���

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

{���F�s�N�g�l}
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
  I[0] :=3;   //��Ԗڂ̔j���̒���
  I[1] :=5;   //��Ԗڂ̋󔒂̒���

//  I[2] :=30;   //��Ԗڂ̔j���̒���
//  I[3] :=10;   //��Ԗڂ̋󔒂̒���
//  I[4] :=50;   //�O�Ԗڂ̔j���̒���
//  I[5] :=10;   //�O�Ԗڂ̋󔒂̒���

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
  I[0] :=10;   //��Ԗڂ̔j���̒���
  I[1] :=5;   //��Ԗڂ̋󔒂̒���

//  I[2] :=30;   //��Ԗڂ̔j���̒���
//  I[3] :=10;   //��Ԗڂ̋󔒂̒���
//  I[4] :=50;   //�O�Ԗڂ̔j���̒���
//  I[5] :=10;   //�O�Ԗڂ̋󔒂̒���

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

{��`�\��}
procedure RectLine(RectMode : TLineMode ; fX,fY,Width,Height : Integer );
var
	tX,tY : Integer;
begin
	tX := fx+Width;
	tY := fY+Height;

  PenSize( BoldPenSize );

	{��`�̕\��}
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
��`���e�L�X�g�󎚁F
��`�^�C�v�A�����z�u�V�n�A�����z�u���E�A
��`�ʒu�A��`�T�C�Y�A
�󎚕�����A�t�H���g�T�C�Y�A�����C�� �A�w�i�F
}
procedure RectAndText( RectMode : TLineMode; TextLoc :TTextLayout; TextSide:TTextAlignment ;
			fX,fY,Width,Height,tsize : Integer; text : string ;Fonttype : TFontType );  {�e�L�X�g�󎚐���Ώۃt�B�[���h}
var
	TheRect: TRect;
	tX,tY,FontHp,TextWp,LocXp,LocYp: Integer;
begin

	tX := fx+Width;
	tY := fY+Height;
	TheRect := Rect(HorzPos(fX),VertPos(fY),HorzPos(tX),VertPos(tY));

  PrintCanvas.Font.Name := PrintFontName ;
  {Ver. 1.3.1 �������ʂ̎��t�H���g���΃T�C�Y�w��}
  if (DeviceType = dvDISP )and((tsize >= 8) and (tsize <=11)) then
	  FontSize(tsize +  PrintFontResize )
  else
    FontSize(tsize );
  {���p�������ƂȂ����\������Ȃ���������}
	FontHp := PrintCanvas.TextHeight(text);
	TextWp := PrintCanvas.TextWidth(text);

	{�V�n�ʒu}
	case TextLoc of
	tlBOTTOM:{���t��}begin
		LocYp := VertPos(tY)-FontHp - VSpc;
	end;
	tlTOP:   {��t��}begin
		LocYp := VertPos(fY) + VSpc;
	end;
	else{����}  begin
		LocYp := Round((VertSize(tY-fY)-FontHp)/2)+VertPos(fY) ;
	end;
	end;
	{���E�ʒu}
	case TextSide of
	taLeft:{����}begin
		LocXp := HorzPos(fX) + HSpc;
	end;
	taRight:{�E��}begin
		LocXp := HorzPos(tX)-TextWp - HSpc;
	end;
	else{����}  begin
		LocXp := Round((HorzSize(tX-fX)-TextWp)/2)+HorzPos(fX)-1 ;
	end;
	end;
//	TLineMode 		=	(lmClear,lmNONE,lmUNDER,lmRECT);      //��`����^�C�v
	case RectMode of
  lmClear: begin//�e�L�X�g�̂ݔw�i�����Ȃ�
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
    {��`}
//    PrintCanvas.Brush.Color := clBlack;
//    PrintCanvas.FrameRect(TheRect);
    PrintCanvas.Brush.Color := clWhite;
    PrintCanvas.Brush.Style := bsClear;
    PrintCanvas.TextFlags :=  ETO_CLIPPED ;
		PrintCanvas.TextRect(TheRect,LocXp,LocYp, text );
  end;
  lmRECT: begin
    {��`}
    PrintCanvas.Brush.Color := clBlack;
    PrintCanvas.FrameRect(TheRect);
    PrintCanvas.Brush.Color := clWhite;
    PrintCanvas.Brush.Style := bsClear;
    PrintCanvas.TextFlags :=  ETO_CLIPPED ;
		PrintCanvas.TextRect(TheRect,LocXp,LocYp, text );
  end;
  lmRECTFILLBLUE:begin
    {�w�i��`��}
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
//    PrintCanvas.TextFlags :=  ETO_CLIPPED or ETO_OPAQUE; {�t�H���g�w�i�����F�w��}
    PrintCanvas.TextFlags :=  ETO_CLIPPED ;
		PrintCanvas.TextRect(TheRect,LocXp,LocYp, text );
    PrintCanvas.Brush.Style := bsClear;
    PrintCanvas.Brush.Color := clWhite;
    {��`}
    PrintCanvas.Brush.Color := clBlack;
    PrintCanvas.FrameRect(TheRect);
    PrintCanvas.Brush.Color := clWhite;
  end;
  lmRECTFILLRED:begin
    {�w�i��`��}
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
//    PrintCanvas.TextFlags :=  ETO_CLIPPED or ETO_OPAQUE; {�t�H���g�w�i�����F�w��}
    PrintCanvas.TextFlags :=  ETO_CLIPPED ;
		PrintCanvas.TextRect(TheRect,LocXp,LocYp, text );
    PrintCanvas.Brush.Style := bsClear;
    PrintCanvas.Brush.Color := clWhite;
    {��`}
    PrintCanvas.Brush.Color := clBlack;
    PrintCanvas.FrameRect(TheRect);
    PrintCanvas.Brush.Color := clWhite;
  end;
  lmRECTFILLYELLOW:begin
    {�w�i��`��}
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
//    PrintCanvas.TextFlags :=  ETO_CLIPPED or ETO_OPAQUE; {�t�H���g�w�i�����F�w��}
    PrintCanvas.TextFlags :=  ETO_CLIPPED ;
		PrintCanvas.TextRect(TheRect,LocXp,LocYp, text );
    PrintCanvas.Brush.Style := bsClear;
    PrintCanvas.Brush.Color := clWhite;
    {��`}
    PrintCanvas.Brush.Color := clBlack;
    PrintCanvas.FrameRect(TheRect);
    PrintCanvas.Brush.Color := clWhite;
  end;
  lmRECTFILL:begin
    {�w�i��`��}
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
//    PrintCanvas.TextFlags :=  ETO_CLIPPED or ETO_OPAQUE; {�t�H���g�w�i�����F�w��}
    PrintCanvas.TextFlags :=  ETO_CLIPPED ;
		PrintCanvas.TextRect(TheRect,LocXp,LocYp, text );
    PrintCanvas.Brush.Style := bsClear;
    PrintCanvas.Brush.Color := clWhite;
    {��`}
    PrintCanvas.Brush.Color := clBlack;
    PrintCanvas.FrameRect(TheRect);
    PrintCanvas.Brush.Color := clWhite;
  end;
  end;

end;

{
	���s�������    Height:�ʏ퍂��
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
  //Ver. 1.3.1 �t�H���g�ݒ�A��ʂ̎��C�ӎw�肠��
  PrintCanvas.Font.Name := PrintFontName ;

  {Ver. 1.3.1 �������ʂ̎��t�H���g���΃T�C�Y�w��}
  if (DeviceType = dvDISP )and((tsize >= 8) and (tsize <=11)) then
	  FontSize(tsize +  PrintFontResize )
  else
    FontSize(tsize );

	aFormat := DT_LEFT or DT_WORDBREAK or DT_CALCRECT;
	{�z�u�T�C�Y���m�F}
	DrawText( PrintCanvas.Handle,PChar(Buff),Length(Buff),aRect,aFormat);

    //A.Nishimura ���܂���܂�Ȃ��ɌW��炸�ɏ���
	aFormat := DT_LEFT or DT_WORDBREAK;
	aRect.Right := HorzPos(tX);	{���ɖ߂�}
	aRect.Bottom := VertSize(PixToMMSize(aRect.Bottom)); {���i�������I�[�_�[�ɖ߂�}
	if RectMode = lmRECT then begin
//		�������Ƃ���Řg���������ꍇ���̃R�����g�͂���
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
	{�͈͓��łȂ���΂�����������Ԃ�}
	if (aRect.Bottom <= VertPos(tY)) or     {�ʏ�T�C�Y���Ɏ��܂邩}
		 (aRect.Bottom <= MaxH )then begin     {�ő�T�C�Y���Ɏ��܂邩} {Ver 2.0 Add'='}
			{���܂�ꍇ���̂܂܈�����Ďg�p�̈��Ԃ�}
			aFormat := DT_LEFT or DT_WORDBREAK;
			aRect.Right := HorzPos(tX);	{���ɖ߂�}
			aRect.Bottom := VertSize(PixToMMSize(aRect.Bottom)); {���i�������I�[�_�[�ɖ߂�}
			if RectMode = lmRECT then
//		�������Ƃ���Řg���������ꍇ���̃R�����g�͂���
//				PrintCanvas.Rectangle(HorzPos(fX),VertPos(fY),aRect.Right,aRect.Bottom);
				PrintCanvas.Rectangle(HorzPos(fX),VertPos(fY),aRect.Right,MaxH);
			DrawText( PrintCanvas.Handle,PChar(Buff),Length(Buff),aRect,aFormat);
			result := True ;
			MaxHeight := PixToMMSize(aRect.Bottom - aRect.Top);
	end else begin
			{���܂�Ȃ��ꍇ�G���[��Ԃ��Ďg�p�̈��Ԃ�}
			result := False ;
      {2003/02/18�Fadd +1/100 VertPos�̎Z�o�Ƃ̌덷�̔�����}
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
		//�X�g���b�`�@�\���Ȃ��ꍇ�̏����o������

		exit;
	end;
  with Bitmap do
  begin
    { DIB �̑傫�����擾 }
    GetDIBSizes(Handle, InfoSize, ImageSize);
    Info := AllocMem(InfoSize);
    try
      Image := AllocMem(ImageSize);
      try
        { DIB �f�[�^���擾 }
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


  {Ver. 1.3.1 �𑜓x�ɂ��񂹈ʒu��ύX����}
//showmessage('pixels '+inttostr(PixelsPerInch));
  if PixelsPerInch < 100 then begin
    {���}
    VSpc := 0;
    HSpc := 2;
  end else begin
    {���}
    if PixelsPerInch < 250 then begin
      VSpc := 1;
      HSpc := 3;
    end else begin
      VSpc := 1;
      HSpc := 4;
    end;
  end;

  with PrintCanvas do begin
		{ �p���T�C�Y�̍��ォ��̗]�������߂�ꍇ�́AWindows API �� Escape �֐��� }
		{ GETPRINTINGOFFSET ��^����B �����錋�ʂ̓s�N�Z�����Ȃ̂ŁA }
		{ mm �Ɋ��Z����ꍇ�́A(25.4 / PixelsPerInch) ���|���邱�� }
		{ �p���T�C�Y���̂��̂����߂�Ƃ��́AGETPHYSPAGESIZE ���g�� }
		{ �v�����^�̗p���T�C�Y }
		{ ���̗]��(mm) - ����s�\�̈���܂܂Ȃ� }
      LeftMargin := round(GetDeviceCaps(handle,PHYSICALOFFSETX)*2.54/100);
      LeftMargin := LeftMargin+LeftStart; //���]��15�~��
      TopMargin := round(GetDeviceCaps(handle,PHYSICALOFFSETY)*2.54/100);        { ��̗]��(mm) - ����s�\�̈���܂܂Ȃ� }
      TopMargin := TopMargin + TopStart;
		{ �t�H�[���ɐݒ肳�ꂽ�t�H���g������ɂ��g�� }
//		Font.Assign(self.Font);{�ďo�t�H�[�����������ĂȂ���΂Ȃ�Ȃ�}
//	Showmessage(Font.Name);

      //��ʂ̃N���A
      Pen.Color := clWhite;
//        Brush.Color := clRed;
      Brush.Color := clWhite;
      Rectangle(0,0,748,1086);
      Pen.Color := clBlack;
      Brush.Color := clBlack;

		{���ʐݒ�}
		FontSize(9);
		PenSize( DefPenSize );
		Pen.Color := clBlack;
		Pen.Style := psSolid;
		Brush.Color := clBlack;
		Brush.Style := bsClear;

  end;
  //�����̕\��
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
//��������
procedure TfrmPreview.btnCMTClick(Sender: TObject);
var
stmp : String;
begin

   //PrintModule1.ADOSindan.Close;

   Application.CreateForm(TEntryCMTForm, EntryCMTForm);




  //stmp := PrintModule1.ADOQueryUketuke.FieldByName('�앨��').asString;

  //EntryCMTForm.sakuname := stmp; //Jval2[1].sakuname;    //'�A�X�p���K�X'; //stmp;
  EntryCMTForm.KeyCode := JVal.SNO;
  
  EntryCMTForm.SetReport( FReportType );

   EntryCMTForm.ShowModal;
//   Application.ProcessMessages();

   EntryCMTForm.Release;



   //�ĕ`��
   stmp := '';
   PrintReport( FReportType, Image1.Canvas, dvDISP,MulDiv(PixelsPerInch, FZoomScale, 100),PageCnt,stmp);

{
  case FReportType of
  rtSindan: //'�y��f�f�[';
//  	if EntComment( FReportType , KeyCodeList[PageCnt-1]) then begin
  	if EntComment( FReportType , MainForm.VSample) then begin
    	MakeImage;
	    DspData;
    end;
  rtSekkei: //'�{��݌v�[';
  	if EntComment( FReportType , MainForm.VSample) then begin
//  	if EntComment( FReportType , KeyCodeList[PageCnt-1]) then begin
    	MakeImage;
	    DspData;
    end;
  end;
}
//  stmp := MainForm.VSample;
//  stmp := PrintModule1.QueryUketuke.FieldByName('�T���v���ԍ�').AsString;

end;
{Version 0.6 #44 ���^�t�@�C���ۑ��@�\�̒ǉ�}
// XXXXX jpg�ۑ�
procedure TfrmPreview.btnSaveAsClick(Sender: TObject);
var
//  Meta : TMetaFile ;
  jpg: TJPEGImage;
  FileName,aExt : string ;
begin
//
  case FReportType of
  rtSindan: //'�y��f�f�[';
    //SaveDialog1.FileName := 'D'+KeyCodeList[PageCnt-1]+'.jpg';
    SaveDialog1.FileName := 'D0000001.jpg';

  rtSekkei: //'�{��݌v�[';
    SaveDialog1.FileName := 'S'+KeyCodeList[PageCnt-1]+'.jpg';
  end;

  if not SaveDialog1.Execute then exit ;
//  Meta := TMetaFile.Create ;
  jpg :=  TJPEGImage.Create ;
  try
//    Meta.Assign(Image.Canvas);
//    Meta.SaveToFile(SaveDialog1.FileName);                      <- ����
//    Image1.Picture.MetaFile.SaveToFile(SaveDialog1.FileName);   <-��Bitmap���j�������
    FileName := SaveDialog1.FileName ;
    //�t�B���^�[�ύX�Ŋg���q���蓮�ŕύX����B�������łȂ��Ɣ��f���Ȃ�
    //ofOverwritePrompt	= False �ɂ��Ȃ��ƁA�ۑ��{�^�����_�ł́ASaveDialog1.FileName�̊g���q��
    //�m�F�����邽�߁A��������
    case SaveDialog1.FilterIndex of
    1:  aExt := 'jpg';
    2:  aExt := 'bmp';
    end;
    FileName := ChangeFileExt(FileName,'.'+aExt) ;
    if LowerCase(ExtractFileExt(FileName)) = '.jpg' then begin
      jpg.Assign(Image1.Picture.Bitmap);
      jpg.SaveToFile(SaveDialog1.FileName);
    end else
      Image1.Picture.SaveToFile(SaveDialog1.FileName);            //<- �r�b�g�}�b�v�ۑ���OK
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

//�G�N�Z���ւ̏o��

//�G�N�Z���ւ̏o��
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

stmp2com : String; //�R�����g


hsY : integer;
XX1,sY : integer;


taitoru : String;
hakono : String;

hiryouhyoujiflg : boolean;

begin

  //�^�C�g���̓���
  Application.CreateForm(TFETaitoru, FETaitoru);

  FETaitoru.JaName :=  '�i�`'+FTPTiku;

  FETaitoru.ShowModal ;


  hakono := FETaitoru.ENo.Text;
  taitoru := 'No.' + FETaitoru.ENo.Text + ' ' + FETaitoru.EJA.Text + ' ' + FETaitoru.ESisyo.Text;


  FETaitoru.Release ;







  //�o�̓t�@�C�������o��
  SaveDialog2.FileName := 'No' + hakono + '.xls';

  if not SaveDialog2.Execute then exit ;
  outfile := SaveDialog2.FileName;

  //�G�N�Z���t�@�C���̌^���R�s�[
  infile :=  FTPServer + '\���[�^.xls';
  CopyFile(  PChar(infile) , PChar(outfile) ,  false ) ;


  Excel := CreateOleObject('Excel.Application');
  xApp := Excel.Application;


  WorkBook := xApp.Workbooks.Open( outfile );

  //��ʂ�\��
  xApp.Visible := true;

  //�V�[�g�̒ǉ�
  //WorkSheet := WorkBook.WorkSheets['DATA'];


  //�T���v��
  with PrintModule1.ADOQueryUketuke do begin
  	Close;
    //SQL.Text :=


//  �������p


SQL.Text := 'SELECT T_UKETUKE.*, '+
//'M_FUSHOKU.���A��, M_DOJOU.����y��R�[�h, M_DOJOU.���q�y��R�[�h, M_DOJOU.�y�떼, '+
'M_DOJOU.�y�떼, '+
'M_DOSEI.�y����, M_DOSEI.�����_���p�� AS �����_���p��,M_DOSEI.���c�b�d�b�l as ���c�b�d�b�l,'+
'M_sakumotu.�앨��, M_sakugata.��^��'+
',M_NOUKA.* '+
'FROM (((('+
'T_UKETUKE '+
'LEFT JOIN M_SAKUMOTU ON (T_UKETUKE.�앨�R�[�h = M_sakumotu.�앨�R�[�h)) '+
'LEFT JOIN M_SAKUGATA ON (T_UKETUKE.�앨�R�[�h = M_sakugata.�앨�R�[�h) AND (T_UKETUKE.��^�R�[�h = M_sakugata.��^�R�[�h)) '+
'LEFT JOIN M_DOJOU ON T_UKETUKE.�y��R�[�h = M_DOJOU.�y��R�[�h) '+
'LEFT JOIN M_DOSEI ON T_UKETUKE.�y���R�[�h = M_DOSEI.�y���R�[�h) '+
'LEFT JOIN M_NOUKA ON T_UKETUKE.�_�Ɣԍ� = M_NOUKA.�_�Ɣԍ� '+
'WHERE '+SQLCondition +
' ORDER BY �T���v���ԍ�';



   Open;



 end;

 for I := 1 to Pages do begin


  PrintReport( FReportType, Image1.Canvas, dvDISP,MulDiv(PixelsPerInch, FZoomScale, 100),I,KeyCD);


  WorkSheet := WorkBook.WorkSheets[I];

  //�O���t���C���[�W�ɂ���

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

  //�傫���̕ύX
  //Workimage.ShapeRange.ScaleWidth(0.5, False);


 end;




  //�^�y�[�W���폜����B///////////////////////////

  //�폜���܂����̃��b�Z�[�W�������B
  xApp.DisplayAlerts := False;
  WorkSheetNew := WorkBook.WorkSheets['DATA'];
  WorkSheetNew.Delete;
  //���b�Z�[�W�\�������ɖ߂��B
  xApp.DisplayAlerts := True;


  //�I��
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
 //0�́A�\�����Ȃ�
function TfrmPreview.FtoStr(aValue : double; aPrec : integer ):string;
begin
	if aValue <= 0.000 then result := ' '
  else
		result := Format('%.*n',[aPrec,aValue]);
end;

function TfrmPreview.FtoStr000(aField : TField; aPrec : integer ):string;
begin
	if aField.isNull then result := ' ' // '�|'     {Version 0.6 #49}
  else
		result := Format('%.*n',[aPrec,aField.asFloat]);
end;

{��yme/100mg}
function TfrmPreview.KudoMe( aValue : double ) : double;
begin
	result := aValue / 20.2 ;
end;
{�ΊDme/100mg}
function TfrmPreview.SekkaiMe( aValue : double ) : double;
begin
	result := aValue / 28.0 ;
end;
{����me/100mg}
function TfrmPreview.KariMe( aValue : double ) : double;
begin
	result := aValue / 47.1 ;
end;
{�����_me/100mg}
function TfrmPreview.RinsanMe( aValue : double ) : double;
begin
	result := aValue / 62.97 ;
end;






end.
