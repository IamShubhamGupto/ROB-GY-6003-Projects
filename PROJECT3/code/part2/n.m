function output=n(input)
    
    angle_d1=input(1);
    angle_d2=input(2);
    d3_d=input(3);
    angle_d4=input(4);
    angle1=input(6);
    mass_1 = 25;
    mass_2 = 25;
    mass_3 = 10;
    mass_4 = 5;

    a1 = 0.5;
    a2 = 0.5;

    GR1 = 1;
    GR2 = 1;
    GR3 = 50;
    GR4 = 20;

    g = 9.8;

    force_m1 = 0.0001;
    force_m2 = 0.0001;
    force_m3 = 0.01;
    force_m4 = 0.005;

    C=[-angle_d2*(a1*a2*mass_2*sin(angle1) - (a1*mass_2*sin(angle1))/4 + a1*a2*mass_3*sin(angle1) + a1*a2*mass_4*sin(angle1)), - angle_d1*(a1*a2*mass_2*sin(angle1) - (a1*mass_2*sin(angle1))/4 + a1*a2*mass_3*sin(angle1) + a1*a2*mass_4*sin(angle1)) - angle_d2*(a1*a2*mass_2*sin(angle1) - (a1*mass_2*sin(angle1))/4 + a1*a2*mass_3*sin(angle1) + a1*a2*mass_4*sin(angle1)), 0, 0;
       angle_d1*(a1*a2*mass_2*sin(angle1) - (a1*mass_2*sin(angle1))/4 + a1*a2*mass_3*sin(angle1) + a1*a2*mass_4*sin(angle1)), 0, 0, 0;
       0, 0, 0, 0; 
       0, 0, 0, 0];
 
    Gvty = [0; 0; -(mass_3+mass_4)*g; 0];
    ForceV = [GR1^2*force_m1 0 0 0;0 GR2^2*force_m2 0 0;0 0 GR3^2*force_m3 0;0 0 0 GR4^2*force_m4];
    output = C*[angle_d1;angle_d2;d3_d;angle_d4]+ForceV*[angle_d1;angle_d2 ;d3_d;angle_d4]+Gvty;
end
