// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'core/register_module.dart' as _i7;
import 'features/auth/data/repository/auth_repository_impl.dart' as _i5;
import 'features/auth/domain/repository/auth_repository.dart' as _i4;
import 'features/auth/presentation/cubit/auth_cubit.dart' as _i6;

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
    gh.lazySingleton<_i4.AuthRepository>(
        () => _i5.AuthRepositoryImpl(gh<_i3.FirebaseAuth>()));
    gh.lazySingleton<_i6.AuthCubit>(
        () => _i6.AuthCubit(gh<_i4.AuthRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i7.RegisterModule {}
