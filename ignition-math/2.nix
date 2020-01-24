{ stdenv, callPackage, ignition, ... } @ args :

callPackage ./. ({
  majorVersion = "2";
  version = "2.9.0";
  srcSha256 = "1l3mxhpbqr9f2hz8nzargsvz3z2lb71v6mjr61j7h380ff0ar5nf";
  ignition-cmake = ignition.cmake0;
} // args)
