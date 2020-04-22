{ lib, stdenv, fetchFromGitHub, cmake }:
stdenv.mkDerivation rec {
  pname = "console-bridge";
  version = "0.4.3";

  src = fetchFromGitHub {
    owner = "ros";
    repo = "console_bridge";
    rev = version;
    sha256 = "0vk2ji4q93w3fw4s6p0i9d3x2ppsmhxm3x7qrcl4jfr0pyj96n5x";
  };

  nativeBuildInputs = [ cmake ];

  meta = with lib; {
    description = "A ROS-independent package for logging that seamlessly pipes into rosconsole/rosout for ROS-dependent packages";
    homepage = https://github.com/ros/console_bridge;
    license = licenses.bsd3;
    maintainers = with maintainers; [ lopsided98 ];
  };
}
