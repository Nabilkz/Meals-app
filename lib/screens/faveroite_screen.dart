import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import '../widgets/meal_item.dart';
class FaveroiteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  const FaveroiteScreen(this.favoriteMeals,{super.key});

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty){
    return Center(child: Text("data"),);}
    else{
      return  ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoriteMeals[index].id,
            title: favoriteMeals[index].title,
            imageUrl: favoriteMeals[index].imageUrl,
            affordability: favoriteMeals[index].affordability,
            complexity: favoriteMeals[index].complexity,
            duration: favoriteMeals[index].duration,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }

  }
}