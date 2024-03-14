with Ada.Text_IO; use Ada.Text_IO;

package body Find_Min_Task_Package is
    task body Find_Min_Task is
    begin
        accept Start
           (Lower_Bound, Upper_Bound : in out Integer; M : in out Min_Element)
        do
            for I in Lower_Bound .. Upper_Bound loop
                if Arr (I) < Get_Min_Value (M) then
                    Min_Manager.Set_Min (Arr (I), M, I);
                end if;
            end loop;
            Min_Manager.Increment;
        end Start;
    end Find_Min_Task;
end Find_Min_Task_Package;
