clear all
close all
clc
vrclear
vrclose

%load('generated_traj.mat');
load('generated_traj.mat');
control;
sim('control.mdl', t);
%SCARA_VR_VISUALIZE(squeeze(q(:,1,:)), false);

visualize_results
