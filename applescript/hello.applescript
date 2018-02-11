#!/usr/bin/osascript
set UnixPath to POSIX path of ((path to me as text) & "::")
do shell script UnixPath & "test2.sh"
do shell script UnixPath & "test.sh"
