%{
calculate B vector

%}
function output=B(input)
    angle1=input(1);
    angle2=input(2);
    d3=input(3);
    angle4=input(4);

    u1=input(5);
    u2=input(6);
    u3=input(7);    
    u4=input(8); 

    % inputs given from the question 
    mass_1 = 25;
    mass_2 = 25;
    mass_3 = 10;
    mass_4 = 5;

    inertia_1 = 5;
    inertia_2 = 5;
    inertia_4 = 1;

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
   
B=[inertia_1 + inertia_2 + inertia_4 + inertia_m2 + inertia_m3 + inertia_m4 + mass_1/16 + mass_2/16 - (a1*mass_1)/2 - (a2*mass_2)/2 + inertia_m1*gr1^2 + a1^2*mass_1 + a1^2*mass_2 + a1^2*mass_3 + a2^2*mass_2 + a1^2*mass_4 + a2^2*mass_3 + a2^2*mass_4 - (a1*mass_2*cos(angle2))/2 + 2*a1*a2*mass_2*cos(angle2) + 2*a1*a2*mass_3*cos(angle2) + 2*a1*a2*mass_4*cos(angle2), inertia_2 + inertia_4 + inertia_m3 + inertia_m4 + mass_2/16 - (a2*mass_2)/2 + a2^2*mass_2 + a2^2*mass_3 + a2^2*mass_4 + inertia_m2*gr2 - (a1*mass_2*cos(angle2))/4 + a1*a2*mass_2*cos(angle2) + a1*a2*mass_3*cos(angle2) + a1*a2*mass_4*cos(angle2), -inertia_m3*gr3, inertia_4 + inertia_m4*gr4;
    inertia_2 + inertia_4 + inertia_m3 + inertia_m4 + mass_2/16 - (a2*mass_2)/2 + a2^2*mass_2 + a2^2*mass_3 + a2^2*mass_4 + inertia_m2*gr2 - (a1*mass_2*cos(angle2))/4 + a1*a2*mass_2*cos(angle2) + a1*a2*mass_3*cos(angle2) + a1*a2*mass_4*cos(angle2), inertia_2 + inertia_4 + inertia_m3 + inertia_m4 + mass_2/16 - (a2*mass_2)/2 + inertia_m2*gr2^2 + a2^2*mass_2 + a2^2*mass_3 + a2^2*mass_4, -inertia_m3*gr3, inertia_4 + inertia_m4*gr4; 
    -inertia_m3*gr3, -inertia_m3*gr3, inertia_m3*gr3^2 + mass_3 + mass_4, 0;
    inertia_4 + inertia_m4*gr4, inertia_4 + inertia_m4*gr4,0, inertia_m4*gr4^2 + inertia_4];
  
    output=B*[u1;u2;u3;u4];
end