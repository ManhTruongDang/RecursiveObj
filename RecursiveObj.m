classdef RecursiveObj < handle   
    % This is an utility class to perform recursively on file directories
    % 
    % Written by Dang Manh Truong (dangmanhtruong@gmail.com)
    %
    % 2 types of recursive operations are supported:
    % 
    % 1) Operations that does something recursively on a directory and
    % dumps the results at that same directory
    % 
    % Usage:
    % 
    % recursive_obj = RecursiveObj();
    % recursive_obj.do(@(root_dir) your_func(root_dest)) ...
    %       .on(your_root_dir);   
    %
    % 2) Operations that does something recursively on a source directory
    % and dumps the results at a destination directory
    % 
    % Usage:
    % 
    % recursive_obj = RecursiveObj();
    % recursive_obj.do(@(source, dest) your_func(source, dest)) ...
    %       .with_source(your_source_dir) ...
    %       .then_dump_results_at(your_dest_dir);
    
    properties (Access=private)  %GetAccess = SetAccess = private
        func;        
        source_dir;        
    end
    
    methods 
        function obj = RecursiveObj()
            % Do nothing
        end
        
        function obj = do(obj, func)
            obj.func = func;
        end
        
        function obj = on(obj, root_dir)
            % With this method, the results are saved in root_dir            
            obj.func(root_dir);
            subfolder_list = list_all_folders_in_a_directory(root_dir);
            num_of_subfolders = numel(subfolder_list);
            for i = 1 : num_of_subfolders
                subfolder_name = subfolder_list{i};
                obj.func(fullfile(root_dir, subfolder_name));
            end
        end
        
        function obj = with_source(obj, source_dir)
            % Nothing in source_dir is modified
            obj.source_dir = source_dir;
        end
        
        function obj = then_dump_results_at(obj, dest_dir)
            obj.func(obj.source_dir, dest_dir);
            subfolder_list = list_all_folders_in_a_directory(obj.source_dir);
            num_of_subfolders = numel(subfolder_list);
            for i = 1 : num_of_subfolders
                subfolder_name = subfolder_list{i};                
                obj.func(fullfile(obj.source_dir, subfolder_name), ...
                    fullfile(dest_dir, subfolder_name));
            end
        end
    end    
end

