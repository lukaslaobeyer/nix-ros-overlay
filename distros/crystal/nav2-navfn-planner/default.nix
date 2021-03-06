
# Copyright 2020 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-cmake-gtest, ament-cmake-pytest, ament-lint-auto, ament-lint-common, builtin-interfaces, geometry-msgs, launch, launch-testing, nav-msgs, nav2-common, nav2-msgs, nav2-robot, nav2-tasks, nav2-util, rclcpp, visualization-msgs }:
buildRosPackage {
  pname = "ros-crystal-nav2-navfn-planner";
  version = "0.1.7";

  src = fetchurl {
    url = "https://github.com/SteveMacenski/navigation2-release/archive/release/crystal/nav2_navfn_planner/0.1.7-0.tar.gz";
    name = "0.1.7-0.tar.gz";
    sha256 = "412542dcda7ba8032585d1d0ff7155c10051f76a66b2301d080b282d20503509";
  };

  buildType = "ament_cmake";
  buildInputs = [ nav2-common ];
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common launch launch-testing ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs nav-msgs nav2-msgs nav2-robot nav2-tasks nav2-util rclcpp visualization-msgs ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''TODO'';
    license = with lib.licenses; [ asl20 ];
  };
}
