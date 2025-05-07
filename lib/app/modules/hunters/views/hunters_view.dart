import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shadow_monarch/app/modules/hunters/controllers/hunters_controller.dart';
import 'package:shadow_monarch/app/routes/app_pages.dart';
import 'package:shadow_monarch/app/theme/app_theme.dart';
import 'package:shadow_monarch/app/widgets/entity_card.dart';

class HuntersView extends GetView<HuntersController> {
  const HuntersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hunters Association'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: controller.updateSearchQuery,
              decoration: InputDecoration(
                hintText: 'Search hunters...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: AppTheme.darkSurface,
              ),
            ),
          ),
          
          // Hunters List
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(AppTheme.shadowPurple),
                  ),
                );
              }
              
              final hunters = controller.filteredHunters;
              
              if (hunters.isEmpty) {
                return const Center(
                  child: Text('No hunters found'),
                );
              }
              
              return GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: hunters.length,
                itemBuilder: (context, index) {
                  final hunter = hunters[index];
                  return EntityCard(
                    name: hunter.name,
                    subtitle: hunter.rank,
                    imageUrl: hunter.imageUrl,
                    onTap: () => Get.toNamed(
                      Routes.HUNTER_DETAIL,
                      arguments: hunter.id,
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
