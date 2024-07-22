import 'dart:developer';

import 'package:cargo/views/home/landing/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:get/get.dart';
import 'package:cargo/models/user.dart' as cargo;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends GetxService {
  final firebase.FirebaseAuth firebaseAuth = firebase.FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Rx<firebase.User?> firebaseUser = Rx<firebase.User?>(null);
  Rx<cargo.User?> firestoreUser = Rx<cargo.User?>(null);

  @override
  void onInit() {
    super.onInit();
    _checkUserStatus();
  }

  void _checkUserStatus() async {
    await loadUserFromPrefs();
    if (firestoreUser.value != null) {
      Get.offAll(() => const HomePage());
    } else {
      firebaseUser.bindStream(firebaseAuth.userChanges());
      ever(firebaseUser, _setFirestoreUser);
    }
  }

  Future<void> _saveUserToPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (firestoreUser.value != null) {
      await prefs.setString('userId', firestoreUser.value!.userId);
      await prefs.setString(
          'userFirstname', firestoreUser.value!.userFirstname);
      await prefs.setString('userLastname', firestoreUser.value!.userLastname);
      await prefs.setString('userGender', firestoreUser.value!.userGender);
      await prefs.setString('userEmail', firestoreUser.value!.userEmail);
      await prefs.setString('userPhone', firestoreUser.value!.userPhone);
      await prefs.setString(
          'profilePicUrl', firestoreUser.value!.profilePicUrl);
      await prefs.setStringList(
          'favoriteCars', firestoreUser.value!.favoriteCars.cast<String>());
    }
  }

  Future<void> _clearUserFromPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('userId');
    await prefs.remove('userFirstname');
    await prefs.remove('userLastname');
    await prefs.remove('userGender');
    await prefs.remove('userEmail');
    await prefs.remove('userPhone');
    await prefs.remove('profilePicUrl');
    await prefs.remove('favoriteCars');
  }

  Future<void> loadUserFromPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('userId')) {
      firestoreUser.value = cargo.User(
        userId: prefs.getString('userId')!,
        userFirstname: prefs.getString('userFirstname')!,
        userLastname: prefs.getString('userLastname')!,
        userGender: prefs.getString('userGender')!,
        userEmail: prefs.getString('userEmail')!,
        userPhone: prefs.getString('userPhone')!,
        profilePicUrl: prefs.getString('profilePicUrl')!,
        favoriteCars: prefs.getStringList('favoriteCars') ?? [],
      );
    }
  }

  Future<void> register(
      String email, String password, Map<String, dynamic> userDetails) async {
    firebase.UserCredential userCredential;
    firebase.User? user;
    try {
      userCredential = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on firebase.FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        log('The account already exists for that email.');
      }
    } catch (e) {
      log(e.toString());
    }

    if (user != null) {
      await firebaseFirestore
          .collection('users')
          .doc(user.uid)
          .set(userDetails);
      await _setFirestoreUser(user);
      await _saveUserToPrefs();
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on firebase.FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        log('Wrong password provided for that user.');
      }
    }
    await _saveUserToPrefs();
  }

  Future<void> signOut() async {
    try {
      await firebaseAuth.signOut();
      await _clearUserFromPrefs();
    } catch (e) {
      log("Error during sign out: $e");
      rethrow;
    }
  }

  Future<void> _setFirestoreUser(firebase.User? user) async {
    if (user != null) {
      DocumentSnapshot userDoc =
          await firebaseFirestore.collection('users').doc(user.uid).get();
      firestoreUser.value =
          cargo.User.fromMap(userDoc.data() as Map<String, dynamic>, user.uid);
      await _saveUserToPrefs();
    } else {
      firestoreUser.value = null;
      await _clearUserFromPrefs();
    }
  }
}
