with Ada.Text_IO;     use Ada.Text_IO;
with GNAT.Semaphores; use GNAT.Semaphores;

procedure Main is
   Num_Of_Philosophers : Integer;

   procedure Do_Computing (Num_Of_Philosophers : in out Integer) is

      function Format_Index (Index : in out Integer) return Integer is
      begin
         if Index > Num_Of_Philosophers then
            return 1;
         else
            return Index;
         end if;
      end Format_Index;

      type Arr_Of_Forks is
        array
          (1 ..
               Num_Of_Philosophers) of Binary_Semaphore
          (True, Default_Ceiling);
      Forks : Arr_Of_Forks;

      task type Philisopher_Task is
         entry Start
           (Id           : in Integer; Right_Fork_Id : in Integer;
            Left_Fork_Id : in Integer);
      end Philisopher_Task;
      task body Philisopher_Task is
         Id            : Integer;
         Right_Fork_Id : Integer;
         Left_Fork_Id  : Integer;
      begin
         accept Start
           (Id           : in Integer; Right_Fork_Id : in Integer;
            Left_Fork_Id : in Integer)
         do
            Philisopher_Task.Id            := Id;
            Philisopher_Task.Right_Fork_Id := Right_Fork_Id;
            Philisopher_Task.Left_Fork_Id  := Left_Fork_Id;
         end Start;

         Put_Line
           ("Philosopher with id" & Integer'Image (Id) & " is thinking.");
         Forks (Format_Index (Right_Fork_Id)).Seize;
         Forks (Format_Index (Left_Fork_Id)).Seize;
         Put_Line
           ("Philosopher with id" & Integer'Image (Id) & " started eating.");
         Forks (Format_Index (Right_Fork_Id)).Release;
         Forks (Format_Index (Left_Fork_Id)).Release;
         Put_Line
           ("Philosopher with id" & Integer'Image (Id) & " finished eating.");
      end Philisopher_Task;

      type Arr_Of_Philisophers is
        array (1 .. Num_Of_Philosophers) of Philisopher_Task;

      Philosophers : Arr_Of_Philisophers;
   begin
      for I in 1 .. Num_Of_Philosophers loop
         if I mod 2 = 0 then
            Philosophers (I).Start (I, I, I + 1);
         else
            Philosophers (I).Start (I, I + 1, I);
         end if;

      end loop;
   end Do_Computing;

begin
   Put ("Enter the number of philosophers: ");
   Num_Of_Philosophers := Integer'Value (Get_Line);

   Do_Computing (Num_Of_Philosophers);
end Main;
