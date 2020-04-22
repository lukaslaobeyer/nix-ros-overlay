{ lib, stdenv, fetchurl, cmake, pkgconfig, ruby, boost, ignition
, ignition-cmake ? ignition.cmake0, ignition-math ? ignition.math4, tinyxml
, urdfdom, urdfdom-headers, console-bridge
, version ? "6.0.0"
, srcSha256 ? "0kdw62s7r4b5kx255mrg0zi1vyvp34ipiqs0jbwqfb6rx43q1slk"
, ...
  }:

stdenv.mkDerivation rec {
  pname = "sdformat";
  inherit version;

  src = fetchurl { 
    url = "https://osrf-distributions.s3.amazonaws.com/${pname}/releases/${pname}-${version}.tar.bz2";
    sha256 = srcSha256;
  };

  prePatch = ''
    substituteInPlace cmake/sdf_config.cmake.in \
      --replace "@CMAKE_INSTALL_PREFIX@/@LIB_INSTALL_DIR@" "@LIB_INSTALL_DIR@"
  '';

  enableParallelBuilding = true;

  nativeBuildInputs = [ cmake pkgconfig ruby ];
  buildInputs = [ urdfdom ];
  propagatedBuildInputs = [ ignition-math boost tinyxml ];

  meta.platforms = lib.platforms.unix;
}
