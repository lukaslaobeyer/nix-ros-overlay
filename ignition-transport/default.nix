{ stdenv, fetchurl, cmake, pkgconfig, ignition, ignition-cmake ? ignition.cmake
, ignition-math ? ignition.math, ignition-msgs ? ignition.msgs, protobuf
, libuuid, sqlite, cppzmq, zeromq
, majorVersion ? "7"
, version ? "7.1.0"
, srcSha256 ? "048z1i436pllqwv4a4al6xfvlmfpa57fz3qgiky08ia8fckqqzwn"
, ... }:

stdenv.mkDerivation rec {
  pname = "ignition-transport${majorVersion}";
  inherit version;

  src = fetchurl {
    url = "https://bitbucket.org/ignitionrobotics/ign-transport/get/ignition-transport${majorVersion}_${version}.tar.bz2";
    sha256 = srcSha256;
  };

  nativeBuildInputs = [ cmake pkgconfig ];
  buildInputs = [ ignition-math sqlite ];
  propagatedBuildInputs = [ ignition-cmake protobuf cppzmq zeromq libuuid
    ignition-msgs ];

  cmakeFlags= [
    "-DCMAKE_INSTALL_INCLUDEDIR:PATH=include"
    "-DCMAKE_INSTALL_LIBDIR:PATH=lib"
  ];

  meta = with stdenv.lib; {
    homepage = https://ignitionrobotics.org/libs/transport;
    description = "Provides fast and efficient asyncronous message passing, services, and data logging.";
    license = licenses.asl20;
    maintainers = with maintainers; [ pxc lopsided98 ];
  };
}
