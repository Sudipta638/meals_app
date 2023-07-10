import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meals.dart';

class FavouriteMealNotifier extends StateNotifier<List<Meal>> {
  FavouriteMealNotifier() : super([]);
  bool showfavouritemeal(Meal meal) {
    final isfavorite = state.contains(meal);
    if (isfavorite) {
      state =
          state.where((favoritemeal) => favoritemeal.id != meal.id).toList();
      return true;
    } else {
      state = [...state, meal];
      return false;
    }
  }
}

final favouriteMealProvider =
    StateNotifierProvider<FavouriteMealNotifier, List<Meal>>((ref) {
  return FavouriteMealNotifier();
});


