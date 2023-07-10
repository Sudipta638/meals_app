import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/providers/favorite_meals_provider.dart';
import 'package:meals_app/providers/filter_meal_provider.dart';
import 'package:transparent_image/transparent_image.dart';

class MelasItemScreen extends ConsumerWidget {
  const MelasItemScreen({
    super.key,
    required this.meal,
    // required this.tooglefavourite
  });
  final Meal meal;
  // final void Function(Meal meal) tooglefavourite;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredmeals = ref.watch(filteredandshownprovider);

    final isFavorite = filteredmeals.contains(meal);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
              onPressed: () {
                // tooglefavourite(meal);
                final isfavourite = ref
                    .read(favouriteMealProvider.notifier)
                    .showfavouritemeal(meal);
                print(filteredmeals);
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(isfavourite
                        ? "Item removed from favourite "
                        : "Item added to favourite")));
              },
              icon: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) {
                    return RotationTransition(
                        turns: Tween<double>(begin: 0.5, end: 1)
                            .animate(animation),
                        child: child);
                  },
                  child: Icon(isFavorite ? Icons.star : Icons.star_border,
                      key: ValueKey(isFavorite)))),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: meal.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
                fit: BoxFit.cover,
                height: 300,
                width: double.infinity,
              ),
            ),
            const SizedBox(height: 14),
            Text(
              "Ingridients",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(
              height: 24,
            ),
            for (final ingrediant in meal.ingredients)
              Text(
                ingrediant,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            const SizedBox(height: 24),
            Text(
              "Steps",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(
              height: 14,
            ),
            for (final step in meal.steps)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text(
                  step,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
