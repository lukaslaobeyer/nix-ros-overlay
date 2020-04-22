{ stdenv, fetchurl, cmake
, majorVersion ? "2"
, version ? "2.1.1"
, srcSha256 ? "18k4jhvygcq79w7f740jlmp8kfzvv32zvkymhr7njqdijlbci2dd"
, ... }:

stdenv.mkDerivation rec {
  pname = "ignition-cmake${majorVersion}";
  inherit version;

  src = fetchurl {
    url = "https://bitbucket.org/ignitionrobotics/ign-cmake/get/ignition-cmake${majorVersion}_${version}.tar.bz2";
    sha256 = srcSha256;
  };

  nativeBuildInputs = [ cmake ];

  meta = with stdenv.lib; {
    homepage = https://ignitionrobotics.org/libs/cmake;
    description = "CMake Modules for Ignition Projects";
    license = licenses.asl20;
    maintainers = with maintainers; [ lopsided98 ];
    platforms = platforms.all;
  };
}
