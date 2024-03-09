with Array_Package;
with Min_Find_Manager; use Min_Find_Manager;
with Min_Element_Package; use Min_Element_Package;

package Find_Min_Task_Package is
    task type Find_Min_Task is
        entry Start
           (Arr                      : in Array_Package.Array_Of_Integers;
            Lower_Bound, Upper_Bound : in Integer; M : in out Min_Element);
    end Find_Min_Task;
end Find_Min_Task_Package;
