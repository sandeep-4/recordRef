codeunit 57101 "Search Mgt"
{
    trigger OnRun()
    begin

    end;

    procedure searcRecord(searchTerm: Text[200]; var Result: Record "Search Record" temporary)
    var
        SearchSetp: Record "Search Setup";
        RecRef: RecordRef;
        KRef: KeyRef;
        FRef: FieldRef;
        LastREc: Integer;
    begin
        SearchSetp.Reset();
        if SearchSetp.FindSet() then
            repeat
                RecRef.Open(SearchSetp."Table No."); //its important to close once opened
                if SearchSetp."Search Primary Key" then begin
                    KRef := RecRef.KeyIndex(1);
                    if KRef.FieldCount <> 1 then
                        Error('No acess');
                    FRef := KRef.FieldIndex(1);
                    FRef.SetRange(searchTerm);
                    if RecRef.FindFirst() then begin
                        LastREc += 1;
                        Result.Init();
                        Result."Line No." := LastREc;
                        Result."Table No." := SearchSetp."Table No.";
                        Result."Data Caption" := Format(RecRef.Caption).Replace(',', ' ');
                        Result."Record Id" := RecRef.RecordId;
                        Result.Insert();
                    end;
                end;
                RecRef.Close();
            until SearchSetp.Next() = 0;

    end;

    procedure NavigateTo(Reco: Record "Search Record")
    var
        SearchSetup: Record "Search Setup";
        RecREfs: RecordRef;
        Varien: Variant;
    begin
        SearchSetup.Get(Reco."Table No.");
        SearchSetup.TestField("Card Page");
        RecREfs.Open(SearchSetup."Table No.");
        RecREfs.Get(Reco."Record Id");
        Varien := RecREfs;
        Page.run(SearchSetup."Card Page", Varien);
        RecREfs.Close();
    end;

    var
        myInt: Integer;
}