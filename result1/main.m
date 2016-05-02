mydir = '/Users/guil/repo/cs513-project/result1';
cd(mydir);

filename = '190.txt';

display ('TODO');

data = importdata(filename,',');

x = data(1:100000,1);
y = data(1:100000,2);
z = data(1:100000,3);

a = 5;

% 3d scattering. Right now it only takes a subset of the first 100000 cloud
% points and fills them

scatter3(x,y,z, 'filled');   
