
# Copyright 2020 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cob-msgs, cob-srvs, diagnostic-msgs, diagnostic-updater, pythonPackages, roscpp, rospy, socketcan-interface, std-msgs }:
buildRosPackage {
  pname = "ros-kinetic-cob-bms-driver";
  version = "0.7.3-r1";

  src = fetchurl {
    url = "https://github.com/ipa320/cob_driver-release/archive/release/kinetic/cob_bms_driver/0.7.3-1.tar.gz";
    name = "0.7.3-1.tar.gz";
    sha256 = "eea179b677cb4cecdb0a6cbefbc39f1e76b3619f92a13624ab35b18a98b7c84c";
  };

  buildType = "catkin";
  propagatedBuildInputs = [ cob-msgs cob-srvs diagnostic-msgs diagnostic-updater pythonPackages.numpy roscpp rospy socketcan-interface std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Driver package for interfacing the battery management system (BMS) on Care-O-bot.'';
    license = with lib.licenses; [ asl20 ];
  };
}
