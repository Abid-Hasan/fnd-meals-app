// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import './screens/category_meals_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 22,
                  fontWeight: FontWeight.w800),
            ),
      ),
      // home: CategoriesScreen(), (not needed anymore; "/" route is declared)

      routes: {
        "/": (context) => CategoriesScreen(),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (context) => MealDetailScreen(),
      },

      initialRoute: "/", // not necessary for "/" because this is the default

      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => CategoriesScreen());
      },
    );
  }
}
