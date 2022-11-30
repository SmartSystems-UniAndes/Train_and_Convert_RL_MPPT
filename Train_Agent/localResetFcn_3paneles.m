function in = localResetFcn_3paneles(in, mdl)
    init_duty = rand;
    if init_duty < 0.15
        init_duty = 0.15;
    elseif init_duty >0.9
        init_duty = 0.9;
    end
    in = in.setVariable('initialDuty', init_duty,'Workspace', mdl);
    
    listTemperature = 25:10:50;
    listIrradiation = 300:100:1000;
    irradiation = listIrradiation(randperm(length(listIrradiation),1));
    if irradiation > 500
        listTemperature = 25:10:50;
    end
    list_perc = [0.25, 0.4, 0.5, 0.75, 0.9];
    
    e = 0.7;
    e2 = 0.8;
    random = rand;
    % Caso 1: paneles sin sombra.    
    if random < e %depending of a random number, the conditions of every panel are equal between each other or not with a bigger chance.
        Ir1 = irradiation;
        Ir2 = irradiation;
        Ir3 = irradiation;
    % Caso 2: 1 panel sombreado.
    elseif e <= random && random <= e2 % The value of probability between e and e2.
         percentaje = list_perc(randperm(length(list_perc),1));
         Ir1 = irradiation;
         Ir2 = irradiation;
         Ir3 = irradiation*percentaje;
         %Ir4 = irradiation*percentaje;
    % Caso 3: 2 paneles con la misma sombra.
    else %if e2 <= random && random <= e3 % The value of probability between e and e2.
         percentaje = list_perc(randperm(length(list_perc),1));
         percentaje_2 = list_perc(randperm(length(list_perc),1));
         Ir1 = irradiation;
         Ir2 = irradiation*percentaje;
         Ir3 = irradiation*percentaje_2;
         %Ir4 = irradiation*percentaje;
    % Caso 4: 2 paneles con sombras distintas.
    %else
    %    percentaje  = list_perc(randperm(length(list_perc),1));
    %    percentaje1 = list_perc(randperm(length(list_perc),1));
    %    Ir1 = irradiation;
    %    Ir2 = irradiation;
    %    Ir3 = irradiation*percentaje;
    %    Ir4 =irradiation*percentaje1;
    %end
    %This are the four values of irradiance set in the environment.
    in = in.setVariable('Ir1', Ir1, 'Workspace', mdl);
    in = in.setVariable('Ir2', Ir2, 'Workspace', mdl);
    in = in.setVariable('Ir3', Ir3, 'Workspace', mdl);
    %in = in.setVariable('Ir4', Ir4, 'Workspace', mdl);
    %Only one variable of temperature is set
    in = in.setVariable('T1', listTemperature(randperm(length(listTemperature),1)), 'Workspace', mdl);
    %in = in.setVariable('T2', listTemperature(randperm(length(listTemperature),1)), 'Workspace', mdl);
    %in = in.setVariable('T3', listTemperature(randperm(length(listTemperature),1)), 'Workspace', mdl);
end
