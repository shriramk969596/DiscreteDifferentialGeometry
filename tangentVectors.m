X1 = [0 0 0];
X2 = [2 0 2];
X3 = [2 2 0];
X4 = [-1 2 0];


XB = [X1(1:end);X2(1:end);X3(1:end);X4(1:end)];
XB_vecLength = numel(XB);
XB_vector = reshape(XB',XB_vecLength,1);

%plot refinement
n_gridsize = 10; %results in a (n_gridsize X n_gridsizegrid) for surface plot
coord_surfData = zeros(n_gridsize*n_gridsize,3);
%plot refinement

n = 1;
for Xi1 = linspace(-1,1,n_gridsize)
    for Xi2 = linspace(-1,1,n_gridsize)
            
           [N,dN_Xi1,dN_Xi2] = shapeFun_Bilinear(Xi1,Xi2);

            N_Vec(1,1:3:XB_vecLength) = N';
            N_Vec(2,2:3:XB_vecLength) = N';
            N_Vec(3,3:3:XB_vecLength) = N';

            coord_surf = N_Vec*XB_vector;
            
            coord_surfData(n,1:3) = coord_surf';
            n = n+1;
  
    end
end

%Plot
x = coord_surfData(:,1);
y = coord_surfData(:,2);
z = coord_surfData(:,3);
x_grid = reshape(x,sqrt(length(x)),sqrt(length(x)));
y_grid = reshape(y,sqrt(length(y)),sqrt(length(y)));
z_grid = reshape(z,sqrt(length(z)),sqrt(length(z)));

surf(x_grid,y_grid,z_grid); %Plotting surface

%starting computation at Xi1 = 0.5,Xi2 = 0.5
Xi1 = 0.8;
Xi2 = 0.8;

hold on
%for Xi
    [N,dN_Xi1,dN_Xi2] = shapeFun_Bilinear(Xi1,Xi2);

    dN1_Xi1_Vec(1,1:3:XB_vecLength) = dN_Xi1';
    dN1_Xi1_Vec(2,2:3:XB_vecLength) = dN_Xi1';
    dN1_Xi1_Vec(3,3:3:XB_vecLength) = dN_Xi1';
    a1 = dN1_Xi1_Vec*XB_vector;

    dN1_Xi2_Vec(1,1:3:XB_vecLength) = dN_Xi2';
    dN1_Xi2_Vec(2,2:3:XB_vecLength) = dN_Xi2';
    dN1_Xi2_Vec(3,3:3:XB_vecLength) = dN_Xi2';
    a2 = dN1_Xi2_Vec*XB_vector;

   [N,dN_Xi1,dN_Xi2] = shapeFun_Bilinear(Xi1,Xi2);
    N_Vec(1,1:3:XB_vecLength) = N';
    N_Vec(2,2:3:XB_vecLength) = N';
    N_Vec(3,3:3:XB_vecLength) = N';
    vec_coord = N_Vec*XB_vector;

    %normal vector
    a3 = cross(a1,a2)/norm(cross(a1,a2));

    %covariant and contravariant metric tensors
    a_ab_co = [a1'*a1 a1'*a2 ; a2'*a1 a2'*a2 ] ;
    a_ab_contra = inv(a_ab_co);

    %Plotting basis vectors
    P1 = vec_coord;
    P2 = a1+vec_coord;
    vectarrow(P1,P2);

    P3 = vec_coord;
    P4 = a2+vec_coord;
    vectarrow(P3,P4);

    P5 = vec_coord;
    P6 = a3+vec_coord;
    vectarrow(P5,P6);
%end



