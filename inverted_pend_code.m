%HERE WE HAVE DEFINED (A,B,C,D and K) FOR RUNNING THE SIMULINK MODEL

clear variables;
clc;
%state_spece model of inverted pendulum
A=[0 1 0 0;8.175 0 0 0; 0 0 0 1; -3.27 0 0 0];
B= [0;-0.33; 0; 0.467];
C = [0 0 1 0]
D = 0;

%state space model of inverted pendulum with reference tracking
A_bar=[A,zeros(4,1);
       -C,0];
B_bar=[B;0];
C_bar=[C 0];
D_bar=D;

%Calculating State feedback gain matrix with the help of ackermann formula
K = acker(A_bar,B_bar,[-4+2i -4-2i -10 -10 -10]) % WE HAVE FOUND THE VALUES OF K WITH THE HELP OF DESIRED POLE LOCATION


%running the simulation model
sim("Inverted_pend_simulation.slx")

open("Inverted_pend_simulation.slx")

