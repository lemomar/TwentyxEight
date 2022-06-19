import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

import '../../models/user/user_model.dart';

class AuthRepository {
  AuthRepository({firebase_auth.FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;
  final firebase_auth.FirebaseAuth _firebaseAuth;

  User currentUser = User.empty;

  Stream<User> get user {
    return _firebaseAuth.userChanges().map((firebaseUser) {
      final user = firebaseUser == null ? User.empty : firebaseUser.toUser;
      currentUser = user;
      return user;
    });
  }

  Future<void> register({required String email, required String password, required String displayName}) async {
    await await _firebaseAuth
        .createUserWithEmailAndPassword(
          email: email,
          password: password,
        )
        .then((_) => _firebaseAuth.currentUser?.updateDisplayName(displayName));
  }

  Future<void> login({required String email, required String password}) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> logout() async {
    try {
      await Future.wait([
        _firebaseAuth.signOut(),
      ]);
    } catch (_) {}
  }
}

extension on firebase_auth.User {
  User get toUser => User(id: uid, email: email, name: displayName, photo: photoURL);
}
