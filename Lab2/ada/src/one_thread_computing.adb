package body One_Thread_Computing is
   procedure Find_Min (Min_Value : in out Integer; Index : in out Integer) is
   begin
      for I in Arr'Range loop
         if Arr (I) < Min_Value then
            Min_Value := Arr (I);
            Index     := I;
         end if;
      end loop;
   end Find_Min;
end One_Thread_Computing;
