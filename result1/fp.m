mydir = 'D:\class_project';
tempdir = dir(mydir);
num_folder = length(tempdir);
fid = fopen( 'final.txt', 'wt' );
for i = 4:num_folder
    %filename = [mydir,'/',tempdir(i).name,'/','dump_index.txt'];
    foldername = fullfile(mydir,tempdir(i).name);
    folder_dir = dir(foldername);
    num_file = length(folder_dir);
    for j = 4: num_file
        filename = fullfile(foldername,folder_dir(j).name);
        data = importdata(filename,',');
        if (size(data,2) == 6)
            num_med = median(data(:,5));
            for row = 1: size(data,1)
                if data(row, 6)/255 > 0.75 && (data(row, 5) < num_med+0.5 && data(row, 5) > num_med-0.5) 
                    fprintf(fid,' %e, %e, %e\n',data(row,3),data(row,4),data(row,5));
                end
            end
        end 
    end
end
fclose(fid);