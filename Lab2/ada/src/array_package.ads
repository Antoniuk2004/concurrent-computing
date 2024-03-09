package Array_Package is
   type Array_Of_Integers is array (Positive range <>) of Integer;

    function Initialize_Array
       (Number_Of_Elements : Integer) return Array_Of_Integers;
end Array_Package;
