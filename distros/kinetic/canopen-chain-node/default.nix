
# Copyright 2020 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, canopen-master, catkin, diagnostic-updater, message-generation, message-runtime, pluginlib, roscpp, roslib, socketcan-interface, std-msgs, std-srvs }:
buildRosPackage {
  pname = "ros-kinetic-canopen-chain-node";
  version = "0.7.12-r1";

  src = fetchurl {
    url = "https://github.com/ros-industrial-release/ros_canopen-release/archive/release/kinetic/canopen_chain_node/0.7.12-1.tar.gz";
    name = "0.7.12-1.tar.gz";
    sha256 = "0544a6b94833ebf4ae24d9d4fe0954dddec974ccbbcce39c926123f5197ee79e";
  };

  buildType = "catkin";
  buildInputs = [ message-generation ];
  propagatedBuildInputs = [ canopen-master diagnostic-updater message-runtime pluginlib roscpp roslib socketcan-interface std-msgs std-srvs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Base implementation for CANopen chains node with support for management services and diagnostics'';
    license = with lib.licenses; [ lgpl2 ];
  };
}
