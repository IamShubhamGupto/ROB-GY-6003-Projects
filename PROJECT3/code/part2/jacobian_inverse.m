% return acceleration
function q_dd= jacobian_inverse(Keq)
% gain
Ke=Keq(1:4);
angle_1=Keq(5);
angle_2=Keq(6);

% given inputs from question
a1=0.5;
a2=0.5;

jacobian_mat=[
    -a2*sin(angle_1 + angle_2) - a1*sin(angle_1), -a2*sin(angle_1 + angle_2), 0, 0; 
    a2*cos(angle_1 + angle_2) + a1*cos(angle_1), a2*cos(angle_1 + angle_2), 0, 0; 
    0, 0, -1, 0;
    1, 1, 0, 1
    ];
q_dd=inv(jacobian_mat)*Ke;
end
