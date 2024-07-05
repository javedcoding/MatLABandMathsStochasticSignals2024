function result = sumFloats(value1, value2)
    % Function to compute the sum of two float values
    
    % Check if inputs are numeric
    if ~isnumeric(value1) || ~isnumeric(value2)
        error('Inputs must be numeric.');
    end
    
    % Compute the sum
    result = value1 + value2;
end

% Test the sumFloats function
tom = 5.5
hardy = 2.7;
sumResult = sumFloats(tom, hardy);
disp(['The sum of ', num2str(tom), ' and ', num2str(hardy), ' is: ', num2str(sumResult)]);
