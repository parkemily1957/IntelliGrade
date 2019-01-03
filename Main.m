pkg load image;

[img map alpha] = imread(input("Enter the path to your picture: "));
[processedImg processedImageResized] = processImage(img);

fprintf("Original image. Press Enter to continue.\n");
imshow(img);
pause();

fprintf("Grayscaled image. Press Enter to continue.\n");
imshow(processedImg);
pause();

fprintf("Pixelated and grayscaled image. Press Enter to continue.\n");
imshow(processedImageResized);
pause();
