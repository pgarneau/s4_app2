% Comment/Uncomment the code bellow to increase compilation speed
%y_e = FindHeight();
y_e = 12.27;

poly = FindPoly(y_e);
x_matrix = [0 8 15 20 25];
y_matrix = [30 19 20 16 y_e];

% Trouver la vitesse selon la position
syms x
vit = sqrt((-x*9.81*0.63 - 9.81*(poly - 30))*2);


x = 0:0.1:25;
subplot(2,1,1);
plot(x_matrix, y_matrix, 'o', x, subs(poly,x));
grid on
title('Trajectoire du participant sur la glissade')
xlabel('distance (m)')
ylabel('hauteur (m)')


subplot(2,1,2);
plot(x, subs(vit,x));
grid on
title('Courbe de la vitesse du participant en fonction de sa position')
xlabel('distance (m)')
ylabel('vitesse (m/s)')







