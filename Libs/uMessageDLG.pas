unit uMessageDLG;

interface
 uses  System.TypInfo,System.UITypes,dialogs,Vcl.StdCtrls;
 const
    BotonesCaption: array[TMsgDlgBtn] of String = (
    'Sí', 'No', 'Aceptar', 'Cancelar', 'Abortar', 'Reintentar', 'Ignorar', 'Todos', 'No a Todo',
    'Sí a Todo', 'Ayuda', 'Cerrar');
    function StrToMsgBtn(aStr:String):TMsgDlgBtn;
function MensajeDLG(const Msg: string; DLGCaption: string; DlgType: TMsgDlgType;
    Buttons: TMsgDlgButtons): Integer;
implementation
   function StrToMsgBtn(aStr:String):TMsgDlgBtn;
begin
  result := TMsgDlgBtn(GetEnumValue(TypeInfo(TMsgDlgBtn),aStr));
end;

function MensajeDLG(const Msg: string; DLGCaption: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons): Integer;
var
  i: Integer;
  dlgButton: TButton;
  CaptionIndex: TMsgDlgBtn;
begin
  with CreateMessageDialog(Msg, DlgType, Buttons) do begin
    Caption := DLGCaption;
    for i := 0 to ControlCount - 1 do
    begin
      if (Components[i] is TButton) then
      begin
        dlgButton := TButton(Components[i]);
        CaptionIndex := StrToMsgBtn('mb'+dlgButton.Name);
        dlgButton.Caption := BotonesCaption[CaptionIndex];
      end;
    end;
  Result := ShowModal;
  end;
end;

end.

