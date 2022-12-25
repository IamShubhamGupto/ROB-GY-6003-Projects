figure(1)
subplot(4,1,1); plot(t, pd(:,1)-result_coordinate(:,1));title('Error in X');ylabel('magnitude (m)');xlabel('Time (s)');
subplot(4,1,2); plot(t, pd(:,2)-result_coordinate(:,2));title('Error in Y');ylabel('magnitude (m)');xlabel('Time (s)');
subplot(4,1,3); plot(t, pd(:,3)-result_coordinate(:,3));title('Error in Z');ylabel('magnitude (m)');xlabel('Time (s)');


figure(2)
subplot(4,1,1); plot(t, result_joint(:,1));title('Joint 1 - Revolute');ylabel('angle (rad)');xlabel('Time (s)');
subplot(4,1,2); plot(t, result_joint(:,2));title('Joint 2 - Revolute');ylabel('angle (rad)');xlabel('Time (s)');
subplot(4,1,3); plot(t, result_joint(:,3));title('Joint 3 - Prismatic');ylabel('magnitude (m)');xlabel('Time (s)');
subplot(4,1,4); plot(t, result_joint(:,4));title('Joint 4 - Revolute');ylabel('angle (rad)');xlabel('Time (s)');