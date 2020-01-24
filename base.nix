self: super: with super.lib; let

  pythonOverridesFor = python: python.override (old: {
    packageOverrides = pySelf: pySuper: {
      catkin-pkg = pySelf.callPackage ./catkin-pkg { };
      colcon-cmake = pySelf.callPackage ./colcon/cmake.nix { };
      colcon-core = pySelf.callPackage ./colcon/core.nix { };
      colcon-library-path = pySelf.callPackage ./colcon/library-path.nix { };
      colcon-pkg-config = pySelf.callPackage ./colcon/pkg-config.nix { };
      colcon-python-setup-py = pySelf.callPackage ./colcon/python-setup-py.nix { };
      colcon-recursive-crawl = pySelf.callPackage ./colcon/recursive-crawl.nix { };
      colcon-ros = pySelf.callPackage ./colcon/ros.nix { };
      colcon-test-result = pySelf.callPackage ./colcon/test-result.nix { };
      empy = pySelf.callPackage ./empy { };
      rosdep = pySelf.callPackage ./rosdep { };
      rosdistro = pySelf.callPackage ./rosdistro { };
      rosinstall = pySelf.callPackage ./rosinstall { };
      rosinstall-generator = pySelf.callPackage ./rosinstall-generator { };
      rospkg = pySelf.callPackage ./rospkg { };
      vcstools = pySelf.callPackage ./vcstools { };
      wstool = pySelf.callPackage ./wstool { };
    } // (if python.isPy3 then {
      wxPython = pySelf.wxPython_4_0;
    } else {});
  });

in {
  colcon = with self.python3Packages; colcon-core.withExtensions [
    colcon-ros
  ];
    
  libyamlcpp = self.callPackage ./libyaml-cpp { };
  qwt6 = self.libsForQt5.callPackage ./qwt/6.nix { };
  
  console-bridge = self.callPackage ./console-bridge { };
  
  urdfdom = self.callPackage ./urdfdom {};
  urdfdom-headers = self.callPackage ./urdfdom-headers {};

  gazeboSimulator = self.pkgs.recurseIntoAttrs {
    sdformat4 = self.callPackage ./sdformat/4.nix { };
    sdformat6 = self.callPackage ./sdformat { };
    sdformat = self.gazeboSimulator.sdformat6;
    gazebo7 = self.callPackage ./gazebo/7.nix { };
    gazebo9 = self.callPackage ./gazebo/9.nix { };
    gazebo10 = self.callPackage ./gazebo { };
    gazebo = self.gazeboSimulator.gazebo10;
  };
  gazebo = self.gazeboSimulator.gazebo;

  ignition = {
    cmake0 = self.callPackage ./ignition-cmake/0.nix { };
    cmake2 = self.callPackage ./ignition-cmake { };
    cmake = ignition.cmake2;
    common1 = self.callPackage ./ignition-common/1.nix { };
    common3 = self.callPackage ./ignition-common { };
    common = ignition.common3;
    fuel-tools1 = self.callPackage ./ignition-fuel-tools/1.nix { };
    fuel-tools3 = self.callPackage ./ignition-fuel-tools { };
    fuel-tools = ignition.fuel-tools3;
    math2 = self.callPackage ./ignition-math/2.nix { };
    math4 = self.callPackage ./ignition-math/4.nix { };
    math6 = self.callPackage ./ignition-math { };
    math = ignition.math6;
    msgs0 = self.callPackage ./ignition-msgs/0.nix { };
    msgs1 = self.callPackage ./ignition-msgs/1.nix { };
    msgs4 = self.callPackage ./ignition-msgs { };
    msgs = ignition.msgs4;
    tools = self.callPackage ./ignition-tools { };
    transport2 = self.callPackage ./ignition-transport/2.nix { };
    transport4 = self.callPackage ./ignition-transport/4.nix { };
    transport7 = self.callPackage ./ignition-transport {
      # Uses C++17 filesystem API
      stdenv = gcc8Stdenv;
    };
    transport = ignition.transport7;
  };
  
  openni2 = self.callPackage ./openni2 {};

  opensplice = self.opensplice_6_9;
  opensplice_6_9 = self.callPackage ./opensplice { };

  python27 = pythonOverridesFor super.python27;
  python36 = pythonOverridesFor super.python36;
  python37 = pythonOverridesFor super.python37;
}
