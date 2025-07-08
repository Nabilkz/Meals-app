import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilteer;
  final Map<String, bool> currentFiltter;
  const FiltersScreen( this.currentFiltter,this.saveFilteer,{super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool lactoseFree = false;
  
     @override
  void initState() {
    _glutenFree = widget.currentFiltter['gluten']!;
    _vegetarian = widget.currentFiltter['vegetarian']!;
    _vegan = widget.currentFiltter['vegan']!;
    lactoseFree = widget.currentFiltter['lactose']!;
    super.initState();
    
  }

  Widget switchForFilterr(
    String title,
    String sub,
    bool currentValue,
    ValueChanged<bool> updateValue,
    // VoidCallback updateTheValue,
  ) {
    return SwitchListTile(
      value: currentValue,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(sub),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("filters"),actions: [IconButton(icon: Icon(Icons.save),onPressed: () {
       final selectedFilter = {
       'gluten':_glutenFree,
       'lactose':lactoseFree,
       'vegan':_vegan,
       'vegetarian':_vegetarian,
  };
        
        widget.saveFilteer(selectedFilter);})],),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Adjust your filter here'),
          ),
          Expanded(
            child: ListView(
              children: [
                switchForFilterr(
                  'gluten free',
                  "foodd that is under gluten",
                  _glutenFree,
                  (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                switchForFilterr(
                  '_vegetarian ',
                  "food that is under _vegetarian",
                  _vegetarian,
                  (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                ),
                switchForFilterr(
                  'gluten free',
                  "food that is under _vegan",
                  _vegan,
                  (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                ),
                switchForFilterr(
                  'gluten free',
                  "food that is under lactoseFree",
                  lactoseFree,
                  (newValue) {
                    setState(() {
                      lactoseFree = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
