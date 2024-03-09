with Ada.Text_IO;             use Ada.Text_IO;
with My_Package;
with Array_Package;
with Find_Min_Task_Package;   use Find_Min_Task_Package;
with Min_Find_Manager;        use Min_Find_Manager;
with Min_Element_Package; use Min_Element_Package;
with Ada.Calendar;            use Ada.Calendar;
with Ada.Calendar.Formatting; use Ada.Calendar.Formatting;
with name.Test; use name.Test;

procedure Main is
   Start_Time, Stop_Time : Time;
   Elapsed_Time          : Duration;

   Num_Of_Arr_Elements : Integer := 1_000_000;
   Num_Of_Tasks        : Integer := 3;
   Arr : Array_Package.Array_Of_Integers (1 .. Num_Of_Arr_Elements);

   One_Task_Range : Integer;
   Lower_Bound    : Integer;
   Upper_Bound    : Integer;

   Min : Integer;
   M: Min_Element;

   type Arr_Of_Tasks is array (1 .. Num_Of_Tasks) of Find_Min_Task;
   tasks : Arr_Of_Tasks;
begin
   Init;

   Initialize_Element(M);

   --  Put ("Input the number of threads: ");
   --  Num_Of_Tasks := Integer'Value (Get_Line);

   Arr := Array_Package.Initialize_Array (Num_Of_Arr_Elements);

   Start_Time := Clock;
   Min_Manager.Set_Num_Of_Tasks (Num_Of_Tasks);
   One_Task_Range := Arr'Length / Num_Of_Tasks;

   for I in 1 .. Num_Of_Tasks loop
      Lower_Bound := I * One_Task_Range;
      if I = Num_Of_Tasks then
         Upper_Bound := Arr'Length;
      else
         Upper_Bound := Lower_Bound + One_Task_Range;
      end if;
      tasks (I).Start (Arr, Lower_Bound, Upper_Bound, M);
   end loop;

   Min_Manager.Get_Min (Min);
   Stop_Time    := Clock;
   Elapsed_Time := Stop_Time - Start_Time;
   Put_Line ("Elapsed time: " & Duration'Image (Elapsed_Time));
   Put_Line
     ("Min with" & Integer'Image (Num_Of_Tasks) & " Threads: " &
      Integer'Image (Get_Min_Value(M)));

   -- Min value with only one Thread
   Start_Time   := Clock;
   Min          := My_Package.Find_Min (Num_Of_Tasks, Arr);
   Stop_Time    := Clock;
   Elapsed_Time := Stop_Time - Start_Time;
   Put_Line ("Elapsed time: " & Duration'Image (Elapsed_Time));
   Put_Line ("Min with only one thread: " & Integer'Image (Min));

end Main;
