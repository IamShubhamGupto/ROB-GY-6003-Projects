clear all
close all
clc
vrclear
vrclose

load('kinematic_traj.mat');
clik_phi_inverse;
sim("clik_phi_inverse",t);
%SCARA_VR_VISUALIZE(squeeze(q(:,1,:)), false);
visualize_results;
%SCARA_VR_VISUALIZE(squeeze((ans.q)'), false);