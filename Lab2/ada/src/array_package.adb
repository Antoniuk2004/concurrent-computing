with Ada.Numerics.Float_Random;
with Ada.Text_IO;
with Ada.Numerics.Discrete_Random;

package body Array_Package is
    subtype Rand_Range is Natural;
    package Rand_Int is new Ada.Numerics.Discrete_Random (Rand_Range);

    gen : Rand_Int.Generator;

    function generate_random_number return Integer is
    begin
        if Rand_Int.Random (gen) mod 2 = 0 then
            return Rand_Int.Random (gen);
        else
            return Rand_Int.Random (gen) * (-1);
        end if;
    end generate_random_number;

    procedure Initialize_Array is
    begin
        Rand_Int.Reset (gen);
        for I in Arr'Range loop
            Arr (I) := generate_random_number;
        end loop;
    end Initialize_Array;
end Array_Package;
