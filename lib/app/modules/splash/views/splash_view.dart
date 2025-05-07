import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shadow_monarch/app/modules/splash/controllers/splash_controller.dart';
import 'package:shadow_monarch/app/theme/app_theme.dart';
import 'package:shadow_monarch/app/utils/constants.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(Constants.splashBackgroundUrl),
            fit: BoxFit.cover,
            colorFilter: const ColorFilter.mode(
              Colors.black54,
              BlendMode.darken,
            ),
          ),
        ),
        child: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Shadow Monarch Logo Animation (if you uncomment it)
              const SizedBox(height: 30),
              // App Name with Glow Effect
              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0.0, end: 1.0),
                duration: const Duration(seconds: 2),
                curve: Curves.easeInOut,
                builder: (context, value, child) {
                  return Opacity(
                    opacity: value,
                    child: Text(
                      Constants.appName.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 2,
                        shadows: [
                          Shadow(
                            color:
                                AppTheme.shadowPurple.withOpacity(0.8 * value),
                            blurRadius: 15 * value,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
              // Tagline
              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0.0, end: 1.0),
                duration: const Duration(seconds: 2),
                curve: Curves.easeInOut,
                builder: (context, value, child) {
                  return Opacity(
                    opacity: value,
                    child: Text(
                      Constants.appTagline,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                        letterSpacing: 1.5,
                        fontStyle: FontStyle.italic,
                        shadows: [
                          Shadow(
                            color:
                                AppTheme.shadowPurple.withOpacity(0.5 * value),
                            blurRadius: 10 * value,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 50),
              // Loading Indicator
              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0.0, end: 1.0),
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
                builder: (context, value, child) {
                  return Opacity(
                    opacity: value,
                    child: const CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(AppTheme.shadowPurple),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
