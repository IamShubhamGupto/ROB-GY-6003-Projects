figure(1)
subplot(4,1,1); plot(t, pd(:,1)-result_orientation(:,1));title('Error in X vs Time');ylabel('magnitude (m)');xlabel('Time (s)');
subplot(4,1,2); plot(t, pd(:,2)-result_orientation(:,2));title('Error in Y vs Time');ylabel('magnitude (m)');xlabel('Time (s)');
subplot(4,1,3); plot(t, pd(:,3)-result_orientation(:,3));title('Error in Theta vs Time');ylabel('magnitude (m)');xlabel('Time (s)');
% subplot(4,1,4); plot(t, theta_d(:,1)-result_orientation(:,4));title('Error in Theta vs Time');ylabel('angle (rad)');xlabel('Time (s)');

figure(2)
subplot(4,1,1); plot(t, result_angle(:,1));title('Joint 1 - Revolute');ylabel('angle (rad)');xlabel('Time (s)');
subplot(4,1,2); plot(t, result_angle(:,2));title('Joint 2 - Revolute');ylabel('angle (rad)');xlabel('Time (s)');
subplot(4,1,3); plot(t, result_angle(:,3));title('Joint 3 - Prismatic');ylabel('extension (m)');xlabel('Time (s)');
subplot(4,1,4); plot(t, result_angle(:,4));title('Joint 4 - Revolute');ylabel('angle (rad)');xlabel('Time (s)');