function degree = CalRotationDegree(Coordi1,Coordi2)

degree1 = acos(dot(Coordi1,Coordi2)/(sqrt(sumsqr(Coordi1))*sqrt(sumsqr(Coordi2))));
degree2 = pi-degree1;

degree_min= min(degree1,degree2);
degree = degree_min*180/pi;
