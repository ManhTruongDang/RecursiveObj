function [list_of_all_folders] = list_all_folders_in_a_directory(directory)
% Utility function
directory_list = dir(directory); 
directory_list(1:2) = []; % Remove "." and ".."
dir_flags = [directory_list.isdir];
subfolder_list = directory_list(dir_flags);
temp = cell(1, numel(subfolder_list));
for i = 1 : numel(subfolder_list)
    temp{i} = subfolder_list(i).name;
end
list_of_all_folders = temp;

end

