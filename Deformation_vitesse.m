
vmax = 10;
T(1).vitesse=1;
save(NOMFIC,'im','nombre_objets','subd','T');

detect

T(1).vitesse <= vmax && size(objets_heurtes,2)>0

while(T(1).vitesse <= vmax && size(objets_heurtes,2)>0)
    T(1).vitesse = T(1).vitesse + 0.5;
    save(NOMFIC,'im','nombre_objets','subd','T');
    
    detect
    
    objets_heurtes
end

T.vitesse
    