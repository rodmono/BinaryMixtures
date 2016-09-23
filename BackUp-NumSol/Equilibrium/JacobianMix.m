%%%%%%
% Function that defines the Jacobian
%  Results from the analytical calculations done in the appendix.
%%%%%%
function [J] = JacobianMix(S,Coef)
% Jacobian for the system of non-linear equations

  Aa = Coef(1);Ba = Coef(2);Ca = Coef(3);
  Ab = Coef(4);Bb = Coef(5);Cb = Coef(6);
  Aab = Coef(7);Cab = Coef(8);
  
  J(1,1) = 2*Aa - 6*Ba*S(1) + 12*Ca*S(1)^2 + 2*Cab*S(2)^2;
  J(1,2) = Aab + 4*Cab*S(1)*S(2);
  J(2,1) = Aab + 4*Cab*S(1)*S(2);
  J(2,2) = 2*Ab - 6*Bb*S(2) + 12*Cb*S(2)^2 + 2*Cab*S(1)^2;

end
%%%%%%