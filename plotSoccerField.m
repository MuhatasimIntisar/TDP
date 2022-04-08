% Script for plotting the Soccer field over the Robot Visualizer
%
% Copyright 2019 The MathWorks, Inc.

% Find the figure number to start plotting over
obj = findobj('Tag','MultiRobotEnvironment');
figNum = obj.Number;
figure(figNum);
hold on

% Title
title('Robot Soccer Simulation');



% Center circle
viscircles([5.5 4],0.75,'Color','k', 'LineWidth', 0.1);

% Draw outer boundary
rectangle('Position', [0 0 11 8],'LineWidth', 0.1);
rectangle('Position', [5.5 1 4.5 6],'LineWidth', 0.1); %center line
rectangle('Position', [1 1 9 6],'LineWidth', 0.1); %Game outer Border
rectangle('Position', [8 1.5 2 5],'LineWidth', 0.1); % Goal area 90 side
rectangle('Position', [1 1.5 2 5],'LineWidth', 0.1);% Goal area 0 side
rectangle('Position', [9 2.5 1 3],'LineWidth', 0.1);% penalty area 90 side
rectangle('Position', [1 2.5 1 3],'LineWidth', 0.1);% penalty area 0 side

%rectangle('Position', [90 15 6 26],'LineWidth', 2);% goal marking 90 side

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