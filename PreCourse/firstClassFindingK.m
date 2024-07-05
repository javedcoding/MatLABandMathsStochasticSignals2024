clear all
close all
clc;

k = 2;
fun = @(x,k) (k/8)*exp(-x/(k+2)); % define the integrand as a function of x and k
step_size = 0.001; % set the step size for numerical integration
x = 0:step_size:1000; % define the range of x values to integrate over
q = sum(fun(x,k))*step_size; % approximate the integral using numerical integration
eqn = @(k) q - 1; % define the equation we want to solve
options = optimset('TolX', 1e-6, 'MaxIter', 1000); % set options for fzero
k = fzero(eqn, k, options); % find the root of the equation with an initial guess of k

