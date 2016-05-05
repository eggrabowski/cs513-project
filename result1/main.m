%Change the following dir to include your own local directory
mydir = '/Users/guil/repo/cs513-project/result1/';
cd(mydir);

filename = 'final.txt';

display('Importing input data...');
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

display('Removing noise from input data...');
fid = fopen( 'final_noise_rem.txt', 'wt' );

for i=1:nSlices,
    Text = ['    +Processing slice number ', num2str(i), ' of ', num2str(nSlices), '...'];
    disp(Text);

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

disp('OK')

data = importdata('final_noise_rem.txt',',');


figures = floor(length(data) / 100000);
rest = length(data) - figures*100000;


for count = 1:figures
    
    Text = ['    +Processing figure number ', num2str(count), '...'];
    disp(Text);
    lowestBound = (count - 1) * 100000 + 1;
    higestBound = count * 100000;
    x2 = data(lowestBound:higestBound,1);
    y2 = data(lowestBound:higestBound,2);
    z2 = data(lowestBound:higestBound,3);

    f = figure();
    scatter3(x2,y2,z2,1, 'filled');
    s1 = 'finalData/figure';
    s2 = '.png';
    
    sF = strcat (s1,num2str(count));
    sF = strcat (sF, s2);
    
    saveas(f, sF);
end

    count = figures + 1;
    Text = ['    +Processing figure number ', num2str(count), '...'];
    disp(Text);
    lowestBound = (count - 1) * 100000 + 1;
    higestBound = (count - 1) * 100000 + rest;
    x2 = data(lowestBound:higestBound,1);
    y2 = data(lowestBound:higestBound,2);
    z2 = data(lowestBound:higestBound,3);

    f = figure();
    scatter3(x2,y2,z2,1, 'filled');
    s1 = 'finalData/figure';
    s2 = '.png';
    
    sF = strcat (s1,num2str(count));
    sF = strcat (sF, s2);
    
    saveas(f, sF);
    

disp ('DONE');
