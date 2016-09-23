function X = SolveTwoComp(Theta, Shear, Sigma, Tumbling)

  %%%%%%%%%%%%
  % ----------
  % Time span of integration
  % ----------
  %%%%%%%%%%%%

  tspan = 0:0.1:3000;

  %%%%%%%%%%%%
  % ----------
  % Integrate using ode45
  % ----------
  %%%%%%%%%%%%
  X_ini = (1-(-1)).*rand(10,1) + (-1);
  
  ODE = @(t, X) FuncEquationsMix(t, X, Theta, Shear, Sigma, Tumbling);
  [t,X] = ode45(ODE, tspan, X_ini);
  
end