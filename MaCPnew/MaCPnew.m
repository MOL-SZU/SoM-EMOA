classdef MaCPnew < ALGORITHM
% <2025> <multi> <real/integer/label/binary/permutation> <constrained/none>
% MaCP
% k      --- 3 --- The solution set size

%------------------------------- Reference --------------------------------
% An Efficient Evolutionary Algorithm for Many-objective Cover Problem
%------------------------------- Copyright --------------------------------
% Copyright (c) 2025 BIMK Group. You are free to use the PlatEMO for
% research purposes. All publications which use this platform or any code
% in the platform should acknowledge the use of "PlatEMO" and reference "Ye
% Tian, Ran Cheng, Xingyi Zhang, and Yaochu Jin, PlatEMO: A MATLAB platform
% for evolutionary multi-objective optimization [educational forum], IEEE
% Computational Intelligence Magazine, 2017, 12(4): 73-87".
%--------------------------------------------------------------------------

    methods
        function main(Algorithm,Problem)
            k = Algorithm.ParameterSet(3);
            %% Generate random population
            Population = Problem.Initialization();
            [Archive,minArchive] = InitializeArchive(Population);

            Population = Population(randperm(Problem.N,k));
            %minPopulation = minArchive;
            minPopulation = min(Population.objs,[],1);
            %val = [];
            %% Optimization
            while Algorithm.NotTerminated(Population)
                for i=1:k
                    Parents = MatingSelection(Population,Archive,minPopulation,minArchive);
                    Offspring = OperatorGAhalf(Problem,Parents);
                    %TODO: use a more smart method to generate the
                    %offspring
                    [Archive,minArchive] = UpdateArchive(Archive,Offspring,minArchive);
                    [Population,G,minPopulation] = Reduce(Population,Offspring,minPopulation);
                    %val = [val,G];
                    %if Problem.FE >= Problem.maxFE
                    %   a=1; 
                    %end
                end
            end
        end
    end
end