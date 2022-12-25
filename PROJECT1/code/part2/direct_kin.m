%{
function to compute direct kinematics
input:
    1: theta1
    2: theta2
    3: d3
%}
function result = direct_kin(input)
    % input q   
    theta1 = input(1);
    theta2 = input(2);
    d3 = input(3);
    
    % robot parameters
    a1=0.5;
    a2=0.5;
    base=1;
    
    % output     
    result(1) = a2*cos(theta1 + theta2) + a1*cos(theta1);
    result(2) = a2*sin(theta1 + theta2) + a1*sin(theta1);
    result(3) = base - d3;

end