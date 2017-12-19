maxtempsparcours = 500;
%
simul;
t = 1; % donc t=1 est l'instant de depart => duree de parcours = temps parcours - 1
objets_heurtes = []; % Le robot 1 n'a encore heurte aucun autre objet
Vulnerable = true(1,nombre_objets); % Tous les objets sont vulnerables au depart
%

while t <= maxtempsparcours % Boucle temporelle avec maxtempsparcours variable à cause des collisions éventuelles
    xunit = [];
    yunit = [];
    for k = 1:nombre_objets
        if t < tempsparcours(k)
            ii(k) = round(P(k).pp(t)); %% ii(k) est l'index donnant accès à la position du centre de l'objet k à l'instant t
        end
    end
    %%
    % Test de détection d'obstacles de l'objet 1 avec les autres objets
    % kobj
    % On ne considère ici que les collisions de l'objet 1 avec les autres
    % objets
    %
    for kobj = 2:nombre_objets
        % kobj est le numero de l'objet susceptible de rentrer en collision avec l'objet 1
        distance = norm(xy(1:2,ii(kobj),kobj)-xy(1:2,ii(1),1)); % distance du robot (objet 1) à l'objet kobj
        sumray = rrob(1)+rrob(kobj);
         if distance < sumray && Vulnerable(1) && Vulnerable(kobj)
            objets_heurtes = [objets_heurtes kobj] % liste des objets heurtes par le robot 1 (MICKEY)
            kcol = kobj; % on sauvegarde le numero de l'objet kobj rentré en collision avec l'objet 1
            %
            %les objets 1 et kcol deviennent invulnerables
            Vulnerable(1) = false;
            Vulnerable(kcol) = false;
            %
         else if distance >= sumray
                 %pas de collision : distance >= sumray
                 if ~Vulnerable(1) && ~Vulnerable(kobj)
                     % Les 2 objets 1 et kobj sont invulnerables et ne sont plus
                     % en collision : ils redeviennent vulnerables
                     Vulnerable(1) = true;
                     Vulnerable(kobj) = true;
                 end
             end
         end
    end
    %
    t = t + 1;
    
end