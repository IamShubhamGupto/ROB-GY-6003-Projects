%plot tracking

figure(1)
subplot(4,1,1); plot(t, pd(:,1)-result_orientation(:,1));%Position X
subplot(4,1,2); plot(t, pd(:,2)-result_orientation(:,2));%Position Y
subplot(4,1,3); plot(t, pd(:,3)-result_orientation(:,3));%Position Z
subplot(4,1,4); plot(t, theta_d(:,1)-result_orientation(:,4));% Orientation

figure(2)
subplot(4,1,1); plot(t, result_angle(:,1));% q1 revolute
subplot(4,1,2); plot(t, result_angle(:,2));% q2  revolute
subplot(4,1,3); plot(t, result_angle(:,3));% q3  prismatic
subplot(4,1,4); plot(t, result_angle(:,4));% q4  revolute