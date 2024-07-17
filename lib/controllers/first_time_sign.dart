import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirstTimeSign {
  static FirstTimeSign instance = FirstTimeSign();

  bool isFirstTime = true;

  changeFirstTime() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    String? userId = user!.email;

    if (userId != null) {
      isFirstTime = false;
      await prefs.setBool('isFirstTime$userId', isFirstTime);
    }
  }
}
