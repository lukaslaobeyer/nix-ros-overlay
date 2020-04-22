{ stdenv, fetchurl, cmake, pkgconfig, ignition, ignition-cmake ? ignition.cmake
, ignition-math ? ignition.math, libuuid, tinyxml-2, freeimage, gts
, ffmpeg
, majorVersion ? "3"
, version ? "3.3.0"
, srcSha256 ? "02k5gbrs338594jx9dxaf69pflk4d49mbcw03866vypqi1541h1r"
, ... }:

stdenv.mkDerivation rec {
  pname = "ignition-common${majorVersion}";
  inherit version;

  src = fetchurl {
    url = "https://bitbucket.org/ignitionrobotics/ign-common/get/ignition-common${majorVersion}_${version}.tar.bz2";
    sha256 = srcSha256;
  };

  nativeBuildInputs = [ cmake pkgconfig ];
  buildInputs = [ ignition-math tinyxml-2 freeimage gts ffmpeg ];
  propagatedBuildInputs = [ ignition-cmake libuuid ];

  meta = with stdenv.lib; {
    homepage = https://ignitionrobotics.org/libs/common;
    description = "Miscellaneous libraries for Ignition Robotics";
    longDescription = ''
      Ignition Common, a component of Ignition Robotics, provides a set of
      libraries that cover many different use cases. An audio-visual library
      supports processing audio and video files, a graphics library can load a
      variety 3D mesh file formats into a generic in-memory representation, and
      the core library of Ignition Common contains functionality that spans
      Base64 encoding/decoding to thread pools.
    '';
    license = licenses.asl20;
    maintainers = with maintainers; [ lopsided98 ];
  };
}
