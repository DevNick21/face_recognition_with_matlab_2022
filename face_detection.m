%FACE_DETECTION:
clc
%Detect objects using Viola-Jones Algorithm

%To detect Face
FDetect = vision.CascadeObjectDetector;
%Read the input image
%I is a variable that i used to store the imread function
%anything can be used but you much use that variable with the step function
I= imread ('hii.jpg');
%Returns Bounding Box values based on number of objects
%The step function performs multi scale detection on inputed image AI and
%returns Bounding Boxes (BB) which is an MX4 matrix, it contains the
%detected object. each row is a four element vector X Y width and height,
%that specifies the upper left corner and size of the bb in pixels
BB = step(FDetect, I);
%If i want to read multiple images, i would use
%"[file,path]=uigetfile(".",'Select an image');"
%The 'Select an image' represents the window name
%The "." means we can select any type of file
%The uigetfile() is a function on mathlab to use and get files, we are
%storing it in [file,path]
%Then we concat it with strcat(path,file) and store it in loc
%i.e = loc=strcat(path,file)
%Then we use loc to get our image

figure,
%imshow is an option to plot the image, located in the plot tab, close to..
%..the home tab, down here we used it as a function
imshow(I); hold on
for i = 1:size (BB, 1)
rectangle ('Position',BB(i,:),'LineWidth',5,'LineStyle','-','EdgeColor','r');
end
title('Face Detection');
hold off;

%hold on retains the current plot and certain axes properties so that..
%subsequent graphing commands add to the existing graph. hold off resets..
%axes properties to their defaults before drawing new plots

%To detect Nose
NoseDetect = vision.CascadeObjectDetector('Nose','MergeThreshold',16);
I = imread ('hii0.jpg'); 
BB=step(NoseDetect, I);
figure,
imshow(I); hold on
for i = 1:size(BB,1)

rectangle('Position',BB(i,:),'LineWidth',4,'LineStyle','-','EdgeColor','b');
end
title('Nose Detection');
hold off;

%To detect Eyes
EyeDetect = vision.CascadeObjectDetector('EyePairBig');

%Read the input Image
I = imread ('hii2.jpg');
BB=step(EyeDetect,I);

figure,imshow(I);
rectangle('Position',BB,'LineWidth',4,'LineStyle','-','EdgeColor','b');
title('Eyes Detection');
hold off;


%To detect Mouth
MouthDetect=vision.CascadeObjectDetector('Mouth','MergeThreshold',300);
I = imread ('hii.jpg');
BB=step(MouthDetect,I);

figure,
imshow(I); hold on
for i = 1:size(BB,1)
rectangle('Position',BB(i,:),'LineWidth',4,'LineStyle','-','EdgeColor','b');
end
title('Mouth Detection');
hold off;
