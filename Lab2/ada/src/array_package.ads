package Array_Package is
   type Array_Of_Integers is array (Positive range <>) of Integer;

   Arr : Array_Of_Integers (1 .. 1_000_000);

   procedure Initialize_Array;
end Array_Package;
