function biggest = getBiggestCluster( IDX )
    len = length(IDX);
    nClusters = max(IDX);
    clusterSize = zeros(nClusters,1);
    for i=1:len,
        clusterSize(IDX(i)) = clusterSize(IDX(i)) + 1;
    end
    biggest = 1;
    for i=1:nClusters,
        if clusterSize(i)>clusterSize(biggest),
            biggest = i;
        end
    end
end

