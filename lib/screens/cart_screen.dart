import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/constants/app_colors.dart';
import '../providers/cart_provider.dart';
import '../widgets/custom_button.dart';
import 'order_success_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('My Cart')),
      body: cart.items.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('🛍️', style: TextStyle(fontSize: 56)),
                  const SizedBox(height: 12),
                  Text('Your cart is empty', style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 6),
                  Text('Add some cakes to get started', style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: cart.items.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 10),
                    itemBuilder: (context, i) {
                      final item = cart.items[i];
                      return Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [
                            BoxShadow(color: AppColors.chocolate.withOpacity(0.06), blurRadius: 6),
                          ],
                        ),
                        child: Row(
                          children: [
                            // Quantity controls
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove_circle_outline, color: AppColors.dustyRose),
                                  onPressed: () => context.read<CartProvider>().decreaseQuantity(item.cake.id),
                                ),
                                Text('${item.quantity}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                IconButton(
                                  icon: const Icon(Icons.add_circle_outline, color: AppColors.chocolate),
                                  onPressed: () => context.read<CartProvider>().addItem(item.cake),
                                ),
                              ],
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(item.cake.name, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 14)),
                                  Text('\$${item.cake.price.toStringAsFixed(2)} each', style: Theme.of(context).textTheme.bodySmall),
                                ],
                              ),
                            ),
                            Text(
                              '\$${item.total.toStringAsFixed(2)}',
                              style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.chocolate),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete_outline, color: AppColors.textMuted, size: 20),
                              onPressed: () => context.read<CartProvider>().removeItem(item.cake.id),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                // Summary
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Total', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.textDark)),
                          Text(
                            '\$${cart.total.toStringAsFixed(2)}',
                            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.chocolate),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      CustomButton(
                        label: 'Place Order',
                        isFullWidth: true,
                        onPressed: () {
                          context.read<CartProvider>().clear();
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (_) => const OrderSuccessScreen()),
                            (route) => false,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}