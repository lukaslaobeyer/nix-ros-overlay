{ stdenv, fetchurl, cmake, ignition, ignition-cmake ? ignition.cmake
, majorVersion ? "6"
, version ? "6.4.0"
, srcSha256 ? "0i874nq8j3qj2rxh7ncsqjld6d1fn70n2cv1bab61b82abpd4qsl"
, ... }:

stdenv.mkDerivation {
  pname = "ignition-math${majorVersion}";
  inherit version;

  src = fetchurl {
    url = "https://bitbucket.org/ignitionrobotics/ign-math/get/ignition-math${majorVersion}_${version}.tar.bz2";
    sha256 = srcSha256;
  };

  nativeBuildInputs = [ cmake ];
  propagatedBuildInputs = [ ignition-cmake ];

  cmakeFlags = [
    "-DCMAKE_INSTALL_INCLUDEDIR:PATH=include"
    "-DCMAKE_INSTALL_LIBDIR:PATH=lib"
  ];

  meta = with stdenv.lib; {
    homepage = https://ignitionrobotics.org/libs/math;
    description = "Math classes and functions for robot applications";
    license = licenses.asl20;
    maintainers = with maintainers; [ pxc lopsided98 ];
    platforms = platforms.all;
  };
}
