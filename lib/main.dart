import 'package:dars12/pages/form/form_page.dart';
import 'package:dars12/pages/todo/list/bloc/list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:dars12/pages/todo/list/list_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const FormPage().page,
      // home: BlocProvider(
      //   create: (context) => ListBloc(),
      //   child: const ListPage(),
      // ),
    );
  }
}
