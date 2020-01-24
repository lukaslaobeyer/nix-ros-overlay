{ stdenv, callPackage, ignition, ... } @ args :

callPackage ./. ({
  majorVersion = "4";
  version = "4.0.0";
  srcSha256 = "1lcnrqw3kjwjnm8n61xc9ld9grgr4zy457lg115vbzy0p41ydlbj";
  ignition-cmake = ignition.cmake0;
  ignition-math = ignition.math4;
  ignition-msgs = ignition.msgs1;
} // args)
