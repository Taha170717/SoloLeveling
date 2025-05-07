import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shadow_monarch/app/modules/monarchs/controllers/monarchs_controller.dart';
import 'package:shadow_monarch/app/routes/app_pages.dart';
import 'package:shadow_monarch/app/theme/app_theme.dart';
import 'package:shadow_monarch/app/widgets/entity_card.dart';

class MonarchsView extends GetView<MonarchsController> {
  const MonarchsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Monarchs'),
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
                hintText: 'Search monarchs...',
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
          
          // Monarchs List
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(AppTheme.shadowPurple),
                  ),
                );
              }
              
              final monarchs = controller.filteredMonarchs;
              
              if (monarchs.isEmpty) {
                return const Center(
                  child: Text('No monarchs found'),
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
                itemCount: monarchs.length,
                itemBuilder: (context, index) {
                  final monarch = monarchs[index];
                  return EntityCard(
                    name: monarch.name,
                    subtitle: monarch.title,
                    imageUrl: monarch.imageUrl,
                    onTap: () => Get.toNamed(
                      Routes.MONARCH_DETAIL,
                      arguments: monarch.id,
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
