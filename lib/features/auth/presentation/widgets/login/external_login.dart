import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shopping_organizer/core/color_extension.dart';
import 'package:shopping_organizer/core/custom_images.dart';
import 'package:shopping_organizer/features/auth/presentation/cubit/auth_cubit.dart';

class ExternalLogin extends StatelessWidget {
  const ExternalLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final colorFilter = ColorFilter.mode(
      Theme.of(context).extension<ColorExtension>()!.mainDark,
      BlendMode.srcIn,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: context.read<AuthCubit>().loginViaFacebook,
          child: SvgPicture.asset(
            width: 30,
            height: 30,
            CustomImages.facebookIcon,
            colorFilter: colorFilter,
          ),
        ),
        const SizedBox(width: 20),
        ElevatedButton(
          onPressed: context.read<AuthCubit>().loginViaGoogle,
          child: SvgPicture.asset(
            width: 30,
            height: 30,
            CustomImages.googleIcon,
            colorFilter: colorFilter,
          ),
        ),
      ],
    );
  }
}
