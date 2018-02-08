def palindrome?(string)
    p string.gsub(/(\W|\d)/, "").downcase == string.gsub(/(\W|\d)/, "").downcase.reverse
end

palindrome?("A man, a plan, a canal -- Panama")
palindrome?("Madam, I'm Adam!")
palindrome?("Abracadabra")
palindrome?("Eva, can I stab bats in a cave?")
palindrome?("Was it a rat I saw?")
palindrome?("not a palindrome")
palindrome?("1234321")


def count_words(string)
    counts = {}
    string.downcase.scan(/\b[a-z]+/).each do |word|
        if counts[word].nil? then
        counts[word] = 1
        else
            counts[word] += 1
        end
    end
    puts counts
end

count_words("A man, a plan, a canal -- Panama")
count_words("Doo bee doo bee doo")
count_words("Was it a rat I saw?")
count_words("# => false (nil is also ok)")