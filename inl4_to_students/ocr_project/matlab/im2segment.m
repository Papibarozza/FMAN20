function [S] = im2segment(I)
%Threshold image
im = imgaussfilt(I,0.5);
im = I<140;
inSegment = 0;
%Accumulator of start indices of segments
start_acc= [1];
start=1;
cut=0;

for j=1:size(im,2)
    %We look for a colon of only black values.
    if(im(:,j)== zeros(size(im,1),1))
        %If found, and we are currently making a segment of a character,
        %we will stop making the segment and save the column index as well
        %as resetting the cut which is the width of the segment.
        if(inSegment == 1)
            start = start+cut;
            start_acc=[start_acc start]; %Save column index where the next segment will start.
            cut=0;
            inSegment = 0;
        end
    else
        inSegment = 1;    
    end
    %Increment cut for every column we check of the image
    cut=cut+1;
end
S={};
j=1;
%Go through column indexes, extract the segment from the image and pad with
%zeros
for i=1:size(start_acc,2)-1
    segment = [ zeros(size(im,1),start_acc(i)-1) im(:,start_acc(i):start_acc(i+1)) zeros(size(im,1),size(I,2)-start_acc(i+1)) ];
    if(sum(sum(segment))> 20)
        S{j} = segment;
        j=j+1;
    end
    
end

