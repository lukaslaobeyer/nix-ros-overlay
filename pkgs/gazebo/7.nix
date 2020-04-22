{ callPackage, ignition, gazeboSimulator, qt4, ... } @ args:

(callPackage ./. (args // rec {
  version = "7.16.0";
  srcSha256 = "0kyg2rkxy5fw4b53msjxi5cichy5d5w5ckfk5nh9897skdxz5rf6";
  sdformat = gazeboSimulator.sdformat4;
  ignition-msgs = null;
  ignition-math = ignition.math2;
  ignition-transport = ignition.transport2;
  qt = qt4;
  qwt6 = null;
})).overrideDerivation ({
  doCheck ? false,
  cmakeFlags ? [], ...
}: {
  cmakeFlags = cmakeFlags ++ [ "-DENABLE_TESTS_COMPILATION=${toString doCheck}" ];
})

