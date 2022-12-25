function q_dd=manipulator(input)
    % given inputs from question
    mass_1 = 25;
    mass_2 = 25;
    mass_3 = 10;
    mass_4 = 5;
    inertia_1 = 5;
    inertia_2 = 5;
    intertia_4 = 1;
    inertia_m1 = 0.0001;
    inertia_m2 = 0.0001;
    inertia_m3 = 0.01;
    inertia_m4 = 0.005;

    a1 = 0.5;
    a2 = 0.5;

    gr1 = 1;
    gr2 = 1;
    gr3 = 50;
    gr4 = 20;

    g = 9.8;

    force_m1 = 0.0001;
    force_m2 = 0.0001;
    force_m3 = 0.01;
    force_m4 = 0.005;
    
    angle1 = input(1);
    angle2 = input(2);
    d3 = input(3);
    angle4 = input(4);

    u1 = input(5);
    u2 = input(6);
    u3 = input(7);
    u4 = input(8);
    angle_d1 = input(9);
    angle_d2 = input(10);
    d3_d = input(11);
    angle_d4 = input(12);

    
   B=[inertia_1 + inertia_2 + intertia_4 + inertia_m2 + inertia_m3 + inertia_m4 + mass_1/16 + mass_2/16 - (a1*mass_1)/2 - (a2*mass_2)/2 + inertia_m1*gr1^2 + a1^2*mass_1 + a1^2*mass_2 + a1^2*mass_3 + a2^2*mass_2 + a1^2*mass_4 + a2^2*mass_3 + a2^2*mass_4 - (a1*mass_2*cos(angle2))/2 + 2*a1*a2*mass_2*cos(angle2) + 2*a1*a2*mass_3*cos(angle2) + 2*a1*a2*mass_4*cos(angle2), inertia_2 + intertia_4 + inertia_m3 + inertia_m4 + mass_2/16 - (a2*mass_2)/2 + a2^2*mass_2 + a2^2*mass_3 + a2^2*mass_4 + inertia_m2*gr2 - (a1*mass_2*cos(angle2))/4 + a1*a2*mass_2*cos(angle2) + a1*a2*mass_3*cos(angle2) + a1*a2*mass_4*cos(angle2), -inertia_m3*gr3, intertia_4 + inertia_m4*gr4;
    inertia_2 + intertia_4 + inertia_m3 + inertia_m4 + mass_2/16 - (a2*mass_2)/2 + a2^2*mass_2 + a2^2*mass_3 + a2^2*mass_4 + inertia_m2*gr2 - (a1*mass_2*cos(angle2))/4 + a1*a2*mass_2*cos(angle2) + a1*a2*mass_3*cos(angle2) + a1*a2*mass_4*cos(angle2), inertia_2 + intertia_4 + inertia_m3 + inertia_m4 + mass_2/16 - (a2*mass_2)/2 + inertia_m2*gr2^2 + a2^2*mass_2 + a2^2*mass_3 + a2^2*mass_4, -inertia_m3*gr3, intertia_4 + inertia_m4*gr4; 
    -inertia_m3*gr3, -inertia_m3*gr3, inertia_m3*gr3^2 + mass_3 + mass_4, 0;
    intertia_4 + inertia_m4*gr4, intertia_4 + inertia_m4*gr4,0, inertia_m4*gr4^2 + intertia_4];

    C=[-angle_d2*(a1*a2*mass_2*sin(angle2) - (a1*mass_2*sin(angle2))/4 + a1*a2*mass_3*sin(angle2) + a1*a2*mass_4*sin(angle2)), - angle_d1*(a1*a2*mass_2*sin(angle2) - (a1*mass_2*sin(angle2))/4 + a1*a2*mass_3*sin(angle2) + a1*a2*mass_4*sin(angle2)) - angle_d2*(a1*a2*mass_2*sin(angle2) - (a1*mass_2*sin(angle2))/4 + a1*a2*mass_3*sin(angle2) + a1*a2*mass_4*sin(angle2)), 0, 0;
       angle_d1*(a1*a2*mass_2*sin(angle2) - (a1*mass_2*sin(angle2))/4 + a1*a2*mass_3*sin(angle2) + a1*a2*mass_4*sin(angle2)), 0, 0, 0;
       0, 0, 0, 0; 
       0, 0, 0, 0];

    gravity_mat = [0; 0; -(mass_3+mass_4)*g; 0];
    force_mat = [gr1^2*force_m1 0 0 0;0 gr2^2*force_m2 0 0;0 0 gr3^2*force_m3 0;0 0 0 gr4^2*force_m4];
    torque_mat = [u1;u2;u3;u4];
    torqx= C*[angle_d1 angle_d2 d3_d angle_d4]'+force_mat*[angle_d1 angle_d2 d3_d angle_d4]'+gravity_mat;
    q_dd = inv(B)*(torque_mat-torqx);

end