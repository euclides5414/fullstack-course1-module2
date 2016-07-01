#Implement all parts of this assignment within (this) module2_assignment2.rb file

#Implement a class called LineAnalyzer.
class LineAnalyzer
  #Implement the following read-only attributes in the LineAnalyzer class. 
  attr_reader :highest_wf_count #- a number with maximum number of occurrences for a single word (calculated)
  attr_reader :highest_wf_words #- an array of words with the maximum number of occurrences (calculated)
  attr_reader :content          #- the string analyzed (provided)
  attr_reader :line_number      #- the line number analyzed (provided)

  #Add the following methods in the LineAnalyzer class.
  #* initialize() - taking a line of text (content) and a line number
  def initialize(content, line_number)
    @content = content
    @line_number = line_number
    @highest_wf_words = []
    @highest_wf_count = 0
    self.calculate_word_frequency(@content)

  end
  #* calculate_word_frequency() - calculates result

  #Implement the initialize() method to:
  #* take in a line of text and line number
  #* initialize the content and line_number attributes
  #* call the calculate_word_frequency() method.

  def calculate_word_frequency(content)
    words = content.split(' ')
    hash_words = Hash.new(0)
    words.each { |word| hash_words[word] += 1
      @highest_wf_count = hash_words[word] if @highest_wf_count < hash_words[word] }
    #puts hash_words
    hash_words.each { |k, v| @highest_wf_words << k if v == @highest_wf_count }
    #p @highest_wf_words, @highest_wf_count
  end

  def to_s
    "#{self.highest_wf_count} #{self.highest_wf_words}"
  end
  #Implement the calculate_word_frequency() method to:
  #* calculate the maximum number of times a single word appears within
  #  provided content and store that in the highest_wf_count attribute.
  #* identify the words that were used the maximum number of times and
  #  store that in the highest_wf_words attribute.
end

#  Implement a class called Solution. 
class Solution

  # Implement the following read-only attributes in the Solution class.
  attr_reader :analyzers #- an array of LineAnalyzer objects for each line in the file
  attr_reader :highest_count_across_lines #- a number with the maximum value for highest_wf_words attribute in the analyzers array.
  attr_reader :highest_count_words_across_lines #- a filtered array of LineAnalyzer objects with the highest_wf_words attribute 
  #  equal to the highest_count_across_lines determined previously.
  def initialize
    @analyzers = []
    @highest_count_across_lines = nil
    @highest_count_words_across_lines = nil
  end
  # Implement the following methods in the Solution class.
  def analyze_file()
    filename = 'test.txt' #if filename==nil
    begin
        file = File.new(filename, "r")
        line_number = 1
        while (line = file.gets)
            @analyzers << LineAnalyzer.new(line.downcase, line_number)
            line_number += 1
        end
        file.close
    rescue => err
        puts "Exception: #{err}"
        err
    end
    #puts @analyzers, @analyzers.length
  end


  def calculate_line_with_highest_frequency
    max = 0
    @analyzers.each { |a| max = a.highest_wf_count if max < a.highest_wf_count}
    @highest_count_across_lines = max
    @highest_count_words_across_lines = []
    @analyzers.each { |a| @highest_count_words_across_lines << a if a.highest_wf_count == max }
    puts @analyzers
    puts @highest_count_words_across_lines
  end
  #* analyze_file() - processes 'test.txt' intro an array of LineAnalyzers and stores them in analyzers.
  #* calculate_line_with_highest_frequency() - determines the highest_count_across_lines and 
  #  highest_count_words_across_lines attribute values
  #* print_highest_word_frequency_across_lines() - prints the values of LineAnalyzer objects in 
  #  highest_count_words_across_lines in the specified format
  
  # Implement the analyze_file() method() to:
  #* Read the 'test.txt' file in lines 
  #* Create an array of LineAnalyzers for each line in the file

  # Implement the calculate_line_with_highest_frequency() method to:
  #* calculate the maximum value for highest_wf_count contained by the LineAnalyzer objects in analyzers array
  #  and stores this result in the highest_count_across_lines attribute.
  #* identifies the LineAnalyzer objects in the analyzers array that have highest_wf_count equal to highest_count_across_lines 
  #  attribute value determined previously and stores them in highest_count_words_across_lines.
  def print_highest_word_frequency_across_lines
    puts ""
  end
  #Implement the print_highest_word_frequency_across_lines() method to
  #* print the values of objects in highest_count_words_across_lines in the specified format
end
