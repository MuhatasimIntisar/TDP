classdef gameSituation < Simulink.IntEnumType
    enumeration
        InPlay(1)
        OutOfPlay(2)
        GoalScored(3)
        CornerKick(4)
    end        
end
