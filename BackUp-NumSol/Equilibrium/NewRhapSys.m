function x = NewRhapSys(x0,func,deriv)
  
  N = 10000; % Iterations
  tolerance = 1e-10; % Tolerance
  maxval = 1000.0; % Value for divergence
  
  xx = x0; % Initial guess

  while (N>0)
    JJ = deriv(xx);
    if abs(det(JJ)) < tolerance
%        error(' Jacobian is singular - try new x0');
%        abort;
    end;

    xn = xx - inv(JJ)*func(xx);
    if abs(func(xn)) < tolerance
      x=xn;
      iter = 10000-N;
      return;
    end;
    
    if abs(func(xx)) > maxval
      iter = 10000-N;
    end;
    
    N = N - 1;
    xx = xn;
    
    if (N==0)
      x = xn;
      iter = 10000-N;
      break;
    end;
  end;
%    error('No convergence after 1000 iterations.');
end
