function [processedImg processedImgResized] = processImage(img)

  % Convert to grayscale
  processedImg = rgb2gray(img);
  
  %Resize
  processedImgResized = imresize(processedImg, [20 20]);

end
