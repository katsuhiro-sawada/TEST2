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
    { Private 宣言 }
  public
    { Public 宣言 }
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
    SQL.Text := 'Select 作目コード,作物コード,作物名 from M_Sakumotu where 作目コード= "1" and ((作物コード = "04") or (作物コード = "05") or (作物コード = "06"))';
    Open;
    while not Eof do begin
      CbSakumotu.Items.Add(fieldByname('作物名').asString);
      CbSakumotuCD.Items.Add(fieldByname('作物コード').asString);
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
    SQL.Text := 'Select 作目コード,作物コード,作型コード,作型名 from M_Sakugata where 作目コード= "1" and 作物コード = "'+CbSakumotuCD.Text+'"';
    Open;
    while not Eof do begin
      CbSakugata.Items.Add(fieldByname('作型名').asString);
      CbSakugataCD.Items.Add(fieldByname('作型コード').asString);
      Next;
    end;
    Close;
  end;






end;

procedure TmstSehi_T.CbSakugataChange(Sender: TObject);
begin
  inherited;

  CbSakugataCD.ItemIndex := CbSakugata.ItemIndex;


  ADOTable1.Locate('作物コード;作型コード',VarArrayOf([CbSakumotuCD.Text,CbSakugataCD.Text]),[]);



end;

end.
