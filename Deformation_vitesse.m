detect

T(1).vitesse <= vmax && size(objets_heurtes,2)>0

while(T(1).vitesse > 0 && size(objets_heurtes,2)>0)
    T(1).vitesse = T(1).vitesse - 0.1;
    save(NOMFIC,'im','nombre_objets','subd','T');
    
    detect
end

if (T(1).vitesse == 0)
    disp('pas de vitesse trouvée oour cette trajectoire');
else 
    disp("on a choisit une vitesse de" , T(1).vitesse);
end

    