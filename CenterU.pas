unit CenterU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DBCtrls, Db, DBTables, ADODB;

type
  TfrmCenter = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Bevel1: TBevel;
    Button1: TButton;
    Button2: TButton;
    ComboBox1: TComboBox;
    ADOTable1: TADOTable;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private 宣言 }
    FCenter : string ;
    CenterList : TStringList ;
  public
    { Public 宣言 }
  end;

var
  frmCenter: TfrmCenter;
function DspCenter(var Center : string ) : Boolean;

implementation

uses DMU;

{$R *.DFM}
function DspCenter(var Center : string ) : Boolean;
begin
  Application.CreateForm(TfrmCenter, frmCenter);
  frmCenter.FCenter := Center ;
  frmCenter.ShowModal ;
  result := Center <> frmCenter.FCenter ;
  if result then Center := frmCenter.FCenter ;

  frmCenter.Release ;
end;

procedure TfrmCenter.FormCreate(Sender: TObject);
begin
	Color := BackColor ;
  CenterList := TStringList.Create ;
end;

procedure TfrmCenter.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	CenterList.Free ;
end;

procedure TfrmCenter.Button2Click(Sender: TObject);
begin
	Close;
end;

procedure TfrmCenter.Button1Click(Sender: TObject);
begin
	if ComboBox1.ItemIndex >= 0 then begin
		FCenter := CenterList[ComboBox1.ItemIndex] ;
		Close;
  end;
end;

procedure TfrmCenter.FormShow(Sender: TObject);
var
	cnt : integer ;
begin
  with ADOTable1 do begin
  	Open;
    ComboBox1.Items.Clear ;
    while not eof do begin
      ComboBox1.Items.Add( FieldByName('センター名称').asString );
      CenterList.Add(FieldByName('センター記号').asString  );
    	Next;
    end;
		Close;
  end;
  for cnt:=0 to CenterList.Count -1 do begin
  	if CenterList[cnt] = FCenter then begin
      ComboBox1.ItemIndex := cnt ;
    	break;
    end;
  end;
//  Table1.Locate('センター名称',FCenter,[]);
end;


end.
