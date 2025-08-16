class Spacecraft {
  String name;
  DateTime? launchDate;

  int? get launchYear => launchDate?.year;

  Spacecraft(this.name, this.launchDate) {}

  Spacecraft.unlanunched(String name) : this(name, null);

  void describe() {
    print("Spacecraft: $name");
    print("launch date: $launchDate");
    print("launch year: $launchYear");
  }
}

void main() {
  var voyager = Spacecraft("Voyager1", DateTime.now());
  var starShip = Spacecraft.unlanunched("Demo starship");
  voyager.describe();
  print("-------");
  starShip.describe();
}
