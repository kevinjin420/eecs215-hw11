clc;
clear;

A = [
    -1/3-3/2*1j+1/9*1j,  -1/9*1j,  3/2*1j;
    -1/9*1j,  2/9*1j-1/3,  -1/9*1j;
    3/2*1j,  -1/9*1j,  -2/3*1j+1/9*1j-1/3
];

b = [
    -10/3;
    0;
    0
];

fprintf('Matrix A:\n');
disp(A);

fprintf('\nVector b:\n');
disp(b);

sol = A\b;

fprintf('\nSolution (V1, V2, V3):\n');
disp(sol);

fprintf('\nV1 = %.4f + %.4fi\n', real(sol(1)), imag(sol(1)));
fprintf('V2 = %.4f + %.4fi\n', real(sol(2)), imag(sol(2)));
fprintf('V3 = %.4f + %.4fi\n', real(sol(3)), imag(sol(3)));

V_source = 10;
V1 = sol(1);
R = 3;
I_source = (V_source - V1) / R;

fprintf('\nSource current:\n');
fprintf('I = %.4f + %.4fi A\n', real(I_source), imag(I_source));
fprintf('|I| = %.4f A\n', abs(I_source));
fprintf('angle(I) = %.4f rad = %.4f deg\n', angle(I_source), rad2deg(angle(I_source)));

fprintf('\nVerification (should equal b):\n');
disp(A*sol);
