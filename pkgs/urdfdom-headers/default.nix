{ lib, stdenv, fetchFromGitHub, cmake }:

stdenv.mkDerivation rec {
  pname = "urdfdom-headers";
  version = "1.0.3";

  src = fetchFromGitHub {
    owner = "ros";
    repo = "urdfdom_headers";
    rev = version;
    sha256 = "162px7dnmcgjncicsw27ay2llg8cknicxl16g9505icr9pzskw3l";
  };

  nativeBuildInputs = [ cmake ];

  meta = with lib; {
    description = "URDF (U-Robot Description Format) headers provides core data structure headers for URDF";
    homepage = https://github.com/ros/urdfdom_headers;
    license = licenses.bsd3;
    maintainers = with maintainers; [ lopsided98 ];
  };
}
