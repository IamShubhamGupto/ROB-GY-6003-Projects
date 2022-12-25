%{
    function to compute jacobian transpose
    input:
        1-4: Ke - gain*error
        5: theta1
        6: theta2
    output:
        q_dot - velocity
%}
function q_dot = jacobian_inverse(input)
    % parameter input       
    Ke = input(1:4);
    theta1 = input(5);
    theta2 = input(6);
    
    % robot parameters   
    a1=0.5;
    a2=0.5;
    
    % compute jacobian matrix     
    jacobian_matrix = [
        -a2*sin(theta1 + theta2) - a1*sin(theta1), -a2*sin(theta1 + theta2), 0, 0; 
        a2*cos(theta1 + theta2) + a1*cos(theta1), a2*cos(theta1 + theta2), 0, 0; 
        0, 0, -1, 0;
        1, 1, 0, 1
        ];
    
    q_dot = inv(jacobian_matrix)*Ke;

end