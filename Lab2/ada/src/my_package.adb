package body My_Package is

   function Find_Min
     (Num_Of_Threads : Integer; Arr : Array_Package.Array_Of_Integers)
      return Integer
   is
      Min_Value : Integer := Integer'Last;

   begin
      for I in Arr'Range loop
         if Arr (I) < Min_Value then
            Min_Value := Arr (I);
         end if;
      end loop;

      return Min_Value;
   end Find_Min;

end My_Package;
