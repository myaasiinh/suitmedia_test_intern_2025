import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/auth/datasource/auth_datasource.dart';
import '../../feature/third/bloc/user_bloc.dart';
import '../utils/route_utils.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
     create: (context) => UserBloc(authDataSource: AuthDataSource()),
      child: MaterialApp.router(
        title: 'Suitmedia Intern 2025',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
       routerConfig: appRouter,
      ),
    );
  }
}
