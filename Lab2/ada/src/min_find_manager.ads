with Min_Element_Package; use Min_Element_Package;

package Min_Find_Manager is
    protected Min_Manager is
        procedure Set_Min (Value : in Integer; M: in out Min_Element);
        procedure Increment;
        procedure Set_Num_Of_Tasks (N : in Integer);
        entry Get_Min (Value : out Integer);
    private
        Min_Value    : Integer := 0;
        Tasks_Count  : Integer := 0;
        Num_Of_Tasks : Integer := 0;
    end Min_Manager;
end Min_Find_Manager;
