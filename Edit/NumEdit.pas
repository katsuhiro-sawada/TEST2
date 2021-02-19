(******************************************************************************
*     �y�t�@�C�����z
*       NumEdit.pas
*
*     �y�@�\�T�v�z
*       ���l���͗p��Edit
*
*     2003/02/10 : �V�K�C��
*     �l�擾�� .Value
*     �l�ݒ�� .Value
*     .Text �͎g�p���Ȃ��i�����ϊ��Ŏg�p .Text�ɐݒ肵�Ă��\�����f���邪�A.Value�ɔ��f���Ȃ��j
*
******************************************************************************)
unit NumEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,Clipbrd;

type
  TNumEdit = class(TCustomEdit)
  private
    { Private �錾 }
    FAlignment       :TAlignment;             //Alignment�v���p�e�B�p
    FLeaveReturn     :Boolean;                //Enter�L�[�ł̃t�H�[�J�X�ړ�
    FIntLen          :Integer;                //��������
    FDecLen          :Integer;                //��������
    FComma           :Boolean;                //3����؂�
    FValue           :Extended;               //�l
    FEffectFocusColor:Boolean;                //�t�H�[�J�X�擾���w�i�FON/OFF
    FEffectMinusColor:Boolean;                //�����\����Font�J���[
    FNormalColor,                             //�m�[�}�����w�i�F
    FFocusColor,                              //�t�H�[�J�X�擾���w�i�F
    FDisableColor,                            //Disable���J���[
    FSaveFontColor   :TColor;                 //Font�J���[�ۑ��p
    FMinusFont       :TFont;                  //������Font�J���[
    function  TextToNum(Str: String): string;
    function  TxtEncode(src: string):String;
    function  ChkLength(str:string):Boolean;
    procedure SetAlignment(V:TAlignment);
    procedure SetLeaveReturn(V:Boolean);
    procedure SetIntLen(V:Integer);
    procedure SetDecLen(V:Integer);
    procedure SetComma(V:Boolean);
    procedure SetValue(V:Extended);
    procedure SetEffectFocusColor(V:Boolean);
    procedure SetNormalColor(V:TColor);
    procedure SetFocusColor(V:TColor);
    procedure SetEffectMinusColor(V:Boolean);
    procedure SetMinusFont(V:TFont);
    procedure SetDisableColor(V:TColor);
  protected
    { Protected �錾 }
    procedure WMChar(var Msg:TWMChar);message WM_CHAR;
    procedure WMSetText(var msg:TWMSetText); message WM_SETTEXT;
    procedure CMEnter(var Msg:TCMGotFocus);message CM_ENTER;
    procedure CMExit(var Msg:TCMExit);message CM_EXIT;
    procedure CMEnabledChanged(var Message: TMessage); message CM_ENABLEDCHANGED;
    procedure KeyPress(var Key: Char);override;
    procedure Change;override;
    procedure FontChanged(Sender:TObject);
    procedure MinusText;
    function InsertComma(const src: string): string; virtual;
  public
    { Public �錾 }
    constructor Create(AOwner:TComponent); override;
    procedure CreateParams(var Params: TCreateParams); override;
    destructor Destroy;override;

//    property Value:Extended           read FValue        write SetValue;
  published
    { Published �錾 }
    property Anchors;
    property AutoSelect;
    property AutoSize;
    property BiDiMode;
    property BorderStyle;
    property Constraints;
    property Ctl3D;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property Font;
    property OEMConvert;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ReadOnly;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Text;        {�ړ����Ȃ����ƁB���s���̐����ŕ\�L�ύX�����}
    property Visible;
    property OnChange;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDock;
    property OnStartDrag;
    {�ǉ��v���p�e�B}
    property Alignment:TAlignment     read FAlignment    write SetAlignment;
    property DisableColor:TColor      read FDisableColor write SetDisableColor;
    property LeaveReturn:Boolean      read FLeaveReturn  write SetLeaveReturn ;
    property DecLength:Integer        read FDecLen       write SetDecLen;
    property IntLength:Integer        read FIntLen       write SetIntLen;
    property Comma:Boolean            read FComma        write SetComma;
    property FocusColor:TColor        read FFocusColor   write SetFocusColor;
    property NormalColor:TColor       read FNormalColor  write SetNormalColor;
    property EffectFocusColor:Boolean read FEffectFocusColor write SetEffectFocusColor;
    property MinusFont:TFont          read FMinusFont    write SetMinusFont;
    property EffectMinusColor:Boolean read FEffectMinusColor write SetEffectMinusColor;
    property Value:Extended           read FValue        write SetValue;
  end;

procedure Register;

implementation

Const
  Msg_IntLenMaxOver = '�͈͊O�̐��l�����͂����.���܂��B';

constructor TNumEdit.Create(AOwner:TComponent);
begin
  inherited Create(AOwner);
  FAlignment    := taRightJustify;       //Alignment�����è��taRightJustify��ݒ�
  FLeaveReturn  := False;                //Enter�L�[�ɂ��t�H�[�J�X�ړ�
//  FDecLen       := 0;                    //����������
  FDecLen       := 2;                    //2003/02/10 �F �����������������̂łO�ɂ��Ȃ�
  FIntLen       := 10;                   //����������
//  FComma        := True;                 //�J���}�ҏW
  FComma        := False;                 //2003/02/10 �F DBEdit���l�ɂ���
  FDisableColor := clSilver;
  FFocusColor   := $00C8DAFF;
  FNormalColor  := Color;                //�ʏ펞�J���[
  FMinusFont    := TFont.Create;         //�}�C�i�X���J���[
  with FMinusFont do
  begin
    Color := clRed;
    onChange := FontChanged;
  end;
  FSaveFontColor:= Font.Color;
  Width         := 110;
  imeMode       := imClose;
  ControlStyle  := ControlStyle - [csSetCaption];
end;

//--------------------------------------------------------------------------------------
//�E�B���h�E�쐬�p�����[�^�̏�����
//--------------------------------------------------------------------------------------
procedure TNumEdit.CreateParams(var Params: TCreateParams);
const
  Alignments: array[TAlignment] of Longint = (ES_LEFT,ES_RIGHT,ES_CENTER);
begin
  inherited CreateParams(Params);
  Params.Style := Params.Style and DWORD(not (ES_AUTOVSCROLL or WS_VSCROLL)) or
                                   DWORD(ES_MULTILINE) or
                                   DWORD(ES_AUTOHSCROLL) or
                                   DWORD(Alignments[FAlignment]);
end;

//--------------------------------------------------------------------------------------
//�f�X�g���N�^
//--------------------------------------------------------------------------------------
destructor TNumEdit.Destroy;
begin
  FMinusFont.Free;
  inherited Destroy;
end;

//--------------------------------------------------------------------------------------
//CMEnabledChanged
//--------------------------------------------------------------------------------------
procedure TNumEdit.CMEnabledChanged(var Message: TMessage);
begin
  inherited;
  if not Enabled then
    Color := FDisableColor
  else
    //�w�i�F���m�[�}���J���[�ɐݒ肷��
    Color := FNormalColor;
end;

//--------------------------------------------------------------------------------------
//CMEnter
//--------------------------------------------------------------------------------------
procedure TNumEdit.CMEnter(var Msg:TCMGotFocus);
begin
  inherited;

  Text := TextToNum(Text);

  if imeMode <> imClose then
    imeMode := imClose;

  //Alignment���w�肵���ꍇAutoSelect�ł��Ȃ��Ȃ�
  if AutoSelect and not (csLButtonDown in ControlState) then
    SelectAll;

  if FEffectFocuscolor then
    Color := FFocusColor;

end;

//--------------------------------------------------------------------------------------
//CMExit
//--------------------------------------------------------------------------------------
procedure TNumEdit.CMExit(var Msg:TCMExit);
begin
  inherited;

  if FEffectFocusColor then
    Color := FNormalColor;

  if (Text ='-') or (Text = '.') then
    Text :='';

  if not ChkLength(Text) then
  begin
    ShowMessage(Msg_IntLenMaxOver);
    SetFocus;
    Exit;
  end;

  if Text <> '' then
    Text := TxtEncode(Text)

//20001214
  {
  if (FComma) and (Text <> '')then
    Text := TxtEncode(Text);
  }
//20001214
end;

//--------------------------------------------------------------------------------------
//KeyPress
//--------------------------------------------------------------------------------------
procedure TNumEdit.KeyPress(var Key: char);
var
  Len,
  i,
  IntLen,
  DecLen:Integer;
begin
  inherited;

  if (FLeaveReturn) and (Key = Char(VK_RETURN)) then
  begin
    SendMessage(GetParentForm(Self).Handle,WM_NEXTDLGCTL,0,0);
    Key := #0;
  end
  else if (not FLeaveReturn) and (Key = Char(VK_RETURN)) then
  begin
    Abort;
  end;

  if (AutoSelect) and (SelLength = Length(Text)) and (Key in [char(VK_BACK),char(VK_RETURN)]) then
    Abort;

  Len := Length(Text);
  i := Ansipos('.',Text);
  //�����_�Ȃ��̏ꍇ
  if i = 0 then
  begin
    intlen := Len;
    //DecLen := 0;
    DecLen := -1;
  end
  else
  begin
    intlen := i - 1;
    declen := len - i;
  end;

  // '-' �͌����ɓ���Ȃ�
  if (AnsiPos('-',Text) <> 0) or ((Key = '-') and (SelStart = 0)) then
    Dec(intlen);

  //�����݂̂̏ꍇ
  if (FIntLen > 0) and (FDecLen = 0) then
  begin
    if intlen >= FIntLen then
    begin
      if not (Key in [char(VK_BACK),char(VK_RETURN)]) then
      begin
        Key := #0;
        Exit;
      end;
    end;
  end
  //�����{�����̏ꍇ
  else if (FIntLen > 0) and (FDecLen > 0) then
  begin
    //�������͒�
    if (SelStart < i) or (i = 0) then
    begin
      //����
      if intlen >= FIntLen then
      begin
        if (not (Key in [Char(VK_BACK),Char(VK_RETURN),Char('.')]))
         or ((Key = Char('.')) and (((intlen = FIntLen) and (SelStart < FIntLen))
         or (Length(Copy(Text,1,SelStart)) > FIntLen))
         or ((intlen < FIntLen) and (Length(Copy(Text,SelStart,Len)) > FDecLen))
         or ((intlen > FIntLen) and (Length(Copy(Text,SelStart+1,Len)) > FDecLen))) then
        begin
          Key := #0;
          Exit;
        end
      end;
    end
    else if SelStart > i then
    begin
      //����������̏ꍇ
      if DecLen >= FDecLen then
      begin
        if not (Key in [char(VK_BACK),char(VK_RETURN)]) then
        begin
          Key := #0;
          Exit;
        end;
      end;
    end;
  end;
end;

//--------------------------------------------------------------------------------------
//WMSetText
//--------------------------------------------------------------------------------------
procedure TNumEdit.WMSetText(var msg:TWMSetText);
begin
  inherited;

  if (FEffectMinusColor) and (Text[1] = '-') then
  begin
    Font.Color := FMinusFont.Color;
  end
  else
    Font.Color := FSaveFontColor;

  if (not Focused) and (FComma) and (Text <> '') {2003/02/10 : and (pos(',',Text) = 0)} then
    Text := TxtEncode(Text);


  msg.Result := 0;
end;

//--------------------------------------------------------------------------------------
//�@WMChar
//--------------------------------------------------------------------------------------
procedure TNumEdit.WMChar(var Msg:TWMChar);
  function ExistChar(St:String;Ch:Char):Boolean;
  begin
    Result := pos(Ch,St) <> 0;
  end;
begin
  if not(Msg.CharCode in [Ord('0')..Ord('9'),Ord('-'),Ord('.'),VK_RETURN,VK_BACK])
      or((Msg.CharCode = Ord('-')) and ExistChar(Text,Char(Msg.CharCode)) and
      not ExistChar(SelText,Char(Msg.CharCode)))
      or((Msg.CharCode = Ord('-')) and (SelStart <> 0))
      or((Msg.CharCode = Ord('.')) and ExistChar(Text,Char(Msg.CharCode)))
      or((FDecLen = 0) and (Msg.CharCode = Ord('.')))
      or((Msg.CharCode = Ord('.')) and (SelStart = 0)) then
  begin
    MessageBeep(0);
    Msg.CharCode := 0;
  end;

  inherited;
end;

//--------------------------------------------------------------------------------------
//�@FontChanged
//--------------------------------------------------------------------------------------
procedure TNumEdit.FontChanged(Sender:TObject);
begin
  invalidate;
end;

//--------------------------------------------------------------------------------------
//  Change
//--------------------------------------------------------------------------------------
procedure TNumEdit.Change;
var
  Wk_Str :String;
begin
  {2003/02/10 :�t�H�[�J�X���L��Ƃ�(�����)�̂�Value�ɃZ�b�g}
  if not Focused  then exit ;
  Wk_Str := TextToNum(Text);

  if (Wk_Str <> '') and (Wk_Str <>  '.') and (Wk_Str <>  '-') then
    FValue := StrToFloat(Wk_Str)
  else
    FValue := 0;

  MinusText;

  inherited;
end;

//--------------------------------------------------------------------------------------
//
//--------------------------------------------------------------------------------------
procedure TNumEdit.MinusText;
begin
  if Text <> '' then
  begin
    if (FEffectMinusColor) and (Text[1] = '-') then
    begin
      Font.Color := FMinusFont.Color;
    end
    else
      Font.Color := FSaveFontColor;
  end;
end;

//--------------------------------------------------------------------------------------
//
//--------------------------------------------------------------------------------------
function TNumEdit.ChkLength(str:string):Boolean;
var
  pos:Integer;
begin
  pos := AnsiPos('-',str);

  if pos <> 0 then
    str := copy(str,pos + 1,Length(str));

  pos := AnsiPos('.',str);

  if pos = 0 then
  begin
    Result := Length(str) <= FIntLen;
    Exit;
  end
  else begin
    Result := Length(copy(str,1,pos-1)) <= FIntLen;
    Exit;
  end;
end;

//--------------------------------------------------------------------------------------
//   �l�̕\���̐��`
//--------------------------------------------------------------------------------------
function TNumEdit.TxtEncode(src: string):String;
var
  sFormat : string;
begin
(*  2003/02/10 : �\���t�H�[�}�b�g�֐��g�p�i���I�����_�����j
var
  len, pos: Integer;
  swork,sminus,sint,sdot,sdec: string;
begin
  Result := '';
  swork  := src;
  len := Length(swork);

   if (len > 0) and (swork[1] = '-') then
  begin
    // �}�C�i�X������ꍇ
    sminus := '-';
    swork  := Copy(swork, 2, len-1);  {bugfix. add. -1}
  end;

  swork := FloatToStr(StrToFloat(swork));

  if FComma then
  begin
    pos := AnsiPos('.', swork);
    if pos <> 0 then
    begin
      sint  := InsertComma(Copy(swork, 1, (pos - 1)));
      sdot := '.';
      sdec := Copy(swork, (pos + 1), len);
      if (sdec = '0') or (Length(sdec) = 0) then
        Result := sminus + sint
      else
        Result := sminus + sint + sdot + sdec;
    end
    else
    begin
      // �����_���Ȃ��ꍇ�A�����݂̂Ɣ��f
      Result := sminus + InsertComma(FloatToStr(StrToFloat(swork)));
    end;
  end
  else
    Result := sminus + FloatToStr(StrToFloat(swork));
*)
  if FComma then sFormat := '%.*n'     {�J���}�L��}
  else sFormat := '%.*f' ;
  try

    result := Format(sFormat,[DecLength,StrtoFloat(TextToNum(src))]);
  except
    result := Format(sFormat,[DecLength,0]);
  end;
end;

//--------------------------------------------------------------------------------------
//�@�J���}�폜
//--------------------------------------------------------------------------------------
function TNumEdit.TextToNum(Str: String): string;
var
  Wk: String;
begin
  Result := '';
  Wk := Trim(Str);

  if Wk = '' then
    Exit;

  // ','���폜����
  while Pos(',', Wk) <> 0 do
    Delete(Wk, Pos(',', Wk), 1);

  Result := Wk;
end;

//--------------------------------------------------------------------------------------
//�@�J���}�Z�b�g
//--------------------------------------------------------------------------------------
function  TNumEdit.InsertComma(const src: string): string;
var
  swork: string;
  cnt, lop, len: Integer;
begin
  Result := '';

  if src = '' then
    Exit;
  // �J���}���Z�b�g
  len := Length(src);
  swork := '';
  cnt := 0;
  for lop := len downto 1 do
  begin
    swork := swork + src[lop];

    Inc(cnt);
    if ( cnt mod 3 = 0) and ( lop <> 1 ) then
      swork := swork + ',';
  end;

  len := Length( swork );
  Result := '';
  if len > 0 then
    for lop := len downto 1 do
      Result := Result + swork[lop];
end;

//--------------------------------------------------------------------------------------
//
//--------------------------------------------------------------------------------------
procedure TNumEdit.SetValue(V:Extended);
begin
//  if (not ReadOnly or (csDesigning in ComponentState)) then begin
  {2003/02/10 : Value�Z�b�g�͏�ɗL��}
//  if (csDesigning in ComponentState) then begin
    FValue := V;
    {2003/02/10 : �\���e�L�X�g�̔��f}
    Text := TxtEncode(Floattostr(V));
//  end;
end;

//--------------------------------------------------------------------------------------
//
//--------------------------------------------------------------------------------------
procedure TNumEdit.SetIntlen(V:Integer);
begin
  if FIntLen <> V then
  begin
    if V <= 0 then
      V := 1;
    if V > 15 then
      V := 15;
    FIntLen := V;

    if FIntLen = 15 then
      FDecLen := 0
    else if FIntLen + FDecLen > 15 then
      FDecLen := 15 - FIntLen;
  end;
end;

//--------------------------------------------------------------------------------------
//
//--------------------------------------------------------------------------------------
procedure TNumEdit.SetDeclen(V:Integer);
begin
  if FDecLen <> V then
  begin
    if V < 0 then
      V := 0;
    if V > 14 then
      V := 14;
    FDecLen := V;

    if FDecLen = 14 then
      FIntLen := 1
    else if FIntLen + FDecLen > 15 then
      FIntLen := 15 - FDecLen;
  end;
end;

//--------------------------------------------------------------------------------------
//
//--------------------------------------------------------------------------------------
procedure TNumEdit.SetComma(V:Boolean);
begin
  if FComma <> V then
    FComma := V;
end;

//--------------------------------------------------------------------------------------
//
//--------------------------------------------------------------------------------------
procedure TNumEdit.SetLeaveReturn(V:Boolean);
begin
  if FLeaveReturn <> V then
    FLeaveReturn := V;
end;

//--------------------------------------------------------------------------------------
//
//--------------------------------------------------------------------------------------
procedure TNumEdit.SetAlignment(V:TAlignment);
begin
  if FAlignment <> V then
  begin
    FAlignment := V;
    RecreateWnd;
  end;
end;

//--------------------------------------------------------------------------------------
//
//--------------------------------------------------------------------------------------
procedure TNumEdit.SetEffectFocusColor(V:Boolean);
begin
  if FEffectFocusColor <> V then
  begin
    FEffectFocusColor := V;

    if not FEffectFocusColor then
      Color := FNormalColor;
  end;
end;

//--------------------------------------------------------------------------------------
//
//--------------------------------------------------------------------------------------
procedure TNumEdit.SetFocusColor(V:TColor);
begin
  if FFocusColor <> V then
    FFocusColor := V;
end;

//--------------------------------------------------------------------------------------
//
//--------------------------------------------------------------------------------------
procedure TNumEdit.SetDisableColor(V:TColor);
begin
  if FDisableColor <> V then
  begin
    FDisableColor := V;

    if not Enabled then
      Color := V;
  end;
end;

//--------------------------------------------------------------------------------------
//
//--------------------------------------------------------------------------------------
procedure TNumEdit.SetNormalColor(V:TColor);
begin
  if FNormalColor <> V then
  begin
    FNormalColor := V;

    if Enabled then
      Color := V;
  end;
end;

//--------------------------------------------------------------------------------------
//
//--------------------------------------------------------------------------------------
procedure TNumEdit.SetEffectMinusColor(V:Boolean);
begin
  if FEffectMinusColor <> V then
  begin
    FEffectMinusColor := V;

    if not FEffectMinusColor then
      FSaveFontColor := Font.Color;
  end;
end;

//--------------------------------------------------------------------------------------
//
//--------------------------------------------------------------------------------------
procedure TNumEdit.SetMinusFont(V:TFont);
begin
  FMinusFont.Assign(V);
  Invalidate;
end;


procedure Register;
begin
  RegisterComponents('Samples', [TNumEdit]);
end;

end.
