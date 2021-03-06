
# Copyright 2020 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, amcl, base-local-planner, carrot-planner, catkin, clear-costmap-recovery, costmap-2d, dwa-local-planner, fake-localization, global-planner, map-server, move-base, move-base-msgs, move-slow-and-clear, nav-core, navfn, rotate-recovery, voxel-grid }:
buildRosPackage {
  pname = "ros-melodic-navigation";
  version = "1.16.6-r1";

  src = fetchurl {
    url = "https://github.com/ros-gbp/navigation-release/archive/release/melodic/navigation/1.16.6-1.tar.gz";
    name = "1.16.6-1.tar.gz";
    sha256 = "1ea370e4943f34a593b5dbfd91ee8d6c732260b3b111aa5457eb367f1824cdcc";
  };

  buildType = "catkin";
  propagatedBuildInputs = [ amcl base-local-planner carrot-planner clear-costmap-recovery costmap-2d dwa-local-planner fake-localization global-planner map-server move-base move-base-msgs move-slow-and-clear nav-core navfn rotate-recovery voxel-grid ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A 2D navigation stack that takes in information from odometry, sensor
        streams, and a goal pose and outputs safe velocity commands that are sent
        to a mobile base.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
