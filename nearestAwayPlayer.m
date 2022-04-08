function [seen,dist,ang] = nearestAwayPlayer(players)

dist = -1;
ang = 0;
awayPlayers = players(players(:,3) > 4,:);
seen = ~isempty(awayPlayers);
if seen
    [dist, idx] = min(awayPlayers(:,1));
    ang = awayPlayers(idx(1),2);
    
end






    




