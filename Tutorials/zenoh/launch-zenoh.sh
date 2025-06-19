#! /bin/bash
# service file: /etc/systemd/system/launch-zenoh.service

screen_name="zenoh_router"
screen -S $screen_name -X stuff $'\003'

source /opt/ros/humble/setup.bash
source /home/robot/ros2_ws/install/local_setup.bash

sleep 2

echo "Starting Zenoh router.."
export RUST_LOG=zenoh=info
screen -dmS $screen_name ros2 run rmw_zenoh_cpp rmw_zenohd

sleep 2
if screen -list | grep -q $screen_name; then
    echo "Zenoh router started successfully in screen  '$screen_name.'"
else
    echo "ERROR! Failed to start Zenoh router."
fi
