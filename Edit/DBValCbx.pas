{********1*********2*********3*********4*********5*********6*********7*********
 *                                                                            *
 *  Unit Name    :  DBValCbx.pas                                              *
 *                                                                            *
 *  Description  :  DBValComboBox Component for Borland Delphi3.              *
 *                                                                            *
 *============================================================================*
 *  Rev.No           Date        Author         Purpose                       *
 *----------------------------------------------------------------------------*
 *    00          02/09/1998    T.Kosaka        New Create.(Ver 0.5)          *
 *                                                                            *
 ********1*********2*********3*********4*********5*********6*********7********}

unit DBValCbx;

//{$R-}

interface

uses Windows, SysUtils, Messages, Classes, Controls, Forms,
     Graphics, Menus, StdCtrls, ExtCtrls, Mask, Buttons, ComCtrls, Db, DBCtrls;

type

{ TDBValComboBox }

  TDBValComboBox = class(TCustomComboBox)
  private
    FDataLink: TFieldDataLink;
    FValue: string;  { Rev.00 Add }
    FValues: TStrings;  { Rev.00 Add }
    FInSetValue: Boolean;  { Rev.00 Add }
    FPaintControl: TPaintControl;
    procedure DataChange(Sender: TObject);
    procedure EditingChange(Sender: TObject);
{ Rev.00 Start }
{ *****
    function GetComboText: string;
***** }
    function GetComboText(Index: Integer): string;
{ Rev.00 End }
    function GetDataField: string;
    function GetDataSource: TDataSource;
    function GetField: TField;
    function GetReadOnly: Boolean;
    procedure SetComboText(const Value: string);
    procedure SetDataField(const Value: string);
    procedure SetDataSource(Value: TDataSource);
    procedure SetEditReadOnly;
    procedure SetItems(Value: TStrings);
    procedure SetValues(Value: TStrings);  { Rev.00 Add }
    procedure SetReadOnly(Value: Boolean);
    procedure UpdateData(Sender: TObject);
    procedure CMEnter(var Message: TCMEnter); message CM_ENTER;
    procedure CMExit(var Message: TCMExit); message CM_EXIT;
    procedure CMGetDataLink(var Message: TMessage); message CM_GETDATALINK;
    procedure WMPaint(var Message: TWMPaint); message WM_PAINT;
  protected
    procedure Change; override;
    procedure Click; override;
    procedure ComboWndProc(var Message: TMessage; ComboWnd: HWnd;
      ComboProc: Pointer); override;
    procedure CreateWnd; override;
    procedure DropDown; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPressCombo(var Key: Char);  { Rev.00 Add }
    procedure KeyPress(var Key: Char); override;
    procedure Loaded; override;
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
    procedure SetStyle(Value: TComboboxStyle); override;
    procedure WndProc(var Message: TMessage); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Field: TField read GetField;
    property Text;
    property Value: string read FValue write SetComboText;  { Rev.00 Add }
  published
{ Rev.00 Start }
//    property Style; {Must be published before Items}
{ Rev.00 End }
    property Color;
    property Ctl3D;
    property DataField: string read GetDataField write SetDataField;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property DragMode;
    property DragCursor;
    property DropDownCount;
    property Enabled;
    property Font;
    property ImeMode;
    property ImeName;
    property ItemHeight;
    property Items write SetItems;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ReadOnly: Boolean read GetReadOnly write SetReadOnly default False;
    property ShowHint;
    property Sorted;
    property TabOrder;
    property TabStop;
    property Values: TStrings read FValues write SetValues;  { Rev.00 Add }
    property Visible;
    property OnChange;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnDrawItem;
    property OnDropDown;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMeasureItem;
    property OnStartDrag;
  end;

procedure Register;

implementation

uses Clipbrd, DBConsts, Dialogs;

//{$R DBCTRLS}

{ TDBValComboBox }

constructor TDBValComboBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{ Rev.00 Start }
//  ControlStyle := ControlStyle + [csReplicatable];
  Style := csDropDownList;
{ Rev.00 End }
  FDataLink := TFieldDataLink.Create;
  FDataLink.Control := Self;
  FDataLink.OnDataChange := DataChange;
  FDataLink.OnUpdateData := UpdateData;
  FDataLink.OnEditingChange := EditingChange;
  FPaintControl := TPaintControl.Create(Self, 'COMBOBOX');
{ Rev.00 Start }
  FValues := TStringList.Create;
{ Rev.00 End }
end;

destructor TDBValComboBox.Destroy;
begin
  FPaintControl.Free;
  FDataLink.Free;
  FDataLink := nil;
{ Rev.00 Start }
  FValues.Free;
{ Rev.00 End }
  inherited Destroy;
end;

procedure TDBValComboBox.Loaded;
begin
  inherited Loaded;
  if (csDesigning in ComponentState) then DataChange(Self);
end;

procedure TDBValComboBox.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (FDataLink <> nil) and
    (AComponent = DataSource) then DataSource := nil;
end;

procedure TDBValComboBox.CreateWnd;
begin
  inherited CreateWnd;
  SetEditReadOnly;
end;

procedure TDBValComboBox.DataChange(Sender: TObject);
begin
  if DroppedDown then Exit;
  if FDataLink.Field <> nil then
    SetComboText(FDataLink.Field.Text)
  else
    if csDesigning in ComponentState then
      SetComboText(Name)
    else
      SetComboText('');
end;

procedure TDBValComboBox.UpdateData(Sender: TObject);
begin
{ Rev.00 Start }
{ *****
  FDataLink.Field.Text := GetComboText;
***** }
  if (FDataLink.Field <> nil) and (ItemIndex >= 0) then begin
    FDataLink.Field.Text := GetComboText(ItemIndex);
  end;
{ Rev.00 End }
end;

{ Rev.00 Start }
{ *****
function TDBValComboBox.GetComboText: string;
var
  I: Integer;
***** }
function TDBValComboBox.GetComboText(Index: Integer): string;
{ Rev.00 End }
begin
  if Style in [csDropDown, csSimple] then Result := Text else
  begin
{ Rev.00 Start }
{ *****
    I := ItemIndex;
    if I < 0 then Result := '' else Result := Items[I];
***** }
    if (Index < FValues.Count) and (FValues[Index] <> '') then
      Result := FValues[Index]
    else if Index < Items.Count then
      Result := Items[Index]
    else
      Result := '';
{ Rev.00 End }
  end;
end;

procedure TDBValComboBox.SetComboText(const Value: string);
var
  I: Integer;
  Index: Integer;  { Rev.00 Add }
//  Redraw: Boolean;
begin
{ Rev.00 Start }
{ *****
  if Value <> GetComboText then
  begin
    if Style <> csDropDown then
    begin
      Redraw := (Style <> csSimple) and HandleAllocated;
      if Redraw then SendMessage(Handle, WM_SETREDRAW, 0, 0);
      try
        if Value = '' then I := -1 else I := Items.IndexOf(Value);
        ItemIndex := I;
      finally
        if Redraw then
        begin
          SendMessage(Handle, WM_SETREDRAW, 1, 0);
          Invalidate;
        end;
      end;
      if I >= 0 then Exit;
    end;
    if Style in [csDropDown, csSimple] then Text := Value;
  end;
***** }
  if FValue <> Value then
  begin
    FInSetValue := True;
    try
      Index := -1;
      for I := 0 to Items.Count - 1 do
        if Value = GetComboText(I) then
        begin
          Index := I;
          Break;
        end;
      ItemIndex := Index;
    finally
      FInSetValue := False;
    end;
    FValue := Value;
  end;
{ Rev.00 End }
end;

procedure TDBValComboBox.Change;
begin
{ Rev.00 Start }
{ *****
  FDataLink.Edit;
  inherited Change;
  FDataLink.Modified;
***** }
{ Rev.00 End }
  if not FInSetValue then begin
    inherited Change;
    if ItemIndex >= 0 then Value := GetComboText(ItemIndex);
    FDataLink.Modified;
  end;
end;

procedure TDBValComboBox.Click;
begin
  FDataLink.Edit;
  inherited Click;
  FDataLink.Modified;
end;

procedure TDBValComboBox.DropDown;
begin
  inherited DropDown;
end;

function TDBValComboBox.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

procedure TDBValComboBox.SetDataSource(Value: TDataSource);
begin
  FDataLink.DataSource := Value;
  if Value <> nil then Value.FreeNotification(Self);
end;

function TDBValComboBox.GetDataField: string;
begin
  Result := FDataLink.FieldName;
end;

procedure TDBValComboBox.SetDataField(const Value: string);
begin
  FDataLink.FieldName := Value;
end;

function TDBValComboBox.GetReadOnly: Boolean;
begin
  Result := FDataLink.ReadOnly;
end;

procedure TDBValComboBox.SetReadOnly(Value: Boolean);
begin
  FDataLink.ReadOnly := Value;
end;

function TDBValComboBox.GetField: TField;
begin
  Result := FDataLink.Field;
end;

procedure TDBValComboBox.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited KeyDown(Key, Shift);
  if Key in [VK_BACK, VK_DELETE, VK_UP, VK_DOWN, 32..255] then
  begin
    if not FDataLink.Edit and (Key in [VK_UP, VK_DOWN]) then
      Key := 0;
  end;
end;

{ Rev.00 Start(Same with TDBComboBox.KeyPress) }
procedure TDBValComboBox.KeyPressCombo(var Key: Char);
begin
  inherited KeyPress(Key);
  if (Key in [#32..#255]) and (FDataLink.Field <> nil) and
    not FDataLink.Field.IsValidChar(Key) then
  begin
    MessageBeep(0);
    Key := #0;
  end;
  case Key of
    ^H, ^V, ^X, #32..#255:
      FDataLink.Edit;
    #27:
      begin
        FDataLink.Reset;
{ Rev.00 Start }
        SetComboText(FDataLink.Field.Text);
{ Rev.00 End }
        SelectAll;
      end;
  end;
end;
{ Rev.00 End }

procedure TDBValComboBox.KeyPress(var Key: Char);
var
  ValidChars_Org: TFieldChars;
begin
{ Rev.00 Start }
  ValidChars_Org := FDataLink.Field.ValidChars;

  if (Key in [#32..#255]) and (FDataLink.Field <> nil) then begin
    if (Style in [csDropDownList, csOwnerDrawFixed, csOwnerDrawVariable]) and
       (FDataLink.Field.DataType in [ftInteger, ftSmallInt]) then begin
      FDataLink.Field.ValidChars := [#32..#255];
    end;
  end;

  try
    KeyPressCombo(Key);
  finally
    FDataLink.Field.ValidChars := ValidChars_Org;
  end;
{ Rev.00 End }
end;

procedure TDBValComboBox.EditingChange(Sender: TObject);
begin
  SetEditReadOnly;
end;

procedure TDBValComboBox.SetEditReadOnly;
begin
  if (Style in [csDropDown, csSimple]) and HandleAllocated then
    SendMessage(EditHandle, EM_SETREADONLY, Ord(not FDataLink.Editing), 0);
end;

procedure TDBValComboBox.WndProc(var Message: TMessage);
begin
  if not (csDesigning in ComponentState) then
    case Message.Msg of
      WM_COMMAND:
        if TWMCommand(Message).NotifyCode = CBN_SELCHANGE then
          if not FDataLink.Edit then
          begin
            if Style <> csSimple then
              PostMessage(Handle, CB_SHOWDROPDOWN, 0, 0);
            Exit;
          end;
      CB_SHOWDROPDOWN:
        if Message.WParam <> 0 then FDataLink.Edit else
          if not FDataLink.Editing then DataChange(Self); {Restore text}
      WM_CREATE,
      WM_WINDOWPOSCHANGED,
      CM_FONTCHANGED:
        FPaintControl.DestroyHandle;
    end;
  inherited WndProc(Message);
end;

procedure TDBValComboBox.ComboWndProc(var Message: TMessage; ComboWnd: HWnd;
  ComboProc: Pointer);
begin
  if not (csDesigning in ComponentState) then
    case Message.Msg of
      WM_LBUTTONDOWN:
        if (Style = csSimple) and (ComboWnd <> EditHandle) then
          if not FDataLink.Edit then Exit;
    end;
  inherited ComboWndProc(Message, ComboWnd, ComboProc);
end;

procedure TDBValComboBox.CMEnter(var Message: TCMEnter);
begin
  inherited;
  if SysLocale.FarEast and FDataLink.CanModify then
    SendMessage(EditHandle, EM_SETREADONLY, Ord(False), 0);
end;

procedure TDBValComboBox.CMExit(var Message: TCMExit);
begin
  try
    FDataLink.UpdateRecord;
  except
    SelectAll;
    SetFocus;
    raise;
  end;
  inherited;
end;

procedure TDBValComboBox.WMPaint(var Message: TWMPaint);
var
  S: string;
  R: TRect;
  P: TPoint;
  Child: HWND;
begin
  if csPaintCopy in ControlState then
  begin
    if FDataLink.Field <> nil then S := FDataLink.Field.Text else S := '';
    if Style = csDropDown then
    begin
      SendMessage(FPaintControl.Handle, WM_SETTEXT, 0, Longint(PChar(S)));
      SendMessage(FPaintControl.Handle, WM_PAINT, Message.DC, 0);
      Child := GetWindow(FPaintControl.Handle, GW_CHILD);
      if Child <> 0 then
      begin
        Windows.GetClientRect(Child, R);
        Windows.MapWindowPoints(Child, FPaintControl.Handle, R.TopLeft, 2);
        GetWindowOrgEx(Message.DC, P);
        SetWindowOrgEx(Message.DC, P.X - R.Left, P.Y - R.Top, nil);
        IntersectClipRect(Message.DC, 0, 0, R.Right - R.Left, R.Bottom - R.Top);
        SendMessage(Child, WM_PAINT, Message.DC, 0);
      end;
    end else
    begin
      SendMessage(FPaintControl.Handle, CB_RESETCONTENT, 0, 0);
      if Items.IndexOf(S) <> -1 then
      begin
        SendMessage(FPaintControl.Handle, CB_ADDSTRING, 0, Longint(PChar(S)));
        SendMessage(FPaintControl.Handle, CB_SETCURSEL, 0, 0);
      end;
      SendMessage(FPaintControl.Handle, WM_PAINT, Message.DC, 0);
    end;
  end else
    inherited;
end;

procedure TDBValComboBox.SetItems(Value: TStrings);
begin
  Items.Assign(Value);
  DataChange(Self);
end;

{ Rev.00 Start }
procedure TDBValComboBox.SetValues(Value: TStrings);
begin
  FValues.Assign(Value);
  DataChange(Self);
end;
{ Rev.00 End }

procedure TDBValComboBox.SetStyle(Value: TComboboxStyle);
begin
  if (Value = csSimple) and Assigned(FDatalink) and FDatalink.DatasourceFixed then
    DatabaseError('DatabaseErr');//SNotReplicatable);
  inherited SetStyle(Value);
end;

procedure TDBValComboBox.CMGetDatalink(var Message: TMessage);
begin
  Message.Result := Integer(FDataLink);
end;

procedure Register;
begin
  RegisterComponents('Samples', [TDBValComboBox]);
end;

end.
