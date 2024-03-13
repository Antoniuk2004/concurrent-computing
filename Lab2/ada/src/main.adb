with Ada.Text_IO; use Ada.Text_IO;
with Array_Package;
with Program;     use Program;

procedure Main is
   Num_Of_Arr_Elements : constant Integer := 1_000_000;
   Num_Of_Tasks        : Integer;
   Arr : Array_Package.Array_Of_Integers (1 .. Num_Of_Arr_Elements);
begin

   Put ("Input the number of threads: ");
   Num_Of_Tasks := Integer'Value (Get_Line);

   Arr := Array_Package.Initialize_Array (Num_Of_Arr_Elements);

   Do_Computing (Num_Of_Tasks, Arr);
end Main;
