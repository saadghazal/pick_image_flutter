import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pick_image/home_screen.dart';
import 'package:pick_image/pick_image_cubit/pick_image_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PickImageCubit>(
      create: (context) => PickImageCubit(imagePicker: ImagePicker()),
      child: MaterialApp(
        title: 'Image Pick',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: HomeScreen(),
      ),
    );
  }
}

