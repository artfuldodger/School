class Dessert
  attr_accessor :name, :calories

  def initialize(name, calories)
    self.name = name
    self.calories = calories
  end

  def healthy?
    self.calories < 200
  end

  def delicious?
    true
  end
end

class JellyBean < Dessert
  attr_accessor :flavor, :calories, :flavor

  def initialize(name, calories, flavor)
    self.name = name
    self.calories = calories
    self.flavor = flavor
  end

  def delicious?
    self.flavor.downcase != 'black licorice'
  end 
end