unit InputNoU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, ComCtrls, Db, DBTables, DBCtrls, ADODB;

type
  TInputNoForm = class(TForm)
    PageControl1: TPageControl;
    Tabsample: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    TabSheet3: TTabSheet;
    Label6: TLabel;
    Bevel1: TBevel;
    L2: TLabel;
    ComboBox2: TComboBox;
    EMode: TEdit;
    Panel1: TPanel;
    btnOK: TButton;
    btnCancel: TButton;
    ADOQuery1: TADOQuery;
    TSisyo: TADOTable;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private 宣言 }
    FRes : Boolean ;
    SakumokuCDList : TStringList ;
    SakumotuCDList : TStringList ;
  public
    { Public 宣言 }
  end;

var
  InputNoForm: TInputNoForm;
function DspInputNo( AOwner: TForm; mode: Integer ): String;

implementation

uses DMU, SNoukaU;

{$R *.DFM}
function DspInputNo( AOwner: TForm; mode : Integer ): String;
begin
  Application.CreateForm(TInputNoForm, InputNoForm);
  InputNoForm.EMode.Text := '';


  if mode = 1 then begin
     InputNoForm.EMode.Text := '土壌';
  end
  else if mode = 2 then begin
     InputNoForm.EMode.Text := '堆肥';
  end
  else if mode = 3 then begin
     InputNoForm.EMode.Text := '飼料';
  end
  else begin
     InputNoForm.EMode.Text := '土壌';
  end;

  InputNoForm.PageControl1.ActivePageIndex := 0 ;

//  if InputNoForm.EMode.Text <> '' then     //分析値のみ
//     InputNoForm.PageControl1.ActivePageIndex := 3 ;


  InputNoForm.ShowModal ;
  result := InputNoForm.EMode.Text;
//  result := InputNoForm.FRes ;
  InputNoForm.Release ;
end;

procedure TInputNoForm.FormCreate(Sender: TObject);
begin
	FRes := False ;
	Color := BackColor ;


  SakumokuCDList := TStringList.Create ;
  SakumotuCDList := TStringList.Create ;
  PageControl1.ActivePageIndex := 0 ;
//  if EMode.Text <> '' then     //分析値のみ
//     PageControl1.ActivePageIndex := 3 ;

  Edit1.Text := Format('%0.4d',[EntrySTART]);
  Edit2.Text := Format('%0.4d',[EntrySTOP]);
end;

procedure TInputNoForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  SakumokuCDList.Free ;
  SakumotuCDList.Free ;
end;

procedure TInputNoForm.btnCancelClick(Sender: TObject);
begin

EMode.Text := '';
	Close;
end;

procedure TInputNoForm.btnOKClick(Sender: TObject);
var
qtmp : String;
begin



  case PageControl1.ActivePageIndex of
  0: begin
		SQLCondition := '試料NO BETWEEN '''+Edit1.Text + ''' and ''' + Edit2.Text +'''';
     end;
  1: begin
  	SQLCondition := 'T_uketuke6.作物コード = '''+SakumokuCDList[ComboBox2.ItemIndex] +''' and T_uketuke.作物コード = '''+SakumotuCDList[ComboBox2.ItemIndex] +'''';
     end;
  end;


  close;


end;

procedure TInputNoForm.Edit1Exit(Sender: TObject);
begin
	try
		(Sender as TEdit).Text := Format('%0.4d',[StrtoInt((Sender as TEdit).Text )]);
  except
  (Sender as TEdit).Text := '';
  end;
end;

procedure TInputNoForm.FormShow(Sender: TObject);
var
i : Integer;
begin
//   EMode.Text := '';





//   ComboBox1.Items.Clear ;
   SakumokuCDList.Clear ;
    with ADOQuery1 do begin
		SQL.Text := 'select * from M_SAKUMOTU';
        Open;
	  while not Eof do begin
  	  ComboBox2.Items.Add(FieldByname('作物名').asString );
          SakumokuCDList.Add( FieldByname('作物コード').asString );
  		Next;
  	end;
        Close;
    end;






end;
//作物の指定
end.
