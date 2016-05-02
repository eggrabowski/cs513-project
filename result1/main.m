mydir = 'D:\cs513-project\result1';
cd(mydir);

filename = 'final.txt';

display('TODO');

data = importdata(filename,',');

x = data(:,1);
y = data(:,2);

a = 1;

scatter(x,y,a,'filled');