%% �����ɶ�ֱ��������ʵ���������

clc;
clear;

Sample_Time_Net = 0.005;

mh = 1.8; %ֱ������������ ��λ��kg
loc = 0.78; %ֱ�������嵽��ת��ľ��� ��λ��m

mc = 3.433; %ƽ�������� ��λ��kg
lob = 0.33; %ƽ��쵽֧��ľ��� ��λ��m

mb = 0.67948;
loa = 0.2296;

m1 = 0.552; %ֱ���������ƽ��������� ��λ��kg
m2 = 0.552; %ֱ���������ƽ��������� ��λ��kg  ����û����

ldf = 0.17; %ֱ�����ƽ�������ת��ľ��� ��λ��m
lcd = 0.10; %ֱ���������ƽ������Ӹ����ĵ���ת��ľ��� ��λ��m

I_t = 0.0319;  %ֱ����������ת������
I_e = 1.469;   %ֱ����������ת������
I_psi = 1.469; %ֱ����ƫ����ת������
g = 9.81;
m = (-mc*lob + mh *loc + mb*loa)/loc;%��Ч����
%m = (-mc*lob + mh *loc)/loc;%��Ч����

%% ��ʶ�������
error = 0.8;

%% ����ͨ����ʶ����

a1 = 0.2634;  
a2 = 1.6279;
b1 = 0.531;
ce = 0.3010;

a1_ctrl = a1 * error;  
a2_ctrl = a2 * error;
b1_ctrl = b1 * error;
ce_ctrl = ce * error;

%% ����ͨ����ʶ����

a3 = 25.6488;
b2 = 5.3292;
ct = 0.3410; 

%% ƫ��ͨ����ʶ����

% b3 = 0.65;
b3 = 0.531; %����
b4 = 0.1157;
% b4 = 0.01157;

cp = 0.6804;

%% �ٶȲ�������ģ���������
%              w^2 s
%  D(s)=--------------------
%        s^2 + 2wn s + w^2 
w= 125.66;
n=0.9;
%

%%  UDE��������

%  epsilon_T = 10;  %�����
%  theta_T = 10;
%  psi_T = 10;

% epsilon_T = 0.1;  %С����
% theta_T = 0.1;
% psi_T = 0.1;



%%  ����ͨ�����Ʋ�������
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


%%  ����ͨ�����Ʋ�������

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

%%  ����ͨ�����Ʋ�������

kp_psi = 0.28;
kd_psi = 1;
ki_psi = 0;

k_double_psi=[ki_psi   kp_psi    kd_psi];
% A_psi = [0 1 0;
%      0 0 1;
%      c_psi*kp_psi/((1-c_psi)*T_psi) (c_psi*(kp_psi+(kd_psi/T_psi))-b_psi)/(1-c_psi) (c_psi*(kd_psi+(1/T_psi))-a_psi)/(1-c_psi)];
% [V_psi,D_psi] = eig(A_psi);



