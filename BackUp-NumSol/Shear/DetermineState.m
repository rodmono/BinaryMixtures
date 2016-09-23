function DetermineState( FileName, Tumbling, Shear, Components)

  % Calculating the Fourier Transform to analyse the dynamic behavior 
  Sample = length(Components);
  half = int16(floor(Sample*0.5));
  Alignment = fft(Components);
  FFT = 2*abs(Alignment)/Sample;

  % looking for different states of the system
  % Note that indices for the alignment tensor component here go from 2 to 6,
  % because a1 is the time

  % check for flow alignment
  
  tol = 2.5*10^-2;
  
  if     ( all(FFT(2:half,:) <= tol))
  
    fprintf(FileName,'%d %d %d\n',Tumbling, Shear, 1.0);
  
  elseif ( all(FFT(2:half,4) <= tol) && all(FFT(2:half,5) <= tol))
  
  % check for tumbling
    if     ( any(Components(:,2)<0) && any(Components(:,2)>0))
      
      fprintf(FileName,'%d %d %d\n',Tumbling, Shear, 2.0);
      
  % check for wagging   
    elseif ( any(Components(:,2)<0) || any(Components(:,2)>0))

      fprintf(FileName,'%d %d %d\n',Tumbling, Shear, 3.0);
  
    end
    
  elseif ( any(FFT(2:half,4) <= tol) && any(FFT(2:half,5) <= tol))
  
  % check for kayaking tumbling      
    if   ( any(Components(:,4)<0) && any(Components(:,4)>0) && any(Components(:,5)<0) && any(Components(:,5)>0) )
  
      fprintf(FileName,'%d %d %d\n',Tumbling, Shear, 4.0);
      
  % check for kayaking wagging    
    elseif ( any(Components(:,4)<0) || any(Components(:,4)>0) && any(Components(:,5)<0) || any(Components(:,5)>0) )
  
    fprintf(FileName,'%d %d %d\n',Tumbling, Shear, 5.0);
    
    end
  
  % check for chaos
  else
  
    fprintf(FileName,'%d %d %d\n',Tumbling, Shear, 6.0);
      
  end

end