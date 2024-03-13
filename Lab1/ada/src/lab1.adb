with Ada.Text_IO; use Ada.Text_IO;

procedure Lab1 is

   procedure Calculator (Num_of_tasks : Integer) is
      Can_Be_Stopped : Boolean := False;
      pragma Atomic (Can_Be_Stopped);

      task type Break_Task;
      task body Break_Task is
      begin
         delay 2.0;
         Can_Be_Stopped := True;
      end Break_Task;

      task type Calc_Task is
         entry Start (Index : in Integer);
      end Calc_Task;

      task body Calc_Task is
         Local_Index : Integer;
         Sum         : Long_Long_Integer := 0;
      begin
         accept Start (Index : in Integer) do
            Local_Index := Index;
         end Start;

         Put_Line
           ("Task" & Integer'Image (Local_Index) & " started calculating..." &
            Integer'Image (Local_Index));
         while Can_Be_Stopped = False loop
            Sum := Sum + 1;
         end loop;
         Put_Line
           ("Task" & Integer'Image (Local_Index) & " Sum:" &
            Long_Long_Integer'Image (Sum));
      end Calc_Task;

      b : Break_Task;
      type Arra_Of_Tasks is array (Positive range <>) of Calc_Task;
      Tasks : Arra_Of_Tasks (1 .. Num_of_tasks);
   begin
      for I in 1 .. Num_of_tasks loop
         Tasks (I).Start (I);
      end loop;
   end Calculator;

   Number_Of_Tasks : Integer;

begin
   Put ("Enter the number of tasks: ");
   Number_Of_Tasks := Integer'Value (Get_Line);
   Calculator (Number_Of_Tasks);
end Lab1;