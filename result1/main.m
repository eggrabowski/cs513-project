%Change the following dir to include your own local directory
mydir = '.';
cd(mydir);

filename = 'final.txt';

display ('TODO');

data = importdata(filename,',');


% % % % subset of first 100000 points. Modify it to include more or all the
% % % % points given in the input file
% % % 
% % % %  x = data(1:100000,1);
% % % %  y = data(1:100000,2);
% % % %  z = data(1:100000,3);

x = data(:,1);
y = data(:,2);
z = data(:,3);
a = 1;
epsilon = 0.00005;
MinPts=1;
sliceSize=15000;

len = length(x);
nSlices = ceil(len/sliceSize);

fid = fopen( 'final_noise_rem.txt', 'wt' );

for i=1:nSlices,
    minIndex = (sliceSize*(i-1))+1;
    maxIndex = minIndex + (sliceSize-1);
    if (maxIndex>len), 
        maxIndex=len;
    end
    X=[x(minIndex:maxIndex) y(minIndex:maxIndex) z(minIndex:maxIndex)];
    Y=[x(minIndex:maxIndex) y(minIndex:maxIndex)];
    IDX=DBSCAN(Y,epsilon,MinPts);
    biggestCluster=getBiggestCluster(IDX);
    for j=1:length(IDX),
        if (IDX(j)==biggestCluster)
            fprintf(fid,' %e, %e, %e\n',X(j,1),X(j,2),X(j,3));
        end
    end
end

fclose(fid);

data = importdata('final_noise_rem.txt',',');

x2 = data(:,1);
y2 = data(:,2);
z2 = data(:,3);

scatter3(z2,y2,x2,5, 'filled');