unit plChgCompo;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, TypInfo;

function ChangeComponent(Original: TComponent; NewClass: TComponentClass):
  TComponent;

implementation

//=============================================================================
//  コンポーネントを交換する関数
//-----------------------------------------------------------------------------
//  【動作確認環境】
//
//  Delphi 2007 R-2 Pro, Delphi 2010 Pro, Delphi XE Pro
//=============================================================================
function ChangeComponent(Original: TComponent; NewClass: TComponentClass):
  TComponent;
var
  APropList   : TPropList;
  New         : TComponent;
  Stream      : TStream;
  Methods     : array of TMethod;
  MethodCount : Integer;
  i           : Integer;
begin
  MethodCount := GetPropList(Original.ClassInfo, [tkMethod], @APropList[0]);
  SetLength(Methods, MethodCount);

  for i := 0 to MethodCount - 1 do begin
    Methods[i] := GetMethodProp(Original, APropList[i]);
  end;

  Stream := TMemoryStream.Create;
  try
    Stream.WriteComponent(Original);
    New := NewClass.Create(Original.Owner);
    if New is TControl then TControl(New).Parent := TControl(Original).Parent;
    Original.Free;
    Stream.Position := 0;
    Stream.ReadComponent(New);
  finally
    Stream.free
  end;

  for i := 0 to MethodCount - 1 do begin
    SetMethodProp(New, APropList[i], Methods[i]);
  end;
  Result := New;
end;

end.
