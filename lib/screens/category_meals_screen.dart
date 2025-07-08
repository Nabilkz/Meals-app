
import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routename = 'categories-meals';

  final List<Meal> avalibleMealsList;

  const CategoryMealsScreen(this.avalibleMealsList,{super.key});


  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String? categoryTitle;
  late List<Meal> displayedItems;
  bool restartromvedidchange = false;
   @override
  void initState() {
    
    // TODO: implement initState
    super.initState();
    
  }
  @override
  void didChangeDependencies() {
    
    
    if (!restartromvedidchange){
      final routeArg =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    categoryTitle = routeArg['title'];
    final categoryId = routeArg['id'];
    
       displayedItems =  widget.avalibleMealsList.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    restartromvedidchange = true;
    }
    super.didChangeDependencies();
  }

  void removeMeal(String mealId) {
setState(() {
  displayedItems.removeWhere((meal) => meal.id == mealId);
});
  }
  @override
  Widget build(BuildContext context) {
  

    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle!)),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            // removeItem: removeMeal,
            id: displayedItems[index].id,
            title: displayedItems[index].title,
            imageUrl: displayedItems[index].imageUrl,
            affordability: displayedItems[index].affordability,
            complexity: displayedItems[index].complexity,
            duration: displayedItems[index].duration,
          );
        },
        itemCount: displayedItems.length,
      ),
    );
  }
}
