function [objRange,objAngle] = detectObject(detections)
% Accepts a set of object detections and searches for a ball
%
% Copyright 2019 The MathWorks, Inc.

objRange = -1;
objAngle =  0;

for idx = 1:size(detections,1)
    if detections(idx,3) == ObjectType.Ball
        objRange = detections(idx,1);
        objAngle = detections(idx,2);
    end
end

end

