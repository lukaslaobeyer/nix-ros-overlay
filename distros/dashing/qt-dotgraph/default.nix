
# Copyright 2020 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-cmake-pytest, ament-lint-auto, ament-lint-common, python-qt-binding, python3Packages }:
buildRosPackage {
  pname = "ros-dashing-qt-dotgraph";
  version = "1.0.7-r1";

  src = fetchurl {
    url = "https://github.com/ros2-gbp/qt_gui_core-release/archive/release/dashing/qt_dotgraph/1.0.7-1.tar.gz";
    name = "1.0.7-1.tar.gz";
    sha256 = "e76d05f8fc9980fe75079a36a3a8e5bbf48100cf46316093f63eeea272c33977";
  };

  buildType = "ament_cmake";
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common python3Packages.pygraphviz ];
  propagatedBuildInputs = [ python-qt-binding python3Packages.pydot ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''qt_dotgraph provides helpers to work with dot graphs.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
