{ lib, stdenv, fetchFromGitHub, cmake, pkgconfig, tinyxml, boost
, urdfdom-headers, console-bridge }:

stdenv.mkDerivation rec {
  pname = "urdfdom";
  version = "1.0.3";

  src = fetchFromGitHub {
    owner = "ros";
    repo = pname;
    rev = version;
    sha256 = "1i6xd6rhz024cwrhi5h7g4j7qv5v0b708mnlghk2vsczfjxshy6m";
  };

  nativeBuildInputs = [ cmake pkgconfig ];
  buildInputs = [ tinyxml boost ];
  propagatedBuildInputs = [ urdfdom-headers console-bridge ];

  cmakeFlags = [ "-DCMAKE_INSTALL_LIBDIR:PATH=lib" ];

  meta = with lib; {
    description = "Provides core data structures and a simple XML parser for populating the class data structures from an URDF file";
    homepage = https://github.com/ros/urdfdom;
    license = licenses.bsd3;
    maintainers = with maintainers; [ lopsided98 ];
  };
}
