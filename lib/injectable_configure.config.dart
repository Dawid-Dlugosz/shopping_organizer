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
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:uuid/uuid.dart' as _i706;

import 'core/register_module.dart' as _i537;
import 'features/auth/data/repository/auth_repository_impl.dart' as _i814;
import 'features/auth/domain/repository/auth_repository.dart' as _i279;
import 'features/auth/presentation/cubit/auth_cubit.dart' as _i945;
import 'features/create_shopping_list/data/repositories/shopping_list_repository_impl.dart'
    as _i692;
import 'features/create_shopping_list/domain/repositories/shopping_list_repository.dart'
    as _i262;
import 'features/create_shopping_list/presentation/cubits/shopping_list_cubit.dart'
    as _i311;
import 'features/custom_user/data/repositories/custom_user_repository_impl.dart'
    as _i961;
import 'features/custom_user/domain/repositories/custom_user_repository.dart'
    as _i106;
import 'features/custom_user/presentation/cubit/custom_user_cubit.dart'
    as _i1069;

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
    gh.factory<_i706.Uuid>(() => registerModule.uuid);
    gh.lazySingleton<_i106.CustomUserRepository>(
        () => _i961.CustomUserRepositoryImpl(gh<_i974.FirebaseFirestore>()));
    gh.lazySingleton<_i279.AuthRepository>(
        () => _i814.AuthRepositoryImpl(gh<_i59.FirebaseAuth>()));
    gh.lazySingleton<_i262.ShoppingListRepository>(
        () => _i692.ShoppingListRepositoryImpl(
              gh<_i974.FirebaseFirestore>(),
              gh<_i457.FirebaseStorage>(),
            ));
    gh.lazySingleton<_i1069.CustomUserCubit>(() => _i1069.CustomUserCubit(
          gh<_i106.CustomUserRepository>(),
          gh<_i892.FirebaseMessaging>(),
        ));
    gh.lazySingleton<_i945.AuthCubit>(
      () => _i945.AuthCubit(
        gh<_i279.AuthRepository>(),
        gh<_i1069.CustomUserCubit>(),
        gh<_i892.FirebaseMessaging>(),
      ),
      dispose: (i) => i.close(),
    );
    gh.factory<_i311.ShoppingListCubit>(() => _i311.ShoppingListCubit(
          gh<_i262.ShoppingListRepository>(),
          gh<_i1069.CustomUserCubit>(),
          gh<_i706.Uuid>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i537.RegisterModule {}
