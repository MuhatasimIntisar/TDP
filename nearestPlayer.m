function [seen,dist,ang] = nearestPlayer(players)

dist = -1;
ang = 0;
seen = ~isempty(players);
if seen
    [dist, idx] = min(players(:,1));
    ang = players(idx(1),2);
    
end