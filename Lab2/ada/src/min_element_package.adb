-- Min_Element_Package.adb (Package Body)
package body Min_Element_Package is
    procedure Initialize_Element (Element : in out Min_Element) is
    begin
        Element.Min_Value := Integer'Last;
    end Initialize_Element;

    function Get_Min_Value (Element : Min_Element) return Integer is
    begin
        return Element.Min_Value;
    end Get_Min_Value;

    procedure Set_Min_Value (Element : in out Min_Element; Min_V : Integer) is
    begin
        Element.Min_Value := Min_V;
    end Set_Min_Value;

end Min_Element_Package;
