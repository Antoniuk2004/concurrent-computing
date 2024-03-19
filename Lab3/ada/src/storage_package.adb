package body Storage_Package is
    procedure Create_Storage (Capacity : in out Integer) is
        package String_Lists is new Indefinite_Doubly_Linked_Lists (String);
        use String_Lists;

        Storage : List;
    begin
        null;
    end Create_Storage;

    procedure Add_Product (Product : in out String) is
    begin
        null;
    end Add_Product;
end Storage_Package;
