function dydt = center(t, y)
    % === VARILLA DELGADA SOBRE MESA GIRATORIA ===
    % Ecuación de movimiento obtenida de las ecuaciones de Euler:
    % θ¨ = -2 * sin(2θ)
    % (válida porque I_y = I_z y M_z = 0)
    
    theta = y(1);      % posición angular θ
    thetad = y(2);     % velocidad angular θ̇

    % Ecuación diferencial
    thetadd =  - 98.1 * cos(theta) -2 *sin(2*theta);

    % Retornar derivadas
    dydt = [thetad; thetadd];
end
