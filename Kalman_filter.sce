// サイン波を作成
w=%pi/4; // 各周波数
T=0.1; // 周期
t=0:T:500;
signal=cos(w*t);
// ノイズを有するサイン波
v=rand(t,"normal");
y=signal+v;
// ノイズを有するサイン波をプロット
subplot(2,1,1);
plot(t,y);
xtitle("sinusoid with noise","t");
// システム
n=2; // システムの次数
f=[cos(w*T) -sin(w*T); sin(w*T) cos(w*T)];
g=0;
h=[1 0];
p0=[1000 0; 0 0];
R=70;
Q= 80;
x0=zeros(n,1);
// ループを初期化
x1=x0;
p1=p0;
// カルマンフィルタ
for i=1:length(t)-1
    [x1(:,i+1),p1,x,p]=kalm(y(i),x1(:,i),p1,f,g,h,Q,R);
end
// サイン波(緑)と比較するために,結果を(赤で)プロット
subplot(2,1,2);
plot(t,signal,"color","green");
plot(t,x1(1,:),"color","red");
xtitle("Comparison between sinusoid (green) and extraction with Kalman filter (red)","t");
