unit pretty_baby_image_list;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Menus;

type

  { Tfrm_image_list }

  Tfrm_image_list = class(TForm)
    image_strings: TListBox;
    image_list_pop: TPopupMenu;
    show_images: TMenuItem;
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure image_stringsClick(Sender: TObject);
    procedure image_stringsDblClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frm_image_list : Tfrm_image_list;

implementation

{$R *.lfm}

{ Tfrm_image_list }

uses
  pretty_baby_image ;

procedure Tfrm_image_list.image_stringsClick(Sender: TObject);
begin
end;

procedure Tfrm_image_list.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
    if Button = mbLeft then
          Tfrm_image_list( Sender ).BeginDrag( true );
end;

procedure Tfrm_image_list.image_stringsDblClick(Sender: TObject);
var
  i : integer;
  j : integer;
begin
      for i:=0 to image_strings.Items.Count - 1 do
      begin
          if image_strings.Selected[i] then
          begin
             for j := 0 to Screen.FormCount - 1 do
               begin
                 if Screen.Forms[j] is Tpretty_image_frm then
                    begin
                      if Tpretty_image_frm( Screen.Forms[j] ).Caption = image_strings.Items[i] then
                       Tpretty_image_frm( Screen.Forms[j] ).BringToFront;
                    end;
               end;
          end;
      end;
end;

end.

