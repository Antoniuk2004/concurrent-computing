with Ada.Containers.Indefinite_Doubly_Linked_Lists; use Ada.Containers;
with GNAT.Semaphores;                               use GNAT.Semaphores;

package Storage_Package is
    Access_Semaphone : Counting_Semaphore (1, Default_Ceiling);
    Full_Semaphone   : Counting_Semaphore (3, Default_Ceiling);
    Empty_Semaphone  : Counting_Semaphore (0, Default_Ceiling);

    procedure Create_Storage (Capacity : in out Integer);

    procedure Add_Product (Product : in out String);
end Storage_Package;
