// Vortech API Sonic Controller ❤
// For: 
// [Gentek] IntelliDoor Garage v3.1 for my kennel
// [Gentek] IntelliDoor Bollard v3.1
// Breda Sci-Fi Single Sliding Door Full Perm
// NLS TARDIS Door open/close

integer SecureDoorCHANNEL = 99879;  //corresponds to the "CHANNEL IN" of the door options
string commID = "TARDIS";  //corresponds to the "COMM ID" of the SecureDoor options

default
{
    state_entry()
    {
       
    }

    link_message(integer SendersLink, integer Value, string Text, key ID) {
        //llOwnerSay ((string)Value +": "+ Text );
        if ( Value != 9001 ) { return; }
        //llOwnerSay ((string)Value +": "+ Text );
        if ( Text == "SonicAPIOpenDoor" ) {
            // [Gentek] IntelliDoor Garage v3.1 for my kennel
            llWhisper (-494827459, "NONEKennel&&open");
            // NLS TARDIS Door open/close
            llWhisper (999, "door");
            // Breda Sci-Fi Singel Sliding Door Full Perm
            llWhisper(SecureDoorCHANNEL,"OPEN::"+ commID);
        } else {
            if ( Text == "SonicAPICloseDoor" ) {
                llWhisper (999, "door");
                llWhisper(SecureDoorCHANNEL,"CLOSE::"+ commID);
            } else {
                if ( Text == "SonicAPIDoorLock" ) {
                    // [Gentek] IntelliDoor Bollard v3.1
                    llShout(-494827459, "NONEBollard&&close");
                    llShout(SecureDoorCHANNEL,"LOCK::"+ commID);
                } else {
                    if ( Text == "SonicAPIDoorUnlock" ) {
                        llShout(-494827459, "NONEBollard&&open");
                        llShout(SecureDoorCHANNEL,"UNLOCK::"+ commID);
                    }
                }
            }
        }
    }
}
