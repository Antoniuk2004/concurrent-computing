with Ada.Text_IO; use Ada.Text_IO;

package Manager_Package is
   Products_Per_Producer       : Integer;
   Remaining_Products_Producer : Integer;

   Products_Per_Consumer       : Integer;
   Remaining_Products_Consumer : Integer;

   Reaming_Producers : Integer;
   Reaming_Consumers : Integer;

   Is_Num_Of_Producers_More_Than_Num_Of_Products : Boolean;
   Is_Num_Of_Consumers_More_Than_Num_Of_Products : Boolean;

   Extra_Products_For_Producers : Integer;
   Extra_Products_For_Consumers : Integer;

   procedure Create_Manager
     (Number_Of_Products  : in out Integer;
      Number_Of_Producers : in out Integer;
      Number_Of_Consumers : in out Integer);

   function Calc_Num_Of_Products_To_Produce (step : in Integer) return Integer;

   function Calc_Num_Of_Products_To_Consume (step : in Integer) return Integer;

   function Check_If_Done return Boolean;
end Manager_Package;
