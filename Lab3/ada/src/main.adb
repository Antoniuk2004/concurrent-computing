with Ada.Text_IO; use Ada.Text_IO;
with Computing_Package; use Computing_Package;

procedure Main is
   Capacity        : Integer;
   Num_Of_Products : Integer;

begin
   Put ("Enter the storage capacity: ");
   Capacity := Integer'Value (Get_Line);

   Put ("Enter the number of products: ");
   Num_Of_Products := Integer'Value (Get_Line);

   Do_Computing(Num_Of_Products, Capacity);
end Main;
