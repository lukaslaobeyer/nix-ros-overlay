
# Copyright 2020 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cmake-modules, hardware-interface, pluginlib, resource-retriever, roscpp, tinyxml }:
buildRosPackage {
  pname = "ros-melodic-transmission-interface";
  version = "0.18.0-r1";

  src = fetchurl {
    url = "https://github.com/ros-gbp/ros_control-release/archive/release/melodic/transmission_interface/0.18.0-1.tar.gz";
    name = "0.18.0-1.tar.gz";
    sha256 = "5ad61a28a7a3e8e5d3d8faa51d69f9958c1054318aac2e9d4a492ea2be831764";
  };

  buildType = "catkin";
  buildInputs = [ cmake-modules ];
  checkInputs = [ resource-retriever ];
  propagatedBuildInputs = [ hardware-interface pluginlib roscpp tinyxml ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Transmission Interface.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
