clear all
close all
clc;

% Set the current working directory
% cd('F:/Stochastic Lab takings/Class4/'); % Replace 'path_to_file' with the actual path to the directory
% Read data from the CSV file
data1 = readmatrix('testsignal.csv'); % Replace 'data.csv' with the actual filename

% Access specific columns or rows
signal = data1(1, :); 
N = length(signal);
fs = 1000;

t = (0:N-1)/fs;

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

subplot(4,1,2);
plot(freq, PSD)
xlabel('Frequency (Hz)')
ylabel('Power Spectral Density')
title('Power Spectral Density of Random Process')
xlim([0, 150]);

subplot(4, 1, 3);
plot(tau, ACF);
xlabel('normalized tau of Synthesized Signal');
ylabel('y(t)*y(t)');
title('Auto Correlation of Signal');
xlim([-0.01, 0.01]);

% NFFT = 2^nextpow2(N);   %Next power of 2 from signal length

% Calculate FFT of the original signal to get the original phase
% Find the three highest peaks in the PSD
half_PSD = PSD(length(PSD)/2:end); % Consider only positive frequencies
half_freq = freq(length(freq)/2:end); % Corresponding frequencies
[pks, locs] = findpeaks(half_PSD);
[~, sorted_indices] = sort(pks, 'descend');
highest_indices = locs(sorted_indices(1:3));
highest_freqs = ceil(half_freq(highest_indices));

% Display the highest frequencies and their amplitudes
disp('Highest Frequencies and Amplitudes:');
for i = 1:3
    disp(['Frequency: ', num2str(highest_freqs(i)), ' Hz']);
end

fs_synth_sig = 2000;
N_synth_sig = (2.048-0)*fs_synth_sig;
t_synth_sig = (0:N_synth_sig-1)/fs_synth_sig;
% NFFT = length(PSD);
% signal_fft = fft(signal, NFFT);
% signal_phase = angle(signal_fft);

% Synthesize signal based on the three highest frequencies
synth_signal = zeros(1, N_synth_sig);
for i = 1:3
    synth_signal = synth_signal + sin(2 * pi * highest_freqs(i) * t_synth_sig);
end

synth_signal = synth_signal * max_value;

%Plot the synthesized signal
subplot(4,1,4);
plot(t_synth_sig, real(synth_signal));
title('Synthesized Signal');
xlabel('Time (s)');
ylabel('Amplitude');

figure;
%Plot the synthesized signal
subplot(3,1,1);
plot(t_synth_sig, real(synth_signal));
title('Synthesized Signal');
xlabel('Time (s)');
ylabel('Amplitude');


%Plot first 100 sampling points of synthesized signal
subplot(3,1,2);
plot(t_synth_sig, synth_signal);
title('Synthesized Signal''s First 100 points only');
xlabel('Time (s)');
ylabel('Amplitude');
xlim([0, 0.1])

%Get the ACF of the synthesized signal
[ACF_of_synth_signal, lag_of_synth_signal] = xcorr(synth_signal, 'biased');
tau_of_synth_signal = lag_of_synth_signal/fs_synth_sig;


subplot(3,1,3);
plot(tau_of_synth_signal, ACF_of_synth_signal)
xlabel('normalized tau of Synthesized Signal');
ylabel('y(t)*y(t)');
title('Auto Correlation of Synthesized Signal');
xlim([-0.01, 0.01]);