{ stdenv, fetchurl, cmake, ronn, ruby }:

stdenv.mkDerivation rec {
  pname = "ignition-tools";
  version = "0.2.0";

  src = fetchurl {
    url = "https://bitbucket.org/ignitionrobotics/ign-tools/get/ignition-tools_${version}.tar.bz2";
    sha256 = "06kqllnpxchyb6ridxi3was1462s2hdipl4fkm7cyhh2xryj1i06";
  };

  nativeBuildInputs = [ cmake ronn ];
  buildInputs = [ ruby ];

  meta = with stdenv.lib; {
    homepage = https://bitbucket.org/ignitionrobotics/ign-tools;
    description = "Ignition entry point for using all the suite of ignition tools";
    license = licenses.asl20;
    maintainers = with maintainers; [ lopsided98 ];
  };
}
