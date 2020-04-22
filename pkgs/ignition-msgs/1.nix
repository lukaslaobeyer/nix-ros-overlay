{ stdenv, callPackage, ignition, ... } @ args :

callPackage ./. ({
  majorVersion = "";
  version = "1.0.0";
  srcSha256 = "1as0626499kblprz382yk6k9753ww5a21qvd3pxwdsqa2sgjz4nm";
  ignition-cmake = ignition.cmake0;
  ignition-math = ignition.math4;
} // args)
