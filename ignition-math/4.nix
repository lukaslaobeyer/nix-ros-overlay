{ stdenv, callPackage, ignition, ... } @ args :

callPackage ./. ({
  majorVersion = "4";
  version = "4.0.0";
  srcSha256 = "12i808rwaag5p28p9120x1rb39bpl09rmfnnyncnjwhgak9vh96x";
  ignition-cmake = ignition.cmake0;
} // args)
