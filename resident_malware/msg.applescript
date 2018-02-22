#!/usr/bin/osascript
set UnixPath to POSIX path of ((path to me as text) & "::")
set dirty to 0
set delaytime to 5
repeat while true
    if application "Messages" is running then
        set dirty to 1
        repeat until application "Messages" is not running
            delay delaytime
        end repeat
    end if
    if application "Messages" is not running then
        if dirty is 1
            do shell script UnixPath & "general.sh"
            set dirty to 0
        end if
        delay delaytime
    end if
end repeat
