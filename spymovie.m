clc, clear all, close all
w = 1 - kernel(8);
for i=1:64,g=repmat( w(i,:), 64,1).*w;spy(g),pause(0.2),end