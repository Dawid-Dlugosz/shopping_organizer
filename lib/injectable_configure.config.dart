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
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'core/register_module.dart' as _i12;
import 'features/auth/data/repository/auth_repository_impl.dart' as _i7;
import 'features/auth/domain/repository/auth_repository.dart' as _i6;
import 'features/auth/presentation/cubit/auth_cubit.dart' as _i10;
import 'features/custom_user/data/repositories/custom_user_repository_impl.dart'
    as _i9;
import 'features/custom_user/domain/repositories/custom_user_repository.dart'
    as _i8;
import 'features/custom_user/presentation/cubit/custom_user_cubit.dart' as _i11;

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
    gh.lazySingleton<_i6.AuthRepository>(
        () => _i7.AuthRepositoryImpl(gh<_i3.FirebaseAuth>()));
    gh.lazySingleton<_i8.CustomUserRepository>(
        () => _i9.CustomUserRepositoryImpl(gh<_i4.FirebaseFirestore>()));
    gh.lazySingleton<_i10.AuthCubit>(
        () => _i10.AuthCubit(gh<_i6.AuthRepository>()));
    gh.lazySingleton<_i11.CustomUserCubit>(
        () => _i11.CustomUserCubit(gh<_i8.CustomUserRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i12.RegisterModule {}
