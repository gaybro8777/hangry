# encoding: UTF-8

describe Hangry do
  context "allrecipes.com lasagna recipe" do
    before(:all) do
      @html = File.read("spec/fixtures/all_recipes_lasagna.html")
      @parsed = Hangry.parse(@html)
    end
    subject { @parsed }

    it "should use a non-standard parser" do
      expect(Hangry::ParserSelector.new(@html).parser).to be_an_instance_of(Hangry::Parsers::NonStandard::AllRecipesParser)
    end

    its(:author) { should == 'John Chandler' }
    its(:canonical_url) { should == 'http://allrecipes.com/recipe/23600/worlds-best-lasagna/' }
    its(:description) { should == '"It takes a little work, but it is worth it."' }
    its(:image_url) { should == 'http://images.media-allrecipes.com/userphotos/560x315/3359675.jpg' }
    its(:ingredients) {
      should == [
        "1 pound sweet Italian sausage",
        "3/4 pound lean ground beef",
        "1/2 cup minced onion",
        "2 cloves garlic, crushed",
        "1 (28 ounce) can crushed tomatoes",
        "2 (6 ounce) cans tomato paste",
        "2 (6.5 ounce) cans canned tomato sauce",
        "1/2 cup water",
        "2 tablespoons white sugar",
        "1 1/2 teaspoons dried basil leaves",
        "1/2 teaspoon fennel seeds",
        "1 teaspoon Italian seasoning",
        "1 tablespoon salt",
        "1/4 teaspoon ground black pepper",
        "4 tablespoons chopped fresh parsley",
        "12 lasagna noodles",
        "16 ounces ricotta cheese",
        "1 egg",
        "1/2 teaspoon salt",
        "3/4 pound mozzarella cheese, sliced",
        "3/4 cup grated Parmesan cheese"
      ]
    }
    its(:name) { should == "World's Best Lasagna" }
    its(:nutrition) do
      should == {
        calories: '448 kcal',
        cholesterol: '82 mg',
        fiber: nil,
        protein: '29.7 g',
        saturated_fat: nil,
        sodium: '1788 mg',
        sugar: nil,
        total_carbohydrates: '36.5g',
        total_fat: '21.3 g',
        trans_fat: nil,
        unsaturated_fat: nil
      }
    end
    its(:instructions) {
      instructions = <<-EOS
In a Dutch oven, cook sausage, ground beef, onion, and garlic over medium heat until well browned. Stir in crushed tomatoes, tomato paste, tomato sauce, and water. Season with sugar, basil, fennel seeds, Italian seasoning, 1 tablespoon salt, pepper, and 2 tablespoons parsley. Simmer, covered, for about 1 1/2 hours, stirring occasionally.
Bring a large pot of lightly salted water to a boil. Cook lasagna noodles in boiling water for 8 to 10 minutes. Drain noodles, and rinse with cold water. In a mixing bowl, combine ricotta cheese with egg, remaining parsley, and 1/2 teaspoon salt.
Preheat oven to 375 degrees F (190 degrees C).
To assemble, spread 1 1/2 cups of meat sauce in the bottom of a 9x13 inch baking dish. Arrange 6 noodles lengthwise over meat sauce. Spread with one half of the ricotta cheese mixture. Top with a third of mozzarella cheese slices. Spoon 1 1/2 cups meat sauce over mozzarella, and sprinkle with 1/4 cup Parmesan cheese. Repeat layers, and top with remaining mozzarella and Parmesan cheese. Cover with foil: to prevent sticking, either spray foil with cooking spray, or make sure the foil does not touch the cheese.
Bake in preheated oven for 25 minutes. Remove foil, and bake an additional 25 minutes. Cool for 15 minutes before serving.
      EOS
      should == instructions.strip
    }
    its(:prep_time) { should == 30 }
    its(:cook_time) { should == 150 }
    its(:total_time) { should == 195 }
    its(:published_date) { should == nil }
    its(:yield) { should == '12' }
  end
end
