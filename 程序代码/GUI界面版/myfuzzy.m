%% 模糊图像增强
function I=myfuzzy(X)
[M,N]=size(X);
x1=double(X);
% 基本参数
Fd=0.8;
FD=-1*Fd;
Fe=128;
Xmax=255;
% 模糊特征平面
for i=1:M
    for j=1:N
        P(i,j)=(1+(Xmax-x1(i,j))/Fe)^FD;
    end
end
figure,imshow(P);title('模糊增强 P');
% 模糊增强
for i=1:M
    for j=1:N
        if P(i,j) <= 0.8000
            P1(i,j)=2*P(i,j)^2;
        else
            P1(i,j)=1-2*(1-P(i,j))^2;
        end
    end
end
    P=P1;
figure,imshow(P);title('模糊增强 P1');
% 反模糊化
for i=1:M
    for j=1:N
        I(i,j)=Xmax-Fe*((1/P(i,j))^(1/Fd)-1);
    end
end
I=uint8(I);
