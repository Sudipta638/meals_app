import 'package:meals_app/models/category.dart';
import 'package:flutter/material.dart';

class Category_Item extends StatelessWidget {
  const Category_Item(
      {super.key, required this.category, required this.ontapcategory});
  final Category category;
  final void Function() ontapcategory;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontapcategory,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        margin: const EdgeInsets.fromLTRB(4, 0, 4, 0),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(colors: [
              category.color.withAlpha(100),
              category.color.withAlpha(200)
            ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
        child: Text(
          category.title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      ),
    );
  }
}
