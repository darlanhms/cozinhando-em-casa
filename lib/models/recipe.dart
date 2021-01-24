class Recipe {
  String title;
  String image;
  String portions;
  String prepareTime;
  String ingredients;
  String howto;

  Recipe({
    this.title,
    this.image,
    this.portions,
    this.prepareTime,
    this.ingredients,
    this.howto,
  });

  Recipe.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    portions = json['portions'];
    prepareTime = json['prepareTime'];
    ingredients = json['ingredients'];
    howto = json['howto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['image'] = this.image;
    data['portions'] = this.portions;
    data['prepareTime'] = this.prepareTime;
    data['ingredients'] = this.ingredients;
    data['howto'] = this.howto;
    return data;
  }
}
