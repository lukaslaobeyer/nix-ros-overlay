
# Copyright 2020 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-copyright, ament-flake8, ament-pep257, pythonPackages, ros2cli }:
buildRosPackage {
  pname = "ros-crystal-ros2node";
  version = "0.6.3";

  src = fetchurl {
    url = "https://github.com/ros2-gbp/ros2cli-release/archive/release/crystal/ros2node/0.6.3-0.tar.gz";
    name = "0.6.3-0.tar.gz";
    sha256 = "5a98f8f75ece2380b33e4ba7477ff99b3a5cf6916a5c7f12ff9e68a6a4723d19";
  };

  buildType = "ament_python";
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 pythonPackages.pytest ];
  propagatedBuildInputs = [ ros2cli ];

  meta = {
    description = ''The node command for ROS 2 command line tools.'';
    license = with lib.licenses; [ asl20 ];
  };
}
