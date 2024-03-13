package body Min_Element_Package is
    procedure Initialize_Element (Element : in out Min_Element) is
    begin
        Element.Min_Value := Integer'Last;
        Element.Index     := 0;
    end Initialize_Element;

    function Get_Min_Value (Element : Min_Element) return Integer is
    begin
        return Element.Min_Value;
    end Get_Min_Value;

    function Get_Index (Element : Min_Element) return Integer is
    begin
        return Element.Index;
    end Get_Index;

    procedure Set_Min_Value (Element : in out Min_Element; Min_V : Integer; Index_Of_Arr: Integer) is
    begin   
        Element.Min_Value := Min_V;
        Element.Index := Index_Of_Arr;
    end Set_Min_Value;
end Min_Element_Package;