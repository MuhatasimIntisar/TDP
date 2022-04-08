function [holded,indexholder,team]=findholdertest(home,away)
holded=false;
indexholder=0;
%% This function returns if ball is holded or not and the player's index if holded
homeindexholder = find(home(:,1) ~= 0 & home(:,2) < 8  & home(:,2) > 1  & home(:,3) > 3 & home(:,3) < 6);
awayindexholder = find(away(:,1) ~= 0 & away(:,2) < 5 & away(:,2) > 1 & away(:,3) < 3 & away(:,3) > 1);

awayHolds = ~isempty(awayindexholder);
homeHolds = ~isempty(homeindexholder);

if awayHolds || homeHolds
    holded = true;
    if homeHolds && ~awayHolds
        indexholder = homeindexholder(randi([1,size(homeindexholder,1)]));
    elseif awayHolds && ~homeHolds
        indexholder = awayindexholder(randi([1,size(awayindexholder,1)])) + 4;
    elseif  homeHolds && awayHolds
        determineholder = [homeindexholder;awayindexholder+4];
        indexholder = determineholder(randi([1,size(determineholder,1)]));
    end
if indexholder == 0
    team = 0;
elseif indexholder > 0 && indexholder < 5
    team = 1;
else
    team = 2;
end
        
end
