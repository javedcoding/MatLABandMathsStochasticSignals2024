clear all
close all
clc;

freq = 4; %Frequency of the sine signal in Hz
T = 1/freq;
phaseShift = 4; %phase shift of the sine wave in radians
amplitude = 1; %amplitude of the sine wave

t = -1:0.01:1; %time vector starting from -1 to 1 with increment of 0.01
% t = -(3*T):T/100:3*T;

y = amplitude*sin(2*pi*freq*t); %The equation of signal
y1 = amplitude*sin((2*pi*freq*t) + phaseShift); %The equation of signal

samplingFreq = 30; %sampling frequency in Hz >2f
% t_sampling = -1:1/samplingFreq:1;
t_sampling = -(3*T):1/samplingFreq:3*T;
y_sampling = amplitude*sin(2*pi*freq*t_sampling)
y_sampling1 = amplitude*sin((2*pi*freq*t_sampling) + phaseShift)

figure;
subplot(3,2,1);
%Plotting the sinewave
plot(t,y);
xlabel("Time (s)");
ylabel("Amplitude");
title("Sine wave");
grid on

%Plotting the sinewave with phase delay
subplot(3,2,2);
plot(t,y1);
xlabel("Time (s)");
ylabel("Amplitude");
title("Sine wave with phase shift");
grid on

%Plotting the sampled sinewave
subplot(3,2,3);
stem(t_sampling,y_sampling);
xlabel("Time (s)");
ylabel("Amplitude");
title("Sampled sine wave");
grid on

%Plotting the sampled sinewave with phase delay
subplot(3,2,4)
stem(t_sampling, y_sampling1 );

% b) Making rectangular signal

t1 = -3:0.01:4;   % time range
x = 3*rectangularPulse(-1, 2, t1);
% x = 3*(t >= -1 & t <= 2);   % rectangular signal

subplot(3,2,5)
plot(t1, x, 'LineWidth', 2);
xlabel('Time (t)');
ylabel('Amplitude');
title('Rectangular Signal x(t)');
ylim([-0.5 3.5]);  
grid on
