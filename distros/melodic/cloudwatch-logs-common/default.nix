
# Copyright 2020 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, aws-common, catkin, cmake, dataflow-lite, file-management, gmock, gtest }:
buildRosPackage {
  pname = "ros-melodic-cloudwatch-logs-common";
  version = "1.1.3-r1";

  src = fetchurl {
    url = "https://github.com/aws-gbp/cloudwatch_common-release/archive/release/melodic/cloudwatch_logs_common/1.1.3-1.tar.gz";
    name = "1.1.3-1.tar.gz";
    sha256 = "08487534fd32112a15bb53a4ab17e099775ac3772057135f1e5b49ddbf523168";
  };

  buildType = "cmake";
  checkInputs = [ gmock gtest ];
  propagatedBuildInputs = [ aws-common dataflow-lite file-management ];
  nativeBuildInputs = [ catkin cmake ];

  meta = {
    description = ''AWS CloudWatch management library used by ROS1/2 node to publish logs to CloudWatch service'';
    license = with lib.licenses; [ asl20 ];
  };
}
