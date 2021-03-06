
# Copyright 2020 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, apr, boost, catkin, cpp-common, log4cxx, rosbuild, rostime, rosunit }:
buildRosPackage {
  pname = "ros-melodic-rosconsole";
  version = "1.13.11-r1";

  src = fetchurl {
    url = "https://github.com/ros-gbp/rosconsole-release/archive/release/melodic/rosconsole/1.13.11-1.tar.gz";
    name = "1.13.11-1.tar.gz";
    sha256 = "a3e3a70918afe751f2ddfeb9c2f5d25986bd0e5fa305bb3c8857349dc1410aea";
  };

  buildType = "catkin";
  buildInputs = [ boost rosunit ];
  propagatedBuildInputs = [ apr cpp-common log4cxx rosbuild rostime ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''ROS console output library.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
