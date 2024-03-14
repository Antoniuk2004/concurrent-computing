with Ada.Text_IO;             use Ada.Text_IO;
with One_Thread_Computing;    use One_Thread_Computing;
with Array_Package;           use Array_Package;
with Find_Min_Task_Package;   use Find_Min_Task_Package;
with Min_Find_Manager;        use Min_Find_Manager;
with Min_Element_Package;     use Min_Element_Package;
with Ada.Calendar;            use Ada.Calendar;
with Ada.Calendar.Formatting; use Ada.Calendar.Formatting;

package Program is
    procedure Compute_With_Tasks (Num_Of_Tasks : in out Integer);
    procedure Compute_Without_Tasks;
end Program;
