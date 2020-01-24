{ stdenv, callPackage, ignition, ... } @ args :

callPackage ./. ({
  majorVersion = "2";
  version = "2.1.0";
  srcSha256 = "0a0h7iy2aqlhkz0slp1csiixm4fhnw3vhh58cccwfbzjai71vkd6";
  ignition-cmake = ignition.cmake0;
  ignition-math = null;
  ignition-msgs = ignition.msgs0;
} // args)
