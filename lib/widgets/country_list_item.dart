import 'package:flutter/material.dart';
import '../models/country_model.dart';

class CountryListItem extends StatelessWidget {
  final Country country;

  const CountryListItem({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: Text(country.emoji, style: const TextStyle(fontSize: 24)),
        title: Text(country.name),
        subtitle: Text('Código: ${country.code}'),
      ),
    );
  }
}
