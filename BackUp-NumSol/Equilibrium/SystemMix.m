%%%%%%
% Function that defines the system
%  Results from the analytical calculations done in the appendix.
%%%%%%
function [f] = SystemMIx(S,Coef)
% Represents a system of 2 non-linear equations
  
  Aa = Coef(1);Ba = Coef(2);Ca = Coef(3);
  Ab = Coef(4);Bb = Coef(5);Cb = Coef(6);
  Aab = Coef(7);Cab = Coef(8);
  
  eq1 = S(1)*(2*Aa - 3*Ba*S(1) + 4*Ca*S(1)^2) + S(2)*(Aab + 2*Cab*S(1)*S(2));
  eq2 = S(2)*(2*Ab - 3*Bb*S(2) + 4*Cb*S(2)^2) + S(1)*(Aab + 2*Cab*S(1)*S(2));
  
  f = [eq1;eq2];
end
%%%%%%