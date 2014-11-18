def draw_man(n)
  if n == 0
      puts "__________________
     |
     |
     |
     |
     |
     |
     -----------------"
  elsif n == 1
      puts "__________________
     |           |
     |
     |
     |
     |
     |
     -----------------"
  elsif n == 2
      puts "__________________
     |           |
     |           @
     |
     |
     |
     |
     -----------------"
  elsif n == 3
      puts "__________________
     |           |
     |           @
     |          /
     |
     |
     |
     -----------------"
  elsif n == 4
     puts "__________________
     |           |
     |           @
     |          /|
     |
     |
     |
     -----------------"
  elsif n == 5
     puts "__________________
     |           |
     |           @
     |          /|\\
     |
     |
     |
     -----------------"
  elsif n == 6
      puts "__________________
     |           |
     |           @
     |          /|\\
     |           |
     |
     |
     -----------------"
  elsif n == 7
      puts "__________________
     |           |
     |           @
     |          /|\\
     |           |
     |          /
     |
     -----------------"
  elsif n == 8
      puts "__________________
     |           |
     |           @
     |          /|\\
     |           |
     |          / \\
     |
     -----------------"
  end
end


def check_letter(word, letter)
  letters= word.split("")
  locations = []
  letters.each_with_index do |test_letter, i|
    if letter == test_letter
      locations.push(i)
    end
  end
  locations
end


def display_result(word, letter_array)
  guessed_loc = {}
  letter_array.each do |letter|
    word.length.times do |w|
      if word.slice(w).downcase == letter.downcase
        guessed_loc[w] = true
      end
    end
  end
  word_array = word.split("")
  word_array.length.times do |o|
    if guessed_loc[o] == nil
      word_array[o] = "_"
    end
  end
  puts "You've guessed these letters:"
  print letter_array.join(","), "\n"
  puts word_array.join(" ")

end

f = File.new("EnglishDictionary.txt" ,"r")
words = f.readlines
word_sample = words.sample
f.close

parts = 0
guesses = []

draw_man(parts)
display_result(word_sample, guesses)
puts "This is a game of hangman! What is your first guess?"
num_letters = 0

while(true)
  letter = gets.chomp
  guessed = false
  guesses.each do |guess|
    if guess == letter
      puts 'Guess a different letter'
      guessed = true
    end
  end
  if guessed
    next
  end
  guesses.push(letter)
  if check_letter(word_sample, letter).empty?
    draw_man(parts += 1)
    display_result(word_sample, guesses)
    puts "You guessed wrong. Keep Guessing!"
  else
    num_letters += check_letter(word_sample, letter).length
    draw_man(parts)
    display_result(word_sample, guesses)
    puts "Good job! You guessed right! Keep guessing!"
  end

  if num_letters == word_sample.length
    puts 'You got it!'
    break
  elsif parts == 8
    puts "You lost, your word was #{word_sample}"
    break
  end
end

