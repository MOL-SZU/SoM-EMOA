function [Archive,minVal] = UpdateArchive(Archive,Offspring,minVal)
    offObj = Offspring.obj;
    [minVal,minIndex] = min([minVal;offObj],[],1);
    
    Archive(minIndex==2) = Offspring;
end