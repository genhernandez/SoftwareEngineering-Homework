class Dessert
    def initialize(name, calories)
        @name, @calories = name, calories
    end
    
    attr_accessor :name, :calories
    
    def healthy?
        @calories < 200
    end
    
    def delicious?
        true
    end
end

class JellyBean < Dessert
    def initialize(name, calories, flavor)
        @name, @calories, @flavor = name, calories, flavor
    end
    
    attr_accessor :name, :calories, :flavor
    
    def delicious?
        true unless @flavor == "black licorice"
    end
    
end

cake = Dessert.new("cake", 100)
p cake.name
p cake.calories
p cake.healthy?
cake.calories = 500
p cake.healthy?
p cake.delicious?

jellybean = JellyBean.new("jellybean", 100, "strawberry")
p jellybean.name
p jellybean.calories
p jellybean.flavor
p jellybean.healthy?
p jellybean.delicious?
jellybean.calories = 500
jellybean.flavor = "black licorice"
p jellybean.flavor
p jellybean.calories
p jellybean.healthy?
p jellybean.delicious?
