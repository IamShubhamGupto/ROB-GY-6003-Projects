%{
input:
    1: theta1
    2: theta2
    3: d3
    4: theta4
%}
function [direct_kin_result] = direct_kin(input)

    theta1 = input(1);
    theta2 = input(2);
    d3 = input(3);
    theta4 = input(4);

    % robot parameters
    a1=0.5;
    a2=0.5;
    base=1;
    
    HT_matrix = [
        cos(theta1 + theta2 + theta4), -sin(theta1 + theta2 + theta4), 0, a2*cos(theta1 + theta2) + a1*cos(theta1); 
        sin(theta1 + theta2 + theta4), cos(theta1 + theta2 + theta4), 0, a2*sin(theta1 + theta2) + a1*sin(theta1); 
        0, 0, 1, base - d3;
        0, 0, 0, 1
       ];
    
    
    inter_res = HT_matrix*[0; 0; 0; 1];
    direct_kin_result = [inter_res(1:3); theta1 + theta2 + theta4];


end
