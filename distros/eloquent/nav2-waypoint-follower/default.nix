
# Copyright 2020 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-lint-auto, ament-lint-common, nav-msgs, nav2-common, nav2-msgs, nav2-util, rclcpp, rclcpp-action, rclcpp-lifecycle, tf2-ros }:
buildRosPackage {
  pname = "ros-eloquent-nav2-waypoint-follower";
  version = "0.3.4-r1";

  src = fetchurl {
    url = "https://github.com/SteveMacenski/navigation2-release/archive/release/eloquent/nav2_waypoint_follower/0.3.4-1.tar.gz";
    name = "0.3.4-1.tar.gz";
    sha256 = "2e6250827928a85a9d129a30acfc8d16dd6acbc5d9480cf22dc93039e2d6af90";
  };

  buildType = "ament_cmake";
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ nav-msgs nav2-common nav2-msgs nav2-util rclcpp rclcpp-action rclcpp-lifecycle tf2-ros ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''A waypoint follower navigation server'';
    license = with lib.licenses; [ asl20 ];
  };
}
