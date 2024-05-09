import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gem/models/user_model.dart';
import 'package:gem/screens/qr_page.dart';
import 'package:gem/screens/sign_in.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

String? uID;
UserModel? userModel;
var user;
var obsc = true.obs;
// var passicon = FontAwesomeIcons.eye;

class AuthController extends GetxController {
  void passIcon() {
    bool tick(o) => !o;
    obsc.value = tick(obsc.value);
    // passicon == Icons.eye
    //     ? passicon = FontAwesomeIcons.eyeSlash
    //     : passicon = FontAwesomeIcons.eye;
  }

  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user!.uid);
      uID = value.user!.uid;
      userCreate(email: email, name: name, phone: phone, uID: value.user!.uid);
      getUser();
      Get.off(const SignIn());
    }).catchError((error) {
      print(error);
      return error;
    });
  }

  void userLogin({
    required String email,
    required String password,
  }) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      uID = value.user!.uid;
      print(' IDDDDDDD $uID');
      getUser();
      Get.to(QRViewExample());
    }).catchError((error) {
      print(error);
    });
  }

  // void getUserName() async {
  //   print('USERRR IDDD $uID');
  //   FirebaseFirestore.instance.collection('users').doc(uID).get().then((value) {
  //     final data = value.data();
  //     userName = data!['name'];
  //   });
  //   print('USERRR NAMMMMEEEE $userName');
  // }

  void userCreate({
    required String email,
    required String name,
    required String phone,
    required String uID,
  }) {
    UserModel userModel =
        UserModel(name: name, email: email, phone: phone, uID: uID);
    FirebaseFirestore.instance
        .collection('users')
        .doc(uID)
        .set(userModel.toMap())
        .then((value) => null)
        .catchError((error) {});
  }

  void getUser() {
    FirebaseFirestore.instance
        .collection('users')
        .doc(uID)
        .get()
        .then((value) {
          userModel = UserModel.fromJson(value.data()!);
          print('GETTTT USEREEEEE${value.data()}');
        })
        .then((value) => Get.to(()))
        .catchError((error) {});
  }
}
