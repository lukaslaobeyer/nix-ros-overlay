
# Copyright 2020 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, pythonPackages }:
buildRosPackage {
  pname = "ros-kinetic-swri-prefix-tools";
  version = "2.12.0-r1";

  src = fetchurl {
    url = "https://github.com/swri-robotics-gbp/marti_common-release/archive/release/kinetic/swri_prefix_tools/2.12.0-1.tar.gz";
    name = "2.12.0-1.tar.gz";
    sha256 = "6291ee73a2a1b0263072937d49184fd9a419670d9d812abf2f132b5d98286841";
  };

  buildType = "catkin";
  propagatedBuildInputs = [ pythonPackages.psutil ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Contains scripts that are useful as prefix commands for nodes
    started by roslaunch.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
