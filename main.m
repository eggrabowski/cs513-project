%%%%%%%%%%%%%%%%%%
%     CS-513     %
%  Final Project %
%%%%%%%%%%%%%%%%%%

display('Initializing script...');

%set the folder path
%ATTENTION. CHANGE DIR TO YOUR PERSONAL DIR WHERE YOUR POINTCLOUD FILES ARE
mydir = '/Users/guil/repo/cs513-project/data/';
cd(mydir);


%opening input file and importing data
fprintf('Opening file "dump0000.txt"... ');
filename_1 = 'dump0000.txt';

display('TODO');

return;

%% BELOW THIS LINE IT STILL DOES NOT WORK. I HAVE TO FIX IT


delimiterIn = ',';


%str = '0.41 8.24 3.57 6.24 9.27';
%C = textscan(str,'%f');
%A_aux = dlmread(filename_1,delimiterIn);

%A_aux = textscan(filename_1, '%f', ',');

A_aux = importdata(filename_1);

display('OK');

fprintf('Transforming to xyz data... ');

%Applies function to transform the point to xyz coordinates
for row = 1:size(A,1)
    [A(row,1),A(row,2),A(row,3)] = lla2ecef(A_aux(row,3),A_aux(row,4),A_aux(row,5));
    A(row,4) = A_aux(row,4);
end

A = rot90(A,3);

display('OK');

%%%%%%%%%%%%%%%%%%%%%%%%%%

%opening file 2
fprintf('Opening file "pointcloud2.fuse"... ');
filename_2 = 'pointcloud2.fuse';

B = importdata(filename_2, delimiterIn);

display('OK');

fprintf('Transforming to xyz data... ');

%Applies function to transform the point to xyz coordinates
for row = 1:size(B,1)
    [B(row,1),B(row,2),B(row,3)] = lla2ecef(B(row,1),B(row,2),B(row,3));
end

B = rot90(B,3);

display('OK');

%%%%%%%%%%%%%%%%%%%%%%%%%%

fprintf('Applying transformation matrix... ');


resultA = T * A;
resultB = T * B;

display('OK');

fprintf('Writing output file "A_result.txt"... ');
dlmwrite('A_result.txt',resultA);
display('OK');

fprintf('Writing output file "B_result.txt"... ');
dlmwrite('B_result.txt',resultB);
display('OK');

display('Script executed sucessfully');



