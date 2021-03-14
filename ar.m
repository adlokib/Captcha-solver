function a=ar(i,rev,pix_graph,back)

current=rev(i);
%previous=rev(i-1);
next=rev(i+1);



[pix_graph2 dummy dummy2] = featureNormalize(pix_graph');

pix_graph2=pix_graph2+abs(min(pix_graph2));

[pks3 idx] = findpeaks(pix_graph2,"MinPeakHeight",2.3);

vals=pix_graph(idx);
mean(vals);

if back,
a=mean(vals)/(max(pix_graph(:,next:current))+0.001);
else
a=mean(vals)/(max(pix_graph(:,current:next))+0.001);
end;
