with Ada.Text_IO; use Ada.Text_IO;
with Computing_Package; use Computing_Package;
with Storage_Package; use Storage_Package;

procedure Main is
   Capacity        : Integer;
   Num_Of_Products : Integer;

begin
   Put ("Enter the storage capacity: ");
   Capacity := Integer'Value (Get_Line);

   Put ("Enter the number of products: ");
   Num_Of_Products := Integer'Value (Get_Line);

   Create_Storage(Capacity);
   Do_Computing(Num_Of_Products, Capacity);
end Main;
