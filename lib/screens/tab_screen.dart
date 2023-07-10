import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:meals_app/models/meals.dart';
import 'package:meals_app/providers/favorite_meals_provider.dart';
import 'package:meals_app/providers/filter_meal_provider.dart';
import 'package:meals_app/providers/meal_provider.dart';
import 'package:meals_app/screens/category_screen.dart';
import 'package:meals_app/screens/filter_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/maindrawer.dart';

// final kIntialmeal = {
//   Filter.gluttengfree: false,
//   Filter.lactosefree: false,
//   Filter.vegiterian: false,
//   Filter.vegan: false,
// };

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key});
  @override
  ConsumerState<TabScreen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends ConsumerState<TabScreen> {
  var _selectedindex = 0;
  // final List<Meal> _favouritemeals = [];
  // Map<Filter, bool> _selectedmeals = kIntialmeal;
  // void _showinfomessage(String message) {
  //   ScaffoldMessenger.of(context).clearSnackBars();
  //   ScaffoldMessenger.of(context)
  //       .showSnackBar(SnackBar(content: Text(message)));
  // }

  void _onscreen(String indentifier) async {
    Navigator.of(context).pop();
    if (indentifier != "meals") {
      // final result =
      await Navigator.of(context).push<Map<Filter, bool>>(MaterialPageRoute(
          builder: (ctx) => const FilterScreen(
              // filtereditems: _selectedmeals,
              )));
      // setState(() {
      //   _selectedmeals = result ?? kIntialmeal;
      // });
    }
  }

  // void _onfavourite(Meal meal) {
  //   final isExisting = _favouritemeals.contains(meal);

  //   if (isExisting) {
  //     setState(() {
  //       _favouritemeals.remove(meal);
  //       _showinfomessage("Meals removed from favourite list");
  //     });
  //   } else {
  //     setState(() {
  //       _favouritemeals.add(meal);
  //       _showinfomessage("Meal is added to favourite list");
  //     });
  //   }
  // }

  void _onbottomtab(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //   final availableMeals = ref.watch(meals_provider);
    //  final selectedmeals= ref.watch(filterMealProvider);
    // final availablemeals = availableMeals.where((meal) {
    //   if (selectedmeals[Filter.gluttengfree]! && !meal.isGlutenFree) {
    //     return false;
    //   }
    //   if (selectedmeals[Filter.lactosefree]! && !meal.isLactoseFree) {
    //     return false;
    //   }
    //   if (selectedmeals[Filter.vegan]! && !meal.isVegan) {
    //     return false;
    //   }
    //   if (selectedmeals[Filter.vegiterian]! && !meal.isVegetarian) {
    //     return false;
    //   }
    //   return true;
    // }).toList();

    final availablemeals = ref.watch(filteredandshownprovider);
    Widget currentscreen = CategoryScreen(
      // tooglefavourite: _onfavourite,
      availablemeal: availablemeals,
    );
    var activepagetitle = "Pick your category";
    if (_selectedindex == 1) {
      final favouritemeals = ref.watch(favouriteMealProvider);
      currentscreen = Meals_Screen(
        meals: favouritemeals,
        // tooglefavourite: _onfavourite,
      );
      activepagetitle = "Your Favourites";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activepagetitle),
      ),
      drawer: MainDrawer(ondrawerbutton: _onscreen),
      body: currentscreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onbottomtab,
        currentIndex: _selectedindex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favurites"),
        ],
      ),
    );
  }
}
