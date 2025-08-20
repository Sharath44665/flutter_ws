**Use Cases of Factory Constructors**

**Singleton Pattern:** Ensures a class has only one instance, as shown in the example. Useful for managing shared resources like database connections or configuration settings.

**Caching Instances:** Reuse existing objects to save memory or improve performance, e.g., caching immutable objects like strings or configurations.

**Returning Subclass Instances:** Allow a factory constructor to return an instance of a subclass based on input parameters. For example:

**Object Pooling:** Manage a pool of reusable objects, returning an available instance instead of creating a new one.

**Initialization Logic:** Perform complex initialization logic before returning an instance, such as parsing data or validating inputs.


```dart
class Singleton {
  // Static instance to hold the single object
  static final Singleton _instance = Singleton._internal();

  // Private constructor
  Singleton._internal();

  // Factory constructor
  factory Singleton() {
    return _instance; // Returns the same instance every time
  }

  void doSomething() {
    print("Doing something with Singleton instance");
  }
}

void main() {
  // Both variables point to the same instance
  var instance1 = Singleton();
  var instance2 = Singleton();

  print(identical(instance1, instance2)); // true
  instance1.doSomething(); // Doing something with Singleton instance
}
```
**When to Use Factory Constructors**

- When you want to control instance creation (e.g., reuse, subclassing, or conditional logic).
- When you need to return an existing or cached instance instead of a new one. 
- When you want to hide the complexity of object creation from the caller.

Factory constructors provide flexibility in object creation, making them powerful for implementing design patterns and optimizing resource usage in Dart applications.
 
---

In Dart, a Stream is a sequence of asynchronous events, used to handle data that arrives over time, such as user input, network responses, or file I/O. Streams are a core part of Dart’s asynchronous programming model, alongside Future, and are particularly useful for processing data incrementally or in real-time.

**What is a Stream?**

* A Stream is an object that emits a sequence of values (or events) over time. These values can be data, errors, or a signal that the stream is done.
* Streams can be **single-subscription** (only one listener) or **broadcast** (multiple listeners).
* Streams are asynchronous, meaning data is delivered as it becomes available, and you can process it without waiting for the entire dataset.

**Types of Streams**

1. **Single-subscription streams:** Only one listener can subscribe to the stream. Once the stream is listened to, no other listener can subscribe. Example: Reading a file.
2. **Broadcast streams:** Multiple listeners can subscribe to the same stream. Example: WebSocket events or UI updates.

**When to Use Streams**

Use streams when:
* Data arrives incrementally or unpredictably (e.g., real-time updates, network requests, or user interactions).
* You need to process a sequence of events asynchronously.
* You want to handle large datasets (e.g., file reading) without loading everything into memory.
* Examples:

> * Listening to user input (e.g., button clicks, text changes).
> * Processing real-time data from APIs (e.g., WebSocket feeds).
> * Reading large files piece by piece.
> * Handling event-driven systems (e.g., notifications, sensor data).

---

**generators** are special functions that allow you to produce a sequence of values lazily, meaning values are generated on-demand rather than all at once. This is useful for working with large datasets, infinite sequences, or asynchronous data streams, as it avoids loading everything into memory upfront. Dart supports two types of generators: synchronous and asynchronous, which are used to generate sequences of values in different contexts.

**What Are Generators in Dart?**

- **Synchronous Generators:** Produce a sequence of values synchronously using the `sync*` keyword, returning an Iterable.

- **Asynchronous Generators:** Produce a sequence of values asynchronously using the `async*` keyword, returning a `Stream`.

- Generators use the `yield` keyword to emit values one at a time, and they can be paused and resumed, making them efficient for iterative or streaming data.

---

**What Are Generics?**

Generics let you define classes, methods, or functions that can operate on any data type while ensuring type safety. Instead of specifying a concrete type (e.g., `String` or `int`), you use a placeholder (type parameter) like `T` that is resolved when the code is used. This avoids code duplication and reduces the risk of runtime errors.

For example, instead of writing separate classes for a list of Strings and a list of ints, you can use a generic type List<T> to handle any type.

---

**Why Use Generics in Flutter?**

1. **Type Safety:** Ensures the correct data type is used, catching errors at compile time rather than runtime. 
2. **Code Reusability:** Write a single class or method that works with multiple types. 
3. **Improved Readability:** Generic types make code more expressive and maintainable. 
4. **Common in Flutter:** Generics are widely used in Flutter’s APIs, such as `List<T>`, `Map<K, V>`, `Future<T>`, and widgets like `FutureBuilder<T>` or `ListView.builder`.

---

**When to Use Mixins**
- Use mixins when you want to share behavior across multiple classes without forcing them into a single inheritance chain.
- Common use cases include adding abilities like logging, serialization, or specific behaviors (e.g., Flyable, Serializable).

---

**Sealed classes Key Characteristics**
- **Cannot Be Instantiated:** A sealed class is implicitly abstract, so you cannot create instances of it.

- **Restricted Subclassing:** Subclasses must be defined in the same library, and they can be class, mixin, or other sealed, final, or interface classes.
- **Exhaustive Matching**: When used in a switch expression or statement, the Dart compiler ensures all possible subclasses are covered, or it throws a compile-time error.
- **No External Subclasses**: Classes outside the library cannot extend or implement a sealed class.


**Comparison with Other Modifiers**
- **Sealed vs. Final:** A `final` class cannot be extended or implemented at all, while a `sealed` class allows a fixed set of subclasses within the same library.
- **Sealed vs. Abstract:** An `abstract` class can be extended freely, even outside the library, and doesn’t enforce exhaustive matching.
- **Sealed vs. Enum:** Enums are simpler and used for a fixed set of constant instances, while sealed classes allow more complex subclasses with their own state and behavior.



