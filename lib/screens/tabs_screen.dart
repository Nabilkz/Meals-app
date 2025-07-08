import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/faveroite_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  const TabsScreen(this.favoriteMeals, {super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<Object, Object>> pages;
  @override
  void initState() {
    pages = [
      {'page': CategoriesScreen(), 'title': "Categories"},
      {'page': FaveroiteScreen(widget.favoriteMeals), 'title': "Your Favorite"},
    ];

    super.initState();
  }

  int selectedPageIndex = 0;

  void selectePage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pages[selectedPageIndex]['title'] as String)),
      drawer: MainDrawer(),
      body: pages[selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectePage,

        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.blue,
        currentIndex: selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categoories',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'favorite'),
        ],
      ),
    );
  }
}
