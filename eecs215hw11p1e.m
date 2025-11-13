clc;
clear;
close all;

%% Load simulation data (skip header line)
fid = fopen('eecs215hw11p1.txt', 'r');
fgetl(fid);  % skip header: time V(n001) V(n002) V(n003) V(n004) I(L1)
sim_data = textscan(fid, '%f %f %f %f %f %f');
fclose(fid);
t_sim = sim_data{1} - 5;  % Shift time left by 5s (data at t=5s now at t=0s)
V_c1_sim = sim_data{5};  % V(n003) for v_c1
V_c2_sim = sim_data{5};  % V(n004) for v_c2
I_L1_sim = sim_data{6};  % I(L1) for i_l

%% Create time vector
t = linspace(0, 50, 5000);

%% v_c1(s) = (12(90s^2-85s-2))/(1620s^3+180s^2+167s+9)
num1 = 12 * [90, -85, -2];
den1 = [1620, 180, 167, 9];
[r1, p1, k1] = residue(num1, den1);

% Evaluate v_c1(t) directly as sum of exponentials
v_c1 = zeros(size(t));
for i = 1:length(r1)
    v_c1 = v_c1 + r1(i) * exp(p1(i) * t);
end
v_c1 = real(v_c1);

%% v_c2(s) = (6(90s+11))/(1620s^3+180s^2+167s+9)
num2 = 6 * [90, 11, 0];
den2 = [1620, 180, 167, 9];
[r2, p2, k2] = residue(num2, den2);

% Evaluate v_c2(t) directly as sum of exponentials
v_c2 = zeros(size(t));
for i = 1:length(r2)
    v_c2 = v_c2 + r2(i) * exp(p2(i) * t);
end
v_c2 = real(v_c2);

%% i_l(s) = (2(90s^2-s+18))/(s(90s^2+5s+9))
num3 = 2 * [90, -1, 18];
den3 = conv([1, 0], [90, 5, 9]);
[r3, p3, k3] = residue(num3, den3);

% Evaluate i_l(t) directly as sum of exponentials
i_l = zeros(size(t));
for i = 1:length(r3)
    i_l = i_l + r3(i) * exp(p3(i) * t);
end
i_l = real(i_l);

%% Plot results
figure('Position', [100, 100, 1000, 800]);

% Plot v_c1
subplot(3, 1, 1);
plot(t_sim, V_c1_sim, 'r-', 'LineWidth', 2);
hold on;
plot(t, v_c1, 'b-', 'LineWidth', 2);
grid on;
xlim([0 50]);
title('v_{c1}(t) = (12(90s^2-85s-2))/(1620s^3+180s^2+167s+9)');
xlabel('Time [s]');
ylabel('v_{c1} [V]');
legend('Simulation Data (Actual)', 'Analytical (Calculated)', 'Location', 'best');

% Plot v_c2
subplot(3, 1, 2);
plot(t_sim, V_c2_sim, 'r-', 'LineWidth', 2);
hold on;
plot(t, v_c2, 'b-', 'LineWidth', 2);
grid on;
xlim([0 50]);
title('v_{c2}(t) = (6(90s+11))/(1620s^3+180s^2+167s+9)');
xlabel('Time [s]');
ylabel('v_{c2} [V]');
legend('Simulation Data (Actual)', 'Analytical (Calculated)', 'Location', 'best');

% Plot i_l compared with simulation
subplot(3, 1, 3);
plot(t_sim, I_L1_sim, 'r-', 'LineWidth', 2);
hold on;
plot(t, i_l, 'b-', 'LineWidth', 2);
grid on;
xlim([0 50]);
title('i_L(t) = (2(90s^2-s+18))/(s(90s^2+5s+9))');
xlabel('Time [s]');
ylabel('i_L [A]');
legend('Simulation Data (Actual)', 'Analytical (Calculated)', 'Location', 'best');

sgtitle('Inverse Laplace Transforms vs Simulation Data', 'FontWeight', 'bold');

%% Print poles and residues
fprintf('Inverse Laplace Transform - Poles and Residues:\n\n');

fprintf('v_c1(s):\n');
for i = 1:length(r1)
    fprintf('  Pole: %.6f + %.6fi, Residue: %.6f + %.6fi\n', real(p1(i)), imag(p1(i)), real(r1(i)), imag(r1(i)));
end

fprintf('\nv_c2(s):\n');
for i = 1:length(r2)
    fprintf('  Pole: %.6f + %.6fi, Residue: %.6f + %.6fi\n', real(p2(i)), imag(p2(i)), real(r2(i)), imag(r2(i)));
end

fprintf('\ni_l(s):\n');
for i = 1:length(r3)
    fprintf('  Pole: %.6f + %.6fi, Residue: %.6f + %.6fi\n', real(p3(i)), imag(p3(i)), real(r3(i)), imag(r3(i)));
end
