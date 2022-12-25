function result_orientation = direct_kin(q)
    % input parameters
    theta1 = q(1);
    theta2 = q(2);
    d3 = q(3);
    theta4 = q(4);

    % robot parameters
    base = 1;
    a1 = 0.5;
    a2 = 0.5;
    
    HT_matrix =[
        cos(theta1 + theta2 + theta4), -sin(theta1 + theta2 + theta4), 0, a2*cos(theta1 + theta2) + a1*cos(theta1); 
        sin(theta1 + theta2 + theta4), cos(theta1 + theta2 + theta4), 0, a2*sin(theta1 + theta2) + a1*sin(theta1); 
        0, 0, 1, base - d3;
        0, 0, 0, 1];
    
    
    inter = HT_matrix*[0;0;0;1];
    
    result_orientation=[inter(1:2); theta1 + theta2 + theta4];



end