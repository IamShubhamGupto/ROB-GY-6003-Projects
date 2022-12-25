function Xe_d= jacobian(q,q_dot)
    angle_1=q(1);
    angle_2=q(2);
    
    % given inputs from question  
    a1=0.5;
    a2=0.5;

    jacobian_mat=[- a2*sin(angle_1 + angle_2) - a1*sin(angle_1), -a2*sin(angle_1 + angle_2), 0, 0; 
        a2*cos(angle_1 + angle_2) + a1*cos(angle_1), a2*cos(angle_1 + angle_2), 0,0; 
        0, 0, -1, 0;
        1, 1, 0, 1];
    
    Xe_d=jacobian_mat*q_dot;

end
