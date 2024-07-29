// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:firebase_messaging/firebase_messaging.dart' as _i5;
import 'package:firebase_storage/firebase_storage.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:uuid/uuid.dart' as _i9;

import 'core/register_module.dart' as _i17;
import 'features/auth/data/repository/auth_repository_impl.dart' as _i11;
import 'features/auth/domain/repository/auth_repository.dart' as _i10;
import 'features/auth/presentation/cubit/auth_cubit.dart' as _i16;
import 'features/create_shopping_list/data/repositories/shopping_list_repository_impl.dart'
    as _i8;
import 'features/create_shopping_list/domain/repositories/shopping_list_repository.dart'
    as _i7;
import 'features/create_shopping_list/presentation/cubits/shopping_list_cubit.dart'
    as _i15;
import 'features/custom_user/data/repositories/custom_user_repository_impl.dart'
    as _i13;
import 'features/custom_user/domain/repositories/custom_user_repository.dart'
    as _i12;
import 'features/custom_user/presentation/cubit/custom_user_cubit.dart' as _i14;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i3.FirebaseAuth>(() => registerModule.firebaseAuth);
    gh.factory<_i4.FirebaseFirestore>(() => registerModule.firebaseFirestore);
    gh.factory<_i5.FirebaseMessaging>(() => registerModule.firebaseMessaging);
    gh.factory<_i6.FirebaseStorage>(() => registerModule.firebaseStorage);
    gh.lazySingleton<_i7.ShoppingListRepository>(
        () => _i8.ShoppingListRepositoryImpl(
              gh<_i4.FirebaseFirestore>(),
              gh<_i6.FirebaseStorage>(),
            ));
    gh.factory<_i9.Uuid>(() => registerModule.uuid);
    gh.lazySingleton<_i10.AuthRepository>(
        () => _i11.AuthRepositoryImpl(gh<_i3.FirebaseAuth>()));
    gh.lazySingleton<_i12.CustomUserRepository>(
        () => _i13.CustomUserRepositoryImpl(gh<_i4.FirebaseFirestore>()));
    gh.lazySingleton<_i14.CustomUserCubit>(() => _i14.CustomUserCubit(
          gh<_i12.CustomUserRepository>(),
          gh<_i5.FirebaseMessaging>(),
        ));
    gh.factory<_i15.ShoppingListCubit>(() => _i15.ShoppingListCubit(
          gh<_i7.ShoppingListRepository>(),
          gh<_i14.CustomUserCubit>(),
          gh<_i9.Uuid>(),
        ));
    gh.lazySingleton<_i16.AuthCubit>(
      () => _i16.AuthCubit(
        gh<_i10.AuthRepository>(),
        gh<_i14.CustomUserCubit>(),
        gh<_i5.FirebaseMessaging>(),
      ),
      dispose: (i) => i.close(),
    );
    return this;
  }
}

class _$RegisterModule extends _i17.RegisterModule {}
