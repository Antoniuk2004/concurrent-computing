package body Min_Element_Package is
    protected body Min_Element is
        procedure Set_Min(Value: in Integer) is
        begin
            Min_Value := Value;
        end Set_Min;

        function Get_Min return Integer is
        begin
            return Min_Value;
        end Get_Min;
    end Min_Element;
end Min_Element_Package;