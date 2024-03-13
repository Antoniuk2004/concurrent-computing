with Array_Package;

package One_Thread_Computing is
   procedure Find_Min
     (Num_Of_Threads :     Integer; Arr : Array_Package.Array_Of_Integers;
      Min_Value      : out Integer; Index : out Integer);
end One_Thread_Computing;
