%% 三自由度直升机控制实验参数设置

clc;
clear;

Sample_Time_Net = 0.005;

mh = 1.8; %直升机本体质量 单位：kg
loc = 0.78; %直升机本体到旋转轴的距离 单位：m

mc = 3.433; %平衡块的质量 单位：kg
lob = 0.33; %平衡快到支点的距离 单位：m

mb = 0.67948;
loa = 0.2296;

m1 = 0.552; %直升机单个推进器的质量 单位：kg
m2 = 0.552; %直升机单个推进器的质量 单位：kg  后面没有用

ldf = 0.17; %直升机推进器到翻转轴的距离 单位：m
lcd = 0.10; %直升机两个推进器连接杠中心到翻转轴的距离 单位：m

I_t = 0.0319;  %直升机俯仰角转动惯量
I_e = 1.469;   %直升机升降角转动惯量
I_psi = 1.469; %直升机偏航角转动惯量
g = 9.81;
m = (-mc*lob + mh *loc + mb*loa)/loc;%有效质量
%m = (-mc*lob + mh *loc)/loc;%有效质量

%% 辨识参数误差
error = 0.8;

%% 升降通道辨识数据

a1 = 0.2634;  
a2 = 1.6279;
b1 = 0.531;
ce = 0.3010;

a1_ctrl = a1 * error;  
a2_ctrl = a2 * error;
b1_ctrl = b1 * error;
ce_ctrl = ce * error;

%% 俯仰通道辨识数据

a3 = 25.6488;
b2 = 5.3292;
ct = 0.3410; 

%% 偏航通道辨识数据

% b3 = 0.65;
b3 = 0.531; %测试
b4 = 0.1157;
% b4 = 0.01157;

cp = 0.6804;

%% 速度测量二阶模块参数设置
%              w^2 s
%  D(s)=--------------------
%        s^2 + 2wn s + w^2 
w= 125.66;
n=0.9;
%

%%  UDE参数设置

%  epsilon_T = 10;  %大参数
%  theta_T = 10;
%  psi_T = 10;

% epsilon_T = 0.1;  %小参数
% theta_T = 0.1;
% psi_T = 0.1;



%%  升降通道控制参数设置
kp_epsilon = 2.5;
kd_epsilon = 2;
ki_epsilon = 0;

% kp_epsilon = 6;
% kd_epsilon = 4;
% ki_epsilon = 0.0;

k_double_epsilon=[ ki_epsilon  kp_epsilon   kd_epsilon ];
% A_epsilon = [0 1 0;
%      0 0 1;
%      c_epsilon*kp_epsilon/((1-c_epsilon)*ki_epsilon) (c_epsilon*(kp_epsilon+(kd_epsilon/ki_epsilon))-b_epsilon)/(1-c_epsilon) (c_epsilon*(kd_epsilon+(1/ki_epsilon))-a_epsilon)/(1-c_epsilon)];
% [V_epsilon,D_epsilon] = eig(A_epsilon);


%%  俯仰通道控制参数设置

kp_theta = 25;
kd_theta = 20;
ki_theta = 0;
% kp_theta = 0.1;
% kd_theta = 0.1;
% ki_theta = 0;

k_double_theta=[ki_theta   kp_theta   kd_theta];
% A_theta = [0 1 0;
%      0 0 1;
%      c_theta*kp_theta/((1-c_theta)*T_theta) (c_theta*(kp_theta+(kd_theta/T_theta))-b_theta)/(1-c_theta) (c_theta*(kd_theta+(1/T_theta))-a_theta)/(1-c_theta)];
% [V_theta,D_theta] = eig(A_theta);

%%  航向通道控制参数设置

kp_psi = 0.28;
kd_psi = 1;
ki_psi = 0;

k_double_psi=[ki_psi   kp_psi    kd_psi];
% A_psi = [0 1 0;
%      0 0 1;
%      c_psi*kp_psi/((1-c_psi)*T_psi) (c_psi*(kp_psi+(kd_psi/T_psi))-b_psi)/(1-c_psi) (c_psi*(kd_psi+(1/T_psi))-a_psi)/(1-c_psi)];
% [V_psi,D_psi] = eig(A_psi);



