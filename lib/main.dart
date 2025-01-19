import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logical_interface/bloc/history_bloc.dart';
import 'network_interface/repositories/history_repository.dart';
import 'user_interface/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MultiRepositoryProvider(
        providers: [
          RepositoryProvider<HistoryRepository>(
            create: (context) => HistoryRepository(),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<HistoryBloc>(
              create: (context) => HistoryBloc(
                historyRepository:
                    RepositoryProvider.of<HistoryRepository>(context),
              )..add(GetHistory()),
            ),
          ],
          child: MaterialApp(
            title: 'Disc Calc',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
              useMaterial3: true,
            ),
            home: const HomeScreen(),
          ),
        ),
      );
}
