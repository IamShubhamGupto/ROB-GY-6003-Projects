function end_pose=direct_kin(q)
angle1=q(1);
angle2=q(2);
d3=q(3);
angle4=q(4);
% given inputs
base=1;
a1=0.5;
a2=0.5;

homogenous_mat=[cos(angle1 + angle2 + angle4), -sin(angle1 + angle2 + angle4), 0, a2*cos(angle1 + angle2) + a1*cos(angle1); 
    sin(angle1 + angle2 + angle4), cos(angle1 + angle2 + angle4), 0, a2*sin(angle1 + angle2) + a1*sin(angle1); 
    0, 0, 1, base - d3;
    0, 0, 0, 1];
inter_mat=homogenous_mat*[0;0;0;1];
end_pose=[inter_mat(1:3);angle1 + angle2 + angle4];
end