import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_organizer/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:shopping_organizer/injectable_configure.dart';

class CustomMultiBlocProvider extends StatelessWidget {
  const CustomMultiBlocProvider({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<AuthCubit>(),
        ),
      ],
      child: child,
    );
  }
}
