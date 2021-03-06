
# Copyright 2020 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, glfw3, gtk3, libGL, libGLU, libusb1, linuxHeaders, openssl, pkg-config, udev }:
buildRosPackage {
  pname = "ros-crystal-librealsense2";
  version = "2.16.5-r2";

  src = fetchurl {
    url = "https://github.com/ros2-gbp/librealsense-release/archive/release/crystal/librealsense2/2.16.5-2.tar.gz";
    name = "2.16.5-2.tar.gz";
    sha256 = "cb95505e6a9a4d16ebb6ca7542eee7bca1afdfca36fd46aa6de30cb011d96b97";
  };

  buildType = "ament_cmake";
  buildInputs = [ pkg-config ];
  propagatedBuildInputs = [ glfw3 gtk3 libGL libGLU libusb1 linuxHeaders openssl udev ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Library for capturing data from the Intel(R) RealSense(TM) SR300 and D400 cameras. This effort was initiated to better support researchers, creative coders, and app developers in domains such as robotics, virtual reality, and the internet of things. Several often-requested features of RealSense(TM); devices are implemented in this project, including multi-camera capture.'';
    license = with lib.licenses; [ asl20 ];
  };
}
