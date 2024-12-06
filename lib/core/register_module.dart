import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

@module
abstract class RegisterModule {
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;
  FirebaseFirestore get firebaseFirestore => FirebaseFirestore.instance;
  FirebaseMessaging get firebaseMessaging => FirebaseMessaging.instance;
  FirebaseStorage get firebaseStorage => FirebaseStorage.instance;
  GoogleSignIn get googleSignIn => GoogleSignIn();
  FacebookAuth get facebookAuth => FacebookAuth.instance;

  Uuid get uuid => const Uuid();
}
