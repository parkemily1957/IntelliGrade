function [problemsCorrect percentCorrect] = grade (studentAnswers, correctAnswers)
  
  % Vector that populates with 1 if student answer matches correct answer, 0 if not
  problemsCorrect = studentAnswers == correctAnswers;
  
  % Number of correct answers the student had
  numCorrect = 0;
  
  fprintf(["\nStudent answers: " mat2str(studentAnswers)]);
  fprintf(["\nCorrect answers: " mat2str(correctAnswers)]);
  
  fprintf("\n\nCORRECT ANSWERS: ");
  
  % Use length because answers are contained in a row vector
  for i = 1 : length(correctAnswers)
      
    if problemsCorrect(i) == 1
      fprintf([mat2str(i) " "]);
      numCorrect++;
    endif
    
      
  endfor
  
  % ----------------------------------------------------------------------
  
  fprintf("\nWRONG ANSWERS: ");
  
  for i = 1 : length(correctAnswers)
      
    if problemsCorrect(i) == 0
      fprintf([mat2str(i) " "]);
    endif
      
  endfor
  
  fprintf("\n\n");
  
  % ----------------------------------------------------------------------
  
  percentCorrect = numCorrect / length(correctAnswers) * 100;
  fprintf(["\nPercent: " mat2str(percentCorrect) "%%\n\n"]);
  
endfunction
