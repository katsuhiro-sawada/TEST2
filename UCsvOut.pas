unit UCsvOut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, ExtDlgs,DMU; //,PrnCanvasU;

type
  TFCsvOut = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Eoutfile: TEdit;
    PB1: TProgressBar;
    SaveDialog1: TSaveDialog;
    BitBtn3: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    Mode : String;
    { Public declarations }
  end;

var
  FCsvOut: TFCsvOut;

implementation

uses PrnCanvasU, MainU, BunsekiU;

{$R *.dfm}

procedure TFCsvOut.BitBtn1Click(Sender: TObject);
var
outfile : String;
  iCnt : Integer;
  WorkList,CSVList : TStringList;
  stmp : String;
  i : integer;

begin
//�o�͎��s

  if EOUtfile.Text = '' then begin
    ShowMessage('�o�̓t�@�C��������͂��ĉ������B');
    exit;
  end;

  outfile := EOUtfile.Text;


   WorkList := TStringList.Create; //1�s����
   CSVList := TStringList.Create;  //�S�̂��i�[



  if Mode = '��t' then begin

   ///////////////////////// �o��   ///
   //���ڂ��o��
    WorkList.Clear ;
      WorkList.Add('�T���v���ԍ�');
      WorkList.Add('��t�N����');
      WorkList.Add('�_�Ɣԍ�');
      WorkList.Add('�_�Ɩ�');
      WorkList.Add('�ޏ�ԍ�');
      WorkList.Add('�ޏꖼ');
      WorkList.Add('�s�����R�[�h');
      WorkList.Add('�s������');
      WorkList.Add('�O��ڃR�[�h');
      WorkList.Add('�O���');
      WorkList.Add('�O�앨�R�[�h');
      WorkList.Add('�O�앨��');
      WorkList.Add('�O��^�R�[�h');
      WorkList.Add('�O��^��');
      WorkList.Add('��ڃR�[�h');
      WorkList.Add('���');
      WorkList.Add('�앨�R�[�h');
      WorkList.Add('�앨��');
      WorkList.Add('��^�R�[�h');
      WorkList.Add('��^��');
      WorkList.Add('�y��R�[�h');
      WorkList.Add('�y�떼');
      WorkList.Add('�y���R�[�h');
      WorkList.Add('�y����');

      WorkList.Add('�엿��1');
      WorkList.Add('N1');
      WorkList.Add('P1');
      WorkList.Add('K1');
      WorkList.Add('Mg1');
      WorkList.Add('�e��1');
//      WorkList.Add('�P��1');
      WorkList.Add('�엿��2');
      WorkList.Add('N2');
      WorkList.Add('P2');
      WorkList.Add('K2');
      WorkList.Add('Mg2');
      WorkList.Add('�e��2');
//      WorkList.Add('�P��2');



//      WorkList.Add('���͎��');
//      WorkList.Add('���A');
      WorkList.Add('pH');
      WorkList.Add('EC');
      WorkList.Add('�g���I�[�OP');
      WorkList.Add('�u���CP');
      WorkList.Add('CaO');
      WorkList.Add('MgO');
      WorkList.Add('K2O');
      WorkList.Add('CEC');
      WorkList.Add('���A');
      WorkList.Add('�A�����j�A��N');
      WorkList.Add('����N');
      WorkList.Add('�M���oN');
      WorkList.Add('�Ɏ_��N');
      WorkList.Add('�P�C�_');
      WorkList.Add('�S');
      WorkList.Add('���z');

WorkList.Add('����');
WorkList.Add('��');
WorkList.Add('�}���K��');
WorkList.Add('�z�E�f');
WorkList.Add('�j�b�P��');
WorkList.Add('pHKCL');
WorkList.Add('Y1');
WorkList.Add('���l');

//      WorkList.Add('���̑����͍���');
//      WorkList.Add('���̑����͒l');
//      WorkList.Add('���l');

   CSVList.Add(WorkList.CommaText);





//   frmBunseki.ADOTable1
//   DM  PrintModule1.QueryUketuke.close;
//   PrintModule1.QueryUketuke.open;

PB1.Min := 0;
PB1.Max := frmBunseki.ADOQuery1.RecordCount;
PB1.Position := 0;


   with frmBunseki.ADOQuery1 do begin

     First;
     i := 0;
     while not frmBunseki.ADOQuery1.eof do begin

       i := i + 1;
       PB1.Position := i;

       //if frmBunseki.ADOTable1.RecordCount < i then
       //  break;


        //���[�N���X�g���N���A
        WorkList.Clear;
      WorkList.Add(FieldbyName('�T���v���ԍ�').asString);
      WorkList.Add(FieldbyName('��t�N����').asString);
      WorkList.Add(FieldbyName('�_�Ɣԍ�').asString);
      WorkList.Add(FieldbyName('�_�Ɩ�').asString);
      WorkList.Add(FieldbyName('�ޏ�ԍ�').asString);
      WorkList.Add(FieldbyName('�ޏꖼ').asString);
      WorkList.Add(FieldbyName('�s�����R�[�h').asString);
      WorkList.Add(FieldbyName('�s������').asString);


      WorkList.Add(FieldbyName('�O��ڃR�[�h').asString);
      WorkList.Add(FieldbyName('�O���').asString);
      WorkList.Add(FieldbyName('�O�앨�R�[�h').asString);
      WorkList.Add(FieldbyName('�O�앨��').asString);
      WorkList.Add(FieldbyName('�O��^�R�[�h').asString);
      WorkList.Add(FieldbyName('�O��^��').asString);
      WorkList.Add(FieldbyName('��ڃR�[�h').asString);
      WorkList.Add(FieldbyName('���').asString);
      WorkList.Add(FieldbyName('�앨�R�[�h').asString);
      WorkList.Add(FieldbyName('�앨��').asString);
      WorkList.Add(FieldbyName('��^�R�[�h').asString);
      WorkList.Add(FieldbyName('��^��').asString);

      WorkList.Add(FieldbyName('�y��R�[�h').asString);
      WorkList.Add(FieldbyName('�y�떼').asString);
      WorkList.Add(FieldbyName('�y���R�[�h').asString);
      WorkList.Add(FieldbyName('�y����').asString);


WorkList.Add(FieldbyName('�엿��1').asString);
WorkList.Add(FieldbyName('N1').asString);
WorkList.Add(FieldbyName('P1').asString);
WorkList.Add(FieldbyName('K1').asString);
WorkList.Add(FieldbyName('Mg1').asString);
WorkList.Add(FieldbyName('�e��1').asString);
//WorkList.Add(FieldbyName('�P��1').asString);

WorkList.Add(FieldbyName('�엿��2').asString);
WorkList.Add(FieldbyName('N2').asString);
WorkList.Add(FieldbyName('P2').asString);
WorkList.Add(FieldbyName('K2').asString);
WorkList.Add(FieldbyName('Mg2').asString);
WorkList.Add(FieldbyName('�e��2').asString);
//WorkList.Add(FieldbyName('�P��2').asString);


//      WorkList.Add(FieldbyName('���͎��').asString);
//      WorkList.Add('���A');
      WorkList.Add(FieldbyName('pH').asString);
      WorkList.Add(FieldbyName('EC').asString);
      WorkList.Add(FieldbyName('�g���I�[�OP').asString);
      WorkList.Add(FieldbyName('�u���CP').asString);
      WorkList.Add(FieldbyName('CaO').asString);
      WorkList.Add(FieldbyName('MgO').asString);
      WorkList.Add(FieldbyName('K2O').asString);
      WorkList.Add(FieldbyName('CEC').asString);
      WorkList.Add(FieldbyName('���A').asString);
      WorkList.Add(FieldbyName('�A�����j�A��N').asString);
      WorkList.Add(FieldbyName('����N').asString);
      WorkList.Add(FieldbyName('�M���oN').asString);
      WorkList.Add(FieldbyName('�Ɏ_��N').asString);
      WorkList.Add(FieldbyName('�P�C�_').asString);
      WorkList.Add(FieldbyName('�S').asString);
      WorkList.Add(FieldbyName('�����z').asString);


WorkList.Add(FieldbyName('����').asString);
WorkList.Add(FieldbyName('��').asString);
WorkList.Add(FieldbyName('�}���K��').asString);
WorkList.Add(FieldbyName('�z�E�f').asString);
WorkList.Add(FieldbyName('�j�b�P��').asString);
WorkList.Add(FieldbyName('pHKCL').asString);
WorkList.Add(FieldbyName('Y1').asString);
WorkList.Add(FieldbyName('���l').asString);


//      WorkList.Add(FieldbyName('�ܐ���').asString);
//      WorkList.Add(FieldbyName('���̑����͍���').asString);
//      WorkList.Add(FieldbyName('���̑����͒l').asString);
//      WorkList.Add(FieldbyName('���l').asString);


        CSVList.Add(WorkList.CommaText);
        Next;

       end;

   end;


   end;


   if Mode = '�W�v' then begin

    //���ڂ��o��
    WorkList.Clear ;
      WorkList.Add('��t�N����');
      WorkList.Add('�Z��');
      WorkList.Add('����');
      WorkList.Add('�ԍ�');
      WorkList.Add('���͎��');
      WorkList.Add('�P��');
      WorkList.Add('���͐�');

      CSVList.Add(WorkList.CommaText);





//   frmBunseki.ADOTable1
//   DM  PrintModule1.QueryUketuke.close;
//   PrintModule1.QueryUketuke.open;

    PB1.Min := 0;
    PB1.Max := DataModule1.ADOQtmp.RecordCount;
    PB1.Position := 0;


   with DataModule1.ADOQtmp do begin

     First;
     i := 0;
     while not eof do begin

       i := i + 1;
       PB1.Position := i;

       //if frmBunseki.ADOTable1.RecordCount < i then
       //  break;


        //���[�N���X�g���N���A
        WorkList.Clear;
        WorkList.Add(FieldbyName('��t�N����').asString);
        WorkList.Add(FieldbyName('�Z��').asString);
        WorkList.Add(FieldbyName('����').asString);
        WorkList.Add(FieldbyName('�ԍ�').asString);
        WorkList.Add(FieldbyName('���͎��').asString);
        WorkList.Add(FieldbyName('�P��').asString);
        WorkList.Add(FieldbyName('���͐�').asString);


        CSVList.Add(WorkList.CommaText);
        Next;

       end;

   end;






   end;









  CSVList.SavetoFile( outfile );

  CSVList.Free;
  WorkList.Free;


 showmessage('�o�͂��܂����B');

 close;


end;

procedure TFCsvOut.BitBtn2Click(Sender: TObject);
begin

   Close;

end;

procedure TFCsvOut.BitBtn3Click(Sender: TObject);
var
outfile : String;
stmp : String;
begin
//�ꗗ�e�L�X�g�o��

    //stmp := MainForm.Vmode;

    //SaveDialog1.FileName := stmp;

   if SaveDialog1.Execute then begin
       outfile := SaveDialog1.FileName;
       EOUtfile.Text := outfile;
   end
   else begin
     exit;
   end;



end;

end.
