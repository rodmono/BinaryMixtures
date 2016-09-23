%  This function calculates de coefficients depending on  the aspect ratio and density of the molecules
%  Results from the analytical calculations done in the appendix.

% These coefficients are fixed for uniaxial nematics

function coef = CoefficientsL3(density, aspratio)

%   For density and aspect ratio
%   (1) component A
%   (2) component B

%  (A,B,C) Coeficients for the first component A
coef(1) = (1/2.)*density(1) - (1/10.)*density(1)*density(1)*( (3*pi/28.)*(2./(aspratio(1)*aspratio(1))) + (17.*pi/168.)*(2./(aspratio(1)*aspratio(1))) - (5.*pi*pi/128.)*(2./(aspratio(1)*aspratio(1)*aspratio(1))) - (5.*pi/32.)*(2./aspratio(1)) );

coef(2) = sqrt(5)/21.*density(1);

coef(3) = (5/28.)*density(1) - (1/18.)*density(1)*density(1)*( -(pi/140.)*(2./(aspratio(1)*aspratio(1))) - (3.*pi/560.)*(2./(aspratio(1)*aspratio(1))) - (9.*pi*pi/1024.)*(2./(aspratio(1)*aspratio(1)*aspratio(1))) - (9.*pi/256.)*(2./aspratio(1)) );

%  (A,B,C) Coeficients for the first component B
coef(4) = (1/2.)*density(2) - (1/10.)*density(2)*density(2)*( (3*pi/28.)*(2./(aspratio(2)*aspratio(2))) + (17.*pi/168.)*(2./(aspratio(2)*aspratio(2))) - (5.*pi*pi/128.)*(2./(aspratio(2)*aspratio(2)*aspratio(2))) - (5.*pi/32.)*(2./aspratio(2)) );

coef(5) = sqrt(5)/21.*density(2);

coef(6) = (5/28.)*density(2) - (1/18.)*density(2)*density(2)*( -(pi/140.)*(2./(aspratio(2)*aspratio(2))) - (3.*pi/560.)*(2./(aspratio(2)*aspratio(2))) - (9.*pi*pi/1024.)*(2./(aspratio(2)*aspratio(2)*aspratio(2))) - (9.*pi/256.)*(2./aspratio(2)) );

%  (A,C) Coeficients for the cross components AB
coef(7) = (1/5.)*density(1)*density(2)*( (3*pi/28.)*(1./(aspratio(1)*aspratio(1)) + 1./(aspratio(2)*aspratio(2))) + (17.*pi/168.)*(2./(aspratio(1)*aspratio(2))) - (5.*pi*pi/128.)*( ((aspratio(1) + aspratio(2))/(aspratio(1)*aspratio(1)*aspratio(2)*aspratio(2))) ) - (5.*pi/32.)*(1./aspratio(1) + 1./aspratio(2)) );

coef(8) = (1/9.)*density(1)*density(2)*( -(pi/140.)*(1./(aspratio(1)*aspratio(1)) + 1./(aspratio(2)*aspratio(2))) + (3.*pi/560.)*(2./(aspratio(1)*aspratio(2))) - (9.*pi*pi/1024.)*( ((aspratio(1) + aspratio(2))/(aspratio(1)*aspratio(1)*aspratio(2)*aspratio(2))) ) - (9.*pi/256.)*(1./aspratio(1) + 1./aspratio(2)) );

end