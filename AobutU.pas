unit AobutU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TAboutBox = class(TForm)
    Panel1: TPanel;
    ProgramIcon: TImage;
    ProductName: TLabel;
    Version: TLabel;
    Copyright: TLabel;
    SystemName: TLabel;
    OKButton: TButton;
    Commnet: TLabel;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
  private
    { Private éŒ¾ }
  public
    { Public éŒ¾ }
  end;

var
  AboutBox: TAboutBox;
function AppGetInfo(const ExeName :string;InfoNumber: integer): string;

implementation

{$R *.DFM}


procedure TAboutBox.FormCreate(Sender: TObject);
begin
	ProductName.Caption := 'Product : '+ AppGetInfo(Application.exename,8);
  Version.Caption := 'Version : '+ AppGetInfo(Application.exename,3);
	Copyright.Caption := 'Copyright : '+ AppGetInfo(Application.exename,5);
	SystemName.Caption := '–¼Ì : '+ AppGetInfo(Application.exename,7);
	Commnet.Caption := AppGetInfo(Application.exename,10);
end;
function AppGetInfo(const ExeName :string;InfoNumber: integer): string;
const
  InfoNum = 10;
  InfoStr : array [1..InfoNum] of String =
    ('CompanyName', 'FileDescription', 'FileVersion', 'InternalName',
     'LegalCopyright', 'LegalTradeMarks', 'OriginalFilename',
     'ProductName', 'ProductVersion', 'Comments');
  InfoStr_j : array [1..InfoNum] of String =
    ('‰ïŽÐ–¼', 'à–¾', 'Ì§²ÙÊÞ°¼Þ®Ý', '“à•”–¼', '’˜ìŒ ', '¤•W',
     '³Ž®Ì§²Ù–¼', '»•i–¼', '»•iÊÞ°¼Þ®Ý', 'ºÒÝÄ ');
var
  n : DWORD;
  Len : longword;
  i: Integer;
  AppName : string;
  Buf, Value: PChar;
  InfoStrBuff: array[1..InfoNum] of string;
begin
  AppName := ExeName;
  n := GetFileVersionInfoSize(PChar(AppName), n);
  if n > 0 then
  begin
    Buf:= AllocMem(n);
//    Label1.Caption:= 'FileVersionInfoSize = ' + IntToStr(n);
    GetFileVersionInfo(PChar(AppName), 0, n, Buf);
    for i:= 1 to InfoNum do begin
      if VerQueryValue(Buf,
                       PChar('StringFileInfo\041103a4\' + InfoStr[i]),
                       Pointer(Value),Len) then begin
//        Memo1.Lines.Add(InfoStr_j[i] + ' = ' + Value);
					InfoStrBuff[i] := Value;
			end;
    end;
    FreeMem(Buf, n);
    result := InfoStrBuff[InfoNumber];
  end else
    result := '';
end;





end.

