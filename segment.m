function indices = segment(pix_graph,n,graph)

indices=[1 160];
x_axis=[1:160];

pix_graph=pix_graph-min(pix_graph);

for i=2:size(pix_graph,2)-1,
	if (pix_graph(i)<pix_graph(i-1) && pix_graph(i)<pix_graph(i+1)),
		indices=[indices i];
	end;
end;


i=2;
temp=[];
while(i<=size(pix_graph,2)-2)
	if (pix_graph(i)==pix_graph(i+1)),
		while((pix_graph(i)==pix_graph(i+1)&&i<=size(pix_graph,2)-2))
			temp=[temp i];
			i++;
		endwhile;
		indices=[indices temp(floor(size(temp,2)/2)+1)];
		temp=[];
	end;
	i++;
endwhile;


indices=sort(indices);
rev=indices;
i=1;
while(ar(i,rev,pix_graph,false)>3)
	i++;
endwhile;
%area(i,rev,pix_graph)
rev=rev(:,i:end);
indices=rev;


%indices=[indices size(pix_graph,2)];
indices=sort(indices);
rev=fliplr(indices);
i=1;
while(ar(i,rev,pix_graph,true)>2.1)
	i++;
endwhile;
%area(i,rev,pix_graph)
rev=rev(:,i:end);
indices=fliplr(rev);


avg_width=abs(((sort(indices)(1))-(sort(indices)(end)))/n);


[pix_graph2 dummy dummy2] = featureNormalize(pix_graph');
pix_graph2=-pix_graph2;
pix_graph2=pix_graph2+abs(min(pix_graph2));
[pks3 idx] = findpeaks(pix_graph2,"MinPeakHeight",3,"MinPeakDistance",avg_width*0.85);
%[pks3 idx] = findpeaks(pix_graph2,"MinPeakHeight",3);

idx(idx>=indices(end))=[];
idx(idx<=indices(1))=[];
idx=[indices(1) idx' indices(end)];


indices=idx;

do
flag=0;
temp=indices;
for i=1:size(indices,2)-1,
	if abs(indices(i)-indices(i+1))<=(avg_width/2),
		flag=1;
		if(pix_graph(indices(i))<pix_graph(indices(i+1)))
			temp(temp==indices(i+1))=[];
		else
			temp(temp==indices(i))=[];
		endif;
	end;
end;
indices=temp;
until(flag==0)

indices=sort(indices);
while size(indices,2)>(n+1),
	%indices(pix_graph(indices)==max(pix_graph(indices)))=[];
	indices(end)==[];
end;

avg_width=abs(((sort(indices)(1))-(sort(indices)(end)))/n);
width_ratio=[];
for i=1:size(indices,2)-1,
width_ratio=[width_ratio abs(indices(i)-indices(i+1))/avg_width];
end;

width_ratio(width_ratio<1)=1;

width_ratio2=[];
for i=1:size(indices,2)-1,
width_ratio2=[width_ratio2 sum(pix_graph(indices(i):indices(i+1)))/(mean(pix_graph(indices(i):indices(i+1)))*(abs(indices(i)-indices(i+1))))];
end;

width_ratio=width_ratio.*width_ratio2;

temp=width_ratio;

do

flag=0;
while (sum(floor(width_ratio))<n)
width_ratio=width_ratio+0.01;
endwhile;

if (sum(floor(width_ratio))>n),
flag=1;
mask=floor(width_ratio)-floor(temp);
b=sum(mask);
c=[0:0.01:b*0.01];
d=c(:,randperm(size(c,2)));
c2=1;
for c1=1:size(mask,2),
if mask(c1)==1,
mask(c1)=mask(c1)*d(c2);
c2=c2+1;
end;
end;

width_ratio=temp+mask;

end;
until(flag==0)

split=floor(width_ratio)-1;
temp=[];

for i=1:size(indices,2)-1,
	if(split(i)!=0),
		dist=indices(i+1)-indices(i);
		val=floor(dist/(split(i)+1));
		start=indices(i);
		for j=1:split(i),
			start=start+val;
			temp=[temp start];
		end;
	end;
end;

indices=sort([indices temp]);
