#!/usr/bin/env bash
set -eo pipefail

source /opt/ros/melodic/setup.bash

# lidar_imu_fusion: pre-existing CMake bug (links Boost::timer without requesting it)
# camera_camera_sync: needs OpenCV nonfree/xfeatures2d (SURF), unavailable in stock OpenCV 3.2
catkin_make -DCATKIN_BLACKLIST_PACKAGES="lidar_imu_fusion;camera_camera_sync" -j"$(nproc)"
