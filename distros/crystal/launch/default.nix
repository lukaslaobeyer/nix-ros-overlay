
# Copyright 2020 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-copyright, ament-flake8, ament-pep257, osrf-pycommon, pythonPackages }:
buildRosPackage {
  pname = "ros-crystal-launch";
  version = "0.7.4";

  src = fetchurl {
    url = "https://github.com/ros2-gbp/launch-release/archive/release/crystal/launch/0.7.4-0.tar.gz";
    name = "0.7.4-0.tar.gz";
    sha256 = "5fc208fcf017a8bfe79594bb62cf434801683c5d01a9785b5b783b558528224a";
  };

  buildType = "ament_python";
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 pythonPackages.pytest ];
  propagatedBuildInputs = [ osrf-pycommon ];

  meta = {
    description = ''The ROS launch tool.'';
    license = with lib.licenses; [ asl20 ];
  };
}
