%  This function calculates de uniaxial energy depending on  the aspect ratio and density of the molecules
%  Results from the analytical calculations done in the appendix.

function f = GetMinimum(density, aspratio);

  %Coefficients and Density
  Coef = Coefficients(density, aspratio);
  %%%%%%

  ax = -sqrt(5)/2;
  bx = sqrt(5);
  ay = -sqrt(5)/2;
  by = sqrt(5);

  System = @(xx) SystemMix(xx,Coef);
  Jacobian = @(xx) JacobianMix(xx,Coef);

  x0 = [ax:0.5:bx];
  y0 = [ay:0.5:by]; 
  roots = [];
    
  for i = 1:length(x0)
    for j = 1:length(y0)
      result = NewRhapSys([x0(i);y0(j)],System,Jacobian);
      roots = [roots ; result(1) result(2)];
      end
  end
  
  %%%%%
  % Find minimum
  %%%%%
  E = [];
  Energia = @(x,y) Energy(x,y,Coef);
  for i = 1:length(roots(:,1))
    if(and( and( ax <= roots(i,1) , roots(i,1) <= bx) , and(ay <= roots(i,2) , roots(i,2) <= by) ) )
      E = [E ; roots(i,1) roots(i,2)  Energia(roots(i,1),roots(i,2)) ];
    end
  end

  preFinal = min(E(:,3));
  preFinal2 = 0.0;
  %%%%%
  % Check if the minimum found is the real minimum
  %%%%%
  aux =  round(preFinal*1000)/1000;
  
  
  
  if aux == 0
    % Check the 8 extremes of the energy landscape to compare
    % Corners and center
    half = 0.5*(bx - ax);
    cero = Energia(0.0,0.0);
    uno = Energia(ax,ay);
    dos = Energia(half,ay);
    tres = Energia(bx,ay);
    cuatro = Energia(bx,half);
    cinco = Energia(bx,by);
    seis = Energia(half,by);
    siete = Energia(ax,by);
    ocho = Energia(ax,half);
    CorCen = [cero, uno, dos, tres, cuatro, cinco, seis, siete, ocho];
    preFinal2 = min(CorCen);
  end
  
  
  f = min(preFinal,preFinal2);
  
end