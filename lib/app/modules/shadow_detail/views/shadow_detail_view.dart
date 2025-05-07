import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shadow_monarch/app/modules/shadow_detail/controllers/shadow_detail_controller.dart';
import 'package:shadow_monarch/app/theme/app_theme.dart';
import 'package:shadow_monarch/app/widgets/stat_bar.dart';
import 'package:shadow_monarch/app/widgets/ability_chip.dart';

class ShadowDetailView extends GetView<ShadowDetailController> {
  const ShadowDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppTheme.shadowPurple),
            ),
          );
        }

        final shadow = controller.shadow.value;
        if (shadow == null) {
          return const Center(
            child: Text('Shadow not found'),
          );
        }

        return CustomScrollView(
          slivers: [
            // App Bar with Shadow Image
            SliverAppBar(
              expandedHeight: 300.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  shadow.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.8),
                        blurRadius: 10,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                ),
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      shadow.imageUrl,
                      fit: BoxFit.cover,
                    ),
                    const DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black54,
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // Content
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Rank Badge
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppTheme.shadowPurple,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        shadow.rank,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Description
                    const Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      shadow.description,
                      style: const TextStyle(
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Stats
                    const Text(
                      'Stats',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ...shadow.stats.entries.map((entry) => 
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: StatBar(
                          label: entry.key,
                          value: entry.value,
                          maxValue: 100,
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Abilities
                    const Text(
                      'Abilities',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: shadow.abilities.map((ability) => 
                        AbilityChip(label: ability),
                      ).toList(),
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Origin
                    const Text(
                      'Origin',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      shadow.origin,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
