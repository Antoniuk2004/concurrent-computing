with Ada.Text_IO; use Ada.Text_IO;
with Manager_Package; use Manager_Package;

package Computing_Package is
    procedure Do_Computing
       (Capacity : in out Integer; Number_Of_Products : in out Integer;
        Number_Of_Producers : in out Integer;
        Number_Of_Consumers : in out Integer);

end Computing_Package;
