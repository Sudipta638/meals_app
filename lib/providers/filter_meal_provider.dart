import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/meal_provider.dart';

enum Filter { gluttengfree, lactosefree, vegiterian, vegan }

class FilterMealNotifier extends StateNotifier<Map<Filter, bool>> {
  FilterMealNotifier()
      : super({
          Filter.gluttengfree: false,
          Filter.lactosefree: false,
          Filter.vegan: false,
          Filter.vegiterian: false
        });

  void setfilter(Filter filter, bool isfiltered) {
    state = {
      ...state,
      filter: isfiltered,
    };
  }

  void setfilters(Map<Filter, bool> choossfiltered) {
    state = choossfiltered;
  }
}

final filterMealProvider =
    StateNotifierProvider<FilterMealNotifier, Map<Filter, bool>>((ref) {
  return FilterMealNotifier();
});

final filteredandshownprovider = Provider((ref) {
  final availableMeals = ref.watch(meals_provider);
  final selectedmeals = ref.watch(filterMealProvider);

  return availableMeals.where((meal) {
    if (selectedmeals[Filter.gluttengfree]! && !meal.isGlutenFree) {
      return false;
    }
    if (selectedmeals[Filter.lactosefree]! && !meal.isLactoseFree) {
      return false;
    }
    if (selectedmeals[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    if (selectedmeals[Filter.vegiterian]! && !meal.isVegetarian) {
      return false;
    }
    return true;
  }).toList();
});
