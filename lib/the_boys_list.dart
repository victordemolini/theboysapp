import 'package:theboysapp/the_boys_card.dart';
import 'package:flutter/material.dart';
import 'the_boys_model.dart';

class TheBoysList extends StatelessWidget {
  final List<TheBoys> the_boys;
  const TheBoysList(this.the_boys, {super.key});

  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }

  ListView _buildList(context) {
    return ListView.builder(
      itemCount: the_boys.length,
      // ignore: avoid_types_as_parameter_names
      itemBuilder: (context, int) {
        return TheBoysCard(the_boys[int]);
      },
    );
  }
}
