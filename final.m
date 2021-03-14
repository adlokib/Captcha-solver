%pkg load image
%pkg load signal
%load params.mat
%load normalize.mat
function [X segmented] = final(image)

%cd 'C:\Users\adlokib\Desktop\project2\testing'
%list=dir();

%list=dir();
%m=size(list,1)-2;
%rp=randperm(m);

%for i=1:size(list,1)-2,
%dic{i}=list(i+2).name;
%end;

%dic=dic(:,rp);

%x_axis=[1:160];
n=6;

%for i=1:m,

	X=[];
	%Y=[];
	%dict{i}=imread(dic{i});
	
	pix_graph=sum(image);
	%cd 'C:\Users\adlokib\Desktop\project2'
	indices=segment(pix_graph,n,false);
	%cd 'C:\Users\adlokib\Desktop\project2\testing'
	
	%subplot(3,1,1);
	%imshow(dict{i});
	%{
	subplot(3,1,2);
	hold on;
	plot(x_axis,pix_graph);
	axis([0 160]);
	for j=1:size(indices,2),
		x_values=[indices(j) indices(j)]; %indices(j)*ones(1,6000);
		y_values=[1 max(pix_graph)];
		plot(x_values,y_values);
		axis([0 160]);
	end;
	hold off;
	%}
	segmented=[];
	for j=1:n,
		segmented=[segmented image(:,indices(j):indices(j+1))];
		if j<n,
			segmented=[segmented 255*ones(size(image,1),10)];
		end;
	end;
	%
	for j=1:n,
		width=indices(j+1)-indices(j);
		
		char=image(:,indices(j):indices(j+1));
		
		rem_width=abs(32-width);
		left=floor(rem_width/2);
		right=rem_width-left;
		
		mini= min(min(char));
		im=[(mini.*ones(size(char,1),left)) char (mini.*ones(size(char,1),right))];
		
		center=floor(size(im,2)/2);
		
		im=im(:,center-15:center+16);
		
		X=[X;im(:)'];
	end;
	
	
	X=double(X);
	X=X./255;
	
	%{
	X=X';
	X=double(X);
	
	X=(X-mu)./(sqrt(sigma_sq+(1e-8)));
	
	Z1=(W1*X)+b1;
	cd 'C:\Users\adlokib\Desktop\project2'
	A1=relu(Z1);
	
	Z2=(W2*A1)+b2;
	A2=relu(Z2);
	
	Z3=(W3*A2)+b3;
	
	Y=softmax(Z3);
	
	[dummy Y]=max(Y);
	
	Y=Y-1;
	
	subplot(3,1,3);
	imshow(segmented);
	title(mat2str(Y));
	
	pause;
	clf;
	cd 'C:\Users\adlokib\Desktop\project2\testing'
end;
%}