import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/filter_meal_provider.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});
  // final Map<Filter, bool> filtereditems;
  @override
//   ConsumerState<FilterScreen> createState() {
//     return _FilterScreenState();
//   }
// }

// class _FilterScreenState extends ConsumerState<FilterScreen> {
  // var _gluttenfree = false;
  // var _lactosefree = false;
  // var _vegiterain = false;
  // var _vegan = false;

  // @override
  // void initState() {
  //   super.initState();
  //   final activefilter = ref.read(filterMealProvider);
  //   _gluttenfree = activefilter[Filter.gluttengfree]!;
  //   _lactosefree = activefilter[Filter.lactosefree]!;
  //   _vegan = activefilter[Filter.vegan]!;
  //   _vegiterain = activefilter[Filter.vegiterian]!;
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activefilters = ref.watch(filterMealProvider);
    return Scaffold(
      appBar: AppBar(title: const Text("Filters")),
      // body: WillPopScope(
      //   onWillPop: () async {
      //     ref.read(filterMealProvider.notifier).setfilters({
      //       Filter.gluttengfree: _gluttenfree,
      //       Filter.lactosefree: _lactosefree,
      //       Filter.vegan: _vegan,
      //       Filter.vegiterian: _vegiterain
      //     });
      // Navigator.of(context).pop(
      //   {
      //   Filter.gluttengfree: _gluttenfree,
      //   Filter.lactosefree: _lactosefree,
      //   Filter.vegan: _vegan,
      //   Filter.vegiterian: _vegiterain
      // }
      // );
      //   return true;
      // },
      // child: Column(
      body: Column(
        children: [
          SwitchListTile(
            value: activefilters[Filter.gluttengfree]!,
            onChanged: (ischeked) {
              ref
                  .read(filterMealProvider.notifier)
                  .setfilter(Filter.gluttengfree, ischeked);
            },
            // value: _gluttenfree,
            // onChanged: (ischeked) {
            //   setState(() {
            //     _gluttenfree = ischeked;
            //   });
            // },
            title: Text("Gluten-free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground)),
            subtitle: Text(
              "showing gluten-free meals",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
          ),
          SwitchListTile(
             value: activefilters[Filter.lactosefree]!,
            onChanged: (ischeked) {
              ref
                  .read(filterMealProvider.notifier)
                  .setfilter(Filter.lactosefree, ischeked);
            },
            // value: _lactosefree,
            // onChanged: (ischeked) {
            //   setState(() {
            //     _lactosefree = ischeked;
            //   });
            // },
            title: Text("Lactose-free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground)),
            subtitle: Text(
              "showing lactose-free meals",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
          ),
          SwitchListTile(
            value: activefilters[Filter.vegiterian]!,
            onChanged: (ischeked) {
              ref
                  .read(filterMealProvider.notifier)
                  .setfilter(Filter.vegiterian, ischeked);
            },
            // value: _vegiterain,
            // onChanged: (ischeked) {
            //   setState(() {
            //     _vegiterain = ischeked;
            //   });
            // },
            title: Text("Vegiterian",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground)),
            subtitle: Text(
              "showing Veguterian meals",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
          ),
          SwitchListTile(
           value: activefilters[Filter.vegan]!,
            onChanged: (ischeked) {
              ref
                  .read(filterMealProvider.notifier)
                  .setfilter(Filter.vegan, ischeked);
            },
            // value: _vegan,
            // onChanged: (ischeked) {
            //   setState(() {
            //     _vegan = ischeked;
            //   });
            // },
            title: Text("Vegan",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground)),
            subtitle: Text(
              "showing Vegan meals",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
          ),
        ],
      ),
    );
  }
}
