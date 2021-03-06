
# Copyright 2020 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-mbf-abstract-core";
  version = "0.3.1-r1";

  src = fetchurl {
    url = "https://github.com/uos-gbp/move_base_flex-release/archive/release/melodic/mbf_abstract_core/0.3.1-1.tar.gz";
    name = "0.3.1-1.tar.gz";
    sha256 = "730adb956cb68e22ffbaca41f8428dfeb1c9cc8ded46e8866be50ba699ebaf29";
  };

  buildType = "catkin";
  propagatedBuildInputs = [ geometry-msgs std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This package provides common interfaces for navigation specific robot actions. It contains the AbstractPlanner, AbstractController and AbstractRecovery plugin interfaces. This interfaces have to be implemented by the plugins to make the plugin available for Move Base Flex. The abstract classes provides a meaningful interface enabling the planners, controllers and recovery behaviors to return information, e.g. why something went wrong. Derivided interfaces can, for example, provide methods to initialize the planner, controller or recovery with map representations like costmap_2d, grid_map or other representations.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
