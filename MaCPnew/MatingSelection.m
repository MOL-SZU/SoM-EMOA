function Parents = MatingSelection(Population,Archive,minPopulation,minArchive)
    Parent1 = Population(randperm(end,1));
    distance = minPopulation-minArchive;
    % 假设 a 是一个 n 维向量，元素均为非负数
    s = sum(distance);
    if s==0
        Parent2 = Archive(randperm(end,1));
    else
        prob = distance/s;                % 归一化为概率
        cum_prob = cumsum(prob);             % 计算累计概率
        r = rand();                          % 生成一个[0,1]随机数
        index = find(cum_prob >= r, 1);      % 根据随机数找到对应的索引    
        Parent2 = Archive(index);
    end
    Parents = [Parent1,Parent2];
end