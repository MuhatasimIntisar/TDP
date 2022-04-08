obj = findobj('Tag','MultiRobotEnvironment');
figNum = obj.Number;
figure(figNum);
hold on

% Title
title('TDP Project');

% Center Line
line([5,5],[1,7],'k-','LineWidth',2);

% Center circle
viscircles([5.5 4],0.75,'Color','k');

% Draw outer boundary
rectangle('Position', [1 1 10 7],'LineWidth', 2);

% Remove default labels and ticks
xlabel('');
ylabel('');
yticks('');
xticks('');

% Crop to field dimensions
axis equal
xlim([0 11]);
ylim([0 8]);

hold off