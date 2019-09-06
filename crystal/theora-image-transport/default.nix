
# Copyright 2019 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, builtin-interfaces, ament-cmake, pluginlib, ament-lint-common, image-transport, rosidl-default-generators, cv-bridge, libogg, std-msgs, rclcpp, libtheora, rosidl-default-runtime }:
buildRosPackage {
  pname = "ros-crystal-theora-image-transport";
  version = "2.0.0";

  src = fetchurl {
    url = https://github.com/ros2-gbp/image_transport_plugins-release/archive/release/crystal/theora_image_transport/2.0.0-0.tar.gz;
    sha256 = "748543b146e6a8816a560c6ccf5a48c9648c0b1b6a956cd3e7c67390ee4e2d2c";
  };

  buildType = "ament_cmake";
  buildInputs = [ builtin-interfaces pluginlib image-transport cv-bridge libogg libtheora rclcpp std-msgs ];
  checkInputs = [ ament-lint-common ];
  propagatedBuildInputs = [ builtin-interfaces pluginlib image-transport cv-bridge libogg libtheora rclcpp std-msgs rosidl-default-runtime ];
  nativeBuildInputs = [ rosidl-default-generators ament-cmake ];

  meta = {
    description = ''Theora_image_transport provides a plugin to image_transport for
    transparently sending an image stream encoded with the Theora codec.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
