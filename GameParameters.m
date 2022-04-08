%Area of Field plus the edge
FullAreaX = [0 11];
FullAreaY = [0 8];

%Area of the Field Only
fieldLimitsX = [1 10];
fieldLimitsY = [1 7];

%Field Defined As an Occupancy Map
map = robotics.OccupancyGrid(zeros(FullAreaY(2),FullAreaX(2)));

%Parameters for the Goal Posts [X,Y,Index]
goalPosts = [1  2.7 2; %Home GoalPost Bottom
             1 5.3 3; %Home GoalPost Top
             10 2.7 4; %Away Goal Post Bottom
             10 5.3 5;]; %Away goal post top
%Position of the Center of the Field
fieldCenter = [mean(fieldLimitsX) mean(fieldLimitsY)];
%Position of the Home Goal
homeGoalPosition = [fieldLimitsX(1) mean(fieldLimitsY)];
%Position of the Away Goal
awayGoalPosition = [fieldLimitsX(2) mean(fieldLimitsY)];
%% Simulation Parameters
sampleTime = 0.5;

% Robot definitions and dimensions
numPlayers = 8;
playerRadius = 0.08;
stepLength = 0.02;

homeTeamColor = [1 0 0];
awayTeamColor = [0 0 1];

homeGKColor = [1 0.5 0];
awayGKColor = [0 0.5 1];

goalKeeperInitPos = [1.2 4 0;
                     9.8 4 pi;];
                 
OutFieldPlayersInitPose = [1.5 2 0;%Home Defender 1 Position
                           8.5 2 pi;%Away Defender 1 Position
                           1.5 6 0;%Home Defender 2 Position
                           8.5 6 pi;%Away Defender 2 Position
                           3.5 4 0;
                           7.5 4 pi];
                       
InitBallPos = fieldCenter;

initGameState = struct('possession',0, ...
                       'situation',gameSituation.InPlay, ...
                       'time', gameTime.GameStart, ...
                       'score',[0;0]);
                   

% Ball kicking noise (multiplying factor for 'randn' function)
ballVelNoise = 0.05;
ballAngleNoise = pi/24;

ballThresh = playerRadius + 0.03; % Distance to grab the ball
ballCarryFactor = 0.9;          % Speed penalty when carrying the ball
outOfBoundsDist = 2;            % Distance to place ball back in bounds

objDetectorOffset = [0 0];
objDetectorAngle = 0;
objDetectorFOV = pi;
objDetectorRange = 10;

playerIdx = (0:8);
%color      
objColors = [0 0.75 0;%ball
             1 0 0;%hgp
             1 0 0;
             0 0 1;
             0 0 1;];%agp
objMarkers = 'o^^';
objDetectorMaxHits = 5;

robotDetectorOffset = [0 0];
robotDetectorAngle = 0;
robotDetectorFOV = 4.15;
robotDetectorRange = 10;
robotDetectorMaxHits = 7;

%% Behavior Logic Parameters
% General parameters
distThresh = 0.1;         % Threshold distance to track points [m]
angThresh = pi/16;      % Threshold angle to track rotation [rad]
goalThresh = 0.8;        % Threshold distance from the goal to kick ball [m]


%%Robot Speed Limits
maxSpeed = 0.1;
maxTurnSpeed = 0.05;
% Attacker parameters
attackerKickSpeed = 0.3;              % Kick speed for attacking
attackerMinGoalDist = 0.25;            % Distance before taking the ball away from goal and try kick again
attackerMaxGoalDist = 0.8;           % Distance away from goal to travel before kicking again
dribbleTime = 25;                   % Max time before kicking the ball while dribbling
dribbleKickSpeed = 0.2;               % Kick speed for dribbling

HomeFormation1=[1.5 4 0
                2.5 4 0
                4 3 0
                4 5 0];
HomeFormation2=[1.5 4 0
                2.5 3 0
                2.5 5 0
                4 4 0];
HomeFormation3=[1.5 4 0
                4 4 0
                4 3 0
                4 5 0];
AwayFormation1=[9.5 4 pi
                7.5 4 pi
                6 3 pi
                6 5 pi];
AwayFormation2=[9.5 4 pi
                7.5 3 pi
                7.5 5 pi
                6 4 pi];
AwayFormation3=[9.5 4 pi
                6 4 pi
                6 3 pi
                6 5 pi];
