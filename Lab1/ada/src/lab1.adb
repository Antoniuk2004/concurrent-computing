with Ada.Text_IO; use Ada.Text_IO;

procedure Lab1 is
   can_be_stopped : Boolean := False;
   pragma Atomic (can_be_stopped);

   task type Breaker;
   task body Breaker is
   begin
      delay 2.0;
      can_be_stopped := True;
   end Breaker;

   task type Calculator (Index : Integer);
   task body Calculator is
      sum : Long_Long_Integer := 0;
   begin
      Put_Line ("Task" & Integer'Image (Index) & " started calculating...");
      while can_be_stopped = False loop
         sum := sum + 1;
      end loop;
      Put_Line
        ("Task" & Integer'Image (Index) & " Sum:" &
         Long_Long_Integer'Image (sum));
   end Calculator;

   b  : Breaker;
   c1 : Calculator (1);
   c2 : Calculator (2);
   c3 : Calculator (3);
   c4 : Calculator (4);

begin
   null;
end Lab1;