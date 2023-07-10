import 'package:flutter/material.dart';

import 'package:meals_app/models/meals.dart';
import 'package:meals_app/screens/meals_item_screen.dart';
import 'package:meals_app/widgets/meals_item.dart';

class Meals_Screen extends StatelessWidget {
  Meals_Screen({super.key, this.title, required this.meals,
  // required this.tooglefavourite
  });
  final String? title;
  final List<Meal> meals;
  // final void Function(Meal meal) tooglefavourite;
  void _ontapmeal(BuildContext context, Meal meal) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => MelasItemScreen(meal: meal,
        // tooglefavourite: tooglefavourite,
        )));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Uh oh .. Nothing here",
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  )),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Try selecting some differnt category!",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          )
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
          itemCount: meals.length,
          itemBuilder: (ctx, index) => Meal_Item(
                meal: meals[index],
                ontapmeal: () {
                  _ontapmeal(context, meals[index]);
                },
              ));
    }
    if (title == null) {
      return content;
    }
    return Scaffold(
      appBar: AppBar(title: Text(title!)),
      body: content,
    );
  }
}
