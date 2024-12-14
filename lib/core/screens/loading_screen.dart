import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shopping_organizer/features/auth/presentation/cubit/auth_cubit.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // TODO TŁUMACZENIE
        child: Row(
          children: [
            Text('Ładowenie dancyh'),
            IconButton(
              onPressed: context.read<AuthCubit>().signOut,
              icon: Icon(Icons.logout),
            ),
          ],
        ),
      ),
    );
  }
}
