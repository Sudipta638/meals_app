import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/category_item.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({
    super.key,
    // required this.tooglefavourite,
    required this.availablemeal,
  });
  // final void Function(Meal meal) tooglefavourite;

  final List<Meal> availablemeal;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationcontroller;

  @override
  void initState() {
    super.initState();
    _animationcontroller = AnimationController(
        vsync: this,
        duration: const Duration(microseconds: 400),
        upperBound: 1,
        lowerBound: 0);
    _animationcontroller.forward();
  }

  void dispose() {
    _animationcontroller.dispose();
    super.dispose();
  }

  void _ontapcategory(BuildContext context, Category category) {
    final filertedmeals = widget.availablemeal
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => Meals_Screen(
              title: category.title,
              meals: filertedmeals,
              // tooglefavourite: tooglefavourite,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationcontroller,
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 15,
          ),
          children: [
            for (Category category in availableCategories)
              Category_Item(
                category: category,
                ontapcategory: () {
                  _ontapcategory(context, category);
                },
              )
          ],
        ),
        builder: (context, child) => SlideTransition(
              position:
                  Tween(begin: const Offset(0, 3), end: const Offset(0, 0))
                      .animate(
                CurvedAnimation(
                    parent: _animationcontroller, curve: Curves.easeInOut),
              ),
              child: child,
            ));
  }
}
