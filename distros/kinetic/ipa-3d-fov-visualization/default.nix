
# Copyright 2020 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cv-bridge, image-geometry, roscpp, sensor-msgs, visualization-msgs }:
buildRosPackage {
  pname = "ros-kinetic-ipa-3d-fov-visualization";
  version = "0.6.15-r1";

  src = fetchurl {
    url = "https://github.com/ipa320/cob_perception_common-release/archive/release/kinetic/ipa_3d_fov_visualization/0.6.15-1.tar.gz";
    name = "0.6.15-1.tar.gz";
    sha256 = "cce134e70aa3a8e9664eb5ea0825d3b902f7548afc876b35df4b9cf9cd44f4b3";
  };

  buildType = "catkin";
  propagatedBuildInputs = [ cv-bridge image-geometry roscpp sensor-msgs visualization-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The ipa_3d_fov_visualization package allows to visualize the field-of-view of a camera.'';
    license = with lib.licenses; [ asl20 ];
  };
}
