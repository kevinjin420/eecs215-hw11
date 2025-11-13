clc;
clear;
close all;

%% Time vector - transition at t = 0.001 s (1 ms)
t1 = 1e-3;  % transition time
t = linspace(0, 20e-3, 5000);  % 0 to 20 ms for good visibility

%% Create index arrays for the two regions
idx1 = (t >= 0 & t < t1);
idx2 = (t >= t1);

%% --- V_c(t) Capacitor Voltage ---
Vc = zeros(size(t));
% Region 1: 0 <= t < 0.001
Vc(idx1) = 21.68*exp(-83*t(idx1)) - 21.57*exp(-1917*t(idx1));
% Region 2: t >= 0.001
Vc(idx2) = 16.78*cos(400*(t(idx2) - t1)) + 4.485*sin(400*(t(idx2) - t1));

%% --- I_L(t) Inductor Current ---
IL = zeros(size(t));
% Region 1: 0 <= t < 0.001
IL(idx1) = 0.1 - 0.1045*exp(-83*t(idx1)) + 0.0045*exp(-1917*t(idx1));
% Region 2: t >= 0.001
IL(idx2) = 0.004485*cos(400*(t(idx2) - t1)) - 0.01678*sin(400*(t(idx2) - t1));

%% --- Plot both responses ---
figure('Position',[100 100 800 600]);

% V_c(t) - Capacitor Voltage
subplot(2,1,1)
plot(t*1e3, Vc, 'LineWidth', 2);
hold on;
xline(t1*1e3, '--r', 'LineWidth', 1.5);  % mark transition point
hold off;
xlim([0 20]);  % 0 to 20 ms window
title('V_c(t): Capacitor Voltage');
ylabel('V_c [V]');
xlabel('Time [ms]');
grid on;
legend('V_c(t)', 't = 1 ms (transition)', 'Location', 'best');

% I_L(t) - Inductor Current
subplot(2,1,2)
plot(t*1e3, IL, 'LineWidth', 2);
hold on;
xline(t1*1e3, '--r', 'LineWidth', 1.5);  % mark transition point
hold off;
xlim([0 20]);  % 0 to 20 ms window
title('I_L(t): Inductor Current');
ylabel('I_L [A]');
xlabel('Time [ms]');
grid on;
legend('I_L(t)', 't = 1 ms (transition)', 'Location', 'best');

sgtitle('RLC Circuit Transient Response', 'FontWeight', 'bold');
