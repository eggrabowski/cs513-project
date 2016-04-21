mydir = 'C:\Users\l\Desktop';
cd(mydir);

filename = 'results.txt';

display('TODO');

data = importdata(filename,',');

x = data(row,1);
y = data(row,2);

scatter(x,y,'filled')