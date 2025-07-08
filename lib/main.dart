import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  Map<String, bool> _filtera = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _avalibleMeals = DUMMY_MEALS;
  List<Meal> favoriteMeals = [];

  void setFilters(Map<String, bool> filterData) {
    setState(() {
      _filtera = filterData;
      _avalibleMeals = DUMMY_MEALS.where((meal) {
        if (_filtera['gluten'] == true && !meal.isGlutenFree) {
          return false;
        }
        if (_filtera['lactose'] == true && !meal.isLactoseFree) {
          return false;
        }
        if (_filtera['vegan'] == true && !meal.isVegan) {
          return false;
        }
        if (_filtera['vegetarian'] == true && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void toggleFavorite(String mealId) {
    final existingIndex = favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }
 bool isMealFavorite(String id){
  return favoriteMeals.any((meal) => meal.id == id);
 }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.pink,
          primary: Colors.pink,
          secondary: Colors.amber,
        ),
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyMedium: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          bodySmall: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
      ),
      home: TabsScreen(favoriteMeals),
      routes: {
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filtera, setFilters),
        CategoryMealsScreen.routename: (ctx) =>
            CategoryMealsScreen(_avalibleMeals),
        MealDetailScreen.routename: (ctx) => MealDetailScreen(toggleFavorite, isMealFavorite),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => CategoryMealsScreen(_avalibleMeals),
        );
      },
    );
  }
}
