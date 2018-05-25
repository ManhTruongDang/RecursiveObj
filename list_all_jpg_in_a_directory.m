function [list_of_all_jpg] = list_all_jpg_in_a_directory(directory)
% Utility function 
directory_list = dir(directory); 
directory_list(1:2) = []; % Remove "." and ".."
dir_flags = [directory_list.isdir];
file_list = directory_list(dir_flags == 0);
temp = cell(1, numel(file_list));
for i = 1 : numel(file_list)
    temp{i} = file_list(i).name;
end
list_of_all_files = temp;

num_of_files = numel(list_of_all_files);
list_of_all_jpg = cell(1,0);
for i = 1 : num_of_files
    file_name = list_of_all_files{i};
    [~,~,ext] = fileparts(file_name);
    if strcmp(ext, '.jpg') == 1
        list_of_all_jpg{end+1} = file_name;
    end
end
end
