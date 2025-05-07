import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shadow_monarch/app/modules/home/controllers/home_controller.dart';
import 'package:shadow_monarch/app/routes/app_pages.dart';
import 'package:shadow_monarch/app/theme/app_theme.dart';
import 'package:shadow_monarch/app/widgets/featured_card.dart';
import 'package:shadow_monarch/app/widgets/section_title.dart';
import 'package:shadow_monarch/app/utils/constants.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppTheme.shadowPurple),
              ),
            )
          : CustomScrollView(
              slivers: [
                // App Bar with Solo Leveling theme
                SliverAppBar(
                  expandedHeight: 200.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text(
                      'Shadow Monarch',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            color: AppTheme.shadowPurple.withOpacity(0.8),
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
                          Constants.sungJinwooBannerUrl,
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
                        // Shadows Section
                        const SectionTitle(title: 'Shadows'),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 220,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.featuredShadows.length,
                            itemBuilder: (context, index) {
                              final shadow = controller.featuredShadows[index];
                              return FeaturedCard(
                                title: shadow.name,
                                subtitle: shadow.rank,
                                imageUrl: shadow.imageUrl,
                                onTap: () => Get.toNamed(
                                  Routes.SHADOW_DETAIL,
                                  arguments: shadow.id,
                                ),
                              );
                            },
                          ),
                        ),
                        
                        const SizedBox(height: 24),
                        
                        // Hunters Section
                        const SectionTitle(title: 'Hunters'),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 220,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.featuredHunters.length,
                            itemBuilder: (context, index) {
                              final hunter = controller.featuredHunters[index];
                              return FeaturedCard(
                                title: hunter.name,
                                subtitle: hunter.rank,
                                imageUrl: hunter.imageUrl,
                                onTap: () => Get.toNamed(
                                  Routes.HUNTER_DETAIL,
                                  arguments: hunter.id,
                                ),
                              );
                            },
                          ),
                        ),
                        
                        const SizedBox(height: 24),
                        
                        // Monarchs Section
                        const SectionTitle(title: 'Monarchs'),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 220,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.featuredMonarchs.length,
                            itemBuilder: (context, index) {
                              final monarch = controller.featuredMonarchs[index];
                              return FeaturedCard(
                                title: monarch.name,
                                subtitle: monarch.title,
                                imageUrl: monarch.imageUrl,
                                onTap: () => Get.toNamed(
                                  Routes.MONARCH_DETAIL,
                                  arguments: monarch.id,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: (index) {
            controller.changeTab(index);
            switch (index) {
              case 0:
                Get.offAllNamed(Routes.HOME);
                break;
              case 1:
                Get.toNamed(Routes.SHADOWS);
                break;
              case 2:
                Get.toNamed(Routes.HUNTERS);
                break;
              case 3:
                Get.toNamed(Routes.MONARCHS);
                break;
            }
          },
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Shadows',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shield),
              label: 'Hunters',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shield),
              label: 'Monarchs',
            ),
          ],
        ),
      ),
    );
  }
}
