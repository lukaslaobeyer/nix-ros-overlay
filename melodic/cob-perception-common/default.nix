
# Copyright 2019 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, cob-perception-msgs, cob-image-flip, cob-object-detection-msgs, cob-vision-utils, catkin, cob-object-detection-visualizer, cob-3d-mapping-msgs, cob-cam3d-throttle }:
buildRosPackage {
  pname = "ros-melodic-cob-perception-common";
  version = "0.6.14-r1";

  src = fetchurl {
    url = https://github.com/ipa320/cob_perception_common-release/archive/release/melodic/cob_perception_common/0.6.14-1.tar.gz;
    sha256 = "97bfc63a8a31d06503529bb80f7aa1c04f59b2872541c970c21a9e8a8677f11c";
  };

  propagatedBuildInputs = [ cob-perception-msgs cob-image-flip cob-object-detection-msgs cob-vision-utils cob-object-detection-visualizer cob-3d-mapping-msgs cob-cam3d-throttle ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This stack provides utilities commonly needed for a variety of computer vision tasks.'';
    license = with lib.licenses; [ asl20 ];
  };
}