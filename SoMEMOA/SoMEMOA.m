classdef SoMEMOA < ALGORITHM
% <2025> <multi> <real/integer/label/binary/permutation> <constrained/none>
% SoM-EMOA
% k      --- 3 --- Number of offspring generated in each iteration
%
%------------------------------- Reference --------------------------------
% SoM-EMOA for Many-objective Cover Problem (arXiv:2601.06387)
%--------------------------------------------------------------------------

    methods
        function main(Algorithm,Problem)
            k = Algorithm.ParameterSet(3);

            %% Generate random population
            Population = Problem.Initialization();
            [Archive,minArchive] = InitializeArchive(Population);

            Population = Population(randperm(Problem.N,k));
            minPopulation = min(Population.objs,[],1);

            %% Optimization
            while Algorithm.NotTerminated(Population)
                for i = 1 : k
                    Parents = MatingSelection(Population,Archive,minPopulation,minArchive);
                    Offspring = OperatorGAhalf(Problem,Parents);

                    [Archive,minArchive] = UpdateArchive(Archive,Offspring,minArchive);
                    [Population,~,minPopulation] = Reduce(Population,Offspring,minPopulation);
                end
            end
        end
    end
end
