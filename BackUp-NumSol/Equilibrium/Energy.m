%  This function calculates de uniaxial energy depending on  the aspect ratio and density of the molecules
%  Results from the analytical calculations done in the appendix.

function E = Energy(xx, yy, Coef)
  
  E = Coef(1)*(xx.^2) - Coef(2)*(xx.^3) + Coef(3)*(xx.^4) + Coef(4)*(yy.^2) - Coef(5)*(yy.^3) + Coef(6)*(yy.^4) + Coef(7)*(xx.*yy) + Coef(8)*(xx.^2).*(yy.^2);

end