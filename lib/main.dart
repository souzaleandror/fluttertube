import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:fluttertube/screens/api.dart';
import 'package:fluttertube/screens/home.dart';

import 'blocs/favorite_bloc.dart';
import 'blocs/videos_bloc.dart';

void main() {
  runApp(MyApp());

  Api api = Api();
  api.search("eletro");
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: VideosBloc(),
      child: BlocProvider(
          bloc: FavoriteBloc(),
          child: MaterialApp(
            title: 'FlutterTube',
            debugShowCheckedModeBanner: false,
            home: Home(),
          )),
    );
  }
}
