unit UMasSel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, ADODB, Buttons, ExtCtrls,MNoukaU;

type
  TFMasSel = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Eskey: TEdit;
    BitBtn1: TBitBtn;
    ds1: TDataSource;
    DBGrid1: TDBGrid;
    ADOQ: TADOQuery;
    BtNouka: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure EskeyKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure BtNoukaClick(Sender: TObject);
    procedure Hyouji();
    procedure BitBtn2Click(Sender: TObject);
    procedure Jikkou();

    procedure BitBtn3Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    Mode : String;
    SAns : String;
    SAns2 : String;     //作型名

    SakuCD : String;  //SQLの作目コード
    SakuCD2 : String;  //SQLの作物コード

    SSQL : String; //SQL文

  end;

var
  FMasSel: TFMasSel;

implementation

{$R *.dfm}

procedure TFMasSel.BitBtn1Click(Sender: TObject);
begin

  sAns := '';
  sAns2 := '';

  Close;

end;

procedure TFMasSel.BitBtn2Click(Sender: TObject);
begin
     Hyouji();

end;
procedure TFMasSel.Jikkou();
begin

    SAns := '';

    if Mode = '作目' then begin
      SAns := ADOQ.FieldByName('作目コード').asString;
      SAns2 := ADOQ.FieldByName('作目名').asString;

    end;

    if Mode = '作物' then begin
      SAns := ADOQ.FieldByName('作物コード').asString;
      SAns2 := ADOQ.FieldByName('作物名').asString;

    end;

    if Mode = '作型' then begin
      SAns := ADOQ.FieldByName('作型コード').asString;
      SAns2 := ADOQ.FieldByName('作型名').asString;
    end;

    if Mode = '農家' then begin
      SAns := ADOQ.FieldByName('農家番号').asString;
    end;

    if Mode = '土壌' then begin
      SAns := ADOQ.FieldByName('土壌コード').asString;
    end;

    if Mode = '土性' then begin
      SAns := ADOQ.FieldByName('土性コード').asString;
    end;

    if Mode = '支所' then begin
      SAns := ADOQ.FieldByName('支所コード').asString;
    end;

    if Mode = '自治会' then begin
      SAns := ADOQ.FieldByName('コード').asString;
    end;

    if Mode = '結果報告方法' then begin
      SAns := ADOQ.FieldByName('名称').asString;
    end;

    if Mode = '結果' then begin
      SAns := ADOQ.FieldByName('名称').asString;
    end;

    if Mode = '作物分類１' then begin
      SAns := ADOQ.FieldByName('名称').asString;
    end;

    if Mode = '作物分類２' then begin
      SAns := ADOQ.FieldByName('名称').asString;
    end;

    if Mode = '事業' then begin
      SAns := ADOQ.FieldByName('名称').asString;
    end;
    if Mode = '分析種類' then begin
      SAns := ADOQ.FieldByName('名称').asString;
    end;

end;
procedure TFMasSel.BitBtn3Click(Sender: TObject);
begin
    Jikkou();
    close;
end;

procedure TFMasSel.BtNoukaClick(Sender: TObject);
begin
  Application.CreateForm(TmstNoukaForm, mstNoukaForm);
  mstNoukaForm.ShowModal ;
  mstNoukaForm.Release ;

  //
   Hyouji();



end;

procedure TFMasSel.DBGrid1DblClick(Sender: TObject);
begin

  Jikkou();
  close;


end;

procedure TFMasSel.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin


	if (Key in [VK_RETURN] ) then begin

    Jikkou();

    close;
  end;

end;

procedure TFMasSel.EskeyKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
stmp : String;
begin

	if (Key in [VK_RETURN] ) then begin


     Hyouji();

     Key:=0; //キー入力を無効にし
     Keybd_event(VK_TAB,0,0,0); //Tabキーを発生させる。


  end;

end;

procedure TFMasSel.Hyouji();
begin


     if Mode = '作目' then begin

        ssql := 'select 作目コード,作目名 From M_SAKUMOKU';
        if Eskey.Text <> '' then begin

           ssql := ssql + ' Where 作目名 like '''+Eskey.Text+'%%''';

        end;
        ssql := ssql + ' ORDER BY 作目コード';

        ADOQ.Close;
        ADOQ.SQL.Clear;
        ADOQ.SQL.Add(ssql);
        ADOQ.Open;

     end;



     if Mode = '作物' then begin

        ssql := 'select 作物コード,作物名 From M_SAKUMOTU';

        if Eskey.Text <> '' then begin
           ssql := ssql + ' and 作物名 like '''+Eskey.Text+'%%''';
        end;

        ssql := ssql + ' ORDER BY 作物コード';


        ADOQ.Close;
        ADOQ.SQL.Clear;
        ADOQ.SQL.Add(ssql);
        ADOQ.Open;

     end;


     if Mode = '農家' then begin

        ssql := 'select 農家番号,農家名 From M_NOUKA';
        if Eskey.Text <> '' then begin

           ssql := ssql + ' Where 農家名 like '''+Eskey.Text+'%%''';

        end;
        ssql := ssql + ' ORDER BY 農家番号';

        ADOQ.Close;
        ADOQ.SQL.Clear;
        ADOQ.SQL.Add(ssql);
        ADOQ.Open;

     end;

     if Mode = '土壌' then begin

        ssql := 'select 土壌コード,土壌名 From M_DOJOU';
        if Eskey.Text <> '' then begin

           ssql := ssql + ' Where 土壌名 like '''+Eskey.Text+'%%''';

        end;
        ssql := ssql + ' ORDER BY 土壌コード';

        ADOQ.Close;
        ADOQ.SQL.Clear;
        ADOQ.SQL.Add(ssql);
        ADOQ.Open;

     end;


     if Mode = '土性' then begin

        ssql := 'select 土性コード,土性名 From M_DOSEI';
        if Eskey.Text <> '' then begin

           ssql := ssql + ' Where 土性名 like '''+Eskey.Text+'%%''';

        end;
        ssql := ssql + ' ORDER BY 土性コード';

        ADOQ.Close;
        ADOQ.SQL.Clear;
        ADOQ.SQL.Add(ssql);
        ADOQ.Open;

     end;

     if Mode = '支所' then begin

        ssql := 'select 支所コード,支所名 From M_SISYO';
        if Eskey.Text <> '' then begin

           ssql := ssql + ' Where 支所名 like '''+Eskey.Text+'%%''';

        end;
        ssql := ssql + ' ORDER BY 支所コード';

        ADOQ.Close;
        ADOQ.SQL.Clear;
        ADOQ.SQL.Add(ssql);
        ADOQ.Open;

     end;


     if Mode = '自治会' then begin

        ssql := 'select コード,自治会名 From M_JICHIKAI';
        if Eskey.Text <> '' then begin

           ssql := ssql + ' Where 自治会名 like '''+Eskey.Text+'%%''';

        end;
        ssql := ssql + ' ORDER BY コード';

        ADOQ.Close;
        ADOQ.SQL.Clear;
        ADOQ.SQL.Add(ssql);
        ADOQ.Open;

     end;


     if Mode = '結果報告方法' then begin

        ssql := 'select コード,名称 From C_HOUKOKU';
        if Eskey.Text <> '' then begin

           ssql := ssql + ' Where 名称 like '''+Eskey.Text+'%%''';

        end;
        ssql := ssql + ' ORDER BY コード';

        ADOQ.Close;
        ADOQ.SQL.Clear;
        ADOQ.SQL.Add(ssql);
        ADOQ.Open;

     end;

     if Mode = '結果' then begin

        ssql := 'select コード,名称 From C_KEKKA';
        if Eskey.Text <> '' then begin

           ssql := ssql + ' Where 名称 like '''+Eskey.Text+'%%''';

        end;
        ssql := ssql + ' ORDER BY コード';

        ADOQ.Close;
        ADOQ.SQL.Clear;
        ADOQ.SQL.Add(ssql);
        ADOQ.Open;

     end;


     if Mode = '作物分類１' then begin

        ssql := 'select コード,名称 From C_SYURUI1';
        if Eskey.Text <> '' then begin

           ssql := ssql + ' Where 名称 like '''+Eskey.Text+'%%''';

        end;
        ssql := ssql + ' ORDER BY コード';

        ADOQ.Close;
        ADOQ.SQL.Clear;
        ADOQ.SQL.Add(ssql);
        ADOQ.Open;

     end;

     if Mode = '作物分類２' then begin

        ssql := 'select コード,コード2,名称 From C_SYURUI2 Where コード = '''+SakuCD+'''';
        if Eskey.Text <> '' then begin

           ssql := ssql + ' Where 名称 like '''+Eskey.Text+'%%''';

        end;
        ssql := ssql + ' ORDER BY コード2';

        ADOQ.Close;
        ADOQ.SQL.Clear;
        ADOQ.SQL.Add(ssql);
        ADOQ.Open;

     end;

     if Mode = '事業' then begin

        ssql := 'select コード,名称 From C_JIGYOU';
        if Eskey.Text <> '' then begin

           ssql := ssql + ' Where 名称 like '''+Eskey.Text+'%%''';

        end;
        ssql := ssql + ' ORDER BY コード';

        ADOQ.Close;
        ADOQ.SQL.Clear;
        ADOQ.SQL.Add(ssql);
        ADOQ.Open;

     end;

     if Mode = '分析種類' then begin

        ssql := 'select コード,名称 From C_BUNSEKI';
        if Eskey.Text <> '' then begin

           ssql := ssql + ' Where 名称 like '''+Eskey.Text+'%%''';

        end;
        ssql := ssql + ' ORDER BY コード';

        ADOQ.Close;
        ADOQ.SQL.Clear;
        ADOQ.SQL.Add(ssql);
        ADOQ.Open;

     end;
     //     DBGrid1.SelectedIndex := 1;
//     DBGrid1.Focused;
//     DBGRID1.CanFocus;



end;

procedure TFMasSel.FormShow(Sender: TObject);
var
ssql : String;
begin

  SAns := '';


  if Mode = '農家' then begin
    btNouka.Visible := true;
  end
  else begin
    btNouka.Visible := false;

  end;

  if Mode = '作型' then begin
     Eskey.Visible := false;
  end
  else begin
     Eskey.Visible := True;
  end;



  //データを表示する
  if Mode = '作型' then begin

        ssql := 'select 作型コード,作型名 From M_SAKUGATA Where 作物コード = '''+SakuCD+''' ORDER BY 作型コード';

//        if Eskey.Text <> '' then begin
//           ssql := ssql + ' Where 作型名 like '''+Eskey.Text+'%%''';
//        end;

        ADOQ.Close;
        ADOQ.SQL.Clear;
        ADOQ.SQL.Add(ssql);
        ADOQ.Open;

     end;


end;

end.
