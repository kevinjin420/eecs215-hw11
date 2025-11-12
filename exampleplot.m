clc;
clear;
close all;

%% Time vectors — adjust range per case for visibility
t_long = linspace(0, 2e-3, 2000);   % for 0.5 ms cases
t_short = linspace(0, 2e-5, 2000);  % for 5 µs cases

%% --- Case a) i ---
t1 = 5e-4;
t = t_long;
idx1 = (t >= 0 & t < t1);
idx2 = (t >= t1);
Vout_a1 = zeros(size(t));
Vout_a1(idx1) = 3 + 2*exp(-1e4*t(idx1));
Vout_a1_t1 = 3 + 2*exp(-1e4*t1);
Vout_a1(idx2) = 5 - 0.00499*exp(-1e4*(t(idx2) - t1));

%% --- Case a) ii ---
t2 = 5e-6;
t = t_short;
idx1 = (t >= 0 & t < t2);
idx2 = (t >= t2);
Vout_a2 = zeros(size(t));
Vout_a2(idx1) = 3 + 2*exp(-1e4*t(idx1));
Vout_a2_t2 = 3 + 2*exp(-1e4*t2);
Vout_a2(idx2) = 5 - 4.9999e-5*exp(-1e4*(t(idx2) - t2));

%% --- Case b) i ---
t3 = 5e-4;
t = t_long;
idx1 = (t >= 0 & t < t3);
idx2 = (t >= t3);
Vout_b1 = zeros(size(t));
Vout_b1(idx1) = 2.98495 + 2.1255*exp(-1.005e6*t(idx1));
Vout_b1_t3 = 2.98495 + 2.1255*exp(-1.005e6*t3);
Vout_b1(idx2) = 4.975 - 1.99005*exp(-1.005e6*(t(idx2) - t3));

%% --- Case b) ii ---
t4 = 5e-6;
t = t_short;
idx1 = (t >= 0 & t < t4);
idx2 = (t >= t4);
Vout_b2 = zeros(size(t));
Vout_b2(idx1) = 2.98495 + 2.1255*exp(-1.005e6*t(idx1));
Vout_b2_t4 = 2.98495 + 2.1255*exp(-1.005e6*t4);
Vout_b2(idx2) = 4.975 - 1.976*exp(-1.005e6*(t(idx2) - t4));

%% --- Plot all four responses ---
figure('Position',[100 100 800 900]);

% a) i
subplot(4,1,1)
t = t_long;
plot(t*1e3, Vout_a1, 'LineWidth', 2);
xlim([0 1]);  % zoom to 1 ms window
title('a) i)  V_{out} = 3 + 2e^{-10^4 t},  t_1 = 0.5 ms');
ylabel('V_{out} [V]');
xlabel('Time [ms]');
grid on;

% a) ii
subplot(4,1,2)
t = t_short;
plot(t*1e6, Vout_a2, 'LineWidth', 2);
xlim([0 10]);  % zoom to 10 µs window
title('a) ii)  V_{out} = 3 + 2e^{-10^4 t},  t_1 = 5 μs');
ylabel('V_{out} [V]');
xlabel('Time [μs]');
grid on;

% b) i
subplot(4,1,3)
t = t_long;
plot(t*1e3, Vout_b1, 'LineWidth', 2);
xlim([0 1]);  % zoom to 1 ms window
title('b) i)  V_{out} = 2.98495 + 2.1255e^{-1.005×10^6 t},  t_1 = 0.5 ms');
ylabel('V_{out} [V]');
xlabel('Time [ms]');
grid on;

% b) ii
subplot(4,1,4)
t = t_short;
plot(t*1e6, Vout_b2, 'LineWidth', 2);
xlim([0 10]);  % zoom to 10 µs window
title('b) ii)  V_{out} = 2.98495 + 2.1255e^{-1.005×10^6 t},  t_1 = 5 μs');
ylabel('V_{out} [V]');
xlabel('Time [μs]');
grid on;

sgtitle('RC Circuit Transient Responses to Pulse Inputs', 'FontWeight', 'bold');
