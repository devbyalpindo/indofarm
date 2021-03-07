import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indofarm/shared/shared.dart';
import 'package:indofarm/ui/pages/pages.dart';

import 'bloc/bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PageBloc()),
        BlocProvider(create: (_) => GaleryBloc()..add(FetchGalery())),
        BlocProvider(create: (_) => DictionaryBloc()..add(FetchDictionary())),
        BlocProvider(create: (_) => NewsBloc()..add(FetchNews()))
      ],
      child: MaterialApp(
        //* Calling theme data from theme state
        theme: ThemeData(primaryColor: mainColor, accentColor: yellowColor1),
        debugShowCheckedModeBanner: false,

        //* Calling root widget of this application
        home: Wrapper(),
      ),
    );
  }
}
