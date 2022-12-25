figure(1)
subplot(3,1,1); plot(ts,hold_pos(1,:));title("Position X");ylabel('Position (m)');xlabel('Time (s)');
subplot(3,1,2); plot(ts,hold_pos(2,:));title("Position Y");ylabel('Position (m)');xlabel('Time (s)');
subplot(3,1,3); plot(ts,hold_pos(3,:));title("Position Z");ylabel('Position (m)');xlabel('Time (s)');

figure(2)
subplot(3,1,1); plot(ts,hold_vel(1,:));title("Velocity X");ylabel('Speed (m/s)');xlabel('Time (s)');
subplot(3,1,2); plot(ts,hold_vel(2,:));title("Velocity Y");ylabel('Speed (m/s)');xlabel('Time (s)');
subplot(3,1,3); plot(ts,hold_vel(3,:));title("Velocity Z");ylabel('Speed (m/s)');xlabel('Time (s)');

figure(3)
subplot(3,1,1); plot(ts,hold_acc(1,:));title("Acceleration X");ylabel('Acceleration (m/s^2)');xlabel('Time (s)');
subplot(3,1,2); plot(ts,hold_acc(2,:));title("Acceleration Y");ylabel('Acceleration (m/s^2)');xlabel('Time (s)');
subplot(3,1,3); plot(ts,hold_acc(3,:));title("Acceleration Z");ylabel('Acceleration (m/s^2)');xlabel('Time (s)');

figure(4)
plot3(hold_pos(1,:),hold_pos(2,:),hold_pos(3,:)); title("3D trajectory")