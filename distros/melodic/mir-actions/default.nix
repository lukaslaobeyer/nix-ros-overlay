
# Copyright 2020 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib, catkin, geometry-msgs, message-generation, message-runtime, nav-msgs }:
buildRosPackage {
  pname = "ros-melodic-mir-actions";
  version = "1.0.4-r1";

  src = fetchurl {
    url = "https://github.com/uos-gbp/mir_robot-release/archive/release/melodic/mir_actions/1.0.4-1.tar.gz";
    name = "1.0.4-1.tar.gz";
    sha256 = "aaf73d32129e1084e5460ae1c6279641d6ee78931c8d05e89aa943836d79807c";
  };

  buildType = "catkin";
  buildInputs = [ message-generation ];
  propagatedBuildInputs = [ actionlib geometry-msgs message-runtime nav-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Action definitions for the MiR100 robot'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
