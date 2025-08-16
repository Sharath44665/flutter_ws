class Pair<A,B>{
  final A value1;
  final B value2;

  Pair(this.value1, this.value2);
}
void main(){
  final names=Pair("Sharath", "Chandra");
  print(names);
}