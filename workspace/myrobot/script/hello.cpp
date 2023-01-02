#include <gazebo/gazebo.hh> // include a core set of basic gazebo functions to use in your code

namespace gazebo
{
  class WorldPluginMyRobot : public WorldPlugin // create plugin WorldPluginMyRobot class that inherits from the gazebo WorldPlugin class. This class offers multiple functions and variables, but here we will be only using the contructor and one of the functions.
  {
  	// insde the constructor in this class, here bottom are printing the hello world statement.
    public: WorldPluginMyRobot() : WorldPlugin()
            {
              printf("Hello World!\n");
            }
    // The load function below is mandatory and should always be included, as it receives informatioin from the world file.
    public: void Load(physics::WorldPtr _world, sdf::ElementPtr _sdf)
            {
            }
  };
  GZ_REGISTER_WORLD_PLUGIN(WorldPluginMyRobot) // The last step is to register the plugin with the simluator.
}