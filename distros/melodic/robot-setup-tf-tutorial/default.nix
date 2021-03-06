
# Copyright 2020 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, roscpp, tf }:
buildRosPackage {
  pname = "ros-melodic-robot-setup-tf-tutorial";
  version = "0.2.3-r1";

  src = fetchurl {
    url = "https://github.com/ros-gbp/navigation_tutorials-release/archive/release/melodic/robot_setup_tf_tutorial/0.2.3-1.tar.gz";
    name = "0.2.3-1.tar.gz";
    sha256 = "56636941f8a10861807e4cd860cf5c123247372f2f079f250aa2e26d0990000d";
  };

  buildType = "catkin";
  propagatedBuildInputs = [ geometry-msgs roscpp tf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The robot_setup_tf_tutorial package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
