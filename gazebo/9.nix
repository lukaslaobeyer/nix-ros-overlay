{ callPackage, ... } @ args:

callPackage ./. (args // rec {
  version = "9.11.0";
  srcSha256 = "18s2rsdhbkn1c76lvixlypgq77bsc9f59k8zij32rmxv3ynwnf8b";
})

