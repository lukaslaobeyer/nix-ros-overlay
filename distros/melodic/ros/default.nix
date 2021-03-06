
# Copyright 2020 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, mk, rosbash, rosboost-cfg, rosbuild, rosclean, roscreate, roslang, roslib, rosmake, rosunit }:
buildRosPackage {
  pname = "ros-melodic-ros";
  version = "1.14.8-r1";

  src = fetchurl {
    url = "https://github.com/ros-gbp/ros-release/archive/release/melodic/ros/1.14.8-1.tar.gz";
    name = "1.14.8-1.tar.gz";
    sha256 = "9d5e2945b00960586de7b7f2a52b02db6c0627695f22bbb38030558170070ac7";
  };

  buildType = "catkin";
  propagatedBuildInputs = [ catkin mk rosbash rosboost-cfg rosbuild rosclean roscreate roslang roslib rosmake rosunit ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''ROS packaging system'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
