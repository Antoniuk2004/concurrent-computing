package body Min_Find_Manager is
    protected body Min_Manager is
        procedure Set_Min
           (Value : in Integer; M : in out Min_Element; Index : in Integer)
        is
        begin
            Set_Min_Value (M, Value, Index);
        end Set_Min;

        procedure Increment is
        begin
            Tasks_Count := Tasks_Count + 1;
        end Increment;

        procedure Set_Num_Of_Tasks (N : in Integer) is
        begin
            Num_Of_Tasks := N;
        end Set_Num_Of_Tasks;

        entry Get_Min when Tasks_Count = Num_Of_Tasks is
        begin
            null;
        end Get_Min;

    end Min_Manager;
end Min_Find_Manager;
