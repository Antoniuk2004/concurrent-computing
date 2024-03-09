with Ada.Numerics.Float_Random;
with Ada.Text_IO;
with Ada.Numerics.Discrete_Random;

package body Array_Package is

    subtype Rand_Range is Natural;
    package Rand_Int is new Ada.Numerics.Discrete_Random (Rand_Range);

    gen : Rand_Int.Generator;

    function generate_random_number (n : Integer) return Integer is
    begin
        if Rand_Int.Random (gen) mod 2 = 0 then
            return Rand_Int.Random (gen) mod n;
        else
            return Rand_Int.Random (gen) mod n * (-1);
        end if;
    end generate_random_number;

    function Initialize_Array
       (Number_Of_Elements : Integer) return Array_Of_Integers
    is
        Arr : Array_Of_Integers (1 .. Number_Of_Elements);

    begin
        Rand_Int.Reset (gen);
        for I in 1 .. Number_Of_Elements loop
            Arr (I) := generate_random_number (Integer'Last);
        end loop;

        return Arr;
    end Initialize_Array;
end Array_Package;
