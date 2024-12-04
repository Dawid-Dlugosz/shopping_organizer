enum FirestoreCollectionType {
  users('users'),
  shoppingList('shoppingLists');

  const FirestoreCollectionType(this.type);

  final String type;
}
