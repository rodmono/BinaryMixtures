%%%%%%%%%%%%
% ----------
% Generating a file containing the state of the system 
% ----------
% 1 = Flow Aligning
% 2 = Tumbling
% 3 = Wagging  
% 4 = Kayaking Tumbling  
% 5 = Kayaking Wagging  
% 6 = Chaos  
% ----------
% AD : cell array containing matrices
% (time,a0,a1,a2,a3,a4) for different parameters (tumbling parameter and
% shear rate)
% ----------
%%%%%%%%%%%%

function AnalyzeDataOneComp(Tumbling, Shear, Theta, Sigma, AD)

tic

% working through all the componentes of the input cell array
path = strcat('Plot_Tumbling_',num2str(Tumbling(1)),'-', num2str(Tumbling(end)),'_Shear',num2str(Shear(1)),'-', num2str(Shear(end)),'_Theta_',num2str(Theta),'_Sigma',num2str(Sigma),'.dat')
fid = fopen(path,'wt')

  for k = 1:length(Shear);
    
    fprintf(fid,'\n');
    
    for l = 1:length(Tumbling);

      alignment = AD{l,k};

      % Calculating the Fourier Transform to analyse the dynamic behavior 
      Sample = length(alignment);
      half = int16(floor(Sample*0.5));
      Alignment = fft(alignment);
      FFT = 2*abs(Alignment)/Sample;

      % looking for different states of the system
      % Note that indices for the alignment tensor component here go from 2 to 6,
      % because a1 is the time

      % check for flow alignment
      
      tol = 2.5*10^-2;
      
      if     ( all(FFT(2:half,:) <= tol))
      
        fprintf(fid,'%d %d %d\n',Tumbling(l), Shear(k), 1.0);
      
      elseif ( all(FFT(2:half,4) <= tol) && all(FFT(2:half,5) <= tol))
      
      % check for tumbling
        if     ( any(alignment(:,2)<0) && any(alignment(:,2)>0))
          
          fprintf(fid,'%d %d %d\n',Tumbling(l), Shear(k), 2.0);
          
      % check for wagging   
        elseif ( any(alignment(:,2)<0) || any(alignment(:,2)>0))
    
          fprintf(fid,'%d %d %d\n',Tumbling(l), Shear(k), 3.0);
      
        end
        
      elseif ( any(FFT(2:half,4) <= tol) && any(FFT(2:half,5) <= tol))
      
      % check for kayaking tumbling      
        if   ( any(alignment(:,4)<0) && any(alignment(:,4)>0) && any(alignment(:,5)<0) && any(alignment(:,5)>0) )
      
          fprintf(fid,'%d %d %d\n',Tumbling(l), Shear(k), 4.0);
          
      % check for kayaking wagging    
        elseif ( any(alignment(:,4)<0) || any(alignment(:,4)>0) && any(alignment(:,5)<0) || any(alignment(:,5)>0) )
      
        fprintf(fid,'%d %d %d\n',Tumbling(l), Shear(k), 5.0);
        
        end
      
      else
      
        fprintf(fid,'%d %d %d\n',Tumbling(l), Shear(k), 6.0);
          
      end
      
    end
    
  end

fclose(fid);
  
elapsed_time = toc

end
