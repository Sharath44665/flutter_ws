void main(List<String> args) {
  Cookie myCookie = Cookie(shape: "rectangle");
  Cookie another = Cookie(shape: "round", size: 30.2);
  print(another._amount); // 3
  // above one is accessible because its in the same file, if its in another file name its not accessible

  print(another.getTotalAmount());

  print(myCookie.amount); // 3

  another.setAmount = 10; // modfying value with setter
  print(another.amount); // 10
}

class Cookie {
  final String? shape;
  final double? size;
  //PRIVATE variable is not private to a file
  int _amount = 3; // private variable
  int? _totalPrice;

  Cookie({this.shape, this.size}) {
    baking();
  }
  // getters
  int get amount => _amount;

  // setters
  set setAmount(int amount) {
    _amount = amount;
  }

  void baking() {
    print("your cookie with shape: $shape, size: $size is baking");
  }

  int? getTotalAmount() {
    _totalPrice = _amount * 5;
    return _totalPrice;
  }

  bool isCooking() {
    return false;
  }
}
