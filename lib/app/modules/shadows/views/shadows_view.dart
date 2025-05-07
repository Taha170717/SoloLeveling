import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shadow_monarch/app/modules/shadows/controllers/shadows_controller.dart';
import 'package:shadow_monarch/app/routes/app_pages.dart';
import 'package:shadow_monarch/app/theme/app_theme.dart';
import 'package:shadow_monarch/app/widgets/entity_card.dart';

class ShadowsView extends GetView<ShadowsController> {
  const ShadowsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shadows Army'),
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
                hintText: 'Search shadows...',
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
          
          // Shadows List
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(AppTheme.shadowPurple),
                  ),
                );
              }
              
              final shadows = controller.filteredShadows;
              
              if (shadows.isEmpty) {
                return const Center(
                  child: Text('No shadows found'),
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
                itemCount: shadows.length,
                itemBuilder: (context, index) {
                  final shadow = shadows[index];
                  return EntityCard(
                    name: shadow.name,
                    subtitle: shadow.rank,
                    imageUrl: shadow.imageUrl,
                    onTap: () => Get.toNamed(
                      Routes.SHADOW_DETAIL,
                      arguments: shadow.id,
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
