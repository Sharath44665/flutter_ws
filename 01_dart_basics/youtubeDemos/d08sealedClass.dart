// a sealed class is a special type of class introduced in Dart 3.0
//to support exhaustive pattern matching in switch statements and expressions.
// It is used to define a fixed set of subclasses, ensuring that all possible
//subclasses are known at compile time. This is particularly
//useful for type-safe code and when working with algebraic data types,
//such as in functional programming or when handling state in applications like Flutter.

void main(List<String> args) {
  Circle circle = Circle(5);
  Square square = Square(4);

  print(calculateArea(circle)); // 78.5
  print(calculateArea(square)); // 16.0
}

// A sealed class is an abstract class that cannot be instantiated directly
//and restricts its subclasses to a fixed set defined within the same library.

// Purpose
// Enables exhaustive pattern matching in switch statements/expressions,
//ensuring all possible subclasses are handled.

sealed class Shape {}

class Circle extends Shape {
  final double radius;
  Circle(this.radius);
}

class Square extends Shape {
  final double side;
  Square(this.side);
}

double calculateArea(Shape shape) {
  return switch (shape) {
    Circle(radius: double r) => 3.14 * r * r,
    Square(side: double s) => s * s,
  };
}
