import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class UserModel with ChangeNotifier {
  String? name;
  double? weight;
  double? age;
  String? wakeUpHour;
  int? hourIdealSleepMax;
  double? waterIdeal;

  UserModel({
    name,
    weight,
    age,
    wakeUpHour,
    hourIdealSleepMax,
    waterIdeal,
  });

  String? get _name => name;
  double? get _weight => weight;
  double? get _age => age;
  String? get _wakeUpHour => wakeUpHour;
  int? get _hourIdealSleepMax => hourIdealSleepMax;
  double? get _waterIdeal => waterIdeal;

  Future<String?> getName() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;
    CollectionReference userCollection = firestore.collection('Users');

    if (user == null) return null;

    try {
      DocumentSnapshot documentSnapshot = await userCollection
          .doc(user.uid)
          .collection('personalDatas')
          .doc('datas')
          .get();

      if (!documentSnapshot.exists) return null;

      Map<String, dynamic> data =
          documentSnapshot.data() as Map<String, dynamic>;

      name = data['name'];
    } catch (error) {
      print('Erro ao ler nome do usuário. Erro: $error');
    }

    notifyListeners();
    return _name;
  }

  Future<double?> getWeight() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;
    CollectionReference userCollection = firestore.collection('Users');

    if (user == null) return null;

    try {
      DocumentSnapshot documentSnapshot = await userCollection
          .doc(user.uid)
          .collection('personalDatas')
          .doc('datas')
          .get();

      if (!documentSnapshot.exists) return null;

      Map<String, dynamic> data =
          documentSnapshot.data() as Map<String, dynamic>;

      weight = data['weight'];
    } catch (error) {
      print('Erro ao ler peso do usuário. Erro: $error');
    }

    notifyListeners();
    return _weight;
  }

  Future<double?> getAge() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;
    CollectionReference userCollection = firestore.collection('Users');

    if (user == null) return null;

    try {
      DocumentSnapshot documentSnapshot = await userCollection
          .doc(user.uid)
          .collection('personalDatas')
          .doc('datas')
          .get();

      if (!documentSnapshot.exists) return null;

      Map<String, dynamic> data =
          documentSnapshot.data() as Map<String, dynamic>;

      age = data['age'];
    } catch (error) {
      print('Erro ao ler idade do usuário. Erro: $error');
    }

    notifyListeners();
    return _age;
  }

  Future<String?> getWakeUpHour() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;
    CollectionReference userCollection = firestore.collection('Users');

    if (user == null) return null;

    try {
      DocumentSnapshot documentSnapshot = await userCollection
          .doc(user.uid)
          .collection('personalDatas')
          .doc('datas')
          .get();

      if (!documentSnapshot.exists) return null;

      Map<String, dynamic> data =
          documentSnapshot.data() as Map<String, dynamic>;

      wakeUpHour = data['wakeUpHour'];
    } catch (error) {
      print('Erro ao ler horário de despertar do usuário. Erro: $error');
    }

    notifyListeners();
    return _wakeUpHour;
  }

  Future<int?> getHourIdealSleepMax() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;
    CollectionReference userCollection = firestore.collection('Users');

    if (user == null) return null;

    try {
      DocumentSnapshot documentSnapshot = await userCollection
          .doc(user.uid)
          .collection('personalDatas')
          .doc('datas')
          .get();

      if (!documentSnapshot.exists) return null;

      Map<String, dynamic> data =
          documentSnapshot.data() as Map<String, dynamic>;

      hourIdealSleepMax = data['hourIdealSleepMax'];
    } catch (error) {
      print('Erro ao ler hora ideal máxima de sono do usuário. Erro: $error');
    }

    notifyListeners();
    return _hourIdealSleepMax;
  }

  Future<double?> getWaterIdeal() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;
    CollectionReference userCollection = firestore.collection('Users');

    if (user == null) return null;

    try {
      DocumentSnapshot documentSnapshot = await userCollection
          .doc(user.uid)
          .collection('personalDatas')
          .doc('datas')
          .get();

      if (!documentSnapshot.exists) return null;

      Map<String, dynamic> data =
          documentSnapshot.data() as Map<String, dynamic>;

      waterIdeal = data['waterIdeal'];
    } catch (error) {
      print('Erro ao ler quantidade de água ideal do usuário. Erro: $error');
    }

    notifyListeners();
    return _waterIdeal;
  }
}
