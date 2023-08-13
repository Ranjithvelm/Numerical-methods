% Read in the STL file
fv = stlread('cube.stl');

% Identify boundary edges of the mesh
boundary_edges = freeBoundary(fv);

% Calculate edge lengths and find mean and standard deviation
edge_lengths = vecnorm(diff(fv.vertices(boundary_edges), [], 2), 2, 2);
mean_length = mean(edge_lengths);
std_length = std(edge_lengths);

% Identify short edges
short_edges = boundary_edges(edge_lengths < (mean_length - std_length/2),:);

% Identify hole edges
hole_edges = setdiff(boundary_edges, short_edges, 'rows');

% Visualize the mesh with holes highlighted
figure
patch(fv, 'FaceColor', [0.8 0.8 1], 'EdgeColor', 'none');
hold on
plot3(fv.vertices(short_edges(:,1), 1), fv.vertices(short_edges(:,1), 2), ...
      fv.vertices(short_edges(:,1), 3), 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
plot3(fv.vertices(hole_edges(:,1), 1), fv.vertices(hole_edges(:,1), 2), ...
      fv.vertices(hole_edges(:,1), 3), 'r-', 'LineWidth', 2);
