% Before Shock Signal
fs = 1000; % Sampling frequency
duration = 10; % Signal duration (seconds)
t = 0:1/fs:duration-1/fs; % Time vector
before_shocks_signal = randn(size(t)); % Random noise signal

% FIR Filter
fir_order = 50;
fir_cutoff = 0.3; % Normalized cutoff frequency
fir_coefficients = fir1(fir_order, fir_cutoff, 'low');
before_shocks_fir = filter(fir_coefficients, 1, before_shocks_signal);

% IIR Filter
[iir_b, iir_a] = butter(4, 0.3, 'low'); % 4th-order Butterworth low-pass filter
before_shocks_iir = filter(iir_b, iir_a, before_shocks_signal);

% Plotting
figure;
subplot(3, 1, 1);
plot(t, before_shocks_signal, 'b');
title('Before Shock Signal (Original)');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3, 1, 2);
plot(t, before_shocks_fir, 'r');
title('Before Shock Signal (FIR Filtered)');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3, 1, 3);
plot(t, before_shocks_iir, 'g');
title('Before Shock Signal (IIR Filtered)');
xlabel('Time (s)');
ylabel('Amplitude');
