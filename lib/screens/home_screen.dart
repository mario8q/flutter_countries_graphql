import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/country_controller.dart';
import '../widgets/country_list_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Países que empiezan con A'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Consumer<CountryController>(
        builder: (context, controller, child) {
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.error.isNotEmpty) {
            return Center(child: Text('Error: ${controller.error}'));
          }

          if (controller.countries.isEmpty) {
            return const Center(child: Text('No hay países disponibles'));
          }

          return ListView.builder(
            itemCount: controller.countries.length,
            itemBuilder: (context, index) {
              final country = controller.countries[index];
              return CountryListItem(country: country);
            },
          );
        },
      ),
    );
  }
}
