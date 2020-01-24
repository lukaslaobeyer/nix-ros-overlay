{ stdenv, callPackage, ignition, ... } @ args :

callPackage ./. ({
  majorVersion = "";
  # Don't use latest version because it requires ignition-math3
  version = "0.6.1";
  srcSha256 = "1izd25wzcjqggs12wfx7spbkb61v48iyavzfcg479iwavidszjnx";
  ignition-cmake = ignition.cmake0;
  ignition-math = ignition.math2;
} // args)
