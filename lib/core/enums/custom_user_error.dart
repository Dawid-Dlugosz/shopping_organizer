enum CustomUserError {
  emptyUser('empty-user'),
  repoFailure('repo-failure'),
  createFailure('create-failure');

  final String code;

  const CustomUserError(this.code);
}
