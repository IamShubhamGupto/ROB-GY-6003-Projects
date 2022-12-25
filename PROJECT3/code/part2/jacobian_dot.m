function jacobian_d=jacobian_dot(qaqd)
angle_1=qaqd(1);
angle_2=qaqd(2);
angle_d1=qaqd(5);
angle_d2=qaqd(6);
d3_d=qaqd(7);
angle4_d=qaqd(8);

q_d=[angle_d1;angle_d2;d3_d;angle4_d];
% given inputs from question
a1=0.5;
a2=0.5;
jacobian_dp=[
    - a2*cos(angle_1 + angle_2)*(angle_d1 + angle_d2) - a1*cos(angle_1)*angle_d1, -a2*cos(angle_1 + angle_2)*(angle_d1 + angle_d2), 0, 0;
    - a2*sin(angle_1 + angle_2)*(angle_d1 + angle_d2) - a1*sin(angle_1)*angle_d1, -a2*sin(angle_1 + angle_2)*(angle_d1+ angle_d2), 0, 0;
    0, 0, 0, 0;
    0, 0, 0, 0
    ];
jacobian_d=jacobian_dp*q_d;
end
