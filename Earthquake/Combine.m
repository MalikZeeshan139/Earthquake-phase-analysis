% Parameters
fs = 1000; % Sampling frequency (Hz)
duration = 10; % Total duration of the signal (seconds)
t = 0:1/fs:duration-1/fs; % Time vector

% Generate 'Before Shock Signal' (random noise)
before_shocks_signal = randn(size(t)); % Random noise

% Generate 'During Shock Signal' (sinusoidal waveform)
main_frequency = 5; % Frequency of the sinusoidal signal (Hz)
during_shock_signal = sin(2 * pi * main_frequency * t);

% Generate 'After Shock Signal' (decaying signal)
after_shock_signal = exp(-0.5 * t); % Exponential decay

% Combine all signals to create the earthquake signal
earthquake_signal = before_shocks_signal + during_shock_signal + after_shock_signal;

% Design FIR filter
fir_order = 50; % FIR filter order
fir_cutoff = 0.3; % Normalized cutoff frequency (0 to 1, where 1 = Nyquist frequency)
fir_coefficients = fir1(fir_order, fir_cutoff, 'low'); % FIR low-pass filter design

% FIR filtered components
before_shocks_fir = filter(fir_coefficients, 1, before_shocks_signal);
during_shock_fir = filter(fir_coefficients, 1, during_shock_signal);
after_shock_fir = filter(fir_coefficients, 1, after_shock_signal);

% Design IIR filter
[iir_b, iir_a] = butter(4, 0.3, 'low'); % 4th-order Butterworth low-pass filter

% IIR filtered components
before_shocks_iir = filter(iir_b, iir_a, before_shocks_signal);
during_shock_iir = filter(iir_b, iir_a, during_shock_signal);
after_shock_iir = filter(iir_b, iir_a, after_shock_signal);

% Plot all graphs in a single figure
figure;

% Before Shock Signal
subplot(4, 2, 1);
plot(t, before_shocks_signal, 'b');
title('Before Shock Signal (Original)');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(4, 2, 2);
hold on;
plot(t, before_shocks_fir, 'r');
plot(t, before_shocks_iir, 'g');
title('Before Shock Signal (Filtered)');
legend('FIR Filter', 'IIR Filter');
xlabel('Time (s)');
ylabel('Amplitude');
hold off;

% During Shock Signal
subplot(4, 2, 3);
plot(t, during_shock_signal, 'b');
title('During Shock Signal (Original)');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(4, 2, 4);
hold on;
plot(t, during_shock_fir, 'r');
plot(t, during_shock_iir, 'g');
title('During Shock Signal (Filtered)');
legend('FIR Filter', 'IIR Filter');
xlabel('Time (s)');
ylabel('Amplitude');
hold off;

% After Shock Signal
subplot(4, 2, 5);
plot(t, after_shock_signal, 'b');
title('After Shock Signal (Original)');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(4, 2, 6);
hold on;
plot(t, after_shock_fir, 'r');
plot(t, after_shock_iir, 'g');
title('After Shock Signal (Filtered)');
legend('FIR Filter', 'IIR Filter');
xlabel('Time (s)');
ylabel('Amplitude');
hold off;

% Filtered Earthquake Signals (Full Comparison)
subplot(4, 2, [7, 8]);
hold on;
plot(t, filter(fir_coefficients, 1, earthquake_signal), 'r', 'DisplayName', 'FIR Filtered');
plot(t, filter(iir_b, iir_a, earthquake_signal), 'g', 'DisplayName', 'IIR Filtered');
title('Earthquake Signal (Filtered Comparison)');
legend('FIR Filter', 'IIR Filter');
xlabel('Time (s)');
ylabel('Amplitude');
hold off;
