% Create an instance of MathOperations
mathOps = OwnOperations(5, 10);

% Multiply the integers
multiplication_result = mathOps.multiply();
disp(['The product of the two integers is: ', num2str(multiplication_result)]);

% Add the integers
addition_result = mathOps.add();
disp(['The sum of the two integers is: ', num2str(addition_result)]);