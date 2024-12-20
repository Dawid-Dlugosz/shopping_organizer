import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

import 'package:shopping_organizer/core/go_router/route_names.dart';
import 'package:shopping_organizer/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:shopping_organizer/features/auth/presentation/dialogs/title_dialog.dart';
import 'package:shopping_organizer/features/auth/presentation/utils/auth_cubit_utils.dart';
import 'package:shopping_organizer/features/custom_user/domain/repositories/custom_user_repository.dart';
import 'package:shopping_organizer/features/custom_user/presentation/cubit/custom_user_cubit.dart';
import 'package:shopping_organizer/injectable_configure.dart';

class AuthListenerWidget extends StatelessWidget {
  const AuthListenerWidget({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthCubit, AuthState>(
          bloc: context.read<AuthCubit>(),
          listener: (context, state) {
            print('sdsdaas $state');
            state.mapOrNull(
              authorized: (value) async {
                final user = value.user;
                final userRepository = getIt<CustomUserRepository>();
                final failureOrResult =
                    await userRepository.isUserExist(userId: user.uid);

                failureOrResult.fold(
                  (failure) {
                    final authCubit = BlocProvider.of<AuthCubit>(context);
                    authCubit.signOut();
                  },
                  (result) {
                    final customUserCubit = context.read<CustomUserCubit>();
                    if (result) {
                      customUserCubit.getCustomUser(userId: user.uid);
                    } else {
                      customUserCubit.createCustomUser(
                        nickname: user.displayName!,
                        userId: user.uid,
                      );
                    }
                    context.go(RouteNames.shoppingList);
                  },
                );
              },
              error: (value) {
                String message = value.code == null
                    ? AppLocalizations.of(context)!.unexpectedError
                    : AuthCubitUtils.getErrorText(
                        value.code!,
                        context,
                      );

                showDialog(
                  context: context,
                  builder: (_) => TitleDialog(
                    title: AppLocalizations.of(context)!.errorOcured,
                    message: message,
                  ),
                );
              },
            );
          },
        ),
      ],
      child: child,
    );
  }
}
