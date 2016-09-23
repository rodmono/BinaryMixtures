function AD = DataTwoComp(Theta, Shear, Sigma, TumblingA, TumblingB)

  %%%%%%%%%%%%
  % ----------
  % Generating a cell array containing matrices (time,a0,a1,a2,a3,a4) 
  % for different parameters (tumbling parameter and shear rate)
  % ----------
  % Shear    = min:step_size:max
  % Tumbling = min:step_size:max
  %%%%%%%%%%%%

  tic
  
  AD { length(TumblingB) , length(Shear) } = [];

  for i = 1:length(TumblingB)
  
    fprintf(strcat('TumblingA \t = \t',num2str(TumblingA),'\n'))
    fprintf(strcat('TumblingB \t = \t',num2str(TumblingB(i)),'\n'))
  
    for j = 1:length(Shear)
      
      % Solving the equations of motion for current parameters

      AD{i,j} = SolveTwoComp(Theta, Shear(j), Sigma, [TumblingA TumblingB(i)]);

      % only save a sample containing the components for higher time values

      AD{i,j} = AD{i,j}(25000:end,:);
    
    end
  end

  % Send to file
  % path = strcat('ComponentA_Tumbling_',num2str(Tumbling(1)),'-', num2str(Tumbling(end)),'_Shear',num2str(Shear(1)),'-', num2str(Shear(end)),'_Theta_',num2str(Theta),'_Sigma',num2str(Sigma),'.mat')
  % save(path,'AD');

  elapsed_time = toc

end