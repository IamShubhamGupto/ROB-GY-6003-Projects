figure(1)
subplot(4,1,1); plot(t, ans.result_joint(:,1));title('Joint-1');ylabel('Position (m)');xlabel('Time (s)');
subplot(4,1,2); plot(t, ans.result_joint(:,2));title('Joint-2');ylabel('Position (m)');xlabel('Time (s)');
subplot(4,1,3); plot(t, ans.result_joint(:,3));title('Joint-3');ylabel('Position (m)');xlabel('Time (s)');
subplot(4,1,4); plot(t, ans.result_joint(:,4));title('Joint-4');ylabel('Position (m)');xlabel('Time (s)');

figure(2)
subplot(4,1,1); plot(t, ans.result_error_joint(:,1));title('Error-1');ylabel('Position (m)');xlabel('Time (s)');
subplot(4,1,2); plot(t, ans.result_error_joint(:,2));title('Error-2');ylabel('Position (m)');xlabel('Time (s)');
subplot(4,1,3); plot(t, ans.result_error_joint(:,3));title('Error-3');ylabel('Position (m)');xlabel('Time (s)');
subplot(4,1,4); plot(t, ans.result_error_joint(:,4));title('Error-4');ylabel('Position (m)');xlabel('Time (s)');

figure(3)
subplot(4,1,1); plot(t, ans.result_error_velocity(:,1));title('Error velocity-1');ylabel('speed (m/s)');xlabel('Time (s)');
subplot(4,1,2); plot(t, ans.result_error_velocity(:,2));title('Error velocity-2');ylabel('speed (m/s)');xlabel('Time (s)');
subplot(4,1,3); plot(t, ans.result_error_velocity(:,3));title('Error velocity-3');ylabel('speed (m/s)');xlabel('Time (s)');
subplot(4,1,4); plot(t, ans.result_error_velocity(:,4));title('Error velocity-4');ylabel('speed (m/s)');xlabel('Time (s)');