
# Copyright 2020 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, amcl, base-local-planner, catkin, dwb-critics, dwb-local-planner, dwb-plugins, map-server, mir-driver, mir-dwb-critics, move-base, nav-core-adapter, roslaunch, sbpl-lattice-planner }:
buildRosPackage {
  pname = "ros-melodic-mir-navigation";
  version = "1.0.4-r1";

  src = fetchurl {
    url = "https://github.com/uos-gbp/mir_robot-release/archive/release/melodic/mir_navigation/1.0.4-1.tar.gz";
    name = "1.0.4-1.tar.gz";
    sha256 = "1ac9fd30f725c0b8fb509496fd475584d0cb21e6b526e19e4d41f6b853b4fec6";
  };

  buildType = "catkin";
  buildInputs = [ roslaunch ];
  propagatedBuildInputs = [ amcl base-local-planner dwb-critics dwb-local-planner dwb-plugins map-server mir-driver mir-dwb-critics move-base nav-core-adapter sbpl-lattice-planner ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Launch and configuration files for move_base, localization etc. on the MiR robot.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
