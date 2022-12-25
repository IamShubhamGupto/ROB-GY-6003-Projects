clear all
close all
clc
vrclear
vrclose

load('kinematic_traj.mat');
clik_inverse;
% clik_transpose;
sim('clik_inverse.mdl', t);
% sim('clik_transpose.slx', t);
% SCARA_VR_VISUALIZE(squeeze(result_joint(:,1,:)), true);
visualize_results;