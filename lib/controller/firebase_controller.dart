import 'package:firebase_database/firebase_database.dart';

class FirebaseController {
  final databaseRef = FirebaseDatabase.instance.reference().child("Portfolio");
  var aboutRef = FirebaseDatabase.instance
      .reference()
      .child("Portfolio")
      .child("about_us");
  var experienceRef = FirebaseDatabase.instance
      .reference()
      .child("Portfolio")
      .child("experience");

  var portfolioRef = FirebaseDatabase.instance
      .reference()
      .child("Portfolio")
      .child("portfolio");

  Future<String> getFullName() async {
    var model = await aboutRef.once();
    return model.value['name'];
  }

  Future<String> getDesignation() async {
    var model = await aboutRef.once();
    return model.value['designation'];
  }

  Future<String> getDescription() async {
    var model = await aboutRef.once();
    return model.value['description'];
  }

  Query getExperience() {
    return experienceRef;
  }

  Query getPortfolio() {
    return portfolioRef;
  }
}
