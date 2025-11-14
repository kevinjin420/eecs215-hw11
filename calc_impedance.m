clc;
clear;

V_source = 10;
I_source = 2.9560 - 0.2231i;

Z_eq = V_source / I_source;

fprintf('Equivalent Impedance:\n');
fprintf('Z = %.4f + %.4fi Ω\n', real(Z_eq), imag(Z_eq));
fprintf('|Z| = %.4f Ω\n', abs(Z_eq));
fprintf('∠Z = %.4f° \n\n', rad2deg(angle(Z_eq)));

R = real(Z_eq);
X = imag(Z_eq);

fprintf('Resistance: R = %.4f Ω\n', R);
fprintf('Reactance: X = %.4f Ω\n', X);

omega = 3e4;

if X > 0
    L = X / omega;
    fprintf('\nModel: Resistor in series with INDUCTOR\n');
    fprintf('R = %.4f Ω\n', R);
    fprintf('L = %.4f μH\n', L * 1e6);
else
    C = 1 / (omega * abs(X));
    fprintf('\nModel: Resistor in series with CAPACITOR\n');
    fprintf('R = %.4f Ω\n', R);
    fprintf('C = %.4f μF\n', C * 1e6);
end
