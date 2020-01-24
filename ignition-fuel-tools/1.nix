{ stdenv, callPackage, ignition } @ args :

callPackage ./. ({
  majorVersion = "1";
  version = "1.2.0";
  srcSha256 = "154pvmxb9g5f94wnzshassvdcyrxing63kqbf99i6z336ffz8wb7";
  ignition-cmake = ignition.cmake0;
  ignition-common = ignition.common1;
} // args)
