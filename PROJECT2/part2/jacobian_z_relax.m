function [q_dot]= jacobian_z_relax(Ke_q)

    Ke = Ke_q(1:3);
    theta1 = Ke_q(4);
    theta2 = Ke_q(5);
    d3 = Ke_q(6);
    
    % robot parameters
    a1 = 0.5;
    a2 = 0.5;
    base = 1;
    
    jacobian_mat = [
        -a2*sin(theta1 + theta2) - a1*sin(theta1), -a2*sin(theta1 + theta2), 0, 0; 
        a2*cos(theta1 + theta2) + a1*cos(theta1), a2*cos(theta1 + theta2), 0, 0; 
        1, 1, 0, 1];
    
    pseudo_inv=(transpose(jacobian_mat))/(jacobian_mat*transpose(jacobian_mat));
    
    inter = [0;0;0;0];
    
    inter(1) = (7*a2*cos(theta1 + theta2) + 4*a2*sin(theta1 + theta2) + 7*a1*cos(theta1) + 4*a1*sin(theta1))/(10*sqrt(abs((a2*cos(theta1 + theta2) + a1*cos(theta1) - sym(2/5)))^2 + abs((d3 - base + sym(1/2)))^2 + abs((a2*sin(theta1 + theta2) + a1*sin(theta1) + sym(7/10)))^2));
    inter(2) = (a2*(7*cos(theta1 + theta2) + 4*sin(theta1 + theta2) - 10*a1*sin(theta2)))/(10*sqrt(abs((a2*cos(theta1 + theta2) + a1*cos(theta1) - sym(2/5)))^2 + abs((d3 - base + sym(1/2)))^2 + abs((a2*sin(theta1 + theta2) + a1*sin(theta1) + sym(7/10)))^2));
    inter(3) = (abs((d3 - base + sym(1/2)))*sign(d3 - base + sym(1/2)))/sqrt(abs((a2*cos(theta1 + theta2) + a1*cos(theta1) - sym(2/5)))^2 + abs((d3 - base + sym(1/2)))^2 + abs((a2*sin(theta1 + theta2) + a1*sin(theta1) + sym(7/10)))^2);
    inter(4) = 0;
    
    %positive constant
    ko = 89;
    qo_dot_dot = ko*(inter);
    
    
    q_dot = pseudo_inv*Ke + (eye(4,4) - pseudo_inv*jacobian_mat)*qo_dot_dot;
 
    

end