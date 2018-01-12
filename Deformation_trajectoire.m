global position
detect
T(1).vitesse = 1;
save(NOMFIC,'im','nombre_objets','subd','T');
while(T(1).nurbs.coefs(4,indicePointControle) > 0 && size(objets_heurtes,2)>0)
    
    distance = norm(position - T(1).nurbs.coefs(1:2,1)./T(1).nurbs.coefs(4,1));
    for (i = 2 : size(T(1).nurbs.coefs,2))
        distanceNouvelle = norm(position -  T(1).nurbs.coefs(1:2,i)./T(1).nurbs.coefs(4,i));
        if (distanceNouvelle < distance)
            distance = distanceNouvelle;
            indicePointControle = i;
        end
    end
    
    T(1).nurbs.coefs(4,indicePointControle) = T(1).nurbs.coefs(4,indicePointControle)*0.9;
    detect;
    
    if (size(objets_heurtes,2)>0)
        T(1).vitesse = T(1).vitesse - 0.01;
    end
    save(NOMFIC,'im','nombre_objets','subd','T');
    
    detect;
end

if (size(objets_heurtes,2)>0)
    disp("pas de déformation intéressante trouvée ...");
end

