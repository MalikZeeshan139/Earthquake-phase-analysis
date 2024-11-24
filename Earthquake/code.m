% Parameters
fs = 1000; % Sampling frequency (Hz)
duration = 30; % Total duration of the signal (seconds)
t = 0:1/fs:duration-1/fs; % Time vector

% Generate before shocks signal
before_shocks_amplitude = 0.2; % Amplitude of before shocks signal
before_shocks_signal = before_shocks_amplitude * randn(size(t));

% Generate main earthquake signal (duration)
main_frequency = 5; % Frequency of the main earthquake signal (Hz)
main_amplitude = 1; % Amplitude of the main earthquake signal
main_duration = 10; % Duration of the main earthquake signal (seconds)
main_earthquake_signal = main_amplitude * sin(2*pi*main_frequency*t(1:main_duration*fs));

% Generate aftershock signals
num_aftershocks = 5; % Number of aftershocks
aftershock_amplitude = 0.5; % Amplitude of the aftershock signals
aftershock_durations = [2, 3, 4, 5, 6]; % Durations of the aftershock signals (seconds)
aftershock_frequencies = [3, 4, 5, 6, 7]; % Frequencies of the aftershock signals (Hz)

% Generate the combined signal
earthquake_signal = before_shocks_signal;

for i = 1:num_aftershocks
    aftershock_duration = aftershock_durations(i);
    aftershock_frequency = aftershock_frequencies(i);
    
    % Generate the aftershock signal
    aftershock_time = 0:1/fs:aftershock_duration-1/fs;
    aftershock_signal = aftershock_amplitude * sin(2*pi*aftershock_frequency*aftershock_time);
    
    % Concatenate the aftershock signal to the combined signal
    earthquake_signal = [earthquake_signal, aftershock_signal];
end

% Generate main earthquake signal (remaining duration)
remaining_duration = duration - length(earthquake_signal)/fs;
remaining_t = 0:1/fs:remaining_duration-1/fs;
remaining_main_earthquake_signal = main_amplitude * sin(2*pi*main_frequency*remaining_t);
earthquake_signal = [earthquake_signal, remaining_main_earthquake_signal];

% Add noise to the signal (Optional)
noise_amplitude = 0.2; % Amplitude of the noise
noise_signal = noise_amplitude * randn(size(earthquake_signal));
earthquake_signal_with_noise = earthquake_signal + noise_signal;

% Plot the earthquake signal components
figure;
subplot(4,1,1);
plot(t, before_shocks_signal);
title('Before Shocks Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(4,1,2);
plot(t(1:main_duration*fs), main_earthquake_signal);
title('Main Earthquake Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(4,1,3);
hold on;
for i = 1:num_aftershocks
    aftershock_duration = aftershock_durations(i);
    aftershock_frequency = aftershock_frequencies(i);
    aftershock_time = 0:1/fs:aftershock_duration-1/fs;
    aftershock_signal = aftershock_amplitude * sin(2*pi*aftershock_frequency*aftershock_time);
    plot(t(main_duration*fs+1:main_duration*fs+aftershock_duration*fs), aftershock_signal);
end
hold off;
title('Aftershock Signals');
xlabel('Time (s)');
ylabel('Amplitude');
