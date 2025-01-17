import "package:discount_calculator/user_interface/home_screen.dart";
import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:sqflite/sqflite.dart";
import "package:sqflite_common_ffi/sqflite_ffi.dart";

import "logical_interface/bloc/history_bloc.dart";
import "network_interface/repositories/history_repository.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // sqfliteFfiInit(); // Initializes ffi for sqflite
  // databaseFactory = databaseFactoryFfi; // Set the global database factory
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
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
          title: "Discount Calculator",
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            useMaterial3: true,
          ),
          home: const HomeScreen(),
        ),
      ),
    );
  }
}
