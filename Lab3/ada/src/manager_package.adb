package body Manager_Package is
    procedure Create_Manager
       (Number_Of_Products  : in out Integer;
        Number_Of_Producers : in out Integer;
        Number_Of_Consumers : in out Integer)
    is
    begin
        Products_Per_Producer := Number_Of_Products / Number_Of_Producers;
        Remaining_Products_Producer :=
           Number_Of_Products mod Number_Of_Producers;

        Products_Per_Consumer := Number_Of_Products / Number_Of_Consumers;
        Remaining_Products_Consumer :=
           Number_Of_Products mod Number_Of_Consumers;

        Is_Num_Of_Producers_More_Than_Num_Of_Products :=
           Number_Of_Producers <= Number_Of_Products;
        Is_Num_Of_Consumers_More_Than_Num_Of_Products :=
           Number_Of_Consumers <= Number_Of_Products;

        Reaming_Producers := Number_Of_Producers;
        Reaming_Consumers := Number_Of_Consumers;

        Extra_Products_For_Producers :=
           Number_Of_Products - Number_Of_Producers * Products_Per_Producer;
        Extra_Products_For_Consumers :=
           Number_Of_Products - Number_Of_Consumers * Products_Per_Consumer;
    end Create_Manager;

    function Calc_Num_Of_Products_To_Produce (step : in Integer) return Integer
    is
    begin
        if Reaming_Producers <= 0 then
            return 0;
        end if;

        Reaming_Producers := Reaming_Producers - 1;
        if Is_Num_Of_Producers_More_Than_Num_Of_Products then
            if step < Extra_Products_For_Producers then
                return Products_Per_Producer + 1;
            else
                return Products_Per_Producer;
            end if;
        end if;

        if Remaining_Products_Producer <= 0 then
            return Products_Per_Producer;
        end if;

        Remaining_Products_Producer := Remaining_Products_Producer - 1;

        Put_Line("It has to return 1");
        return Products_Per_Producer + 1;
    end Calc_Num_Of_Products_To_Produce;

    function Calc_Num_Of_Products_To_Consume (step : in Integer) return Integer
    is
    begin
        if Reaming_Consumers <= 0 then
            return 0;
        end if;

        Reaming_Consumers := Reaming_Consumers - 1;
        if Is_Num_Of_Consumers_More_Than_Num_Of_Products then
            if step < Extra_Products_For_Consumers then
                return Products_Per_Consumer + 1;
            else
                return Products_Per_Consumer;
            end if;
        end if;

        if Remaining_Products_Consumer > 0 then
            Remaining_Products_Consumer := Remaining_Products_Consumer - 1;
            return Products_Per_Consumer + 1;
        end if;

        return Products_Per_Consumer;
    end Calc_Num_Of_Products_To_Consume;

    function Check_If_Done return Boolean is
    begin
        return Reaming_Producers > 0 or Reaming_Consumers > 0;
    end Check_If_Done;
end Manager_Package;
