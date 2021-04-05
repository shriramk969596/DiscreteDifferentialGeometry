function [N,dN_Xi1,dN_Xi2] = shapeFun_Bilinear(Xi1,Xi2)  

    %Shape functions
    N(1,1) = ((1-Xi1)*(1-Xi2))/4;
    N(2,1) = ((1+Xi1)*(1-Xi2))/4;
    N(3,1) = ((1+Xi1)*(1+Xi2))/4;
    N(4,1) = ((1-Xi1)*(1+Xi2))/4;
    
    dN_Xi1(1,1) = (-1+Xi2)/4;
    dN_Xi1(2,1) = (1-Xi2)/4;
    dN_Xi1(3,1) = (1+Xi2)/4;
    dN_Xi1(4,1) = (-1-Xi2)/4;
    
    dN_Xi2(1,1) = (-1+Xi1)/4;
    dN_Xi2(2,1) = (-1-Xi1)/4;
    dN_Xi2(3,1) = (1+Xi1)/4;
    dN_Xi2(4,1) = (1-Xi1)/4;

    
end
    