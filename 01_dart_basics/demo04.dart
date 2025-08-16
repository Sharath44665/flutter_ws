void listDemo() {
  var name = ["demo", "another demo", "hold", "what"];
  name.add("sharath chandra");
  print(name);
}

void main() {
  listDemo();
  demoMaps();
  demoNullable("Sharath", null);
  demoConditionalInvocation(null, "demo middle", "demoLast");
}

void demoMaps() {
  var paper = {
    "name": "opindia",
    "startedIn": 2000,
    "rating": 3,
    "category": {
      "fact-check": true,
      "international": true,
      "sports": false,
      "politics": true,
      "internationalPolitics": true,
    },
  };
  print(paper["name"]);
  }

void demoNullable(String? fname, String? lname) {
  print("firstName: $fname, lastName: $lname");
}


void demoConditionalInvocation(String? fname, String? middleName, String? lname ){
  String? name= fname;
  name ??= middleName;
  name ??= lname;
  
  print(name);
  
}