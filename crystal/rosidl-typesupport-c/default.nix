
# Copyright 2019 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, poco, rosidl-typesupport-interface, ament-cmake-core, ament-lint-common, ament-lint-auto, poco-vendor, rosidl-typesupport-introspection-c, rmw-implementation, rosidl-typesupport-connext-c, ament-cmake-ros, rosidl-typesupport-opensplice-c, rosidl-generator-c }:
buildRosPackage {
  pname = "ros-crystal-rosidl-typesupport-c";
  version = "0.6.3";

  src = fetchurl {
    url = https://github.com/ros2-gbp/rosidl_typesupport-release/archive/release/crystal/rosidl_typesupport_c/0.6.3-0.tar.gz;
    sha256 = "be4fdfbf1648deced42c792279d1ed834eba3df058192d0e30c7600255c297e5";
  };

  buildType = "ament_cmake";
  buildInputs = [ poco rosidl-typesupport-introspection-c poco-vendor rosidl-typesupport-connext-c rosidl-typesupport-opensplice-c rosidl-generator-c ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ poco ament-cmake-core rosidl-typesupport-interface poco-vendor rmw-implementation rosidl-generator-c ];
  nativeBuildInputs = [ ament-cmake-ros ];

  meta = {
    description = ''Generate the type support for C messages.'';
    license = with lib.licenses; [ asl20 ];
  };
}
