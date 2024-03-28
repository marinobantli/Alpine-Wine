#!/bin/ash

export DISPLAY=:0

echo "Starting Xvnc..."
rm -rf /tmp/.X0-lock
Xvnc -geometry $DisplayResolution -AlwaysShared -AcceptCutText -SendCutText -SendPrimary -AcceptSetDesktopSize -SecurityTypes None :0 &
sleep 3

echo "Starting window manager..."
openbox-session &
echo "Ready."

if [ -z $1 ]
then
    echo "No arguments specified via "CMD". Running indefinetly."
    wait $!
else
    echo "Processing specified CMD..."
    exec $1
fi