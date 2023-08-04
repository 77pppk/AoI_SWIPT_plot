function AoI = Calcu_AoI(T,error)
    AoI = 0.5*T+T./(1-error);
end