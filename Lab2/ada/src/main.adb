with Ada.Text_IO; use Ada.Text_IO;
with My_Package;

procedure Main is
   value: Integer;
begin
   value := My_Package.Get_Value;
   Put_Line("Value" & Integer'Image(value));
end Main;
