with Ada.Text_IO;       use Ada.Text_IO;
with Computing_Package; use Computing_Package;

procedure Main is
   Capacity        : Integer;
   Number_Of_Products : Integer;
   Number_Of_Producers: Integer;
   Number_Of_Consumers: Integer;

begin
   --  Put ("Enter the storage capacity: ");
   --  Capacity := Integer'Value (Get_Line);

   --  Put ("Enter the number of products: ");
   --  Number_Of_Products := Integer'Value (Get_Line);

   --  Put ("Enter the number of producers: ");
   --  Number_Of_Producers := Integer'Value (Get_Line);

   --  Put ("Enter the number of consumers: ");
   --  Number_Of_Consumers := Integer'Value (Get_Line);

   Capacity := 3;
   Number_Of_Products := 10;
   Number_Of_Producers := 123;
   Number_Of_Consumers := 34;

   Do_Computing (Capacity, Number_Of_Products, Number_Of_Producers, Number_Of_Consumers);
end Main;
