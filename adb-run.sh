pkg=$(aapt dump badging $1|awk -F" " '/package/ {print $2}'|awk -F"'" '/name=/ {print $2}')
ver=$(aapt dump badging $1 | awk -F " " '/package/ {print $4}' | awk -F "'" '/versionName=/ {print $2}')
act=$(aapt dump badging $1|awk -F" " '/launchable-activity/ {print $2}'|awk -F"'" '/name=/ {print $2}')
pkg_ver=$( echo "$pkg.$ver")
echo "Running package: $pkg ver: $ver with activity: $act"
adb shell am start -n $pkg/$act
