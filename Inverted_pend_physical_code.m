clc;close all;clear all;
 
% initialize starting angle of the pendulum
 thetai=0;

%reference input
r=40;      %range -30 to 50

%state space model
 A=[0 1 0 0;
   4.905 0 0 0;
    0 0 0 1; 
    -2.4525 0 0 0];
 B= [0;-0.2; 0; 0.5];
 C=[0 0 1 0];
 D=0;


 % state space model with reference input
 A_bar=[A,zeros(4,1);-C,0];
 B_bar=[B;0];

 % Q and R matrix for lqr technique
 Q=[10 0 0 0 0;
     0 100 0 0 0;
     0 0 5 0 0;
     0 0 0 1 0;
     0 0 0 0 10];
 R=0.001;

%feedback gain matrix for lqr technique
   k=lqr(A_bar,B_bar,Q,R);


% running the simulation

 sim("inverted_pend_physical_model.slx")

% plotting of curves
t = ans.simX.time;
theta = ans.simX.Data(:,1);
thetad=ans.simX.Data(:,2);
x=ans.simX.Data(:,3);
xd=ans.simX.Data(:,4);

subplot(2,2,1)
plot(t,theta)
xlabel('Time');
ylabel('Theta');
grid on;

subplot(2,2,2)
plot(t,thetad)
xlabel('Time');
ylabel('Angular velocity');
grid on;

subplot(2,2,3)
plot(t,x)
xlabel('Time');
ylabel('Displacement');
grid on;

subplot(2,2,4)
plot(t,xd)
xlabel('Time');
ylabel('Linear velocity');
grid on;
