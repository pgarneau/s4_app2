N = 11;
current_min_rms = 1000;
min_rms_M = 0;

open_matrix = [0 10 20 30 40 50 60 70 80 90 100];
coeff_matrix = [0.87; 0.78; 0.71; 0.61; 0.62; 0.51; 0.51; 0.49; 0.46; 0.48; 0.46];

for M = 1:(N-3)
    P = zeros(N, M);
   
    for rangee = 1:N
        for colonne = 1:M
            if colonne == 1
                P(rangee, colonne) = 1;
            else
                P(rangee, colonne) = open_matrix(rangee).^(colonne-1);
            end
        end
    end
    
    A = (inv(P'*P)*P')*coeff_matrix;
    result = 0;
    total = 0;
    
    for index = 1:N
        result = 0;
        % TROUVER LE POLYNOME + REMPLACEMENT DE VALEUR
        for exp = 1:M
            result = result + A(exp)*open_matrix(index).^(exp-1);
        end
       
        total = total + (result - coeff_matrix(index))^2;
    end
    
    rms = sqrt((1/N)*total);

    % On sait qu'on prend M=5, donc je sauvegarde les valeurs
    if M == 5
        used_A = A;
        used_rms = rms;
    end
    
    % REPRESENTATION GRAPHIQUE
    poly = 0;
    syms opening
    % POLYNOME POUR M=X
    for exp = 1:M
        poly = poly + A(exp)*opening.^(exp-1);
    end
    
    opening = 0:1:100;
    subplot((N-3)/2,2,M);
    plot(open_matrix,coeff_matrix,'o',opening,subs(poly,opening));
    grid on
    title('Approximation du coefficient de friction en fonction du % d''ouverture de la valve')
    str=sprintf('M = %d, RMS = %f', M, rms);
    xlabel(str)
end

% FIND OPENING PERCENTAGE FROM FRICTION COEFFICIENT
% PLACEHOLDER VALUES FOR NOW
disp(used_A);
disp(used_rms);
M = 5;
coeff = 0.63;
result = FindOpeningPercentage(used_A, coeff, M);

disp(result);


    