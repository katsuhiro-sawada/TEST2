unit NetworkU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TNetworkForm = class(TForm)
    CheckBox1: TCheckBox;
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Edit3: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Edit4: TEdit;
    btnOK: TButton;
    btnCancel: TButton;
    Label5: TLabel;
    EUser: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private êÈåæ }
  public
    { Public êÈåæ }
  end;

var
  NetworkForm: TNetworkForm;

implementation

uses DMU;

{$R *.DFM}

procedure TNetworkForm.FormCreate(Sender: TObject);
begin
	Color := BackColor ;
  checkBox1.Checked := FTPPSSV ;
  Edit1.Text := FTPServer ;
  Edit2.Text := FTPAccount ;
  Edit3.Text := FTPPassword ;
  Edit4.Text := FTPHome ;
  EUser.Text := FTPUsrName;
end;

procedure TNetworkForm.btnOKClick(Sender: TObject);
begin
  FTPPSSV := checkBox1.Checked ;
  FTPServer := Edit1.Text ;
  FTPAccount := Edit2.Text;
  FTPPassword := Edit3.Text;
  FTPHome := Edit4.Text;
  FTPUsrName := EUser.Text;
  SystemIni.WriteBool('network', 'usepssv', FTPPSSV );
  SystemIni.WriteString('network', 'server', FTPServer );
  SystemIni.WriteString('network', 'username', FTPAccount );
  SystemIni.WriteString('network', 'password', FTPPassword);
  SystemIni.WriteString('network', 'home', FTPHome );
  SystemIni.WriteString('network', 'usrname', FTPUsrName );
  Close;
end;

procedure TNetworkForm.btnCancelClick(Sender: TObject);
begin
  Close;
end;

end.
