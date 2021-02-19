unit USintyoku;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, Db, DBTables, Buttons, ExtCtrls,
  ComCtrls, DBCtrls;

type
  TFSintyoku = class(TForm)
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    D2: TDataSource;
    DBGrid2: TDBGrid;
    Image2: TImage;
    Image1: TImage;
    Label13: TLabel;
    EKensuu: TEdit;
    Panel1: TPanel;
    Panel3: TPanel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure EBarInputChange(Sender: TObject);
    procedure Sp1Click(Sender: TObject);
    procedure Sp2Click(Sender: TObject);
    procedure Sp3Click(Sender: TObject);
    procedure BtKensakuClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private �錾 }
    procedure DataSet( sf : String);
    procedure DataCls( sf : String );
    procedure DataSetAll( sf : String );
    procedure TableOpen();
    procedure TableOpen2();
  public
    { Public �錾 }
  end;

var
  FSintyoku: TFSintyoku;


implementation

uses
  DMU,PrnCanvasU,Printers,PreviewU, DojouU;


{$R *.DFM}

procedure TFSintyoku.FormShow(Sender: TObject);
var
 i : integer;
 flg : Boolean;
 stmp : String;
begin

    Color := BackColor ;



end;

procedure TFSintyoku.EBarInputChange(Sender: TObject);
begin



end;

//�e�[�u���̃I�[�y��
procedure TFSintyoku.TableOpen();
begin


end;

//�e�[�u���̃I�[�y��
procedure TFSintyoku.TableOpen2();
begin


end;

procedure TFSintyoku.Sp1Click(Sender: TObject);
begin
    Tableopen;


end;

procedure TFSintyoku.Sp2Click(Sender: TObject);
begin

    Tableopen;


end;

procedure TFSintyoku.Sp3Click(Sender: TObject);
begin

    Tableopen;


end;

procedure TFSintyoku.BtKensakuClick(Sender: TObject);
begin

  TableOpen2;


end;

procedure TFSintyoku.DataSet( sf : String);
begin

end;

procedure TFSintyoku.DataSetAll( sf : String );
begin


end;

procedure TFSintyoku.DataCls( sf : String );
var
stmp : String;
begin

end;

procedure TFSintyoku.BitBtn5Click(Sender: TObject);
begin
    DataCls('�i���f�f');

end;

procedure TFSintyoku.BitBtn12Click(Sender: TObject);
begin
    DataCls('�i�����t�I��');
end;

procedure TFSintyoku.BitBtn9Click(Sender: TObject);
begin
     DataSet('�i�������v��');

end;

procedure TFSintyoku.BitBtn14Click(Sender: TObject);
begin
    DataCls('�i�������v��');
end;

procedure TFSintyoku.BitBtn1Click(Sender: TObject);
begin

close;

end;

procedure TFSintyoku.BitBtn2Click(Sender: TObject);
var
stmp : String;
begin


  DataModule1.ADOQtmp.Close;



stmp := 'SELECT T_UKETUKE6.��t�A��, T_BUNSEKI6.��tNO, T_UKETUKE6.��t�N����,min(����NO) as �nNO,max(����NO) as �INO,'+
 ' Count(T_BUNSEKI6.ph) AS ph,'+
 ' Count(T_BUNSEKI6.EC) AS EC,'+
 ' T_UKETUKE6.��t�N����'+
 ' FROM T_BUNSEKI6 INNER JOIN T_UKETUKE6 ON T_BUNSEKI6.��tNO = T_UKETUKE6.��tNO'+
 ' GROUP BY T_UKETUKE6.��t�A��, T_BUNSEKI6.��tNO, T_UKETUKE6.��t�N����';







{

        ' LEFT JOIN M_SAKUMOTU ON T_BUNSEKI6.�앨�R�[�h = M_SAKUMOTU.�앨�R�[�h) '+
        ' LEFT JOIN M_SAKUGATA ON (T_BUNSEKI6.�앨�R�[�h = M_SAKUGATA.�앨�R�[�h) and (T_BUNSEKI6.��^�R�[�h = M_SAKUGATA.��^�R�[�h)) '+
        ' LEFT JOIN M_NOUKYOU ON T_UKETUKE6.�g���ԍ� = M_NOUKYOU.�g���ԍ�) '+
        ' LEFT JOIN M_SISYO ON (T_UKETUKE6.�g���ԍ� = M_SISYO.�g���ԍ�) and (T_UKETUKE6.�x�X�ԍ� = M_SISYO.�x�X�ԍ�)) '+
        'where ' + pCondition +
        ' ORDER BY T_Bunseki6.����NO' ;

}


  DataModule1.ADOQtmp.SQL.Text := stmp;

  DataModule1.ADOQtmp.open;











end;

procedure TFSintyoku.BitBtn3Click(Sender: TObject);
begin

showmessage('������');

end;

procedure TFSintyoku.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  with DBGrid2.Canvas do begin
    if Column.FieldName = '�Ċm�F' then begin
      if DBGrid2.DataSource.DataSet.FieldByName('�Ċm�F').AsBoolean then begin
//           and (not (gdFocused in State))
//      then begin
          DBGrid2.Canvas.FillRect(Rect);
          DBGrid2.Canvas.Draw(Rect.Left+2, Rect.Top+2, Image1.Picture.Bitmap);
      end
      else begin
          DBGrid2.Canvas.FillRect(Rect);
          DBGrid2.Canvas.Draw(Rect.Left+2, Rect.Top+2, Image2.Picture.Bitmap);
      end;
//          Brush.Color := clBtnFace;//TColor($0073705B); //clBlue;
//          Font.Color := clBlue; //clGreen; //clWhite;
    end;
//    end;
  end;
//  DBGrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State);


//		if StringGrid1.Cells[aCol,aRow] = '1' then begin
//			StringGrid1.Canvas.Draw(Rect.Left+2, Rect.Top+2, Image1.Picture.Bitmap);
//		end else begin
//			StringGrid1.Canvas.Draw(Rect.Left+2, Rect.Top+2, Image2.Picture.Bitmap);





end;

procedure TFSintyoku.DBGrid2DblClick(Sender: TObject);
var
stmp : String;
RecCnt : Integer;
aDevice:Array[0..255] of char;
aDriver:Array[0..255] of char;
aPort:Array[0..32] of char;
PDM: PDeviceMode;
aDevMode: THandle;
//PrnDlg : TfrmPreview;
begin

{


     if Q1.FieldByName('�i�����͏I��').asString <> '��' then begin
        ShowMessage('���͂��I�����Ă��܂���B' );
        exit;
     end;



       //���̃t�H�[��������Ă����Ȃ��Ƃ����Ȃ��B�@������DB���d�l���Ă���B
     Application.CreateForm(TSindanForm, SindanForm);



     SQLCondition := '�T���v���ԍ� = "'+ Q1.FieldByName('�T���v���ԍ�').asString+'"';
     PrintModule1.ADOQueryUketuke.SQL.Clear;
     stmp := 'Select T_UKETUKE.*,M_HOJOU.�y��R�[�h,M_HOJOU.�y���R�[�h,M_HOJOU.���A�R�[�h '+
                'from T_UKETUKE INNER JOIN M_HOJOU '+
                'ON  (T_UKETUKE.�ޏ�ԍ� = M_HOJOU.�ޏ�ԍ�) where T_UKETUKE.�폜�t���O<>True and ' +
                SQLCondition;
     PrintModule1.ADOQueryUketuke.SQL.Add(stmp);
     PrintModule1.ADOQueryUketuke.open;

     //�S�̂̌���������o��
     with DataModule1.QueryRead do begin
                SQL.Text := 'Select Count(*) cnt from T_UKETUKE where �폜�t���O<>True and ' + SQLCondition ;
                Open;
                RecCnt := FieldByName('cnt').asInteger ;
                Close;
     end;
//          OpenProgress;
            //�ꌏ������̃X�e�b�v��
//          frmProgress.Scale(Floor(333/RecCnt));
            //H150828      Pages := RecCnt;

            //�v�����^�̐ݒ�
            //  Printer.PrinterIndex := -1;
     Printer.PrinterIndex := Printer.PrinterIndex;
     Printer.GetPrinter(aDevice, aDriver, aPort, aDevMode);
     Printer.SetPrinter(aDevice, aDriver, aPort, 0);
     Printer.GetPrinter(aDevice, aDriver, aPort, aDevMode);
     PDM := GlobalLock(aDevMode); //�����������b�N����@�̈���Ƃ�킯�ł͂Ȃ��B


     if JMode = 'Douou' then begin
                     PDM^.dmPaperSize := DMPAPER_A4;
                     PDM^.dmOrientation := DMORIENT_LANDSCAPE; // ��
                     //DMORIENT_PORTRAIT;
     end
     else if JMode = 'Fuuren' then begin
                     PDM^.dmPaperSize := DMPAPER_B4;
                     PDM^.dmOrientation := DMORIENT_PORTRAIT; // �c
     end
     else begin
                     PDM^.dmPaperSize := DMPAPER_A4;
                     PDM^.dmOrientation := DMORIENT_PORTRAIT; // �c
     end;


     GlobalUnlock(aDevMode); //���������J���@�̈�������킯�ł͂Ȃ��B
     Printer.SetPrinter(aDevice, aDriver, aPort, aDevMode);

     //�\��
     if Q1.FieldByName('�o�͒������͂̂�').asBoolean then begin
         DspPrnReport( self,rtBunseki, RecCnt );
     end
     else begin
         DspPrnReport( self,rtSindan, RecCnt );
     end;


     SindanForm.Release ;
}
end;

end.
