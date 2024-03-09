package body Min_Find_Manager is
    protected body Min_Manager is
        procedure Set_Min(Value: in Integer; M: in out Min_Element) is
        begin
           Set_Min_Value(M, Value);
        end Set_Min;

        procedure Increment is
        begin 
            Tasks_Count := Tasks_Count + 1;
        end;

        procedure Set_Num_Of_Tasks(N: in Integer) is
        begin
            Num_Of_Tasks:= N;
        end Set_Num_Of_Tasks;

        entry Get_Min(Value: out Integer) when Tasks_Count = Num_Of_Tasks is
        begin
            Value := Min_Value;
        end Get_Min;
        
    end Min_Manager;
end Min_Find_Manager;