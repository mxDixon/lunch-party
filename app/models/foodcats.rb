class FoodCats
  def self.categories
    ['Barbecue','Breakfast & Brunch','Burgers','Chinese','Cuban','Fast Food','Hot Dogs','Indian','Italian','Japanese','Korean','Mexican','Pizza','Sandwiches & Subs','Sushi','Tex-Mex','Thai','Vegetarian','Vietnamese']
  end

  def self.catlist
    self.categories.collect {|c| [c, categories.index(c)]}
  end
end