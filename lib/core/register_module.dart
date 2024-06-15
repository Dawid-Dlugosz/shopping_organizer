import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;
  FirebaseFirestore get firebaseFirestore => FirebaseFirestore.instance;
  FirebaseMessaging get firebaseMessaging => FirebaseMessaging.instance;
}
