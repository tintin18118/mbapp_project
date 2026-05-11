class Cake {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String category;
  final double rating;

  const Cake({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category,
    required this.rating,
  });

  // Sample data
  static List<Cake> sampleCakes = [
    Cake(
      id: '1',
      name: 'Rose Velvet Dream',
      description: 'A luscious red velvet cake layered with rose-infused cream cheese frosting, topped with dried petals.',
      price: 42.00,
      imageUrl: 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=400',
      category: 'Celebration',
      rating: 4.9,
    ),
    Cake(
      id: '2',
      name: 'Honey Almond Torte',
      description: 'Delicate layers of almond sponge soaked in wildflower honey, filled with whipped mascarpone.',
      price: 38.00,
      imageUrl: 'https://images.unsplash.com/photo-1621303837174-89787a7d4729?w=400',
      category: 'Classic',
      rating: 4.7,
    ),
    Cake(
      id: '3',
      name: 'Dark Chocolate Forest',
      description: 'Rich chocolate ganache cake with kirsch-soaked cherries and whipped cream, a timeless Black Forest.',
      price: 45.00,
      imageUrl: 'https://images.unsplash.com/photo-1565958011703-44f9829ba187?w=400',
      category: 'Chocolate',
      rating: 4.8,
    ),
    Cake(
      id: '4',
      name: 'Lemon Bliss Chiffon',
      description: 'Feather-light chiffon cake with lemon curd filling and Italian meringue frosting.',
      price: 36.00,
      imageUrl: 'https://images.unsplash.com/photo-1519869325930-281384150729?w=400',
      category: 'Fruity',
      rating: 4.6,
    ),
    Cake(
      id: '5',
      name: 'Salted Caramel Layer',
      description: 'Butter cake with salted caramel buttercream, drizzled with housemade caramel sauce.',
      price: 40.00,
      imageUrl: 'https://images.unsplash.com/photo-1551404973-761c83cd8339?w=400',
      category: 'Caramel',
      rating: 4.9,
    ),
    Cake(
      id: '6',
      name: 'Matcha Cloud Cake',
      description: 'Japanese-style matcha sponge with light whipped cream and white chocolate shavings.',
      price: 44.00,
      imageUrl: 'https://images.unsplash.com/photo-1547414368-ac947d00b91d?w=400',
      category: 'Specialty',
      rating: 4.7,
    ),
  ];
}