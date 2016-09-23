%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ----------
% 01-07-14 
% Calculate the phase diagram changing reduced density and molar concentration of one specie
%  Results from the analytical calculations done in the appendix.
% ----------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ----------
% First the coefficients
% ----------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
SysDensity = 0.00075:0.00075:0.025;
xlong = 0.05:0.05:0.95;
xshort = 1-xlong;
% ----------
% ----------
% Long rods
%  DenLong  = SysDensity*xlong;
klong = 25.0;
% ----------
% Short rods
%  DenShort  = SysDensity*xshort;
kshort = 20.0; % Asp. ratio
% ----------

%  MinEnergy = [];
Leg = cell(length(xlong),1);
Isotropic = [];
Nematic = [];
Flag = 3;

MinEnergy = [];

for i = 1:length(xlong)
  for j = 1:length(SysDensity)
    % ----------
    % Minimum value of the energy
    DenLong  = SysDensity(j)*xlong(i);
    DenShort = SysDensity(j)*xshort(i);
    
    aux = GetMinimum( [DenShort DenLong], [kshort klong] );
    
    MinEnergy = [MinEnergy ; aux];
    
    Minene = round(aux*100000)/100000;
    
    
    % ----------
    % To determine if it is in a Nematic or Isotropic state
    if Minene == 0
      Isotropic = [Isotropic ; xlong(i) SysDensity(j)];
    else
      Nematic = [Nematic ; xlong(i) SysDensity(j)];
    end
    SysDensity(j)
    end
    xlong(i)
end

% ----------
% We plot the phase diagram
%  figure1 = figure;
%  set(figure1, 'Position', [0 0 620 600])
%  axes1 = axes('Parent',figure1,'FontSize',16,'FontAngle','normal');
%  hold(axes1,'all');
%  scatter(Isotropic(:,1),Isotropic(:,2),20,'ob','MarkerFaceColor','b','Parent',axes1,'DisplayName','Isotropic') ; hold on
%  scatter(Nematic(:,1),Nematic(:,2),24,'sr','MarkerFaceColor','r','Parent',axes1,'DisplayName','Nematic'); hold on
%  axis([0.0 1.0 0.0 6.0])
%  xlabel('Mole fraction: x_{long}','FontWeight','demi','FontSize',25,'FontAngle','italic');
%  ylabel('Reduced density: \rho^*','FontWeight','demi','FontSize',25,'FontAngle','italic');
%  legend1 = legend(axes1,'show');
%  set(legend1,'Position',[0.58 0.67 0.31 0.24],'FontSize',25);
isotfile = strcat('Isotropic_',num2str(klong),'_',num2str(kshort),'.dat')
nemfile = strcat('Nematic_',num2str(klong),'_',num2str(kshort),'.dat')
save(isotfile,'Isotropic','-ASCII');
save(nemfile,'Nematic','-ASCII');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ----------
% Output: Phase Diagram
% ----------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%