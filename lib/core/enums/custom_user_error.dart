enum CustomUserError {
  createFailure('create-failure'),
  emptyUser('empty-user'),
  fcmError('fcm-error');

  final String code;

  const CustomUserError(this.code);
}
