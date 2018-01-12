%% Déformation de la vitesse. 
%  Ce code permet d'adapter la vitesse de notre mobile pour éviter les obstacles qu'il rencontrerait.

%On detecte s'il y a eu une collision
detect

% On modifie la vitesse si l'objet bouge et qu'il y a une collision
while(T(1).vitesse > 0 && size(objets_heurtes,2)>0)
    
    % On ralentit
    T(1).vitesse = T(1).vitesse - 0.1;
    save(NOMFIC,'im','nombre_objets','subd','T');
    
    % On recalcule les collisions possibles avec d'autres objets
    detect
end

% Modifier la vitesse n'a pas suffit à éviter les collisions
if (T(1).vitesse == 0)
    disp('pas de vitesse trouvée oour cette trajectoire');
else 
    disp(["on a choisit une vitesse de" , T(1).vitesse]);
end

    