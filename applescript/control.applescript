#!/usr/bin/osascript
set UnixPath to POSIX path of ((path to me as text) & "::")
if application "Messages" is running then
    do shell script UnixPath & "test.sh"
else
    do shell script UnixPath & "test2.sh"
end if
