table 57101 "Search Setup"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Table No."; Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = AllObjWithCaption."Object ID";
        }

        field(2; "Search Primary Key"; Boolean)
        {
            DataClassification = ToBeClassified;
        }

        field(3; "Full Text Search"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Card Page"; Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Table No.")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}