function [seen,dist,ang] = nearestHomePlayer(players)

dist = -1;
ang = 0;
awayPlayers = players(players(:,3) < 5,:);
seen = ~isempty(awayPlayers);
if seen
    [dist, idx] = min(awayPlayers(:,1));
    ang = awayPlayers(idx(1),2);
    
end

