#!/usr/bin/env bash
set -eo pipefail

source /opt/ros/noetic/setup.bash

# Packages excluded due to pre-existing source incompatibilities with the
# Noetic toolchain (OpenCV 4 / PCL 1.10 / patented modules), not environment gaps:
#   camera_model / feature_tracker / pose_graph : OpenCV 2/3 `CV_*` enums removed in OpenCV 4
#   camera_camera_sync                          : needs OpenCV nonfree xfeatures2d (SURF)
#   sensor_processing                           : hard-codes -std=c++11, but PCL 1.10 needs C++14
#   lidar_imu_fusion                            : CMake bug (links Boost::timer without find_package)
BLACKLIST="lidar_imu_fusion;camera_camera_sync;camera_model;feature_tracker;pose_graph;sensor_processing"

catkin_make -DCATKIN_BLACKLIST_PACKAGES="${BLACKLIST}" -j"$(nproc)"
