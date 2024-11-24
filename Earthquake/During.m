% During Shock Signal
main_frequency = 5; % Sinusoidal signal frequency
during_shock_signal = sin(2 * pi * main_frequency * t);

% FIR Filter
during_shock_fir = filter(fir_coefficients, 1, during_shock_signal);

% IIR Filter
during_shock_iir = filter(iir_b, iir_a, during_shock_signal);

% Plotting
figure;
subplot(3, 1, 1);
plot(t, during_shock_signal, 'b');
title('During Shock Signal (Original)');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3, 1, 2);
plot(t, during_shock_fir, 'r');
title('During Shock Signal (FIR Filtered)');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3, 1, 3);
plot(t, during_shock_iir, 'g');
title('During Shock Signal (IIR Filtered)');
xlabel('Time (s)');
ylabel('Amplitude');
