class FoodCats
  def self.categories
    ['American',' Asian',' Bakery','Barbecue','Breakfast & Brunch','Burgers','Cajun & Creole','Caribbean','Chinese','Cuban','Donuts','Fast Food','Hot Dogs & Sausages','Indian','Italian','Japanese','Korean','Latin American','Mexican','Noodle Shop','Pizza','Pub Food','Salad','Sandwiches & Subs','Seafood','Soup','Southern & Soul','Southwestern','Spanish','Steakhouse','Sushi','Tacos','Tex-Mex','Thai','Vegetarian','Vietnamese']
  end

  def self.catlist
    temp = self.categories.collect {|c| [categories.index(c), c]}
    temp
  end
end