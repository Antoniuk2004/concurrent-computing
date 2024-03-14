package Min_Element_Package is
   type Min_Element is private;

   procedure Initialize_Element (Element : in out Min_Element);
   function Get_Min_Value (Element : in out Min_Element) return Integer;
   function Get_Index (Element : in out Min_Element) return Integer;
   procedure Set_Min_Value
     (Element      : in out Min_Element; Min_V : in out Integer;
      Index_Of_Arr :        Integer);

private
   type Min_Element is record
      Min_Value : Integer;
      Index     : Integer;
   end record;

end Min_Element_Package;
