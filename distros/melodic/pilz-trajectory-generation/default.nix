
# Copyright 2020 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cmake-modules, code-coverage, eigen-conversions, kdl-conversions, moveit-core, moveit-msgs, moveit-ros-move-group, moveit-ros-planning, moveit-ros-planning-interface, orocos-kdl, pilz-extensions, pilz-industrial-motion-testutils, pilz-msgs, pilz-testutils, pluginlib, prbt-moveit-config, prbt-pg70-support, prbt-support, roscpp, rostest, rosunit, tf2, tf2-eigen, tf2-geometry-msgs }:
buildRosPackage {
  pname = "ros-melodic-pilz-trajectory-generation";
  version = "0.4.10-r1";

  src = fetchurl {
    url = "https://github.com/PilzDE/pilz_industrial_motion-release/archive/release/melodic/pilz_trajectory_generation/0.4.10-1.tar.gz";
    name = "0.4.10-1.tar.gz";
    sha256 = "2ed5cdd473ec158b703757562794c8981cdf6a44c290f776d6307a6b807dc42c";
  };

  buildType = "catkin";
  checkInputs = [ cmake-modules code-coverage pilz-industrial-motion-testutils pilz-testutils prbt-moveit-config prbt-pg70-support prbt-support rostest rosunit ];
  propagatedBuildInputs = [ eigen-conversions kdl-conversions moveit-core moveit-msgs moveit-ros-move-group moveit-ros-planning moveit-ros-planning-interface orocos-kdl pilz-extensions pilz-msgs pluginlib roscpp tf2 tf2-eigen tf2-geometry-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The pilz_trajectory_generation package containing the MoveIt! plugin pilz_command_planner.'';
    license = with lib.licenses; [ lgpl2 ];
  };
}
