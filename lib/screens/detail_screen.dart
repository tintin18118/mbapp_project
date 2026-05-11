import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import '../core/constants/app_colors.dart';
import '../data/models/cake_model.dart';
import '../providers/cart_provider.dart';
import '../widgets/custom_button.dart';

class DetailScreen extends StatelessWidget {
  final Cake cake;
  const DetailScreen({super.key, required this.cake});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 320,
            pinned: true,
            backgroundColor: AppColors.cream,
            flexibleSpace: FlexibleSpaceBar(
              background: CachedNetworkImage(
                imageUrl: cake.imageUrl,
                fit: BoxFit.cover,
                errorWidget: (_, _, _) => Container(
                  color: AppColors.softPink,
                  child: const Icon(Icons.cake, size: 80, color: AppColors.dustyRose),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.cream,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(cake.name, style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 26)),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: AppColors.softPink,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(cake.category, style: const TextStyle(color: AppColors.chocolate, fontSize: 12)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(Icons.star_rounded, color: AppColors.caramel, size: 18),
                      const SizedBox(width: 4),
                      Text('${cake.rating} rating', style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text('About this cake', style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 8),
                  Text(cake.description, style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.6)),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Price', style: Theme.of(context).textTheme.bodySmall),
                          Text(
                            '\$${cake.price.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.chocolate,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      CustomButton(
                        label: 'Add to Cart',
                        onPressed: () {
                          context.read<CartProvider>().addItem(cake);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('${cake.name} added to cart'),
                              backgroundColor: AppColors.chocolate,
                              duration: const Duration(seconds: 1),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}