%%
%Electric skateboard flat ground range simulation
%Calculating driveline friction losses via coastdown time estimation
%Because friction is appx proportional to weight, not speed?????
clear all
clc
vi_mph = 22; %mph
vi_ms = .44704*vi_mph; %m/s

vf = 0;
coast_time = 30; %seconds

deceleration = -(vf-vi_ms)/coast_time;

force = 79*deceleration
lbsF = force * .2248
%power loss = speed*force
%range at 15mph avg speed

mph = 20;
v_ms = .44704*mph
power = force*v_ms


Ahpercell = 4500; %per cell
parallel = 2;
series = 10;
voltpercell = 3.65; %Nominal

voltage = voltpercell*series
Ah = Ahpercell*parallel

E = voltage * Ah
kJ = E/1000;
h = 60*60;
Wh = 1*h;
kWh = Wh/1000;
Wh_pack = E/Wh;
kWh_pack = E/Wh/1000;

t = E/power/60 %time in minutes
d = 15*(t/60)
