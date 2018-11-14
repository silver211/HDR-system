clear all
close all
R=zeros(10,1);;
G=zeros(10,1);
B=zeros(10,1);
for i=1:10
    img=imread(['Attachment-' num2str(i) '.jpeg']);
    r=img(:,:,1);
    g=img(:,:,2);
    b=img(:,:,3);
    R(i)=mean(mean(r(1750:2250,1250:1750)));
    G(i)=mean(mean(g(1750:2250,1250:1750)));
    B(i)=mean(mean(b(1750:2250,1250:1750)));
end
T=[1/30 1/45 1/60 1/90 1/125 1/180 1/250 1/350 1/500 1/750]';
figure
plot(T,R,'r',T,G,'g',T,B,'b')
xlabel('T(s)')
ylabel('B''')
legend('R channel','G channel','B channel')
r1=corrcoef(log(T),log(R));
g1=1/r1(1,2);
r2=corrcoef(log(T),log(G));
g2=1/r2(1,2);
r3=corrcoef(log(T),log(B));
g3=1/r3(1,2);
figure
plot(T,R.^g1,'r',T,G.^g2,'g',T,B.^g3,'b');
legend(['g_R=' num2str(g1)],['g_G=' num2str(g2)],['g_B=' num2str(g3)])
xlabel('T(s)')
ylabel('B''^g')

