import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_organizer/features/auth/presentation/cubit/auth_cubit.dart';

import 'package:shopping_organizer/features/custom_user/presentation/cubit/custom_user_cubit.dart';
import 'package:shopping_organizer/features/custom_user/utils/custom_user_utils.dart';

class CustomUserListener extends StatelessWidget {
  const CustomUserListener({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CustomUserCubit, CustomUserState>(
      listener: (context, state) {
        state.mapOrNull(
          error: (value) {
            final message = value.message;
            final snackBar = SnackBar(
              content: Text(
                CustomUserUtils.getErrorInformation(message!, context),
              ),
            );

            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            context.read<AuthCubit>().signOut();
          },
        );
      },
      child: child,
    );
  }
}
