import 'package:assesment_project/presentation/bloc/blocs.dart';
import 'package:assesment_project/presentation/pages/detailsbloc.dart';
import 'package:assesment_project/presentation/pages/home.dart';
import 'package:assesment_project/presentation/pages/homebloc.dart';
import 'package:assesment_project/presentation/pages/onboarding.dart';
import 'package:assesment_project/presentation/widgets/card.dart';
import 'package:assesment_project/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<GroceryBloc>()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home:Onboarding(),
      ),
    );
  }
}

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home:HomePageBloc(),
//     );
//     }
// }