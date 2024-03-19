with GNAT.Semaphores; use GNAT.Semaphores;
with Ada.Containers.Indefinite_Doubly_Linked_Lists; use Ada.Containers;

package body Computing_Package is
    procedure Do_Computing
       (Num_Of_Products : in out Integer; Capacity : in out Integer)
    is
        package String_Lists is new Indefinite_Doubly_Linked_Lists (String);
        use String_Lists;

        Storage : List;

        Access_Semaphone : Counting_Semaphore (1, Default_Ceiling);
        Full_Semaphone   : Counting_Semaphore (Capacity, Default_Ceiling);
        Empty_Semaphone  : Counting_Semaphore (0, Default_Ceiling);

        task type Producer_Task is
            entry Start (Num_Of_Products : in out Integer);
        end Producer_Task;
        task body Producer_Task is
            Num : Integer;
        begin
            accept Start (Num_Of_Products : in out Integer) do
                Producer_Task.Num := Num_Of_Products;
            end Start;

            for I in 1 .. Num loop
                Full_Semaphone.Seize;
                Access_Semaphone.Seize;

                Put_Line("Proudct with id" & Integer'Image(I) & " was added");
                Storage.Append("Product with id" & Integer'Image(I));

                Access_Semaphone.Release;
                Empty_Semaphone.Release;
            end loop;
        end Producer_Task;

        task type Consumer_Task is
            entry Start (Num_Of_Products : in out Integer);
        end Consumer_Task;
        task body Consumer_Task is
            Num : Integer;
        begin
            accept Start (Num_Of_Products : in out Integer) do
                Consumer_Task.Num := Num_Of_Products;
            end Start;

            for I in 1 .. Num loop
                Empty_Semaphone.Seize;
                Access_Semaphone.Seize;

                Put_Line(First_Element(Storage) & " was taken");
                Storage.Delete_First;

                Access_Semaphone.Release;
                Full_Semaphone.Release;
            end loop;
        end Consumer_Task;

        Producer : Producer_Task;
        Consumer : Consumer_Task;
    begin
        Producer.Start (Num_Of_Products);
        Consumer.Start (Num_Of_Products);
    end Do_Computing;
end Computing_Package;