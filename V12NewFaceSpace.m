function [facespace_new] = V12NewFaceSpace(M,save_path,r)
%V12NEWFACESPACE
% Transforms a perfect circle of radius r back to facegen, using the affine
% transformation defined by input M.
% This M was computed by the relation between facespace and v1_space in the
% function V12FaceGen_Affine.





circle_coord    = [cos([0:11.25:359]*pi/180)*r'; sin([0:11.25:359]*pi/180)*r']';
v = ones(length(circle_coord),1);
circle_coord    = [circle_coord v];

% compute the new Facegen Coordinates by using the inverse of the Matrix)
facespace_new     = circle_coord/M;
% compute it back to v1 again to see the difference later
v1_r=facespace_new*M;

save(sprintf('%sNewFaceSpaceCoord_r%d.mat',save_path,r),'facespace_new');

figure
plot(circle_coord(:,1),circle_coord(:,2),'ro-')
hold on;
plot(facespace_new(:,1),facespace_new(:,2),'bo-')
hold on;
plot(v1_r(:,1),v1_r(:,2),'m.--')
title(sprintf('Computing New FacegenCoordinates using R=%d',r))
legend('perfect Circle V1','Facespace Coordinates (new)',...
    'Recovered V1 Space (M*newFaceSpace)','Location','best');
axis square
axis equal

SaveFigure([save_path mfilename '.png']);
end

