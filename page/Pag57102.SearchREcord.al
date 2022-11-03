page 57102 "Search REcord"
{
    ApplicationArea = All;
    Caption = 'Search UI';
    PageType = List;
    SourceTable = "Search Record";
    UsageCategory = Tasks;
    SourceTableTemporary = true;
    // ModifyAllowed = false;
    // DeleteAllowed = false;
    Editable = true;
    layout
    {
        area(content)
        {

            group(SearchGrp)
            {
                Caption = 'Serach';
                field(Search; Search)
                {
                    Visible = true;
                    ApplicationArea = all;
                    trigger OnValidate()
                    var
                        SearchMgt: Codeunit "Search Mgt";
                    begin
                        SearchMgt.searcRecord(Search, Rec);
                    end;
                }

                repeater(General)
                {
                    field("Line No."; Rec."Line No.")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Line No. field.';
                    }
                    field("Table No."; Rec."Table No.")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Table No. field.';
                    }
                    field(TableName; Rec.TableName)
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the TableName field.';
                    }
                    field("Record Id"; Rec."Record Id")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Record Id field.';
                    }
                    field("Data Caption"; Rec."Data Caption")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Data Caption field.';
                        DrillDown = true;
                        trigger OnDrillDown()
                        var
                            SechMgt: Codeunit "Search Mgt";
                        begin
                            SechMgt.NavigateTo(Rec);
                        end;
                    }
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Page Setup")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                Image = Setup;
                PromotedOnly = true;
                PromotedCategory = Process;
                RunObject = page "Search Setup";
                trigger OnAction()
                begin

                end;
            }
        }
    }
    var
        Search: Text;
}

