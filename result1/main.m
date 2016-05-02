%Change the following dir to include your own local directory
mydir = '/Users/guil/repo/cs513-project/result1';
cd(mydir);

filename = 'final.txt';

display ('TODO');

data = importdata(filename,',');


% subset of first 100000 points. Modify it to include more or all the
% points given in the input file

x = data(1:100000,1);
y = data(1:100000,2);
z = data(1:100000,3);

a = 1;

% 3d scattering. 
scatter3(x,y,z, 'filled')

%%scatter(x,y,a,'filled');
