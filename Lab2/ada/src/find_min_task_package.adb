with Ada.Text_IO;         use Ada.Text_IO;

package body Find_Min_Task_Package is
    task body Find_Min_Task is
        Min : Integer := Integer'Last;
    begin
        accept Start
           (Arr                      : in Array_Package.Array_Of_Integers;
            Lower_Bound, Upper_Bound : in Integer; M : in out Min_Element)
        do
            for I in Lower_Bound .. Upper_Bound loop
                if Arr (I) < Get_Min_Value (M) then
                    Min_Manager.Set_Min (arr (I), M);
                end if;
            end loop;
            Min_Manager.Increment;
        end Start;
    end Find_Min_Task;
end Find_Min_Task_Package;
