enum CustomUserError {
  createFailure('create-failure'),
  emptyUser('empty-user'),
  fcmError('fcm-error'),
  updateList('update-list');

  final String code;

  const CustomUserError(this.code);
}
