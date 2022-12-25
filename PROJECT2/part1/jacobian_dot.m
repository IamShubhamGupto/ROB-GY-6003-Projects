%{
    function to compute jacobian dot
    input:
        1: theta1
        2: theta2
        5: theta1_dot
        6: theta2_dot
        7: d3_dot
        8: theta4_dot 
    output:
        jacobian_dot_value - differentiated value
%}
function jacobian_dot_value=jacobian_dot(input)
    % parameter input
    theta1 = input(1);
    theta2 = input(2);
    theta1_dot = input(5);
    theta2_dot = input(6);
    d3_dot = input(7);
    theta4_dot = input(8);
    
    q_dot=[theta1_dot;theta2_dot;d3_dot;theta4_dot];
    
    % robot parameters
    a1=0.5;
    a2=0.5;
    
    jacobian_dot_pre=[
        -a2*cos(theta1 + theta2)*(theta1_dot + theta2_dot) - a1*cos(theta1)*theta1_dot, -a2*cos(theta1 + theta2)*(theta1_dot + theta2_dot), 0, 0;
        -a2*sin(theta1 + theta2)*(theta1_dot + theta2_dot) - a1*sin(theta1)*theta1_dot, -a2*sin(theta1 + theta2)*(theta1_dot + theta2_dot), 0, 0;
        0, 0, 0, 0;
        0, 0, 0, 0
       ];
    jacobian_dot_value = jacobian_dot_pre*q_dot;
end