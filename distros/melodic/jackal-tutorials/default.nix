
# Copyright 2020 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, rosdoc-lite }:
buildRosPackage {
  pname = "ros-melodic-jackal-tutorials";
  version = "0.6.4-r3";

  src = fetchurl {
    url = "https://github.com/clearpath-gbp/jackal-release/archive/release/melodic/jackal_tutorials/0.6.4-3.tar.gz";
    name = "0.6.4-3.tar.gz";
    sha256 = "2b4a50407187182e5fcc4f33d017595d3587838f2438331abdfd8a702f961532";
  };

  buildType = "catkin";
  buildInputs = [ rosdoc-lite ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Jackal's tutorials.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
