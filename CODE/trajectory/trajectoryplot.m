clc 
clear all
close all
x10=load('100300N80x.txt');
y10=load('100300N80y.txt');
% x10=[0;x10;1000];
% y10=[0;y10;0];
x20=load('300500N80x.txt');
y20=load('300500N80y.txt');
% x20=[0;x20;1000];
% y20=[0;y20;0];
x30=load('500700N80x.txt');
y30=load('500700N80y.txt');
% x30=[0;x30;1000];
% y30=[0;y30;0];
x40=load('1dx8.txt');
y40=load('1dy8.txt');
% x40=[0;x40;1000];
% y40=[0;y40;0];

x50=load('1dx10.txt');
y50=load('1dy10.txt');
% x50=[0;x50;1000];
% y50=[0;y50;0];
x60=load('1dx11.txt');
y60=load('1dy11.txt');
% x20=load('dx20.txt');

% x20=load('dx20.txt');
% y20=load('dy20.txt');
% x20=[0;x20;2000];
% y20=[0;y20;0];
% x40=load('dx40.txt');
% y40=load('dy40.txt');
% x40=[0;x40;2000];
% y40=[0;y40;0];
% x50=load('dx50.txt');
% y50=load('dy50.txt');
% x50=[0;x50;2000];
% y50=[0;y50;0];
% x60=load('dx60.txt');
% y60=load('dy60.txt');
% x60=[0;x60;2000];
% y60=[0;y60;0];
%
% dx=load('1dx10.txt');
% dx=[0;dx(2:60);2000];
% dy =load('1dy10.txt');
% dy=[0;dy(2:60);0];
% 
% dx1=load('1dx20.txt');
% dx1=[0;dx1(2:60);2000];
% dy1 =load('1dy20.txt');
% dy1=[0;dy1(2:60);0];
% 
% dx2=load('1dx30.txt');
% dx2=[0;dx2(2:60);2000];
% dy2 =load('1dy30.txt');
% dy2=[0;dy2(2:60);0];
% 
% dx3=load('1dx40.txt');
% dx3=[0;dx3(2:60);2000];
% dy3 =load('1dy40.txt');
% dy3=[0;dy3(2:60);0];
% 
% dx4=load('1dx50.txt');
% dx4=[0;dx4(2:60);2000];
% dy4 =load('1dy50.txt');
% dy4=[0;dy4(2:60);0];

plot(x10,y10,'r')
 hold on
 plot(x20,y20,'g')
  plot(x30,y30,'c')
  legend('a=100,b=300','a=300,b=500','a=500,b=700');

   plot(x40,y40,'k')
  plot(x50,y50,'m')
     plot(x60,y60,'*')
% plot(x60,y60,'*')
%
% plot(dx,dy,'r')
% plot(dx1,dy1,'g')
% plot(dx2,dy2,'c')
% plot(dx3,dy3,'k')
%plot(x10,y10,'*')
% h10=load('h10.txt');
% 
% x20=load('x201.txt');
% 
% y20=load('y201.txt');
% 
% h20=load('h201.txt');
% 
% % x30=load('x30.txt');
% % 
% % y30=load('y30.txt');
% % 
% % h30=load('h30.txt');
% 
% x30=load('x301.txt');
% 
% y30=load('y301.txt');
% 
% h30=load('h301.txt');
% x40=load('x401.txt');
% 
% y40=load('y401.txt');
% 
% h40=load('h401.txt');


% plot3(x10,y10,h10,'r');
% hold on
% plot3(x20,y20,h20,'g');
% % plot3(x30,y30,h30,'c');
% plot3(x30,y30,h30,'k');
% plot3(x40,y40,h40,'*');
legend('a=100,b=300','a=300,b=500','a=500,b=700');

%title('Line in 3-D Space');

%text(0,0,0,'origin');

% xlabel('X');ylabel('Y');zlabel('Z');grid;