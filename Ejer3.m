%%
clear; clc; close all;

% --- DATOS ---
m = 0.8;             % kg
L = 0.15;            % m
omega = 2;           % rad/s
I_y = (1/12)*m*L^2;  % kg·m²
I_z = I_y;

fprintf('Momento de inercia I_y = I_z = %.4e kg·m²\n', I_y);

% --- CONDICIONES INICIALES ---
theta0 = deg2rad(30);   % θ(0) = 45°
thetad0 = 0.5;            % θ̇(0) = 0 rad/s
y0 = [theta0; thetad0];

tspan = [0 5];          % tiempo (s)

% --- RESOLVER USANDO ODE45 ---
[t, y] = ode45(['center'], tspan, y0);  % sin arroba, como pediste

theta = y(:,1);
thetad = y(:,2);

% --- CONVERTIR A GRADOS PARA GRAFICAR ---
theta_deg = rad2deg(theta);

% --- GRÁFICAS ---
figure('Position', [100 100 900 600]);

subplot(2,1,1)
plot(t, theta_deg, 'b', 'LineWidth', 2);
xlabel('Tiempo (s)', 'FontSize', 12);
ylabel('\theta (°)', 'FontSize', 12);
title('Posición Angular \theta(t)', 'FontSize', 14);
grid on;

subplot(2,1,2)
plot(t, thetad, 'r', 'LineWidth', 2);
xlabel('Tiempo (s)', 'FontSize', 12);
ylabel('Velocidad Angular \thetȧ (rad/s)', 'FontSize', 12);
title('Velocidad Angular \thetȧ(t)', 'FontSize', 14);
grid on;

fprintf('\nSimulación completada.\n');
fprintf('θ(0) = %.1f°\n', rad2deg(theta0));
fprintf('ω(0) = %.1f rad/s\n', thetad0);
fprintf('θ(final) = %.1f°\n', rad2deg(theta(end)));
fprintf('ω(final) = %.2f rad/s\n', thetad(end));
