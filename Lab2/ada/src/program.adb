package body Program is
    procedure Compute_With_Tasks
       (Num_Of_Tasks : Integer; Arr : Array_Package.Array_Of_Integers)
    is
        Start_Time, Stop_Time : Time;
        Elapsed_Time          : Duration;

        One_Task_Range, Upper_Bound, Min_Value, Min_Value_Index : Integer;
        Lower_Bound                                             : Integer := 1;
        M                                                       : Min_Element;

        type Arr_Of_Tasks is array (1 .. Num_Of_Tasks) of Find_Min_Task;
        tasks : Arr_Of_Tasks;
    begin
        Start_Time := Clock;
        Initialize_Element (M);
        Min_Manager.Set_Num_Of_Tasks (Num_Of_Tasks);
        One_Task_Range := Arr'Length / Num_Of_Tasks;

        for I in 1 .. Num_Of_Tasks loop
            if Num_Of_Tasks /= 1 and I /= 1 then
                Lower_Bound := (I - 1) * One_Task_Range;
            end if;

            if I = Num_Of_Tasks then
                Upper_Bound := Arr'Length;
            elsif I = 1 then
                Upper_Bound := One_Task_Range;
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
    end Compute_With_Tasks;

    procedure Compute_Without_Tasks (Arr : Array_Package.Array_Of_Integers) is
        Start_Time, Stop_Time : Time;
        Elapsed_Time          : Duration;

        Min_Value, Min_Value_Index : Integer;
    begin
        Start_Time := Clock;
        Find_Min (Arr, Min_Value, Min_Value_Index);
        Stop_Time    := Clock;
        Elapsed_Time := Stop_Time - Start_Time;
        Put_Line ("");
        Put_Line ("Elapsed time: " & Duration'Image (Elapsed_Time));
        Put_Line ("Min: " & Integer'Image (Min_Value));
        Put_Line ("Index: " & Integer'Image (Min_Value_Index));

    end Compute_Without_Tasks;
end Program;
