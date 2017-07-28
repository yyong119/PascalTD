uses crt,graph;
const
n=20;
m=20;
maxdts=10;
lj='lyktf\';
coldtime=100;
outtextx=10;
outtexty=8;
fxx:array[1..4] of integer=(-1,1,0,0);
fxy:array[1..4] of integer=(0,0,-1,1);
var
k1,k2,k3:string;
a:array[0..n+1,0..m+1] of 0..5;
spjj,sct:array[1..n+2,1..m+2] of record k:char; ys,bjys:integer; end;
t,tzl:array[1..10000] of record
                     x,y,jq,gj,jg,fw,jsgl,kxgl,bdgl,gjgs,ys,lq,sjcs,ysjcs:longint;
                     my:char;
                     end;
g,gwzl:array[1..10000000] of record
                     scx,scy,x,y,hp,sd,zt,lq,jq,kxsc,jssj,mmkx,kxsj,kxzc,gl,yyhp,bdbs,cgsj:longint;
                     my:char;
                     end;
f:text;
tgsqd,tgs,zsj,jq,tzls,ggs,gwzls,ggsqd,xx,yy,ax,qdx,qdy,maxx,maxy,scxx,scyy:longint;
gdd,gm:integer;
procedure cssj;
begin
gdd:=detect;
spjj[1,1].bjys:=red;
initgraph(gdd,gm,'');
randomize;
xx:=1;yy:=1;ax:=10;
ggsqd:=1;tgsqd:=1;
fillchar(a,sizeof(a),0);
jq:=500;
end;
procedure gs(k:integer);
var
i:integer;
begin
inc(ggsqd);
for i:=k downto ggsqd do
g[i]:=g[i-1];
jq:=jq+g[k].jq;
end;
procedure scdt;
var
i,j:integer;
begin
for i:=1 to n+2 do
begin
for j:=1 to m+2 do
if (i=1)or(j=1)or(i=n+2)or(j=m+2) then begin spjj[i,j].bjys:=black;spjj[i,j].ys:=yellow; spjj[i,j].k:='#'; end
else if a[i-1,j-1]=4 then begin spjj[i,j].bjys:=black; spjj[i,j].ys:=yellow; spjj[i,j].k:='#'; end
else if a[i-1,j-1]=1 then begin spjj[i,j].bjys:=green; spjj[i,j].k:=' '; end
else if a[i-1,j-1]=5 then spjj[i,j].bjys:=green
else begin spjj[i,j].bjys:=8; spjj[i,j].k:=' '; end;
end;
end;
procedure hg;
var
i,x,y:integer;
begin
for i:=ggsqd to ggs do
begin
y:=g[i].y+1;x:=g[i].x+1;
if g[i].zt=1 then spjj[x,y].ys:=blue
else if g[i].zt=2 then spjj[x,y].ys:=red
else if g[i].zt=3 then spjj[x,y].ys:=8
else spjj[x,y].ys:=white;
spjj[x,y].k:=g[i].my;
end;
end;
procedure cg;
var
c,k,i,f:integer;
begin
inc(ggs);
k:=random(100);f:=0;c:=0;
for i:=1 to gwzls do
if (f+gwzl[i].gl>k)and(zsj<=gwzl[i].cgsj) then begin c:=i; break; end else f:=f+gwzl[i].gl;
g[ggs]:=gwzl[c];g[ggs].scx:=qdx;g[ggs].scy:=qdy;g[ggs].x:=qdx;g[ggs].y:=qdy;g[ggs].yyhp:=g[ggs].hp;
end;
procedure gameover;
begin
outtextxy(100,100,'Game Over!');
end;
procedure gd;
var
jl,i,j,x,y:integer;
begin
if zsj=0 then jl:=100
else if zsj<1000 then jl:=0
else if zsj<=30000 then jl:=1
else if zsj<=60000 then jl:=2
else if zsj<=150000 then jl:=3
else if zsj<=240000 then jl:=4
else if zsj<=600000 then jl:=5;
if random(100)<jl then cg;
for i:=ggsqd to ggs do
begin
g[i].lq:=g[i].lq+coldtime;
if g[i].lq>g[i].sd then
begin
x:=g[i].x;y:=g[i].y;g[i].lq:=g[i].lq-g[i].sd;
if a[x,y]=2 then begin gs(i); dec(ax); if ax=0 then gameover; end;
for j:=1 to 4 do
begin
g[i].x:=x+fxx[j];g[i].y:=y+fxy[j];
if not((g[i].x>=1)and(g[i].x<=n)and(g[i].y>=1)and(g[i].y<=m)) then begin g[i].x:=x;g[i].y:=y; continue; end;
if ((g[i].x<>g[i].scx)or(g[i].y<>g[i].scy))and((a[g[i].x,g[i].y]=0)or(a[g[i].x,g[i].y]=2)) then
begin g[i].scx:=x;g[i].scy:=y;if (g[i].zt=1)and(g[i].mmkx=0)and(g[i].jssj=0) then g[i].zt:=0;g[i].bdbs:=0;break;end;
end;
end;
end;
end;
procedure hzb(x,y:integer);
begin
setcolor(red);
line(y*30+1,x*30+1,y*30+1,x*30+5);
line(y*30+1,x*30+1,y*30+5,x*30+1);
line(y*30+1,(x+1)*30,y*30+1,(x+1)*30-4);
line(y*30+1,(x+1)*30,y*30+5,(x+1)*30);
line((y+1)*30,x*30+1,(y+1)*30-4,x*30+1);
line((y+1)*30,x*30+1,(y+1)*30,x*30+5);
line((y+1)*30,(x+1)*30,(y+1)*30,(x+1)*30-4);
line((y+1)*30,(x+1)*30,(y+1)*30-4,(x+1)*30);
setcolor(white);
end;
procedure zt(k,x,y:integer);
begin
inc(tgs);t[tgs]:=tzl[k];t[tgs].x:=x;t[tgs].y:=y;a[x,y]:=5;jq:=jq-tzl[k].jq;
end;
procedure hzt(my:char;x,y,ys:longint);
var
i:longint;
begin
setfillstyle(1,green);
setcolor(ys);
bar(y*30+1,x*30+1,(y+1)*30,(x+1)*30);
circle(y*30+15,x*30+15,10);
bar(y*30+14,x*30+18,y*30+16,x*30+27);
line(y*30+13,x*30+18,y*30+13,x*30+28);
line(y*30+17,x*30+18,y*30+17,x*30+28);
line(y*30+13,x*30+28,y*30+17,x*30+28);
outtextxy(y*30+12,x*30+8,my);
for i:=tgsqd to tgs do
if (t[i].x+1=x)and(t[i].y+1=y) then begin str(t[i].ysjcs,k1);outtextxy(y*30+21,x*30+19,k1); end;
setcolor(white);
end;
procedure hzg(my:char;x,y,ys:longint);
var
i,j:longint;
begin
setfillstyle(1,red);
setcolor(red);
setfillstyle(10,8);
bar(y*30+1,x*30+1,(y+1)*30,(x+1)*30);
bar(y*30+1,x*30+1,(y+1)*30,(x+1)*30);
for i:=ggsqd to ggs do
if (g[i].x=x-1)and(g[i].y=y-1) then
begin
setfillstyle(1,red);
rectangle(y*30+3,x*30+2,(y+1)*30-1,x*30+5);
bar(y*30+4,x*30+3,y*30+3+trunc((25*g[i].hp/g[i].yyhp)),x*30+4);
setfillstyle(1,black);
setcolor(ys);
circle(y*30+15,x*30+10,6);
line(y*30+15,x*30+16,y*30+15,x*30+22);
line(y*30+15,x*30+19,y*30+6,x*30+19);
line(y*30+15,x*30+19,y*30+24,x*30+19);
line(y*30+15,x*30+22,y*30+6,x*30+28);
line(y*30+15,x*30+22,y*30+24,x*30+28);
outtextxy(y*30+13,x*30+5,my);
setcolor(white);
exit;
end;
end;
procedure hzcd(x,y:integer);
begin
setfillstyle(1,green);
bar(y*30+1,x*30+1,(y+1)*30,(x+1)*30);
end;
procedure hzq(x,y:longint);
begin
setfillstyle(2,red);
bar(y*30+1,x*30+1,(y+1)*30,(x+1)*30);
end;
procedure hqdzd(x,y:longint);
begin
setfillstyle(1,black);
setcolor(red);
bar(y*30+1,x*30+1,(y+1)*30,(x+1)*30);
line(y*30+3,x*30+3,y*30+3,(x+1)*30-2);
line(y*30+3,x*30+3,(y+1)*30-2,x*30+15);
line(y*30+3,x*30+15,(y+1)*30-2,x*30+15);
setcolor(white);
end;
procedure hzl(x,y:longint);
begin
setfillstyle(10,8);
bar(y*30+1,x*30+1,(y+1)*30,(x+1)*30);
end;
procedure tdg;
var
aa,bb,cc,dd,x1,x2,y1,y2,tt,i,j,ii,jj,gg:integer;
pd:array[0..n+1,0..m+1] of 0..1;
begin
fillchar(pd,sizeof(pd),0);
for i:=tgsqd to tgs do
begin
gg:=t[i].gjgs;
if t[i].lq=0 then
begin
t[i].lq:=t[i].jg;
for j:=ggsqd to ggs do
if sqrt(sqr(t[i].x-g[j].x)+sqr(t[i].y-g[j].y))<=t[i].fw then
begin
g[j].hp:=g[j].hp-t[i].gj;
dec(gg);
if (random(100)<t[i].kxgl) then begin g[j].mmkx:=g[j].mmkx+3; g[j].kxsj:=10000; g[j].zt:=2; end;
if (random(100)<t[i].jsgl)and(g[j].jssj=0) then begin g[j].sd:=g[j].sd+1000; g[j].jssj:=3000; g[j].zt:=3; end;
if (random(100)<t[i].bdgl)and(g[j].zt<>3)and(g[j].bdbs=0) then begin g[j].lq:=g[j].lq-10000; g[j].zt:=1; g[j].bdbs:=1; end;
if g[j].hp<=0 then gs(j);
y1:=(t[i].y+1)*30+13;x1:=(t[i].x+1)*30+28;y2:=(g[j].y+1)*30+15;x2:=(g[j].x+1)*30+4;
line(y1,x1,y2,x2);
pd[t[i].x,t[i].y]:=1;pd[g[j].x,g[j].y]:=1;
if (x1>x2) then begin tt:=x1;x1:=x2;x2:=tt;tt:=y1;y1:=y2;y2:=tt; end;
if (t[i].x<g[j].x) then begin aa:=t[i].x; bb:=g[j].x; end
else begin aa:=g[j].x;bb:=t[i].x; end;
if (t[i].y<g[j].y) then begin cc:=t[i].y; dd:=g[j].y; end
else begin cc:=g[j].y;dd:=t[i].y; end;
for ii:=aa to bb do
for jj:=cc to dd do pd[ii,jj]:=1;
end;
end
else dec(t[i].lq);
end;
delay(50);
for i:=1 to n do
for j:=1 to m do
if pd[i,j]=1 then
begin
if (a[i,j]=0)and(spjj[i+1,j+1].k<>' ') then hzg(spjj[i+1,j+1].k,i+1,j+1,spjj[i+1,j+1].ys);
if (a[i,j]=5) then hzt(spjj[i+1,j+1].k,i+1,j+1,spjj[i+1,j+1].ys);
if (a[i,j]=1)and(spjj[i+1,j+1].k=' ') then hzcd(i+1,j+1);
if (a[i,j]=0)and(spjj[i+1,j+1].k=' ') then hzl(i+1,j+1);
if (a[i,j]=3)or(a[i,j]=2) then hqdzd(i+1,j+1);
if spjj[i+1,j+1].k='#' then hzq(i+1,j+1);
if spjj[i+1,j+1].bjys=red then hzb(i+1,j+1);
end;
end;
procedure gzt;
var
i:integer;
begin
for i:=ggsqd to ggs do
if g[i].kxsj>0 then
begin
if g[i].kxsj<=coldtime then begin g[i].kxsc:=0; g[i].kxsj:=0 end
else begin g[i].kxsj:=g[i].kxsj-coldtime; g[i].kxsc:=g[i].kxsc+coldtime; end;
g[i].hp:=g[i].hp-g[i].mmkx;
if g[i].hp<=0 then gs(i);
end;
if g[i].jssj>0 then
begin
if g[i].jssj<=coldtime then begin g[i].jssj:=0; g[i].sd:=g[i].sd-1000;
if g[i].kxsj=0 then g[i].zt:=0; end
else g[i].jssj:=g[i].jssj-coldtime;
end;
end;
procedure sjt(x,y:integer);
var
i,l:integer;
begin
for i:=tgsqd to tgs do
if (t[i].x=x)and(t[i].y=y) then
if (t[i].ysjcs<t[i].sjcs) then
if (t[i].jq<=jq) then
begin
t[i].gj:=round(t[i].gj*1.5);t[i].kxgl:=round(t[i].kxgl*1.5);t[i].bdgl:=round(t[i].bdgl*1.5);t[i].jsgl:=round(t[i].jsgl*1.5);inc(t[i].ysjcs);jq:=jq-t[i].jq;hzt(spjj[x+1,y+1].k,x+1,y+1,t[i].ys);
end;
end;
procedure mt(x,y:integer);
var
i,l:integer;
begin
a[x,y]:=1;
for i:=tgsqd to tgs do
if (t[i].x=x)and(t[i].y=y) then
begin
inc(tgsqd);
jq:=jq+t[i].jq div 2;
spjj[x,y].bjys:=green;
for l:=i downto tgsqd do t[l]:=t[l-1]; end;
end;
procedure ht;
var
x,y,i:integer;
begin
for i:=tgsqd to tgs do
begin
x:=t[i].x+1;y:=t[i].y+1;
spjj[x,y].ys:=t[i].ys;
spjj[x,y].k:=t[i].my;
end;
end;
procedure point(k:integer);
var
i,j:integer;
begin
spjj[xx+1,yy+1].bjys:=red;
for i:=1 to n+2 do
for j:=1 to m+2 do
if (i>=2)and(i<=n+1)and(j>=2)and(j<=m+1)and(a[i-1,j-1]=0)and(spjj[i,j].k<>' ')or{(a[scxx,scyy]=5)or}(zsj=0)or(spjj[i,j].k<>sct[i,j].k)or(spjj[i,j].ys<>sct[i,j].ys)or(spjj[i,j].bjys<>sct[i,j].bjys) then
begin
if (i>=2)and(i<=n+1)and(j>=2)and(j<=m+1)and(a[i-1,j-1]=0)and(spjj[i,j].k<>' ') then hzg(spjj[i,j].k,i,j,spjj[i,j].ys);
if (i>=2)and(i<=n+1)and(j>=2)and(j<=m+1)and(a[i-1,j-1]=5) then hzt(spjj[i,j].k,i,j,spjj[i,j].ys);
if (i>=2)and(i<=n+1)and(j>=2)and(j<=m+1)and(a[i-1,j-1]=1)and(spjj[i,j].k=' ') then hzcd(i,j);
if (i>=2)and(i<=n+1)and(j>=2)and(j<=m+1)and(a[i-1,j-1]=0)and(spjj[i,j].k=' ') then hzl(i,j);
if (i>=2)and(i<=n+1)and(j>=2)and(j<=m+1)and((a[i-1,j-1]=3)or(a[i-1,j-1]=2)) then hqdzd(i,j);
if spjj[i,j].k='#' then hzq(i,j);
if spjj[i,j].bjys=red then hzb(i,j);
end;
sct:=spjj;
if (a[xx,yy]=5) then
begin
for i:=tgsqd to tgs do
if (xx=t[i].x)and(yy=t[i].y) then
begin
setfillstyle(1,black);
bar((m+3)*30,1,(m+3)*30+200,500);
str(t[i].ysjcs,k1);outtextxy((m+3)*30,1,'Lv.'+k1+'  ');
outtextxy((m+3)*30+8,1,'      Ta '+t[i].my);
str(t[i].gj,k1);outtextxy((m+3)*30,11,'GJ   :'+k1);
str(t[i].fw,k1);outtextxy((m+3)*30+80,11,'   Fw  :'+k1);
str(t[i].gjgs,k1);outtextxy((m+3)*30,21,'Gjgs :'+k1);
str(t[i].jq,k1);outtextxy((m+3)*30+80,21,'   Jq  :'+k1);
str(t[i].kxgl,k1);outtextxy((m+3)*30,31,'Kxgl: '+k1+'%');
str(t[i].jsgl,k1);outtextxy((m+3)*30+80,31,'   Jsgl:'+k1+'%');
str(t[i].bdgl,k1);outtextxy((m+3)*30,41,'Bdgl:'+k1+'%');
//circle((yy+1)*30+15,(xx+1)*30+15,t[i].fw*30);
end;
end
else
begin
setfillstyle(1,black);
bar((m+3)*30,1,(m+3)*30+200,500);
end;
if k=0 then
begin
str(ax,k1);
str(jq,k2);
setcolor(white);
setfillstyle(1,black);
bar(1,(n+3)*30,1000,(n+4)*30-1);
outtextxy(1,(n+3)*30,'Hp='+k1+'    Money ='+k2+'   ');
str(zsj div 1000,k1);
outtextxy(1,(n+3)*30+10,'Time:'+k1);
end;
end;
procedure ks;
var
cz:char;
j:integer;
begin
scdt;
hg;
ht;
point(0);
tdg;
gd;
gzt;
while keypressed do
begin
scxx:=xx;scyy:=yy;
cz:=readkey;
case ord(cz) of
72:if xx>1 then begin spjj[xx,yy].bjys:=green;dec(xx); end;
80:if xx<n then begin spjj[xx,yy].bjys:=green;inc(xx); end;
75:if yy>1 then begin spjj[xx,yy].bjys:=green;dec(yy); end;
77:if yy<m then begin spjj[xx,yy].bjys:=green;inc(yy); end;
13:begin repeat cz:=readkey; until ord(cz)=13; end;
{ord('1'):if (a[xx,yy]=1)and(jq>=tzl[1].jq) then zt(1,xx,yy);
ord('2'):if (a[xx,yy]=1)and(jq>=tzl[2].jq) then zt(2,xx,yy);
ord('3'):if (a[xx,yy]=1)and(jq>=tzl[3].jq) then zt(3,xx,yy);
ord('4'):if (a[xx,yy]=1)and(jq>=tzl[4].jq) then zt(4,xx,yy);
ord('5'):if (a[xx,yy]=1)and(jq>=tzl[5].jq) then zt(5,xx,yy);}
46:if (a[xx,yy]=5) then mt(xx,yy);
43:if (a[xx,yy]=5) then sjt(xx,yy);

end;
for j:=1 to tzls do
if (cz=chr(j+48))and(a[xx,yy]=1)and(jq>=tzl[j].jq) then zt(j,xx,yy);
if (a[scxx,scyy]=0)and(spjj[scxx+1,scyy+1].k<>' ') then hzg(spjj[scxx+1,scyy+1].k,scxx+1,scyy+1,spjj[scxx+1,scyy+1].ys);
if (a[scxx,scyy]=5) then hzt(spjj[scxx+1,scyy+1].k,scxx+1,scyy+1,spjj[scxx+1,scyy+1].ys);
if (a[scxx,scyy]=1)and(spjj[scxx+1,scyy+1].k=' ') then hzcd(scxx+1,scyy+1);
if (a[scxx,scyy]=0)and(spjj[scxx+1,scyy+1].k=' ') then hzl(scxx+1,scyy+1);
if (a[scxx,scyy]=3)or(a[scxx,scyy]=2) then hqdzd(scxx+1,scyy+1);
if spjj[scxx+1,scyy+1].k='#' then hzq(scxx+1,scyy+1);
hzb(xx+1,yy+1);
delay(coldtime div 10);
end;
delay(coldtime);
zsj:=zsj+coldtime;
end;
procedure xzdt;
var
cz:char;
xd,i,j,l,dts:integer;
dt:array[1..maxdts,0..n+1,0..m+1] of 0..5;
begin
assign(f,lj+'tzl.txt');reset(f);
readln(f,tzls);
for i:=1 to tzls do
read(f,tzl[i].jq,tzl[i].gj,tzl[i].jg,tzl[i].fw,tzl[i].jsgl,tzl[i].kxgl,tzl[i].bdgl,tzl[i].gjgs,tzl[i].ys,tzl[i].sjcs,cz,tzl[i].my);
close(f);
assign(f,lj+'gwzl.txt');reset(f);
readln(f,gwzls);
for i:=1 to gwzls do
read(f,gwzl[i].hp,gwzl[i].sd,gwzl[i].jq,gwzl[i].gl,gwzl[i].cgsj,cz,gwzl[i].my);
close(f);
assign(f,lj+'dts.txt');reset(f);
readln(f,dts);
close(f);
for i:=1 to dts do
begin
assign(f,lj+'dt'+chr(i+ord('0'))+'.txt');reset(f);
for j:=1 to n do
begin
for l:=1 to m do
begin
read(f,cz);
dt[i,j,l]:=ord(cz)-ord('0');
end;
readln(f);
end;
close(f);
end;
xd:=1;
repeat
outtextxy(1*outtexty,1*outtextx,'Ni Yao Na Zhang Tu?');
for i:=1 to dts do
begin
if xd=i then setcolor(red);
str(i,k1);
outtextxy((i*3-2)*outtexty,2*outtextx,k1+' '); setcolor(white);
end;
a:=dt[xd];
scdt;
point(1);
outtextxy(1*outtexty,(n+5)*outtextx,'Are you sure? (Y)');
cz:=readkey;
case ord(cz) of
ord('y'),ord('Y'):
begin
for i:=1 to n do
for j:=1 to m do
if a[i,j]=3 then begin qdx:=i; qdy:=j; break; end;
a:=dt[xd]; exit;
end;
75:if xd>1 then dec(xd);
77:if xd<dts then inc(xd);
end;
until 1=2;
end;
begin
cssj;
xzdt;
cleardevice;
repeat
ks;
until 1=2;
end.