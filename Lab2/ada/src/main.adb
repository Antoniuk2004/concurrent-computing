with Ada.Text_IO;   use Ada.Text_IO;
with Array_Package; use Array_Package;
with Program;       use Program;

procedure Main is
   Num_Of_Tasks : Integer;

begin
   Put ("Input the number of threads: ");
   Num_Of_Tasks := Integer'Value (Get_Line);

   Initialize_Array;

   Compute_With_Tasks (Num_Of_Tasks);
   Compute_Without_Tasks;
end Main;
