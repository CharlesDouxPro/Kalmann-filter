clear all

//-----Read csv file-----
Mx1=csvRead("1-x1-000.csv");
My1=csvRead("1-y1-000.csv");
Mz1=csvRead("1-z1-000.csv");
Mx2=csvRead("2-x1-000.csv");
My2=csvRead("2-y1-000.csv");
Mz2=csvRead("2-z1-000.csv");

//-----Examine the size of the matrix-----%
[nrx1, nc] = size(Mx1);
[nry1, nc] = size(My1);
[nrz1, nc] = size(Mz1);
[nrx2, nc] = size(Mx2);
[nry2, nc] = size(My2);
[nrz2, nc] = size(Mz2);
//

//%%%Geomagnetic sensor output
COMX_x1=Mx1(2:nrx1,2);
COMX_y1=Mx1(2:nrx1,3);
COMX_z1=Mx1(2:nrx1,4);

COMY_x1=My1(2:nry1,2);
COMY_y1=My1(2:nry1,3);
COMY_z1=My1(2:nry1,4);

COMZ_x1=Mz1(2:nrz1,2);
COMZ_y1=Mz1(2:nrz1,3);
COMZ_z1=Mz1(2:nrz1,4);

COMX_x2=Mx2(2:nrx2,2);
COMX_y2=Mx2(2:nrx2,2);
COMX_z2=Mx2(2:nrx2,2);

COMY_x2=My2(2:nry2,2);
COMY_y2=My2(2:nry2,2);
COMY_z2=My2(2:nry2,2);

COMZ_x2=Mz2(2:nrz2,2);
COMZ_y2=Mz2(2:nrz2,3);
COMZ_z2=Mz2(2:nrz2,4);

//Convert the unit(gauss→mgauss)
COMX_X1=COMX_x1*1000;
COMX_Y1=COMX_y1*1000;
COMX_Z1=COMX_z1*1000;

COMY_X1=COMY_x1*1000;
COMY_Y1=COMY_y1*1000;
COMY_Z1=COMY_z1*1000;

COMZ_X1=COMZ_x1*1000;
COMZ_Y1=COMZ_y1*1000;
COMZ_Z1=COMZ_z1*1000;

COMX_X2=COMX_x2*1000;
COMX_Y2=COMX_y2*1000;
COMX_Z2=COMX_z2*1000;

COMY_X2=COMY_x2*1000;
COMY_Y2=COMY_y2*1000;
COMY_Z2=COMY_z2*1000;

COMZ_X2=COMZ_x2*1000;
COMZ_Y2=COMZ_y2*1000;
COMZ_Z2=COMZ_z2*1000;

//Adjust the sensitivity and offset 
Gx1=250;
bx1=100;
Gy1=240;
by1=100;
Gz1=150;
bz1=100;

Gx2=150;
bx2=100;
Gy2=200;
by2=100;
Gz2=250;
bz2=100;

//Corrected magnetic field
comx_x1=(COMX_X1-bx1)/Gx1;
comx_y1=(COMX_Y1-by1)/Gy1;
comx_z1=(COMX_Z1-bz1)/Gz1;

comy_x1=(COMY_X1-bx1)/Gx1;
comy_y1=(COMY_Y1-by1)/Gy1;
comy_z1=(COMY_Z1-bz1)/Gz1;

comz_x1=(COMZ_X1-bx1)/Gx1;
comz_y1=(COMZ_Y1-by1)/Gy1;
comz_z1=(COMZ_Z1-bz1)/Gz1;
//

comx_x2=(COMX_X2-bx2)/Gx2;
comx_y2=(COMX_Y2-by2)/Gy2;
comx_z2=(COMX_Z2-bz2)/Gz2;

comy_x2=(COMY_X2-bx2)/Gx2;
comy_y2=(COMY_Y2-by2)/Gy2;
comy_z2=(COMY_Z2-bz2)/Gz2;

comz_x2=(COMZ_X2-bx2)/Gx2;
comz_y2=(COMZ_Y2-by2)/Gy2;
comz_z2=(COMZ_Z2-bz2)/Gz2;
//

plot2d(comx_y2,comx_z2,1);
//isoview(xmin,xmax,ymin,ymax);
title('Magnetic field');
//axis square
