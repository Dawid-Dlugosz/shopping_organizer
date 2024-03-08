enum FirebaseAuthError {
  invalidEmail('invalid-email'),
  userDisabled('user-disabled'),
  userNotFound('user-not-found'),
  wrongPassword('wrong-password'),
  emailAlreadyInUse('email-already-in-use'),
  weakPassword('weak-password');

  final String code;

  const FirebaseAuthError(this.code);
}
