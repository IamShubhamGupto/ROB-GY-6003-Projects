%main code
clear all;
close all;
clc
Ts=0.001;

% given waypoints
p0=[0;-0.80;0];
p1=[0;-0.80;0.5];
p2=[0.5;-0.6;0.5];
p3=[0.8;0;0.5];
p4=[0.8;0;0];

Ts=0.001;  % sampling time

% timestamps
ts=0:Ts:4;
t0=0;
t1=0.6;
t2=2;
t3=3.4;
t4=4;

anti_time=0.2;   % anticipation time

waypoints_list=[p0 p1 p2 p3 p4];   % waypoints list

% hold variables
hold_pos=zeros(3,4001);   
hold_vel=zeros(3,4001);   
hold_acc=zeros(3,4001);   

dt0=0;
dt1=dt0+0;
dt2=dt1+anti_time;
dt3=dt2+anti_time;
dt4=dt3+anti_time;

% tangent unit vector
tuv1=(p1-p0)/norm(p1-p0);
tuv2=(p2-p1)/norm(p2-p1);
tuv3=(p3-p2)/norm(p3-p2);
tuv4=(p4-p3)/norm(p4-p3);
% tangent vector list
tuv_list=[tuv1 tuv2 tuv3 tuv4];
% time advancements
time_list=[t0;t1-dt1;t2-dt2;t3-dt3;t4-dt4];   
ti=[t0;t1-dt2;t2-dt3;t3-dt4];

% list of norms of segments
norm_list=[norm(p1-p0);norm(p2-p1);norm(p3-p2);norm(p4-p3)];   

m=1;
n=1;
for t=0:Ts:t4-dt4
   if(t>=0 && t<0.4)
        m=1;
        hold_pos(:,n)=waypoints_list(:,m)+(trapezoid_h(t,norm_list(m),0,time_list(m+1),ti(m)))*tuv_list(:,m);
        hold_vel(:,n)=(trapezoid_hd(t,norm_list(m),0,time_list(m+1),ti(m)))*tuv_list(:,m);
        hold_acc(:,n)=(trapezoid_hdd(t,norm_list(m),0,time_list(m+1),ti(m)))*tuv_list(:,m);
   elseif (t>=0.4 && t<0.6)
        m=1;
        hold_pos(:,n)=waypoints_list(:,m)+(trapezoid_h(t,norm_list(m),0,time_list(m+1),ti(m)))*tuv_list(:,m);
        hold_vel(:,n)=(trapezoid_hd(t,norm_list(m),0,time_list(m+1),ti(m)))*tuv_list(:,m);
        hold_acc(:,n)=(trapezoid_hdd(t,norm_list(m),0,time_list(m+1),ti(m)))*tuv_list(:,m);
        m=2;
        hold_pos(:,n)=hold_pos(:,n)+(trapezoid_h(t,norm_list(m),0,time_list(m+1),ti(m)))*tuv_list(:,m);
        hold_vel(:,n)=hold_vel(:,n)+(trapezoid_hd(t,norm_list(m),0,time_list(m+1),ti(m)))*tuv_list(:,m);
        hold_acc(:,n)=hold_acc(:,n)+(trapezoid_hdd(t,norm_list(m),0,time_list(m+1),ti(m)))*tuv_list(:,m);
   elseif (t>=0.6 && t<1.6)
        m=2;
        hold_pos(:,n)=waypoints_list(:,m)+(trapezoid_h(t,norm_list(m),0,time_list(m+1),ti(m)))*tuv_list(:,m);        
        hold_vel(:,n)=(trapezoid_hd(t,norm_list(m),0,time_list(m+1),ti(m)))*tuv_list(:,m);        
        hold_acc(:,n)=(trapezoid_hdd(t,norm_list(m),0,time_list(m+1),ti(m)))*tuv_list(:,m);
   elseif (t>=1.6 && t<1.8)
        m=2;
        hold_pos(:,n)=waypoints_list(:,m)+(trapezoid_h(t,norm_list(m),0,time_list(m+1),ti(m)))*tuv_list(:,m);        
        hold_vel(:,n)=(trapezoid_hd(t,norm_list(m),0,time_list(m+1),ti(m)))*tuv_list(:,m);       
        hold_acc(:,n)=(trapezoid_hdd(t,norm_list(m),0,time_list(m+1),ti(m)))*tuv_list(:,m);
        m=3;
        hold_pos(:,n)=hold_pos(:,n)+(trapezoid_h(t,norm_list(m),0,time_list(m+1),ti(m)))*tuv_list(:,m);        
        hold_vel(:,n)=hold_vel(:,n)+(trapezoid_hd(t,norm_list(m),0,time_list(m+1),ti(m)))*tuv_list(:,m);        
        hold_acc(:,n)=hold_acc(:,n)+(trapezoid_hdd(t,norm_list(m),0,time_list(m+1),ti(m)))*tuv_list(:,m);
   elseif (t>=1.8 && t<2.8)
        m=3;
        hold_pos(:,n)=waypoints_list(:,m)+(trapezoid_h(t,norm_list(m),0,time_list(m+1),ti(m)))*tuv_list(:,m);        
        hold_vel(:,n)=(trapezoid_hd(t,norm_list(m),0,time_list(m+1),ti(m)))*tuv_list(:,m);        
        hold_acc(:,n)=(trapezoid_hdd(t,norm_list(m),0,time_list(m+1),ti(m)))*tuv_list(:,m);
   elseif (t>=2.8 && t<3.0) 
        m=3;
        hold_pos(:,n)=waypoints_list(:,m)+(trapezoid_h(t,norm_list(m),0,time_list(m+1),ti(m)))*tuv_list(:,m);        
        hold_vel(:,n)=(trapezoid_hd(t,norm_list(m),0,time_list(m+1),ti(m)))*tuv_list(:,m);        
        hold_acc(:,n)=(trapezoid_hdd(t,norm_list(m),0,time_list(m+1),ti(m)))*tuv_list(:,m);
        m=4;
        hold_pos(:,n)=hold_pos(:,n)+(trapezoid_h(t,norm_list(m),0,time_list(m+1),ti(m)))*tuv_list(:,m);        
        hold_vel(:,n)=hold_vel(:,n)+(trapezoid_hd(t,norm_list(m),0,time_list(m+1),ti(m)))*tuv_list(:,m);        
        hold_acc(:,n)=hold_acc(:,n)+(trapezoid_hdd(t,norm_list(m),0,time_list(m+1),ti(m)))*tuv_list(:,m);
   else 
        m=4;
        hold_pos(:,n)=waypoints_list(:,m)+(trapezoid_h(t,norm_list(m),0,time_list(m+1),ti(m)))*tuv_list(:,m);        
        hold_vel(:,n)=(trapezoid_hd(t,norm_list(m),0,time_list(m+1),ti(m)))*tuv_list(:,m);      
        hold_acc(:,n)=(trapezoid_hdd(t,norm_list(m),0,time_list(m+1),ti(m)))*tuv_list(:,m);
   end      
    n=n+1;
end
% set nth position to zero
while(n<=4001)
    hold_pos(:,n)=hold_pos(:,n-1);
    hold_vel(:,n)=0;        
    hold_acc(:,n)=0;
    n=n+1;
end

% plot the values
plot_output

t = 0:0.001:4;
t=t';
q0 = [-0.9273; -1.2870; 0.7000; 2.2143];

theta_d=zeros(4001,1);
theta_d_dot=zeros(4001,1);
theta_d_dot_dot=zeros(4001,1);

Tc=0.001;

hold_pos = hold_pos';
hold_vel = hold_vel';
hold_acc = hold_acc';

save generated_traj.mat hold_pos hold_vel hold_acc t theta_d_dot_dot theta_d theta_d_dot Tc q0

function hold=trapezoid_h(t,qf,qi,tf,ti)
    t=t-ti;
    tf=tf-ti;
    gain=7.96;
    tc=((tf)/2)-(1/2)*sqrt((((tf^2)*gain)-4*(qf-qi))/gain);
        if (t<=tc && t>=0)
            hold=qi+(0.5)*gain*t^2;
        elseif (t>tc && t<=tf-tc)
            hold= qi+gain*tc*(t-(tc/2));
        elseif (t>=tf-tc && t<=(tf))
            hold=qf-(0.5)*gain*(((tf)-t)^2);
        end  
end

function hold_d=trapezoid_hd(t,qf,qi,tf,ti)
    t=t-ti;
    tf=tf-ti;
    gain=7.96;
    tc=((tf)/2)-(0.5)*sqrt(((((tf)^2)*gain)-4*(qf-qi))/gain);
        if (t<=tc && t>=0)
            hold_d=gain*t;
        elseif (t>tc && t<=tf-tc)
            hold_d= gain*tc;
        elseif (t>=tf-tc && t<=tf)
            hold_d=gain*(tf-t);
        end
end

function hold_dd=trapezoid_hdd(t,qf,qi,tf,ti)
    t=t-ti;
    tf=tf-ti;
    gain=7.96;
    tc=(tf/2)-(0.5)*sqrt((((tf^2)*gain)-4*(qf-qi))/gain);
        if (t<=tc && t>=0)
            hold_dd=gain;
        elseif (t>tc && t<=tf-tc)
            hold_dd= 0;
        elseif (t>=tf-tc && t<=tf)
            hold_dd=-gain;
        end
end



