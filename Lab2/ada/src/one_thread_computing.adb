package body One_Thread_Computing is
   procedure Find_Min
     (Arr : Array_Package.Array_Of_Integers;
      Min_Value      : out Integer; Index : out Integer)
   is
   begin
      for I in Arr'Range loop
         if Arr (I) < Min_Value then
            Min_Value := Arr (I);
            Index     := I;
         end if;
      end loop;
   end Find_Min;
end One_Thread_Computing;