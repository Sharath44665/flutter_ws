enum PlanetType{
  terrestrial,
  gas,
  ice
}

enum Planet{
  mercury(planetType: PlanetType.terrestrial, moons: 0, hasRings: false),
  venus(planetType: PlanetType.terrestrial, moons: 0, hasRings: false),
  earth(planetType: PlanetType.terrestrial, moons: 1, hasRings: false),
  mars(planetType: PlanetType.terrestrial, moons: 2, hasRings: false),
  jupiter(planetType: PlanetType.gas, moons: 95, hasRings: true),
  saturn(planetType: PlanetType.gas, moons: 145, hasRings: true),
  uranus(planetType: PlanetType.ice, moons: 27, hasRings: true),
  neptune(planetType: PlanetType.ice, moons: 14, hasRings: true);

  const Planet({
    required this.planetType,
    required this.moons,
    required this.hasRings,
});
  final PlanetType planetType;
  final int moons;
  final bool hasRings;


  bool get isGiant =>
      planetType == PlanetType.gas || planetType == PlanetType.ice;
}

void main(){
  for (var planet in Planet.values){
    // print("Planet: ${planet.name}");
    // print("PlanetType:  ${planet.planetType}");
    print('Planet: ${planet.name}');
    print('  Type: ${planet.planetType.name}');
    print('  Moons: ${planet.moons}');
    print('  Has Rings: ${planet.hasRings}');
    print('  Is Giant: ${planet.isGiant}');
    print("----");
  }
}