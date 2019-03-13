function prediction = demo(Theta1, Theta2, numProblems)
  
  % Default value
  prediction = "Not found...";
  
  % Input a new value for the model to predict on at least once before stopping
  demoing = 1;
  
  count = 0;
  
  while demoing == 1 && count != numProblems
    
    fprintf("-----------------------");
    
    fprintf("\nWrite a new number and press a key after saving...");  
    pause();
    
    % Load image, process for classifier, and return prediction
    processedImage = processImage(uigetfile("C:\Users\zpu\Documents\High School 2016-2020\2018-2019, Junior Year\Science Fair\IntelliGrade"));
    prediction = predict(Theta1, Theta2, processedImage);
    
    % Concatenate prediction to the output string after converting from integer to string value
    fprintf(["\n\nYour number: " mat2str(prediction)]);
    fprintf("\n");
    
    count++;
    
    fprintf("\nPress a key to continue...");
    pause();
    fprintf("\n");
    
    % Returns 1 if "yes" and 0 if "no"
    demoing = yes_or_no("Do you want to try another one?!?!?");
    
    
  endwhile
  
endfunction
