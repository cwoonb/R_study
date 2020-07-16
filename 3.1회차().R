

guessHeight <- function(name, height = 173) {
  answer <- paste(name, '님의 키는', height, 'cm입니다', sep = ' ')
  return(answer)
}


guessNumber <- function() {
  number <- sample(x = 10:99, size = 1)
  
  while(TRUE) {
    guess <- readline('두 자리 숫자를 입력하세요: ')
    
    if (guess == number) {
      cat('정답입니다.')
      break
    } else if (guess > number) {
      cat('>> 틀렸습니다. 더 작은 숫자를 입력하세요!\n\n')
    } else if (guess < number) {
      cat('>> 틀렸습니다. 더 큰 숫자를 입력하세요!\n\n')
    }
  }
}

