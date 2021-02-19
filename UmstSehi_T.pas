unit UmstSehi_T;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  MSehiU, Db, DBTables, ComCtrls, StdCtrls, Buttons, ExtCtrls, Mask,
  Variants,DBCtrls,DMU, ADODB;

type
  TmstSehi_T = class(TmstSehiBasicForm)
    Label1: TLabel;
    CbSakumotu: TComboBox;
    Label2: TLabel;
    CbSakugata: TComboBox;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label9: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label3: TLabel;
    LTuihi1: TLabel;
    LTuihi2: TLabel;
    CbSakugataCD: TComboBox;
    CbSakumotuCD: TComboBox;
    ADOQuery1: TADOQuery;
    procedure FormShow(Sender: TObject);
    procedure CbSakumotuChange(Sender: TObject);
    procedure CbSakugataChange(Sender: TObject);
  private
    { Private �錾 }
  public
    { Public �錾 }
  end;

var
  mstSehi_T: TmstSehi_T;

implementation

{$R *.DFM}

procedure TmstSehi_T.FormShow(Sender: TObject);
begin
  inherited;


  CbSakumotu.Items.Clear;
  CbSakumotuCD.Items.Clear;
  CbSakugata.Items.Clear;
  CbSakugataCD.Items.Clear;

  with ADOQuery1 do begin
    Close;
    SQL.Text := 'Select ��ڃR�[�h,�앨�R�[�h,�앨�� from M_Sakumotu where ��ڃR�[�h= "1" and ((�앨�R�[�h = "04") or (�앨�R�[�h = "05") or (�앨�R�[�h = "06"))';
    Open;
    while not Eof do begin
      CbSakumotu.Items.Add(fieldByname('�앨��').asString);
      CbSakumotuCD.Items.Add(fieldByname('�앨�R�[�h').asString);
      Next;
    end;
    Close;
  end;

  ADOTable1.Open;



end;

procedure TmstSehi_T.CbSakumotuChange(Sender: TObject);
begin
  inherited;
  CbSakumotuCD.ItemIndex := CbSakumotu.ItemIndex;

  CbSakugata.Items.Clear;
  CbSakugataCD.Items.Clear;

  with ADOQuery1 do begin
    Close;
    SQL.Text := 'Select ��ڃR�[�h,�앨�R�[�h,��^�R�[�h,��^�� from M_Sakugata where ��ڃR�[�h= "1" and �앨�R�[�h = "'+CbSakumotuCD.Text+'"';
    Open;
    while not Eof do begin
      CbSakugata.Items.Add(fieldByname('��^��').asString);
      CbSakugataCD.Items.Add(fieldByname('��^�R�[�h').asString);
      Next;
    end;
    Close;
  end;






end;

procedure TmstSehi_T.CbSakugataChange(Sender: TObject);
begin
  inherited;

  CbSakugataCD.ItemIndex := CbSakugata.ItemIndex;


  ADOTable1.Locate('�앨�R�[�h;��^�R�[�h',VarArrayOf([CbSakumotuCD.Text,CbSakugataCD.Text]),[]);



end;

end.
