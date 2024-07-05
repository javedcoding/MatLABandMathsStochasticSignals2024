clear all
close all
clc;

% Read data from the CSV file
data = readmatrix('testsignal.csv'); % Replace 'data.csv' with the actual filename

% Access specific columns or rows
signal = data(1, :); 
N = length(signal);
fs = 1000;

t = 0:N-1;

%Plot the signal
figure;
subplot(4,1,1);
plot(t, signal)
xlabel('Time(s)');
ylabel('Amplitude');
title('Given Signal');

%Let's find the maximum and minimum amplitude of the signal
max_value = max(signal);
min_value = min(signal);
disp(['Maximum value: ' num2str(max_value)]);
disp(['Minimum value: ' num2str(min_value)]);

%To know base frequencies of an unknown signal find the PSD
[ACF, lag] = xcorr(signal, 'biased');
tau = lag/fs;
PSD = abs(fftshift(fft(ACF)));

%Let's just guess what will be the frequency range
freq = (-fs/2):(fs/length(lag)):(fs/2 - fs/length(lag));
% freq = fs/N*(-N/2:N/2 - 1);

subplot(4,1,2);
plot(freq, PSD)
xlabel('Frequency (Hz)')
ylabel('Power Spectral Density')
title('Power Spectral Density of Random Process')
xlim([0, 100]);

subplot(4, 1, 3);
plot(freq, 10*log10(PSD));
xlabel('Frequency (Hz)');
ylabel('Power Spectral Density (dB)');
title('PSD in Logarithmic Scale');

subplot(4,1,4);
plot(tau, ACF)
xlabel('Frequency (Hz)')
ylabel('Auto Correlation of Synthesized Signal')
title('normalized tau of Synthesized Signal')
xlim([-0.01, 0.01]);