function [X segmented] = final(image)

n=6;


	X=[];
	pix_graph=sum(image);
	indices=segment(pix_graph,n,false);
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
	
