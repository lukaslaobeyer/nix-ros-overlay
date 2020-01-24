{ stdenv, fetchurl, cmake, ignition, ignition-cmake ? ignition.cmake, protobuf
, ignition-math ? ignition.math
, majorVersion ? "4"
, version ? "4.7.0"
, srcSha256 ? "0y69n517k8s3b1ssj1k30lzm2ari87a2sb9sawfpld6mdm92nxs9"
, ... }:

stdenv.mkDerivation rec {
  pname = "ignition-msgs${majorVersion}";
  inherit version;

  src = fetchurl {
    url = "https://bitbucket.org/ignitionrobotics/ign-msgs/get/ignition-msgs${majorVersion}_${version}.tar.bz2";
    sha256 = srcSha256;
  };

  nativeBuildInputs = [ cmake ];
  propagatedBuildInputs = [ ignition-cmake protobuf ignition-math ];

  meta = with stdenv.lib; {
    homepage = https://ignitionrobotics.org/libs/msgs;
    description = "Protobuf messages and functions for robot applications.";
    license = licenses.asl20;
    maintainers = with maintainers; [ lopsided98 ];
  };
}
