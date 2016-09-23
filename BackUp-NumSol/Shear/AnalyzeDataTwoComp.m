function AnalyzeDataTwoComp(TumblingA, TumblingB, Shear, Theta, Sigma, AD)

tic

%%%%%%%%%%%%
% ----------
% Generating a matrix m containing the state of the system 
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

% Working through all the components of the input cell array
pathA = strcat('Plot_ComponentA_TumblingA_',num2str(TumblingA), '_TumblingB_',num2str(TumblingB(1)),'-', num2str(TumblingB(end)),'_Shear',num2str(Shear(1)),'-', num2str(Shear(end)),'_ThetaA_',num2str(Theta(1)),'_ThetaB_',num2str(Theta(2)),'_ThetaAB_',num2str(Theta(3)),'_Sigma_',num2str(Sigma),'.dat');
pathB = strcat('Plot_ComponentB_TumblingA_',num2str(TumblingA), '_TumblingB_',num2str(TumblingB(1)),'-', num2str(TumblingB(end)),'_Shear',num2str(Shear(1)),'-', num2str(Shear(end)),'_ThetaA_',num2str(Theta(1)),'_ThetaB_',num2str(Theta(2)),'_ThetaAB_',num2str(Theta(3)),'_Sigma_',num2str(Sigma),'.dat');
fidA = fopen(pathA,'wt');
fidB = fopen(pathB,'wt');

  for k = 1:length(Shear);
    
    fprintf(fidA,'\n');
    fprintf(fidB,'\n');
    
    for l = 1:length(TumblingB);

      % To analyze the data we have to separe the solutions
      
      CompA = AD{l,k}(:,1:5);
      DetermineState(fidA, TumblingB(l), Shear(k), CompA);      
      
      CompB = AD{l,k}(:,6:10);
      DetermineState(fidB, TumblingB(l), Shear(k), CompB);
      
    end
    
  end

fclose(fidA);
fclose(fidB);
  
elapsed_time = toc

end

 
