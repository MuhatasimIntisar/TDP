classdef PlayerRole < Simulink.IntEnumType
    % Enumeration datatype for Robot Soccer robot roles
    % Copyright 2019 The MathWorks, Inc.
    
    enumeration
        Attacker(1)
        MidFielder(2)
        Defender(3)
        Goalkeeper(4)
        None(5)
    end
end