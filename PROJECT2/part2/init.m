clear all
close all
clc
vrclear
vrclose

load('kinematic_traj.mat');
clik_z_inverse;
sim('clik_z_inverse.mdl', t);
visualize_results
% SCARA_VR_VISUALIZE(squeeze(q(:,1,:)), false);