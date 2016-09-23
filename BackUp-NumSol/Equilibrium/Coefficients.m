%  This function calculates de coefficients depending on  the aspect ratio and density of the molecules
%  Results from the analytical calculations done in the appendix.

% These coefficients are fixed for uniaxial nematics

function coef = Coefficients(density, aspratio)

%   For density and aspect ratio
%   (1) component A
%   (2) component B

%  (A,B,C) Coeficients for the first component A
coef(1) = (1/2.)*density(1) - (1/10.)*density(1)*density(1)*( ( 5*pi*pi/64. - 5*pi*aspratio(1)/12. + 5*pi*aspratio(1)*aspratio(1)/16.) );
coef(2) = sqrt(5)/21.*density(1);
coef(3) = (5/28.)*density(1) - (1/18.)*density(1)*density(1)*( ( 9*pi*pi/512. + pi*aspratio(1)/40. + 9*pi*aspratio(1)*aspratio(1)/128.) );

%  (A,B,C) Coeficients for the first component B
coef(4) = (1/2.)*density(2) - (1/10.)*density(2)*density(2)*( ( 5*pi*pi/64. - 5*pi*aspratio(2)/12. + 5*pi*aspratio(2)*aspratio(2)/16.) );
coef(5) = sqrt(5)/21.*density(2);
coef(6) = (5/28.)*density(2) - (1/18.)*density(2)*density(2)*( ( 9*pi*pi/512. + pi*aspratio(2)/40. + 9*pi*aspratio(2)*aspratio(2)/128.) );

%  (A,C) Coeficients for the cross components AB
coef(7) = - (1/5.)*density(1)*density(2)*( ( 5*pi*pi/64. - 5*pi*(aspratio(1) + aspratio(2))/24. + 5*pi*aspratio(1)*aspratio(2)/32.) );
coef(8) = - (1/9.)*density(1)*density(2)*( ( 9*pi*pi/512. + pi*(aspratio(1) + aspratio(2))/80. + 9*pi*aspratio(1)*aspratio(2)/256.) );

end