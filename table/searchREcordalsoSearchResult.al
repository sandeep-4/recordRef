table 57102 "Search Record"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Table No."; Integer)
        {
            DataClassification = ToBeClassified;
        }

        field(3; TableName; Text[200])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(AllObjWithCaption."Object Name" where("Object Type" = const(table), "Object ID" = field("Table No.")));
        }

        field(4; "Record Id"; RecordId)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Data Caption"; Text[200])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Line No.")
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