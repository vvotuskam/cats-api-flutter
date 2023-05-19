class Cat {
  String? breed;
  String? country;
  String? origin;
  String? coat;
  String? pattern;

  Cat(
      {this.breed, this.country, this.origin, this.coat, this.pattern});

  Cat.fromJson(Map<String, dynamic> json) {
    breed = json['breed'];
    country = json['country'];
    origin = json['origin'];
    coat = json['coat'];
    pattern = json['pattern'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['breed'] = this.breed;
    data['country'] = this.country;
    data['origin'] = this.origin;
    data['coat'] = this.coat;
    data['pattern'] = this.pattern;
    return data;
  }
}