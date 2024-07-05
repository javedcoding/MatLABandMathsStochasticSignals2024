classdef OwnOperations
    properties
        % Properties of the class (if any)
        integer1
        integer2
    end
    
    methods
        % Constructor
        function obj = OwnOperations(int1, int2)
            % Constructor to initialize the integers
            obj.integer1 = int1;
            obj.integer2 = int2;
        end
        
        % Method to multiply two integers
        function result = multiply(obj)
            result = obj.integer1 * obj.integer2;
        end
        
        % Method to add two integers
        function result = add(obj)
            result = obj.integer1 + obj.integer2;
        end
    end
end


