
# Copyright 2020 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cmake-modules, cv-bridge, image-transport, jsk-recognition-utils, jsk-topic-tools, libsiftfast, nodelet, posedetection-msgs, roscpp, rostest, sensor-msgs }:
buildRosPackage {
  pname = "ros-melodic-imagesift";
  version = "1.2.10";

  src = fetchurl {
    url = "https://github.com/tork-a/jsk_recognition-release/archive/release/melodic/imagesift/1.2.10-0.tar.gz";
    name = "1.2.10-0.tar.gz";
    sha256 = "322d64597608e08314224ee31b4fd32f1d3ab7fe3b6fea7cbff20131e411ffc5";
  };

  buildType = "catkin";
  buildInputs = [ cmake-modules ];
  checkInputs = [ rostest ];
  propagatedBuildInputs = [ cv-bridge image-transport jsk-recognition-utils jsk-topic-tools libsiftfast nodelet posedetection-msgs roscpp sensor-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''For every image, computes its sift features and send a new message with the image, its intrinsic parameters, and the features.
    Parameters include:
    display - shows the image on the local computer'';
    license = with lib.licenses; [ lgpl2 ];
  };
}
