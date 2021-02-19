unit M_KIJUNU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  mstKIJUNU, StdCtrls, Db, DBTables, Buttons, ExtCtrls, ComCtrls, Mask,Variants,


  DBCtrls, ADODB;

type
  TmstKijun1Form = class(TmstKijunForm)
    Label1: TLabel;
    Panel1: TPanel;
    DBEdit5: TDBEdit;
    DBEdit1: TDBEdit;
    Label11: TLabel;
    ADODummy: TADOTable;
    DDummy: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private �錾 }
//    cBox1Itemindex : integer ;
    FBokusouName : string ;
  public
    { Public �錾 }
  end;

var
  mstKijun1Form: TmstKijun1Form;

implementation

uses M_KIJUN2U, DMU;

{$R *.DFM}

procedure TmstKijun1Form.FormCreate(Sender: TObject);
begin
  inherited;
  ADOTable1.TableName := 'm_sakumotu';
 if not JMaster then begin		//�ҏW�s��
    ds1.AutoEdit := False ;
    ADOTable1.ReadOnly := true;
  end;
  ADOTable1.Open;


//  while not ADOTable1.Eof do begin
//    ComboBox1.Items.Add(ADOTable1.fieldByname('�앨��').asString );
//  	ADOTable1.Next;
//  end;




end;


const NUMOFFIELDS = 197;
const FieldN : array[1..NUMOFFIELDS] of string = (
	'pHA���','pHA����','pHA�ڕW','pHA�O���t���','pHA�O���t����',
	'ECA���','ECA����','ECA�ڕW','ECA�O���t���','ECA�O���t����',
  '�����_A���','�����_A����','�����_A�ڕW','�����_A�O���t���','�����_A�O���t����',
  '�ΊDA���','�ΊDA����','�ΊDA�ڕW','�ΊDA�O���t���','�ΊDA�O���t����',
  '��yA���','��yA����','��yA�ڕW','��yA�O���t���','��yA�O���t����',
  '����A���','����A����','����A�ڕW','����A�O���t���','����A�O���t����',

	'pHB���','pHB����','pHB�ڕW','pHB�O���t���','pHB�O���t����',
	'ECB���','ECB����','ECB�ڕW','ECB�O���t���','ECB�O���t����',
  '�����_B���','�����_B����','�����_B�ڕW','�����_B�O���t���','�����_B�O���t����',
  '�ΊDB���','�ΊDB����','�ΊDB�ڕW','�ΊDB�O���t���','�ΊDB�O���t����',
  '��yB���','��yB����','��yB�ڕW','��yB�O���t���','��yB�O���t����',
  '����B���','����B����','����B�ڕW','����B�O���t���','����B�O���t����',

	'pHC���','pHC����','pHC�ڕW','pHC�O���t���','pHC�O���t����',
	'ECC���','ECC����','ECC�ڕW','ECC�O���t���','ECC�O���t����',
  '�����_C���','�����_C����','�����_C�ڕW','�����_C�O���t���','�����_C�O���t����',
  '�ΊDC���','�ΊDC����','�ΊDC�ڕW','�ΊDC�O���t���','�ΊDC�O���t����',
  '��yC���','��yC����','��yC�ڕW','��yC�O���t���','��yC�O���t����',
  '����C���','����C����','����C�ڕW','����C�O���t���','����C�O���t����',
  {91}
  '�ΊD��yA���','�ΊD��yA����','�ΊD��yA�ڕW','�ΊD��yA�O���t���','�ΊD��yA�O���t����',
  '��y����A���','��y����A����','��y����A�ڕW','��y����A�O���t���','��y����A�O���t����',
  '�ΊD�O�aA���','�ΊD�O�aA����','�ΊD�O�aA�ڕW','�ΊD�O�aA�O���t���','�ΊD�O�aA�O���t����',
  '�����O�aA���','�����O�aA����','�����O�aA�ڕW','�����O�aA�O���t���','�����O�aA�O���t����',
  '����O�aA���','����O�aA����','����O�aA�ڕW','����O�aA�O���t���','����O�aA�O���t����',
  '�����_��yA���','�����_��yA����','�����_��yA�ڕW',{'�����_��yA�O���t���','�����_��yA�O���t����',}

  '�ΊD��yB���','�ΊD��yB����','�ΊD��yB�ڕW','�ΊD��yB�O���t���','�ΊD��yB�O���t����',
  '��y����B���','��y����B����','��y����B�ڕW','��y����B�O���t���','��y����B�O���t����',
  '�ΊD�O�aB���','�ΊD�O�aB����','�ΊD�O�aB�ڕW','�ΊD�O�aB�O���t���','�ΊD�O�aB�O���t����',
  '�����O�aB���','�����O�aB����','�����O�aB�ڕW','�����O�aB�O���t���','�����O�aB�O���t����',
  '����O�aB���','����O�aB����','����O�aB�ڕW','����O�aB�O���t���','����O�aB�O���t����',
  '�����_��yB���','�����_��yB����','�����_��yB�ڕW',{'�����_��yB�O���t���','�����_��yB�O���t����',}

  '�ΊD��yC���','�ΊD��yC����','�ΊD��yC�ڕW','�ΊD��yC�O���t���','�ΊD��yC�O���t����',
  '��y����C���','��y����C����','��y����C�ڕW','��y����C�O���t���','��y����C�O���t����',
  '�ΊD�O�aC���','�ΊD�O�aC����','�ΊD�O�aC�ڕW','�ΊD�O�aC�O���t���','�ΊD�O�aC�O���t����',
  '�����O�aC���','�����O�aC����','�����O�aC�ڕW','�����O�aC�O���t���','�����O�aC�O���t����',
  '����O�aC���','����O�aC����','����O�aC�ڕW','����O�aC�O���t���','����O�aC�O���t����',
  '�����_��yC���','�����_��yC����','�����_��yC�ڕW',{'�����_��yC�O���t���','�����_��yC�O���t����',}

  '�P�C�_���','�P�C�_����','�P�C�_�ڕW',
  '�S���','�S����','�S�ڕW',
  '�z�E�f���','�z�E�f����','�z�E�f�ڕW',
  '�������','��������','�����ڕW',
  '�}���K�����','�}���K������','�}���K���ڕW',
  '�����','������','���ڕW',
  '�j�b�P�����','�j�b�P������','�j�b�P���ڕW',
  '�P�C�_�O���t���','�P�C�_�O���t����'
);


procedure TmstKijun1Form.FormShow(Sender: TObject);
begin
  inherited;


  ADODummy.close;

  ADODummy.TableName := 'T_DUMMY';

  ADODummy.Open;

  ADODummy.Edit;
  ADODummy.fieldbyname('�R�[�h2').asString := '01';




end;

//��ڂ̎w��
procedure TmstKijun1Form.ComboBox1Change(Sender: TObject);
var
  res : Boolean ;
  TableName : string ;
begin

end;

procedure TmstKijun1Form.BitBtn2Click(Sender: TObject);
var
stmp : String;
cnt,cnt2 : integer;

begin





     if not ds1.DataSet.Active then  exit;

     stmp := 'CEC:0�`10�@���@CEC:10�`20�ACEC:20�` �ɃR�s�[���܂��B��낵���ł����H';
     if Application.MessageBox(Pchar(stmp),'��l�R�s�[',MB_YESNO) <> ID_YES then
       exit ;

      //A �� B
      cnt2 := 0;
    	for cnt := 31 to 60 do begin //��x��Post����ƃG���[�ɂȂ�B�������I�[�o��
        ds1.DataSet.Edit ;
        cnt2 := cnt2 + 1;
    		ds1.DataSet.FieldByName( FieldN[cnt] ).asFloat := ds1.DataSet.FieldByName( FieldN[cnt2] ).asFloat ;
        ds1.DataSet.Post ;
      end;

      //A �� C
      cnt2 := 0;
    	for cnt := 61 to 90 do begin //��x��Post����ƃG���[�ɂȂ�B�������I�[�o��
        ds1.DataSet.Edit ;
        cnt2 := cnt2 + 1;
    		ds1.DataSet.FieldByName( FieldN[cnt] ).asFloat := ds1.DataSet.FieldByName( FieldN[cnt2] ).asFloat ;
        ds1.DataSet.Post ;
      end;


      //A �� B
      cnt2 := 90; //�`118
    	for cnt := 119 to 146 do begin //��x��Post����ƃG���[�ɂȂ�B�������I�[�o��
        ds1.DataSet.Edit ;
        cnt2 := cnt2 + 1;
    		ds1.DataSet.FieldByName( FieldN[cnt] ).asFloat := ds1.DataSet.FieldByName( FieldN[cnt2] ).asFloat ;
        ds1.DataSet.Post ;
      end;


      //A �� C
      cnt2 := 90;
    	for cnt := 147 to 174 do begin //��x��Post����ƃG���[�ɂȂ�B�������I�[�o��
        ds1.DataSet.Edit ;
        cnt2 := cnt2 + 1;
    		ds1.DataSet.FieldByName( FieldN[cnt] ).asFloat := ds1.DataSet.FieldByName( FieldN[cnt2] ).asFloat ;
        ds1.DataSet.Post ;
      end;









end;

end.
