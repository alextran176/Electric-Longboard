%%
%Electric Skateboard Energy calculations
%Force required to get up certain grade hill:
clear all
clc

grade = .15; %percent grade
angle = atand(grade)%angle, degrees
weight = 778; %Newtons = 175lb, force of gravity towards the center of the earth

Fx = weight*sind(angle) %Force pushing you down the hill
Fy = weight*cosd(angle); %Force pushing you normal to the ground

lbs = Fx * .2248 %Force in lbs pushing you down hill
T = Fx*.083/2 %Torque in Nm at the wheels
T_inlb = lbs*3.26/2 %torque at the wheels
%%
mph = 15;
meterspersec = .44704*mph;

power = meterspersec * Fx %power required to get up this hill at 20mph in Watts
hp = power*.001341

%power = 2000;

%%
%18650 Battery Calculations
Ahpercell = 2500; %per cell
parallel = 2;
series = 10;
voltpercell = 2.5; %Nominal

voltage = voltpercell*series
Ah = Ahpercell*parallel

E = voltage * Ah;
kJ = E/1000;
h = 60*60;
Wh = 1*h;
kWh = Wh/1000;
Wh_pack = E/Wh
kWh_pack = E/Wh/1000;

t = E/power/60 %time in minutes
d = mph*(t/60)

Idraw_tot = power/voltage %peak, travelling up a steep hill, assuming ideal and at 20mph starting velocity.
%Assumes no power loss due to I^2*R heating or friction force. 
%Friction power loss grows linearly with speed. Ploss = Ffriction*speed.
%I^2R loss grows by the square of torque required, so heating losses become
%more apparent as the hill gets steeper and if friction increases (bearing
%friction, pulley friction, motor friction

Min_Idraw_percell = Idraw_tot/parallel %technically peak Idraw, but peak will be sustained for more than 1-2minutes
%this requires the continuous current draw to be very high to avoid
%damaging the batteries.  Battery peak current ratings are only rated for
%very quick bursts <10s.

%%
%Li-po battery calculations
clc
Ahpercell = 5000; %per cell
parallel = 1;
series = 2;
voltpercell = 3.7*5

voltage = voltpercell*series
Ah = Ahpercell*parallel

E = voltage * Ah
kJ = E/1000;
h = 60*60;
Wh = 1*h;
kWh = Wh/1000;
Wh_pack = E/Wh;
kWh_pack = E/Wh/1000

Idraw = power/voltage
Min_Idraw_percell = Idraw/parallel
cell_maxIdraw = 25*2.7

t = E/power/60 %time in minutes







