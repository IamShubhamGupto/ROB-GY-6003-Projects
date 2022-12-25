%{
input:
    1-3: Ke - Gain*error
    joint angles
    4: j1
    5: j2
    6: j3
    7: j4
%}
function q_dot= jacobian_phi_relax(input)

Ke=input(1:3);
size(Ke);
j1=input(4);
j2=input(5);
j3=input(6);
j4=input(7);

% robot parameters
a1=0.5;
a2=0.5;

% get jacobian
jacobian_matrix = [
        -a2*sin(j1 + j2) - a1*sin(j1), -a2*sin(j1 + j2), 0, 0; 
        a2*cos(j1 + j2) + a1*cos(j1), a2*cos(j1 + j2), 0,0; 
        0, 0, -1, 0
    ];
ko=10;
qo = [
    -(4*ko*j1)/pi^2;
    -(32*ko*(2*j2 + pi/4))/(9*pi^2);
    -ko*((64*j3)/9 + (40/9));
    -(ko*j4)/(4*pi^2)
    ];

pseudo_inverse_matrix = (transpose(jacobian_matrix))/(jacobian_matrix*transpose(jacobian_matrix));

q_dot = pseudo_inverse_matrix*Ke + (eye(4,4) - pseudo_inverse_matrix*jacobian_matrix)*qo;

end
