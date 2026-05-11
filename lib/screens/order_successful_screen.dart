import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../screens/home_screen.dart';
import '../widgets/custom_button.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 100, height: 100,
                decoration: const BoxDecoration(color: AppColors.softPink, shape: BoxShape.circle),
                child: const Center(child: Text('🎉', style: TextStyle(fontSize: 48))),
              ),
              const SizedBox(height: 24),
              Text('Order Placed!', style: Theme.of(context).textTheme.displayLarge),
              const SizedBox(height: 12),
              Text(
                'Your cakes are being prepared with love.\nExpected delivery in 2–3 hours.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.6),
              ),
              const SizedBox(height: 40),
              CustomButton(
                label: 'Back to Shop',
                isFullWidth: true,
                onPressed: () => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const HomeScreen()),
                  (route) => false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}