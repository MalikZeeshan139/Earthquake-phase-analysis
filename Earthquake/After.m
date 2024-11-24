% After Shock Signal
after_shock_signal = exp(-0.5 * t); % Exponentially decaying signal

% FIR Filter
after_shock_fir = filter(fir_coefficients, 1, after_shock_signal);

% IIR Filter
after_shock_iir = filter(iir_b, iir_a, after_shock_signal);

% Plotting
figure;
subplot(3, 1, 1);
plot(t, after_shock_signal, 'b');
title('After Shock Signal (Original)');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3, 1, 2);
plot(t, after_shock_fir, 'r');
title('After Shock Signal (FIR Filtered)');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3, 1, 3);
plot(t, after_shock_iir, 'g');
title('After Shock Signal (IIR Filtered)');
xlabel('Time (s)');
ylabel('Amplitude');
