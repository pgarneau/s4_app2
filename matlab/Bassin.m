clear
clc

m = 80;
g = 9.81;
b = 47;
kf = 0.95;
ht = 10;% hauteur de la tomber dans le bassin
ddv = 4.9644;

ve = sqrt((m*g*(1-kf))/b)
vi = sqrt(2*g*10)% 2gh étant la formule pour une chute libre 

ddv2 = ((-1/ve^2) *m*g*(1-kf)-b) * 1/m
z = abs(ddv/ddv2);
display(z);







