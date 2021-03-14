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




if graph,
figure(1);

%

subplot(2,1,1);
	hold on;
	plot(x_axis,pix_graph);
	axis([0 160]);
	for j=1:size(indices,2),
		x_values=[indices(j) indices(j)]; %indices(j)*ones(1,6000);
		y_values=[min(pix_graph) max(pix_graph)];
		plot(x_values,y_values);
		axis([0 160]);
	end;
hold off;

%


end;










%{
[pix_graph2 dummy dummy2] = featureNormalize(pix_graph');
%pix_graph=pix_graph';
%data=-data;
pix_graph2=pix_graph2+abs(min(pix_graph2));
[pks3 idx] = findpeaks(pix_graph2,"MinPeakHeight",2.3);
%if size(idx)==0,
%[pks3 idx] = findpeaks(pix_graph2,"MinPeakHeight",2);
%end;
%data=data+abs(min(data));

vals=pix_graph(idx);
mean(vals);

%}











indices=sort(indices);
rev=indices;
i=1;
while(ar(i,rev,pix_graph,false)>3)
	i++;
endwhile;
%area(i,rev,pix_graph)
rev=rev(:,i:end);
indices=rev;


if graph,

%

subplot(2,1,2);
	hold on;
	plot(x_axis,pix_graph);
	axis([0 160]);
	for j=1:size(indices,2),
		x_values=[indices(j) indices(j)]; %indices(j)*ones(1,6000);
		y_values=[min(pix_graph) max(pix_graph)];
		plot(x_values,y_values);
		axis([0 160]);
	end;
hold off;

%

end;




if graph,
figure(2);

%

subplot(2,1,1);
	hold on;
	plot(x_axis,pix_graph);
	axis([0 160]);
	for j=1:size(indices,2),
		x_values=[indices(j) indices(j)]; %indices(j)*ones(1,6000);
		y_values=[min(pix_graph) max(pix_graph)];
		plot(x_values,y_values);
		axis([0 160]);
	end;
hold off;

%


end;








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





if graph,
%

subplot(2,1,2);
	hold on;
	plot(x_axis,pix_graph);
	axis([0 160]);
	for j=1:size(indices,2),
		x_values=[indices(j) indices(j)]; %indices(j)*ones(1,6000);
		y_values=[min(pix_graph) max(pix_graph)];
		plot(x_values,y_values);
		axis([0 160]);
	end;
hold off;

%


end;





avg_width=abs(((sort(indices)(1))-(sort(indices)(end)))/n);
















%for i=1:size(indices,2),
%	if pix_graph(indices(i))>2000,
%		indices2(i)=[];
%	end;
%end;
%indices(pix_graph(indices)>2000 ) = [];



[pix_graph2 dummy dummy2] = featureNormalize(pix_graph');
pix_graph2=-pix_graph2;
pix_graph2=pix_graph2+abs(min(pix_graph2));
[pks3 idx] = findpeaks(pix_graph2,"MinPeakHeight",3,"MinPeakDistance",avg_width*0.85);
%[pks3 idx] = findpeaks(pix_graph2,"MinPeakHeight",3);




if graph,
figure(3);


%
subplot(3,1,1);
	hold on;
	plot(x_axis,pix_graph);
	axis([0 160]);
	range=[indices(1) indices(end)];
	for j=1:size(range,2),
		x_values=[range(j) range(j)]; %indices(j)*ones(1,6000);
		y_values=[min(pix_graph) max(pix_graph)];
		plot(x_values,y_values);
		axis([0 160]);
	end;
hold off;




subplot(3,1,2);
	hold on;
	plot(x_axis,pix_graph2);
	axis([0 160]);
	for j=1:size(idx),
		x_values=[idx(j) idx(j)]; %indices(j)*ones(1,6000);
		y_values=[min(pix_graph2) max(pix_graph2)];
		plot(x_values,y_values);
		axis([0 160]);
	end;
	hold off;

%

end;




idx(idx>=indices(end))=[];
idx(idx<=indices(1))=[];
idx=[indices(1) idx' indices(end)];


indices=idx;





if graph,

%
subplot(3,1,3);
	hold on;
	plot(x_axis,pix_graph);
	axis([0 160]);
	for j=1:size(indices,2),
		x_values=[indices(j) indices(j)]; %indices(j)*ones(1,6000);
		y_values=[min(pix_graph) max(pix_graph)];
		plot(x_values,y_values);
		axis([0 160]);
	end;
hold off;

%

end;




if graph,
figure(4);

%

subplot(2,1,1);
	hold on;
	plot(x_axis,pix_graph);
	axis([0 160]);
	for j=1:size(indices,2),
		x_values=[indices(j) indices(j)]; %indices(j)*ones(1,6000);
		y_values=[min(pix_graph) max(pix_graph)];
		plot(x_values,y_values);
		axis([0 160]);
	end;
hold off;

%


end;





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








if graph,

%
subplot(2,1,2);
	hold on;
	plot(x_axis,pix_graph);
	axis([0 160]);
	for j=1:size(indices,2),
		x_values=[indices(j) indices(j)]; %indices(j)*ones(1,6000);
		y_values=[min(pix_graph) max(pix_graph)];
		plot(x_values,y_values);
		axis([0 160]);
	end;
hold off;

%

end;




%{
temp=[];
while (size(indices,2))>(n+1),
	temp=sort(pix_graph(indices));
	var=temp(end);
	indices(pix_graph(indices)==var)=[];
endwhile;

%}











%temp=indices;
%for i=2:size(indices,2)-1,
%	if(pix_graph(indices(i))<pix_graph(indices(i-1)) && pix_graph(indices(i))<pix_graph(indices(i+1))),
%		%indices2=[indices2 indices(i)];
%		temp(temp==indices(i-1))=[];
%		temp(temp==indices(i+1))=[];
%	end;
%end;
%indices=temp;

%{
idx=[];
avg_width=abs(((sort(indices)(1))-(sort(indices)(end)))/n);
width_ratio=[];
for i=1:size(indices,2)-1,
width=abs(indices(i)-indices(i+1))/avg_width;
if width<0.7,
	if(pix_graph(indices(i))>pix_graph(indices(i+1)))
		idx=[idx indices(i)];
	else
		idx=[idx indices(i+1)];
	endif
end;
width_ratio=[width_ratio width];
end;

for i=1:size(idx,2),
indices(indices==idx(i))=[];
end;

%}










%{
if indices(1)>15,
indices=[1 indices];
end;

%}


if graph,
figure(5);

%

subplot(2,1,1);
	hold on;
	plot(x_axis,pix_graph);
	axis([0 160]);
	for j=1:size(indices,2),
		x_values=[indices(j) indices(j)]; %indices(j)*ones(1,6000);
		y_values=[min(pix_graph) max(pix_graph)];
		plot(x_values,y_values);
		axis([0 160]);
	end;
hold off;

%


end;


%{
temp=width_ratio;


do
width_ratio=width_ratio+0.01;
until(sum(floor(width_ratio))==n)
mask=floor(width_ratio)-1;

mask(mask>0)=1;

width_ratio=temp;

temp=floor(width_ratio-1);
temp2=width_ratio-temp;

width_ratio2=[];
for i=1:size(indices,2)-1,
%width_ratio2=[width_ratio2 sum(pix_graph(indices(i):indices(i+1)))/(mean(pix_graph)*(abs(indices(i)-indices(i+1))))];
width_ratio2=[width_ratio2 mean(pix_graph(indices(i):indices(i+1)))/(mean(pix_graph))];
end;

width_ratio2;
width_ratio2=mask.*width_ratio2;
width_ratio2(width_ratio2==0)=1
width_ratio2(width_ratio2>=1)=1


temp2
width_ratio=temp2.*((width_ratio2))
width_ratio=width_ratio+temp

%}
%{
do
width_ratio
for i=1:size(width_ratio),
width_ratio(i)=width_ratio(i)+0.01;
if sum(floor(width_ratio))==n
break;
endif
end;
until(sum(floor(width_ratio))==n)
width_ratio
split=floor(width_ratio)-1;

%

while (sum(floor(width_ratio))!=n)

for i=1:size(width_ratio),
width_ratio(i)=width_ratio(i)+0.01;
if sum(floor(width_ratio))==n,
break;
endif
end;

endwhile;
split=floor(width_ratio)-1;
%}
%width_ratio

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


%unique(width_ratio)

width_ratio2=[];
for i=1:size(indices,2)-1,
width_ratio2=[width_ratio2 sum(pix_graph(indices(i):indices(i+1)))/(mean(pix_graph(indices(i):indices(i+1)))*(abs(indices(i)-indices(i+1))))];
end;

%unique(width_ratio2)

width_ratio=width_ratio.*width_ratio2;


%unique(width_ratio)


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


if graph,


%

subplot(2,1,2);
	hold on;
	plot(x_axis,pix_graph);
	axis([0 160]);
	for j=1:size(indices,2),
		x_values=[indices(j) indices(j)]; %indices(j)*ones(1,6000);
		y_values=[min(pix_graph) max(pix_graph)];
		plot(x_values,y_values);
		axis([0 160]);
	end;
hold off;

%


end;




