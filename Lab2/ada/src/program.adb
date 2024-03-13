package body Program is
    procedure Do_Computing
       (Num_Of_Tasks : Integer; Arr : Array_Package.Array_Of_Integers)
    is
        Start_Time, Stop_Time : Time;
        Elapsed_Time          : Duration;

        One_Task_Range : Integer;
        Lower_Bound    : Integer;
        Upper_Bound    : Integer;

        Min_Value       : Integer;
        Min_Value_Index : Integer;
        M               : Min_Element;

        type Arr_Of_Tasks is array (1 .. Num_Of_Tasks) of Find_Min_Task;
        tasks : Arr_Of_Tasks;
    begin
        -- Min value with N Threads
        Start_Time := Clock;
        Initialize_Element (M);
        Min_Manager.Set_Num_Of_Tasks (Num_Of_Tasks);
        One_Task_Range := Arr'Length / Num_Of_Tasks;

        for I in 1 .. Num_Of_Tasks loop
            if Num_Of_Tasks = 1 then
                Lower_Bound := 1;
            else
                Lower_Bound := I * One_Task_Range;
            end if;

            if I = Num_Of_Tasks then
                Upper_Bound := Arr'Length;
            else
                Upper_Bound := Lower_Bound + One_Task_Range;
            end if;
            tasks (I).Start (Arr, Lower_Bound, Upper_Bound, M);
        end loop;

        Min_Manager.Get_Min;
        Stop_Time    := Clock;
        Elapsed_Time := Stop_Time - Start_Time;
        Put_Line ("Elapsed time: " & Duration'Image (Elapsed_Time));
        Put_Line ("Min: " & Integer'Image (Get_Min_Value (M)));
        Put_Line ("Index: " & Integer'Image (Get_Index (M)));

        -- Min value with only one Thread
        Start_Time := Clock;
        Find_Min (Num_Of_Tasks, Arr, Min_Value, Min_Value_Index);
        Stop_Time    := Clock;
        Elapsed_Time := Stop_Time - Start_Time;
        Put_Line ("");
        Put_Line ("Elapsed time: " & Duration'Image (Elapsed_Time));
        Put_Line ("Min: " & Integer'Image (Min_Value));
        Put_Line ("Index: " & Integer'Image (Min_Value_Index));
    end Do_Computing;
end Program;
