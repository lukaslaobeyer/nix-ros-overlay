
# Copyright 2020 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib, catkin, dynamic-tf-publisher, geometry-msgs, jsk-interactive-marker, mk, rosbuild, rospy, visualization-msgs }:
buildRosPackage {
  pname = "ros-kinetic-jsk-interactive";
  version = "2.1.6-r1";

  src = fetchurl {
    url = "https://github.com/tork-a/jsk_visualization-release/archive/release/kinetic/jsk_interactive/2.1.6-1.tar.gz";
    name = "2.1.6-1.tar.gz";
    sha256 = "e2d9001b24845491992e34004b7d0541b528122b932443e087bb219d795ef566";
  };

  buildType = "catkin";
  buildInputs = [ mk rosbuild ];
  propagatedBuildInputs = [ actionlib dynamic-tf-publisher geometry-msgs jsk-interactive-marker rospy visualization-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''jsk_interactive'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
