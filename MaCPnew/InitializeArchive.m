function [Archive,minVal] = InitializeArchive(Population)
    objs = Population.objs;
    [minVal, minIndex] = min(objs, [], 1);
    Archive = Population(minIndex);
end