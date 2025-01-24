%Image Compression

i=imread('HI.jpg'); %Read Image From Graphics File

imwrite(i,'HI_new.jpg','quality',20); %write image to graphics file

%where n is an integer in between 0 to 100.