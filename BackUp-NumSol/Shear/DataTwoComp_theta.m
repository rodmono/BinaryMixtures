% Varying effective concentration

function AD = DataTwoComp_theta( TA, TB, TAB, Shear, Sigma, TumblingA, TumblingB)

  %%%%%%%%%%%%
  % ----------
  % Generating a cell array containing matrices (time,a0,a1,a2,a3,a4) 
  % for different parameters (tumbling parameter and shear rate)
  % ----------
  % Shear    = min:step_size:max
  % Tumbling = min:step_size:max
  %%%%%%%%%%%%

  tic
  
  AD { length(TB) , length(Shear) } = [];

  for i = 1:length(TB)
  
    fprintf(strcat('ThetaA  \t = \t', num2str(TA(i)),'\n'))
    fprintf(strcat('ThetaB  \t = \t', num2str(TB(i)),'\n'))
    fprintf(strcat('ThetaAB \t = \t', num2str(TAB(i)),'\n'))
    
    Theta = [TA(i) TB(i) TAB(i)];
    
    for j = 1:length(Shear)
      
      % Solving the equations of motion for current parameters

      AD{i,j} = SolveTwoComp(Theta, Shear(j), Sigma, [TumblingA TumblingB]);

      % only save a sample containing the components for higher time values

      AD{i,j} = AD{i,j}(25000:end,:);
    
    end
  end

  % Send to file
  % path = strcat('ComponentA_Tumbling_',num2str(Tumbling(1)),'-', num2str(Tumbling(end)),'_Shear',num2str(Shear(1)),'-', num2str(Shear(end)),'_Theta_',num2str(Theta),'_Sigma',num2str(Sigma),'.mat')
  % save(path,'AD');

  elapsed_time = toc

end