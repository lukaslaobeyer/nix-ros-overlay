
# Copyright 2019 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, rosidl-generator-cpp, pluginlib, ament-lint-common, shared-queues-vendor, ament-cmake-gmock, test-msgs, rosbag2-test-common, ament-cmake, poco-vendor, rosidl-typesupport-cpp, rosidl-typesupport-introspection-cpp, ament-index-cpp, ament-lint-auto, rosbag2-storage, rcutils }:
buildRosPackage {
  pname = "ros-crystal-rosbag2";
  version = "0.0.7";

  src = fetchurl {
    url = https://github.com/ros2-gbp/rosbag2-release/archive/release/crystal/rosbag2/0.0.7-0.tar.gz;
    sha256 = "3fd6bf46e3462909038feed3bf7019b83efb38731b9b1d5c136f1ac230cfe002";
  };

  buildType = "ament_cmake";
  buildInputs = [ rosidl-generator-cpp pluginlib shared-queues-vendor poco-vendor rosidl-typesupport-cpp rosidl-typesupport-introspection-cpp ament-index-cpp rosbag2-storage rcutils ];
  checkInputs = [ ament-lint-common ament-cmake-gmock test-msgs rosbag2-test-common ament-lint-auto ];
  propagatedBuildInputs = [ rosidl-generator-cpp pluginlib shared-queues-vendor poco-vendor rosidl-typesupport-cpp rosidl-typesupport-introspection-cpp ament-index-cpp rosbag2-storage rcutils ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''ROSBag2 client library'';
    license = with lib.licenses; [ asl20 ];
  };
}
