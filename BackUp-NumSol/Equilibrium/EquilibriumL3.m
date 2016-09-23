%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ----------
% 01-07-14
% Just to plot and check what happens in equilibrium
% ----------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ----------
% The input for the program is the density, molar fraction of long rods and aspect ratios
% ----------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
SisDensity = 0.2;
xlong = 0.2;
xshort = 1-xlong;
% ----------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ----------
% Long rods
densityA  = SisDensity*xlong;
aspratioA = 20.0;
% ----------
% Short rods
densityB  = SisDensity*xshort;
aspratioB = 24.0;
% ----------
% Coefficients and Density
Coef = CoefficientsL3([densityA densityB],[aspratioA aspratioB]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ----------
% Plotting the Equilibrium results for the specific input parameters
% ----------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ----------
ax = -sqrt(5)/2;
bx = sqrt(5);
ay = -sqrt(5)/2;
by = sqrt(5);
x = [ax:0.1:bx];
y = [ay:0.1:by];
[xx,yy] = meshgrid(x,y);

Energia = @(x,y) Energy(x,y,Coef);
 
% ----------
% Defining the energy to plot
E = Energia(xx,yy);
% ----------
% Setting up the figure
figure
axis tight
shading interp
colormap gray
cmap = colormap;
cmap = flipud(cmap);
colormap(cmap);
contourf(xx,yy,E,20); hold on; 
colorbar
%  %  caxis([-0.0534 0.6619])
%  %  caxis([-1.8006 1.8006])
%  xlabel(strcat('q_{long}. x_S = ',num2str(xshort)))
%  ylabel(strcat('q_{short}. x_L = ',num2str(xlong)))
%  dratio = (diameterA/diameterB);
%  kratio = (aspratioA/aspratioB);
%  title(strcat('Helmholtz free energy density. \kappa_{short}/\kappa_{long} = ', num2str(kratio)))
% ----------
%  % We start the calculations
System = @(xx) SystemMix(xx,Coef);
Jacobian = @(xx) JacobianMix(xx,Coef);
% ----------
roots = [];
for i = 1:length(x)
  for j = 1:length(y)
    result = NewRhapSys([x(i);y(j)],System,Jacobian);
    roots = [roots ; result(1) result(2)];
  end
end
% ----------
% Final plot (For equilibrium)
hold on; plot(roots(:,1),roots(:,2),'r.','MarkerSize',20)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%