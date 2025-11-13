clear all; clc;
syms s t

F1 = (s^2 + 34*s + 168) / (s * (2*s^2 - 20*s + 42));
F2 = (s^2 + 10*s + 25) / ((s + 1) * (s^2 + 12*s + 40));
F3 = 2187 / (s^3 * (s + 6)^2);
F4 = 432 / (s^2 + 16*s + 100)^2;

% Compute inverse Laplace transforms symbolically
f1 = simplify(ilaplace(F1, s, t));
f2 = simplify(ilaplace(F2, s, t));
f3 = simplify(ilaplace(F3, s, t));
f4 = simplify(ilaplace(F4, s, t));

% Display symbolic results
fprintf('Symbolic Inverse Laplace Transforms:\n\n');
fprintf('f1(t) = '); disp(f1);
fprintf('f2(t) = '); disp(f2);
fprintf('f3(t) = '); disp(f3);
fprintf('f4(t) = '); disp(f4);

% Create time vector for plotting
t_vals = linspace(0, 5, 1000);

% Convert symbolic expressions to numerical functions and evaluate
f1_vals = double(subs(f1, t, t_vals));
f2_vals = double(subs(f2, t, t_vals));
f3_vals = double(subs(f3, t, t_vals));
f4_vals = double(subs(f4, t, t_vals));

% Plot all functions
figure('Position', [100, 100, 1000, 800]);

subplot(4, 1, 1);
plot(t_vals, f1_vals, 'b-', 'LineWidth', 2);
grid on;
title('f_1(t) = L^{-1}\{(s^2 + 34s + 168) / (s(2s^2 - 20s + 42))\}');
xlabel('Time [s]');
ylabel('f_1(t)');

subplot(4, 1, 2);
plot(t_vals, f2_vals, 'r-', 'LineWidth', 2);
grid on;
title('f_2(t) = L^{-1}\{(s^2 + 10s + 25) / ((s + 1)(s^2 + 12s + 40))\}');
xlabel('Time [s]');
ylabel('f_2(t)');

subplot(4, 1, 3);
plot(t_vals, f3_vals, 'g-', 'LineWidth', 2);
grid on;
title('f_3(t) = L^{-1}\{2187 / (s^3(s + 6)^2)\}');
xlabel('Time [s]');
ylabel('f_3(t)');

subplot(4, 1, 4);
plot(t_vals, f4_vals, 'm-', 'LineWidth', 2);
grid on;
title('f_4(t) = L^{-1}\{432 / (s^2 + 16s + 100)^2\}');
xlabel('Time [s]');
ylabel('f_4(t)');

sgtitle('Inverse Laplace Transforms', 'FontWeight', 'bold');
