# mynotes

getting started with fire base

- create project in firebase console
- install firebase cli 
- use this command `firebase login`
- next use this command `dart pub global activate flutterfire_cli` (also: https://firebase.google.com/docs/flutter/setup)

some commands:
```
firebase login

dart pub global activate flutterfire_cli

flutterfire configure

```

if any plaform folder is missing then use this:

``` shell 
flutter create --platforms=android .
```

| option | Description |
| ----------- | ----------- |
| `--platforms` | The platforms supported by this project. Platform folders (e.g. android/) will be generated in the target project. This argument only works when "--template" is set to app or plugin. When adding platforms to a plugin project, the pubspec.yaml will be updated with the requested platform. Adding desktop platforms requires the corresponding desktop config setting to be enabled. [`ios (default), android (default), windows (default), linux (default), macos (default), web (default)`] |


run on web:
``` shell
flutter run -d web-server
```

---

``` dart
late final TextEditingController _email;
``` 

from the above line, `_late_` keyword meaning, `as of now its empty, but later i will initialize it with value before compile`

---

**audio is crackling while running emulator?**

solution: 

``` shell
cd /home/yourUserName/.android/avd/Medium_Phone.avd
```

change these lines in `config.ini`

``` ini
hw.audioInput=no
hw.audioOutput=no
```

> i found `hw.audioInput=no` only, add the second line from above

---

## Try catch in Flutter

``` dart
try { 
    final userCredential = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                              email: email,
                              password: password,
                            );
                      } catch (e) {
                        print("--- authorziation error ====");
                        print(e); // just prints whatever error is
                        print("-----");
                        print(e.runtimeType); // to see which type of exception
                      }
```

**catching exception**: 

``` dart
try { 
  final userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
          email: email,
          password: password,
        );
} on FirebaseAuthException catch (e) {
    print("----");
    print(e.code); // exception code name 
}
```
### null aware operator

The Dart code `user?.emailVerified ?? false` is a concise expression that handles null safety and provides a default value. Let's break it down:
1. `user?.emailVerified:`
   - The `?.` is the **null-aware operator** in Dart. It checks if `user` is not null before accessing its `emailVerified` property.
   - If `user` is null, the expression evaluates to `null` instead of throwing a null reference error.
   - If `user` is not null, it returns the value of `user.emailVerified`, which is typically a boolean indicating whether the user's email is verified.

2. `?? false:`
   - The `??` is the null-coalescing operator in Dart. It provides a default value if the expression on its left is null.
   - In this case, if `user?.emailVerified` evaluates to `null` (because `user` is null or `emailVerified` is null), the expression returns `false` as the default value.

---
