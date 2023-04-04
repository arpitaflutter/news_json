import 'package:flutter/material.dart';
import 'package:news_json/screens/newsScreen/provider/newsProvider.dart';
import 'package:news_json/screens/newsScreen/view/news_screen.dart';
import 'package:provider/provider.dart';

void main()
{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => newsProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context) => news_screen(),
        },
      ),
    ),
  );
}