classdef MyClass
    %MYCLASS Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Property1
        inputArg1
    end
    
    methods
        function obj = MyClass(inputArg1,inputArg2)
            %MYCLASS Construct an instance of this class
            %   Detailed explanation goes here
            obj.Property1 = inputArg1 + inputArg2;
        end
        
        function outputArg = sumOfInputs(obj,inputArg)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            outputArg = obj.Property1 + inputArg;
        end
    end
end

