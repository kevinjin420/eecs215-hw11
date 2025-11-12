syms s t

% Define the three transfer functions from equations.txt
v_c1_s = (12*(90*s^2 - 85*s - 2)) / (1620*s^3 + 180*s^2 + 167*s + 9);
v_c2_s = (6*(90*s + 11)) / (1620*s^3 + 180*s^2 + 167*s + 9);
i_l_s = (2*(90*s^2 - s + 18)) / (s*(90*s^2 + 5*s + 9));

% Compute inverse Laplace transforms
v_c1_t = ilaplace(v_c1_s, s, t);
v_c2_t = ilaplace(v_c2_s, s, t);
i_l_t = ilaplace(i_l_s, s, t);

% Print results
fprintf('v_c1(t) = \n');
disp(v_c1_t);
fprintf('\nv_c2(t) = \n');
disp(v_c2_t);
fprintf('\ni_l(t) = \n');
disp(i_l_t);
