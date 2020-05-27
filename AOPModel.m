clear
load('CN')

for q=10:length(CN)
[C,L] = wavedec(CN(1:q),1,'fk4');
V(q-9,1:length(C))=C;
X(q-9,1:length(L))=L;
a(q-9,1:q)= wrcoef('a',V(q-9,:),X(q-9,:),'fk4',1);
for k=1:1
    d(q-9,k,1:q) = wrcoef('d',V(q-9,:),X(q-9,:),'fk4',k);
    E(q-9,k,1:q)=d(q-9,k,1:q).^2;
end
end

for i=1:length(CN)-9
    ENT(i)=0;
    RE(i)=max(E(i,:))./sum(sum(E(i,:,:)));
ENT(i)=RE(i)*log(RE(i))+ENT(i);
    end


[Nor,PS] = mapstd(ENT);

for u=2:length(Nor)-1
    e(u)=Nor(u+1)-Nor(u-1);
end

for p=1:length(e)
    for y1=Z(p):Z(p+1)-1
        em(y1)=e(p);
        Norm(y1)=Nor(p);
    end
end

plot(x(10:length(em)+9),-Norm,'b')
hold on
plot(x(10:length(em)+9),-em,'r')

[I,M]=min(em);
AOP=x(M+9)


