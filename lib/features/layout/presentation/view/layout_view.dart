import 'package:e_commerce/features/layout/presentation/manager/layout_provider/layout_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<LayoutProvider>(
        builder: (context,layoutProvider,child){
          return  SafeArea(
            child: layoutProvider.screens[layoutProvider.currentIndex],
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: Provider.of<LayoutProvider>(context).currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black26,
        onTap: (int index){
          Provider.of<LayoutProvider>(context,listen: false).changeCurrentIndex(index: index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.card_travel,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
