import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tcsensor/app/tcsensor/presenter/cubits/fabricantes_get_cubit/get_fabricantes_cubit.dart';
import 'package:tcsensor/app/tcsensor/presenter/fabricantes_list_page.dart';
import 'package:tcsensor/app/tcsensor/usescases/initi_database.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  KiwiContainer container = KiwiContainer();

  await InitiDataBase().call().then((result) {
    result.fold(
      (l) => null,
      (r) => container.registerInstance<Database>(r),
    );
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetFabricantesCubit>(
          create: (context) => GetFabricantesCubit()..getFabricantesSqlLite(),
        ),
      ],
      child: MaterialApp(
        title: 'TC SENSOR',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const FabricantesPage(),
      ),
    );
  }
}
