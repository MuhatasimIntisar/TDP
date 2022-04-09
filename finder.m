function [holded,indexholder]=finder(home,away)
holded=false;
holdingTeam= 0;
indexholder=0;
awayHolds=0;
homeHolds=0;
%% This function returns if ball is holded or not and the player's index if holded
homeindexholder = find(home(:,1) ~= 0 & home(:,2) < 0.2  & home(:,2) > 0  & home(:,3) > -pi/6 & home(:,3) < pi/6);
awayindexholder = find(away(:,1) ~= 0 & away(:,2) < 0.2 & away(:,2) > 0 & away(:,3) >-pi/6  & away(:,3) < pi/6);
awayHolds = ~isempty(awayindexholder);
homeHolds = ~isempty(homeindexholder);

if awayHolds || homeHolds
    holded = true;
    if homeHolds && ~awayHolds
        if size(homeindexholder,1)== 1
            indexholder = homeindexholder(1);
        else
            indexholder = homeindexholder(end);            
        end
    elseif awayHolds && ~homeHolds
        if size(awayindexholder,1)==1
            indexholder = awayindexholder(1)+4;
        else
            indexholder = awayindexholder(1)+4;
        end
    elseif  homeHolds && awayHolds
        indexholder = randsample([homeindexholder;awayindexholder+4],1);
    end
    
end
end