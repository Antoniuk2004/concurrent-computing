with GNAT.Semaphores;                               use GNAT.Semaphores;
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
            entry Start (Index : in Integer);
        end Producer_Task;
        task body Producer_Task is
            Index : Integer;
        begin
            accept Start (Index : in Integer) do
                Producer_Task.Index := Index;
            end Start;

            Full_Semaphone.Seize;
            Access_Semaphone.Seize;

            Put_Line ("Proudct with id" & Integer'Image (Index) & " was added");
            Storage.Append ("Product with id" & Integer'Image (Index));

            Access_Semaphone.Release;
            Empty_Semaphone.Release;
        end Producer_Task;

        task type Consumer_Task is
            entry Start;
        end Consumer_Task;
        task body Consumer_Task is
        begin
            accept Start do
                null;
            end Start;

            Empty_Semaphone.Seize;
            Access_Semaphone.Seize;

            Put_Line (First_Element (Storage) & " was taken");
            Storage.Delete_First;

            Access_Semaphone.Release;
            Full_Semaphone.Release;
        end Consumer_Task;

        type Arr_Of_Producers is array (1 .. Num_Of_Products) of Producer_Task;
        type Arr_Of_Consumers is array (1 .. Num_Of_Products) of Consumer_Task;

        Producers : Arr_Of_Producers;
        Consumer  : Arr_Of_Consumers;
    begin
        for I in 1 .. Num_Of_Products loop
            Producers (I).Start (I);
            Consumer (I).Start;
        end loop;
    end Do_Computing;
end Computing_Package;
