
# Copyright 2020 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, gazeboSimulator }:
buildRosPackage {
  pname = "ros-eloquent-gazebo-dev";
  version = "3.4.3-r1";

  src = fetchurl {
    url = "https://github.com/ros2-gbp/gazebo_ros_pkgs-release/archive/release/eloquent/gazebo_dev/3.4.3-1.tar.gz";
    name = "3.4.3-1.tar.gz";
    sha256 = "2627ac82737d8946709d5769a3832f450055d89b7b13a5176fc30fee9255a84e";
  };

  buildType = "ament_cmake";
  propagatedBuildInputs = [ gazeboSimulator.gazebo9 ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Provides a cmake config for the default version of Gazebo for the ROS distribution.'';
    license = with lib.licenses; [ asl20 ];
  };
}
