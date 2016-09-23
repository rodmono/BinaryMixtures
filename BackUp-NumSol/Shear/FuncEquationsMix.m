%%%%%%%%%%%%
% ----------
% Last modification: 08.10.2014
% I changed the factor before lambdaA and lambdaB (check notes on the new notebook)
% ----------
%%%%%%%%%%%%
function dAB = FuncEquationsMix(t, X, Theta, Shear, Sigma, Tumbling)
  %%%%%%%%%%%%
  % ----------
  % We define the auxiliar functions for the relaxational part
  % ----------
  % The fisrt 5 are for component A
  % The other 5 are for component B
  %
  % Theta = [ThetaA ThetaB ThetaAB]
  % Tumbling = [TumblingA TumblingB]
  %
  % ----------
  %%%%%%%%%%%%
  %%%%%%%%%%%%
  % ----------
  % Relaxational part
  % ----------
  % The fisrt 5 are for component A
  % The other 5 are for component B
  % ----------
  %%%%%%%%%%%%
  PhiAB = zeros(10,1);
  % ----------
  A_sq = X(1)^2 + X(2)^2 + X(3)^2 + X(4)^2 + X(5)^2;
  B_sq = X(6)^2 + X(7)^2 + X(8)^2 + X(9)^2 + X(10)^2;
  mix  = X(1)*X(6) + X(2)*X(7) + X(3)*X(8) + X(4)*X(9) + X(5)*X(10);
  % ----------
  %%%%%%%%%%%%
  % ----------
  % Relaxation: component A
  % ----------
  %%%%%%%%%%%%
  PhiAB(1)   = X(1)*(Theta(1) - 2*X(1) + 2*A_sq) + 2*(X(2)^2 + X(3)^2) - (X(4)^2 + X(5)^2) - X(6)*(Theta(3) + mix);
  PhiAB(2)   = X(2)*(Theta(1) + 4*X(1) + 2*A_sq) - sqrt(3)*(X(4)^2 - X(5)^2)               - X(7)*(Theta(3) + mix);
  PhiAB(3)   = X(3)*(Theta(1) + 4*X(1) + 2*A_sq) - 2*sqrt(3)*X(4)*X(5)                     - X(8)*(Theta(3) + mix);
  PhiAB(4)   = X(4)*(Theta(1) - 2*X(1) + 2*A_sq) - 2*sqrt(3)*(X(2)*X(4) + X(3)*X(5))       - X(9)*(Theta(3) + mix);
  PhiAB(5)   = X(5)*(Theta(1) - 2*X(1) + 2*A_sq) + 2*sqrt(3)*(X(2)*X(5) - X(3)*X(4))       - X(10)*(Theta(3) + mix);
  %%%%%%%%%%%%
  % ----------
  % Relaxation: component B
  % ----------
  %%%%%%%%%%%%
  PhiAB(6)   = X(6)*(Theta(2) - 2*X(6) + 2*B_sq)  + 2*(X(7)^2 + X(8)^2) - (X(9)^2 + X(10)^2)  - X(1)*(Theta(3) + mix);
  PhiAB(7)   = X(7)*(Theta(2) + 4*X(6) + 2*B_sq)  - sqrt(3)*(X(9)^2 - X(10)^2)                - X(2)*(Theta(3) + mix);
  PhiAB(8)   = X(8)*(Theta(2) + 4*X(6) + 2*B_sq)  - 2*sqrt(3)*X(9)*X(10)                      - X(3)*(Theta(3) + mix);
  PhiAB(9)   = X(9)*(Theta(2) - 2*X(6) + 2*B_sq)  - 2*sqrt(3)*(X(7)*X(9) + X(8)*X(10))        - X(4)*(Theta(3) + mix);
  PhiAB(10)  = X(10)*(Theta(2) - 2*X(6) + 2*B_sq) + 2*sqrt(3)*(X(7)*X(10) - X(8)*X(9))        - X(5)*(Theta(3) + mix);
  %%%%%%%%%%%%
  % ----------
  % Equations of motion
  % ----------
  % The fisrt 5 are for component A
  % The other 5 are for component B
  % ----------
  %%%%%%%%%%%%
  dAB = zeros(10,1);
  %%%%%%%%%%%%
  % ----------
  % Equations of motion component A
  % ----------
  %%%%%%%%%%%%
  % Cheat realted to relaxational time
  dAB(1)  = -PhiAB(1) - sqrt(1/3)*Shear*Sigma*X(3);
  dAB(2)  = -PhiAB(2) + Shear*X(3);
  dAB(3)  = -PhiAB(3) - Shear*X(2) - sqrt(1/3)*Shear*Sigma*X(1) + Tumbling(1)*Shear;
  dAB(4)  = -PhiAB(4) + (1/2)*Shear*(Sigma + 1)*X(5);
  dAB(5)  = -PhiAB(5) + (1/2)*Shear*(Sigma - 1)*X(4);
  %%%%%%%%%%%%
  % ----------
  % Equations of motion component B
  % ----------
  %%%%%%%%%%%%
  % Cheat realted to relaxational time
  dAB(6)   = -PhiAB(6)  - sqrt(1/3)*Shear*Sigma*X(8);
  dAB(7)   = -PhiAB(7)  + Shear*X(8);
  dAB(8)   = -PhiAB(8)  - Shear*X(7) - sqrt(1/3)*Shear*Sigma*X(6) + Tumbling(2)*Shear;
  dAB(9)   = -PhiAB(9)  + (1/2)*Shear*(Sigma + 1)*X(10);
  dAB(10)  = -PhiAB(10) + (1/2)*Shear*(Sigma - 1)*X(9);

end