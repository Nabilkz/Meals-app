import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

Widget buildListTile(String title,IconData icon, VoidCallback onTapListTile, ){
  return ListTile(
           
            leading: Icon(icon,size: 26,),
            title: Text(title,style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
            onTap: onTapListTile,

          );
}
  @override
  Widget build(BuildContext context) {
  
    return Drawer(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Colors.amber,
            child: Text(
              "data",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30,),
            ),
          ),

          SizedBox(height: 10),
          buildListTile("Meals", Icons.restaurant,(){
            Navigator.of(context).pushReplacementNamed('/');}),

          
          buildListTile("Filters", Icons.settings,() {
             Navigator.of(context).pushReplacementNamed('/filters');
          })
          
        ],
      ),
    );
  }
}
