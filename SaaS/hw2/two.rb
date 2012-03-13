class CartesianProduct
  include Enumerable
  
  attr_accessor :result

  def initialize(a, b)
    result = []
    a.each do |a_element|
      b.each do |b_element|
        result << [a_element, b_element]
      end
    end
    self.result = result
  end

  def each(&block)
    self.result.each(&block)
  end
end

# c = CartesianProduct.new([:a,:b], [4,5])
# c.each { |elt| puts elt.inspect }
# # [:a, 4]
# # [:a, 5]
# # [:b, 4]
# # [:b, 5]

# c = CartesianProduct.new([:a,:b], [])
# c.each { |elt| puts elt.inspect }
# # (nothing printed since Cartesian product
# # of anything with an empty collection is empty)