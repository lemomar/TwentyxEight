// ignore_for_file: unnecessary_cast, parameter_assignments, avoid_dynamic_calls

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/models.dart';

class UserDataRepository {
  UserDataRepository({FirebaseFirestore? firestore}) : _firestore = firestore ?? FirebaseFirestore.instance;
  final FirebaseFirestore? _firestore;

  Stream<QuerySnapshot> getCurrencies() async* {
    final collection = _firestore!.collection('Crypto');
    yield* collection.snapshots();
  }

  Stream<DocumentSnapshot> getUserData(String userId) async* {
    final doc = _firestore!.collection('user_data').doc(userId);
    try {
      await doc.get();
    } catch (e) {
      await doc.set({'favoriteCurrencySymbol': null} as Map<String, dynamic>);
    } finally {
      yield* doc.snapshots();
    }
  }

  Future<bool> setFavoriteCurrency(String userId, String? favoriteCurrencySymbol) async {
    try {
      final doc = _firestore!.collection('user_data').doc(userId);
      await doc.set(
        {'favoriteCurrencySymbol': favoriteCurrencySymbol} as Map<String, dynamic>,
        SetOptions(merge: true),
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> setHeldCurrencyList(String userId, List<HeldCurrency> heldCurrencyList) async {
    try {
      final doc = _firestore!.collection('user_data').doc(userId);
      print(heldCurrencyList);
      await doc.set(
        {'held': heldCurrencyList.map((HeldCurrency currency) => currency.toJson()).toList()} as Map<String, dynamic>,
        SetOptions(merge: true),
      );
      print('LESGO');
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
