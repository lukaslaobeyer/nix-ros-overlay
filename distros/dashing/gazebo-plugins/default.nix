
# Copyright 2020 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-cmake-gtest, ament-lint-auto, ament-lint-common, camera-info-manager, cv-bridge, gazebo-dev, gazebo-msgs, gazebo-ros, geometry-msgs, image-transport, nav-msgs, rclcpp, sensor-msgs, std-msgs, std-srvs, tf2-geometry-msgs, tf2-ros, trajectory-msgs }:
buildRosPackage {
  pname = "ros-dashing-gazebo-plugins";
  version = "3.3.4-r1";

  src = fetchurl {
    url = "https://github.com/ros2-gbp/gazebo_ros_pkgs-release/archive/release/dashing/gazebo_plugins/3.3.4-1.tar.gz";
    name = "3.3.4-1.tar.gz";
    sha256 = "94fade3f1d680f67770d229eeecdf61104f8e4759e3b5e348dbfe77e6ce6a2d6";
  };

  buildType = "ament_cmake";
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common cv-bridge ];
  propagatedBuildInputs = [ camera-info-manager cv-bridge gazebo-dev gazebo-msgs gazebo-ros geometry-msgs image-transport nav-msgs rclcpp sensor-msgs std-msgs std-srvs tf2-geometry-msgs tf2-ros trajectory-msgs ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Robot-independent Gazebo plugins for sensors, motors and dynamic reconfigurable components.'';
    license = with lib.licenses; [ bsd2 ];
  };
}
