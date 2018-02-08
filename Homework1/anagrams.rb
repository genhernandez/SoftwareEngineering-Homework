def combine_anagrams(words)
    anagrams = {}
     words.each_with_index do |current_word, index|     
        sorted = current_word.downcase.chars.sort.join
        if anagrams.key? sorted
             anagrams[sorted].push index   
        else
            anagrams[sorted] = [index]    
        end
     end
    
    output = []                    
    anagram_group_index = 0
    anagrams.each_key do |key|
        output.push []         
        anagrams[key].each { |index| output[anagram_group_index].push words[index] }
        anagram_group_index += 1
    end
  output
end
p combine_anagrams(['cars', 'for', 'potatoes', 'racs', 'four', 'scar', 'creams', 'scream'])
p combine_anagrams(['cars', 'for', 'potatoes', 'four','creams'])
p combine_anagrams(['cars', 'for', 'pOtatoes', 'RACS', 'four', 'scar', 'crEams', 'scream'])