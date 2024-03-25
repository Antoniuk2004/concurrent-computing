with GNAT.Semaphores;                               use GNAT.Semaphores;
with Ada.Containers.Indefinite_Doubly_Linked_Lists; use Ada.Containers;
with Manager_Package;                               use Manager_Package;

package body Computing_Package is
    procedure Do_Computing
       (Capacity : in out Integer; Number_Of_Products : in out Integer;
        Number_Of_Producers : in out Integer;
        Number_Of_Consumers : in out Integer)
    is
        package String_Lists is new Indefinite_Doubly_Linked_Lists (String);
        use String_Lists;

        Storage : List;

        Access_Semaphone : Counting_Semaphore (1, Default_Ceiling);
        Full_Semaphone   : Counting_Semaphore (Capacity, Default_Ceiling);
        Empty_Semaphone  : Counting_Semaphore (0, Default_Ceiling);

        task type Producer_Task is
            entry Start (Step : in Integer);
        end Producer_Task;
        task body Producer_Task is
            Num_Of_Iterations : Integer;
            Id                : Integer;
        begin
            accept Start (Step : in Integer) do
                Id := Step;
            end Start;

            Num_Of_Iterations := Calc_Num_Of_Products_To_Produce (Id);
            Put_Line (Integer'Image (Num_Of_Iterations));

            if Num_Of_Iterations > 0 then
                for I in 1 .. Num_Of_Iterations loop
                    Full_Semaphone.Seize;
                    Access_Semaphone.Seize;

                    --  Put_Line
                    --     ("Proudct with id" & Integer'Image (Id) & " was added");
                    Storage.Append ("Product with id" & Integer'Image (Id));

                    Access_Semaphone.Release;
                    Empty_Semaphone.Release;
                end loop;
            end if;

        end Producer_Task;

        task type Consumer_Task is
            entry Start (Step : in Integer);
        end Consumer_Task;
        task body Consumer_Task is
            Id                : Integer;
            Num_Of_Iterations : Integer;
        begin
            accept Start (Step : in Integer) do
                Id                := Step;
                Num_Of_Iterations := Calc_Num_Of_Products_To_Produce (Step);
            end Start;

            if Num_Of_Iterations > 0 then
                for I in 1 .. Num_Of_Iterations loop
                    Empty_Semaphone.Seize;
                    Access_Semaphone.Seize;

                    --  Put_Line (First_Element (Storage) & " was taken");
                    Storage.Delete_First;

                    Access_Semaphone.Release;
                    Full_Semaphone.Release;
                end loop;
            end if;

        end Consumer_Task;

        type Arr_Of_Producers is
           array (1 .. Number_Of_Producers) of Producer_Task;
        type Arr_Of_Consumers is
           array (1 .. Number_Of_Consumers) of Consumer_Task;

        Producers : Arr_Of_Producers;
        Consumers : Arr_Of_Consumers;

        Step : Integer := 0;
    begin
        Create_Manager
           (Number_Of_Products, Number_Of_Producers, Number_Of_Consumers);

        while Step < Number_Of_Producers or Step < Number_Of_Consumers loop
            if Step < Number_Of_Producers then
                Producers (Step + 1).Start (Step);
            end if;

            if Step < Number_Of_Consumers then
                Consumers (Step + 1).Start (Step);
            end if;

            Step := Step + 1;
        end loop;
    end Do_Computing;
end Computing_Package;
