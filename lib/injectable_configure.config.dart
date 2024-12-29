// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:firebase_messaging/firebase_messaging.dart' as _i892;
import 'package:firebase_storage/firebase_storage.dart' as _i457;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart' as _i806;
import 'package:get_it/get_it.dart' as _i174;
import 'package:google_sign_in/google_sign_in.dart' as _i116;
import 'package:injectable/injectable.dart' as _i526;
import 'package:uuid/uuid.dart' as _i706;

import 'core/register_module.dart' as _i537;
import 'features/auth/data/repository/auth_repository_impl.dart' as _i814;
import 'features/auth/domain/repository/auth_repository.dart' as _i279;
import 'features/auth/presentation/cubit/auth_cubit.dart' as _i945;
import 'features/custom_user/data/repositories/custom_user_repository_impl.dart'
    as _i961;
import 'features/custom_user/domain/repositories/custom_user_repository.dart'
    as _i106;
import 'features/custom_user/presentation/cubit/custom_user_cubit.dart'
    as _i1069;
import 'features/shopping_list/create_shopping_list/presentation/cubits/shopping_create_list_cubit.dart'
    as _i1025;
import 'features/shopping_list/domain/repositories/shopping_list_repository.dart'
    as _i617;
import 'features/shopping_list/get_shopping_lists/presentation/cubit/shopping_list_cubit.dart'
    as _i47;
import 'features/shopping_list/repositories/shopping_list_repository_impl.dart'
    as _i446;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i59.FirebaseAuth>(() => registerModule.firebaseAuth);
    gh.factory<_i974.FirebaseFirestore>(() => registerModule.firebaseFirestore);
    gh.factory<_i892.FirebaseMessaging>(() => registerModule.firebaseMessaging);
    gh.factory<_i457.FirebaseStorage>(() => registerModule.firebaseStorage);
    gh.factory<_i116.GoogleSignIn>(() => registerModule.googleSignIn);
    gh.factory<_i806.FacebookAuth>(() => registerModule.facebookAuth);
    gh.factory<_i706.Uuid>(() => registerModule.uuid);
    gh.lazySingleton<_i106.CustomUserRepository>(
        () => _i961.CustomUserRepositoryImpl(gh<_i974.FirebaseFirestore>()));
    gh.lazySingleton<_i617.ShoppingListRepository>(
        () => _i446.ShoppingListRepositoryImpl(
              gh<_i974.FirebaseFirestore>(),
              gh<_i457.FirebaseStorage>(),
            ));
    gh.lazySingleton<_i279.AuthRepository>(() => _i814.AuthRepositoryImpl(
          gh<_i59.FirebaseAuth>(),
          gh<_i116.GoogleSignIn>(),
          gh<_i806.FacebookAuth>(),
        ));
    gh.lazySingleton<_i945.AuthCubit>(
      () => _i945.AuthCubit(gh<_i279.AuthRepository>()),
      dispose: (i) => i.close(),
    );
    gh.lazySingleton<_i1069.CustomUserCubit>(() => _i1069.CustomUserCubit(
          gh<_i106.CustomUserRepository>(),
          gh<_i892.FirebaseMessaging>(),
        ));
    gh.factory<_i1025.ShoppingCreateListCubit>(
        () => _i1025.ShoppingCreateListCubit(
              gh<_i617.ShoppingListRepository>(),
              gh<_i1069.CustomUserCubit>(),
              gh<_i706.Uuid>(),
            ));
    gh.lazySingleton<_i47.ShoppingListCubit>(
      () => _i47.ShoppingListCubit(
        gh<_i617.ShoppingListRepository>(),
        gh<_i1069.CustomUserCubit>(),
      ),
      dispose: (i) => i.close(),
    );
    return this;
  }
}

class _$RegisterModule extends _i537.RegisterModule {}
