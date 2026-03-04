function [Population,originalG,minVal] = Reduce(Population,Offspring,minVal)
% The environmental selection of NSGA-II

%------------------------------- Copyright --------------------------------
% Copyright (c) 2025 BIMK Group. You are free to use the PlatEMO for
% research purposes. All publications which use this platform or any code
% in the platform should acknowledge the use of "PlatEMO" and reference "Ye
% Tian, Ran Cheng, Xingyi Zhang, and Yaochu Jin, PlatEMO: A MATLAB platform
% for evolutionary multi-objective optimization [educational forum], IEEE
% Computational Intelligence Magazine, 2017, 12(4): 73-87".
%--------------------------------------------------------------------------
    % identify the worst solution and remove it from the population 
    originalG = sum(minVal);
    worstIndex = 0;
    newVal = minVal;
    
    offspringObj = Offspring.obj;
    [popSize, m] = size(Population.objs);
    
    indicator = offspringObj <= minVal;
    index = 1:m;
    index = index(indicator==false);
    
    tempVal = minVal;
    tempVal(indicator==true) = offspringObj(indicator==true);
    
    if isempty(index)
        worstIndex = randi(popSize,1);
        Population(worstIndex) = Offspring;
        minVal = offspringObj; 
        originalG = sum(minVal);
    else    
        for i = 1:popSize
            objs = Population.objs;
            individualObj = objs(i,:);
            objs(i,:) = offspringObj;
            for j = index
                if individualObj(j) == minVal(j)
                    tempVal(j) = min(objs(:,j));
                else
                    tempVal(j) = minVal(j);
                end
            end
            newG = sum(tempVal);
            if newG < originalG
                originalG = newG;
                worstIndex = i;
                newVal = tempVal;
            end
        end
        if worstIndex ~= 0
            Population(worstIndex) = Offspring;
            minVal = newVal; 
        end
    end
end