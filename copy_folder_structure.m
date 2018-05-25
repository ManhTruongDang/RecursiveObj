function [] = copy_folder_structure(current_source_dir, current_dest_dir)
% Copy folder tree without copying contents
% Written by Dang Manh Truong (dangmanhtruong@gmail.com)
subfolder_list = list_all_folders_in_a_directory(current_source_dir);
num_of_subfolders = numel(subfolder_list);
for i = 1 : num_of_subfolders
    subfolder_name = subfolder_list{i};
    mkdir(current_dest_dir, subfolder_name);    
end
% Recursion
for i = 1 : num_of_subfolders
    subfolder_name = subfolder_list{i};
    copy_folder_structure(fullfile(current_source_dir, subfolder_name), fullfile(current_dest_dir, subfolder_name));
end

end

