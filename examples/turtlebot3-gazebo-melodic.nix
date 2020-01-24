with import ../. {};
with rosPackages.melodic;
with pythonPackages;

mkShell {
  buildInputs = [
    glibcLocales
    (buildEnv { paths = [
      turtlebot3-description
      turtlebot3-teleop
      turtlebot3-gazebo
      gazebo-plugins
      xacro
    ]; })
  ];

  ROS_HOSTNAME = "localhost";
  ROS_MASTER_URI = "http://localhost:11311";
  TURTLEBOT3_MODEL = "burger";
}
