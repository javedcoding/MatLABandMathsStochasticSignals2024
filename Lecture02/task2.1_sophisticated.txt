clear all;
close all;
clc;

% Parameters
%Calculation for the window length 
%End_of_time = Start_of_time + (Number_of_samples/Sampling_Frequency)
f = 5; % Frequency in Hz
Fs = 50; % Sampling frequency in Hz
t_min = -10; % Start time in seconds
t_max = 10; % End time in seconds
N = Fs * (t_max - t_min); % Number of samples 
t = (-(N/2):(N/2 - 1))/Fs; % Time vector

% (a) Sample the signal x(t) = sin(2*pi*f*t)
y = sin(2*pi*f*t);

% Plot the sampled signal
figure;
subplot(2, 2, 1);
plot(t, y);
title("Sampled Signal x(t) = sin(2\pi f t)");
xlim([t_min t_max]);
xlabel("Time [s]");
ylabel("Amplitude");
grid on;

% (b) Cut out a time frame using a rectangular window
rect_Window = (t >= -5 & t <= 5); % Rectangular window

% Plot the rectangular window
subplot(2, 2, 2);
plot(t, rect_Window);
xlim([t_min t_max]);
ylim([0 1.5]);
title("Rectangular Window");
xlabel("Time [s]");
ylabel("Amplitude");
grid on;

% Apply rectangular window to the signal
cut_out_signal = y .* rect_Window;

% Plot the cut out time frame signal
subplot(2, 2, 3);
plot(t, cut_out_signal);
xlim([t_min t_max]);
title("Cut Out Time Frame (Rectangular Window)");
xlabel("Time [s]");
ylabel("Amplitude");
grid on;

% (c) Calculate the FFT of the cut-out signal
fft_of_rect_signal = fftshift(fft(cut_out_signal));
freq_range = Fs * (-length(cut_out_signal)/2:(length(cut_out_signal)/2)-1) / length(cut_out_signal);

% Plot the FFT of the cut-out signal
subplot(2, 2, 4);
plot(freq_range, abs(fft_of_rect_signal));
xlim([0 15]);
title("FFT of Cut-Out Signal (Rectangular Window)");
xlabel("Frequency [Hz]");
ylabel("Magnitude");
grid on;

% (d) Cut out a time frame using a Hamming window
t_cut = -5:1/Fs:5-(1/Fs); % Time vector for cut-out signal

% Create Hamming window
hamm_Window = [zeros(1, N/4) hamming(length(t_cut))' zeros(1, N/4)];

% Apply Hamming window to the cut-out signal
with_hamming_signal = y .* hamm_Window;

% Plot the cut-out signal with Hamming window
figure;
subplot(2, 2, 1);
plot(t, y);
title("Sampled Signal x(t) = sin(2\pi f t)");
xlim([t_min t_max]);
xlabel("Time [s]");
ylabel("Amplitude");
grid on;

subplot(2, 2, 2);
plot(t, hamm_Window);
xlim([t_min t_max]);
ylim([0 1.5]);
title("Hamming Window");
xlabel("Time [s]");
ylabel("Amplitude");
grid on;

subplot(2, 2, 3);
plot(t, with_hamming_signal);
xlim([t_min t_max]);
title("Cut Out Time Frame (Hamming Window)");
xlabel("Time [s]");
ylabel("Amplitude");
grid on;

% (e) Calculate the FFT of the signal with Hamming window
L_hamm = length(with_hamming_signal);
fft_of_hamm_signal = fftshift(fft(with_hamming_signal));
freq_range_hamm = Fs * (-L_hamm/2:(L_hamm/2)-1) / L_hamm;

% Plot the FFT of the signal with Hamming window
subplot(2, 2, 4);
plot(freq_range_hamm, abs(fft_of_hamm_signal));
xlim([0 15]);
title("FFT of Cut-Out Signal (Hamming Window)");
xlabel("Frequency [Hz]");
ylabel("Magnitude");
grid on;