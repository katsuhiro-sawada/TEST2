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
    SAns2 : String;     //��^��

    SakuCD : String;  //SQL�̍�ڃR�[�h
    SakuCD2 : String;  //SQL�̍앨�R�[�h

    SSQL : String; //SQL��

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

    if Mode = '���' then begin
      SAns := ADOQ.FieldByName('��ڃR�[�h').asString;
      SAns2 := ADOQ.FieldByName('��ږ�').asString;

    end;

    if Mode = '�앨' then begin
      SAns := ADOQ.FieldByName('�앨�R�[�h').asString;
      SAns2 := ADOQ.FieldByName('�앨��').asString;

    end;

    if Mode = '��^' then begin
      SAns := ADOQ.FieldByName('��^�R�[�h').asString;
      SAns2 := ADOQ.FieldByName('��^��').asString;
    end;

    if Mode = '�_��' then begin
      SAns := ADOQ.FieldByName('�_�Ɣԍ�').asString;
    end;

    if Mode = '�y��' then begin
      SAns := ADOQ.FieldByName('�y��R�[�h').asString;
    end;

    if Mode = '�y��' then begin
      SAns := ADOQ.FieldByName('�y���R�[�h').asString;
    end;

    if Mode = '�x��' then begin
      SAns := ADOQ.FieldByName('�x���R�[�h').asString;
    end;

    if Mode = '������' then begin
      SAns := ADOQ.FieldByName('�R�[�h').asString;
    end;

    if Mode = '���ʕ񍐕��@' then begin
      SAns := ADOQ.FieldByName('����').asString;
    end;

    if Mode = '����' then begin
      SAns := ADOQ.FieldByName('����').asString;
    end;

    if Mode = '�앨���ނP' then begin
      SAns := ADOQ.FieldByName('����').asString;
    end;

    if Mode = '�앨���ނQ' then begin
      SAns := ADOQ.FieldByName('����').asString;
    end;

    if Mode = '����' then begin
      SAns := ADOQ.FieldByName('����').asString;
    end;
    if Mode = '���͎��' then begin
      SAns := ADOQ.FieldByName('����').asString;
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

     Key:=0; //�L�[���͂𖳌��ɂ�
     Keybd_event(VK_TAB,0,0,0); //Tab�L�[�𔭐�������B


  end;

end;

procedure TFMasSel.Hyouji();
begin


     if Mode = '���' then begin

        ssql := 'select ��ڃR�[�h,��ږ� From M_SAKUMOKU';
        if Eskey.Text <> '' then begin

           ssql := ssql + ' Where ��ږ� like '''+Eskey.Text+'%%''';

        end;
        ssql := ssql + ' ORDER BY ��ڃR�[�h';

        ADOQ.Close;
        ADOQ.SQL.Clear;
        ADOQ.SQL.Add(ssql);
        ADOQ.Open;

     end;



     if Mode = '�앨' then begin

        ssql := 'select �앨�R�[�h,�앨�� From M_SAKUMOTU';

        if Eskey.Text <> '' then begin
           ssql := ssql + ' and �앨�� like '''+Eskey.Text+'%%''';
        end;

        ssql := ssql + ' ORDER BY �앨�R�[�h';


        ADOQ.Close;
        ADOQ.SQL.Clear;
        ADOQ.SQL.Add(ssql);
        ADOQ.Open;

     end;


     if Mode = '�_��' then begin

        ssql := 'select �_�Ɣԍ�,�_�Ɩ� From M_NOUKA';
        if Eskey.Text <> '' then begin

           ssql := ssql + ' Where �_�Ɩ� like '''+Eskey.Text+'%%''';

        end;
        ssql := ssql + ' ORDER BY �_�Ɣԍ�';

        ADOQ.Close;
        ADOQ.SQL.Clear;
        ADOQ.SQL.Add(ssql);
        ADOQ.Open;

     end;

     if Mode = '�y��' then begin

        ssql := 'select �y��R�[�h,�y�떼 From M_DOJOU';
        if Eskey.Text <> '' then begin

           ssql := ssql + ' Where �y�떼 like '''+Eskey.Text+'%%''';

        end;
        ssql := ssql + ' ORDER BY �y��R�[�h';

        ADOQ.Close;
        ADOQ.SQL.Clear;
        ADOQ.SQL.Add(ssql);
        ADOQ.Open;

     end;


     if Mode = '�y��' then begin

        ssql := 'select �y���R�[�h,�y���� From M_DOSEI';
        if Eskey.Text <> '' then begin

           ssql := ssql + ' Where �y���� like '''+Eskey.Text+'%%''';

        end;
        ssql := ssql + ' ORDER BY �y���R�[�h';

        ADOQ.Close;
        ADOQ.SQL.Clear;
        ADOQ.SQL.Add(ssql);
        ADOQ.Open;

     end;

     if Mode = '�x��' then begin

        ssql := 'select �x���R�[�h,�x���� From M_SISYO';
        if Eskey.Text <> '' then begin

           ssql := ssql + ' Where �x���� like '''+Eskey.Text+'%%''';

        end;
        ssql := ssql + ' ORDER BY �x���R�[�h';

        ADOQ.Close;
        ADOQ.SQL.Clear;
        ADOQ.SQL.Add(ssql);
        ADOQ.Open;

     end;


     if Mode = '������' then begin

        ssql := 'select �R�[�h,����� From M_JICHIKAI';
        if Eskey.Text <> '' then begin

           ssql := ssql + ' Where ����� like '''+Eskey.Text+'%%''';

        end;
        ssql := ssql + ' ORDER BY �R�[�h';

        ADOQ.Close;
        ADOQ.SQL.Clear;
        ADOQ.SQL.Add(ssql);
        ADOQ.Open;

     end;


     if Mode = '���ʕ񍐕��@' then begin

        ssql := 'select �R�[�h,���� From C_HOUKOKU';
        if Eskey.Text <> '' then begin

           ssql := ssql + ' Where ���� like '''+Eskey.Text+'%%''';

        end;
        ssql := ssql + ' ORDER BY �R�[�h';

        ADOQ.Close;
        ADOQ.SQL.Clear;
        ADOQ.SQL.Add(ssql);
        ADOQ.Open;

     end;

     if Mode = '����' then begin

        ssql := 'select �R�[�h,���� From C_KEKKA';
        if Eskey.Text <> '' then begin

           ssql := ssql + ' Where ���� like '''+Eskey.Text+'%%''';

        end;
        ssql := ssql + ' ORDER BY �R�[�h';

        ADOQ.Close;
        ADOQ.SQL.Clear;
        ADOQ.SQL.Add(ssql);
        ADOQ.Open;

     end;


     if Mode = '�앨���ނP' then begin

        ssql := 'select �R�[�h,���� From C_SYURUI1';
        if Eskey.Text <> '' then begin

           ssql := ssql + ' Where ���� like '''+Eskey.Text+'%%''';

        end;
        ssql := ssql + ' ORDER BY �R�[�h';

        ADOQ.Close;
        ADOQ.SQL.Clear;
        ADOQ.SQL.Add(ssql);
        ADOQ.Open;

     end;

     if Mode = '�앨���ނQ' then begin

        ssql := 'select �R�[�h,�R�[�h2,���� From C_SYURUI2 Where �R�[�h = '''+SakuCD+'''';
        if Eskey.Text <> '' then begin

           ssql := ssql + ' Where ���� like '''+Eskey.Text+'%%''';

        end;
        ssql := ssql + ' ORDER BY �R�[�h2';

        ADOQ.Close;
        ADOQ.SQL.Clear;
        ADOQ.SQL.Add(ssql);
        ADOQ.Open;

     end;

     if Mode = '����' then begin

        ssql := 'select �R�[�h,���� From C_JIGYOU';
        if Eskey.Text <> '' then begin

           ssql := ssql + ' Where ���� like '''+Eskey.Text+'%%''';

        end;
        ssql := ssql + ' ORDER BY �R�[�h';

        ADOQ.Close;
        ADOQ.SQL.Clear;
        ADOQ.SQL.Add(ssql);
        ADOQ.Open;

     end;

     if Mode = '���͎��' then begin

        ssql := 'select �R�[�h,���� From C_BUNSEKI';
        if Eskey.Text <> '' then begin

           ssql := ssql + ' Where ���� like '''+Eskey.Text+'%%''';

        end;
        ssql := ssql + ' ORDER BY �R�[�h';

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


  if Mode = '�_��' then begin
    btNouka.Visible := true;
  end
  else begin
    btNouka.Visible := false;

  end;

  if Mode = '��^' then begin
     Eskey.Visible := false;
  end
  else begin
     Eskey.Visible := True;
  end;



  //�f�[�^��\������
  if Mode = '��^' then begin

        ssql := 'select ��^�R�[�h,��^�� From M_SAKUGATA Where �앨�R�[�h = '''+SakuCD+''' ORDER BY ��^�R�[�h';

//        if Eskey.Text <> '' then begin
//           ssql := ssql + ' Where ��^�� like '''+Eskey.Text+'%%''';
//        end;

        ADOQ.Close;
        ADOQ.SQL.Clear;
        ADOQ.SQL.Add(ssql);
        ADOQ.Open;

     end;


end;

end.
