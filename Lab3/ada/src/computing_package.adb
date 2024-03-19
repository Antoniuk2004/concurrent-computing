with GNAT.Semaphores; use GNAT.Semaphores;

package body Computing_Package is
    procedure Do_Computing
       (Num_Of_Products : in out Integer; Capacity : in out Integer)
    is
        task type Producer_Task;
        task body Producer_Task is
            Access_Semaphone : Counting_Semaphore (1, Default_Ceiling);
            Full_Semaphone   : Counting_Semaphore (Capacity, Default_Ceiling);
            Empty_Semaphone  : Counting_Semaphore (0, Default_Ceiling);
        begin
            for I in 1 .. Num_Of_Products loop
                Full_Semaphone.Seize;
                Access_Semaphone.Seize;

                Put_Line ("Add");

                Access_Semaphone.Release;
                Empty_Semaphone.Release;
                delay 1.5;
            end loop;
        end Producer_Task;

        task type Consumer_Task;
        task body Consumer_Task is
        begin
            for I in 1 .. Num_Of_Products loop
                Put_Line ("x1");
                Empty_Semaphone.Seize;
                Access_Semaphone.Seize;

                Put_Line ("Took");

                Access_Semaphone.Release;
                Full_Semaphone.Release;

                delay 2.0;
            end loop;
        end Consumer_Task;

        Producer : Producer_Task;
        Consumer : Consumer_Task;
    begin
        null;
    end Do_Computing;
end Computing_Package;
