{ stdenv, fetchurl, cmake, pkgconfig, ignition, ignition-cmake ? ignition.cmake
, ignition-common ? ignition.common, tinyxml-2, curl, jsoncpp, libyaml, libzip
, majorVersion ? "3"
, version ? "3.2.1"
, srcSha256 ? "1rs7fpkdzvvf1g9611rsjbn9mys0hh0hhbwg1albvzvd6iamnipz"
, ... }:

stdenv.mkDerivation rec {
  pname = "ignition-fuel-tools${majorVersion}";
  inherit version;

  src = fetchurl {
    url = "https://bitbucket.org/ignitionrobotics/ign-fuel-tools/get/ignition-fuel-tools${majorVersion}_${version}.tar.bz2";
    sha256 = srcSha256;
  };

  nativeBuildInputs = [ cmake pkgconfig ];
  propagatedBuildInputs = [ ignition-cmake ignition-common tinyxml-2 curl 
    jsoncpp libyaml libzip ];

  meta = with stdenv.lib; {
    homepage = https://ignitionrobotics.org/libs/fuel_tools;
    description = "Classes and tools for interacting with Ignition Fuel";
    license = licenses.asl20;
    maintainers = with maintainers; [ lopsided98 ];
  };
}
