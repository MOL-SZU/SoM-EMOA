function Parents = MatingSelection(Population,Archive,minPopulation,minArchive)
    Parent1 = Population(randperm(end,1));
    distance = minPopulation - minArchive;

    s = sum(distance);
    if s == 0
        Parent2 = Archive(randperm(end,1));
    else
        prob = distance / s;
        cumProb = cumsum(prob);
        r = rand();
        index = find(cumProb >= r,1);
        Parent2 = Archive(index);
    end

    Parents = [Parent1,Parent2];
end
