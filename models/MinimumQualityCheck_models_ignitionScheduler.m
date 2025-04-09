classdef MinimumQualityCheck_models_ignitionScheduler < matlab.unittest.TestCase
  methods (TestMethodSetup)
    function myTestMethodSetup(testcase)
      close all
      bdclose all
      addTeardown(testcase, @my_teardown)
      function my_teardown()
        close all
        bdclose all
      end  % nested function
    end  % function
  end  % methods
  methods (Test)
    function run_short_sim(~)
      mdl = "ignitionScheduler";
      evalin("base", "initCtrl")
      evalin("base", "initPlant")
      load_system(mdl)
      sim_in = Simulink.SimulationInput(mdl);
      sim_in = setModelParameter(sim_in, StopTime="0.1");
      sim(sim_in);
    end  % function
  end  % methods
end  % classdef
