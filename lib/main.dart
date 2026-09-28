import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Destination {
  final String name;
  final IconData icon;

  Destination(this.name, this.icon);
}

class TravelDeal {
  final String title;
  final double price;
  final String description;
  final bool isPremium;

  TravelDeal(this.title, this.price, this.description, this.isPremium);
}

void main() {
  runApp(const TravelApp());
}

class TravelApp extends StatelessWidget {
  const TravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Universal Travel Dashboard',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
        textTheme: TextTheme(
          displayLarge: GoogleFonts.poppins(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: GoogleFonts.poppins(
            fontSize: 16,
          ),
        ),
      ),
      home: const TravelHomePage(),
    );
  }
}

class TravelHomePage extends StatelessWidget {
  const TravelHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final destinations = [
      Destination('Home', Icons.home),
      Destination('Explore', Icons.explore),
      Destination('Bookings', Icons.book),
      Destination('Profile', Icons.person),
    ];

    final width = MediaQuery.sizeOf(context).width;

    if (width < 600) {
      return MobileLayout(destinations: destinations);
    }

    return DesktopLayout(destinations: destinations);
  }
}

class MobileLayout extends StatelessWidget {
  final List<Destination> destinations;

  const MobileLayout({
    super.key,
    required this.destinations,
  });

  @override
  Widget build(BuildContext context) {
    final navItems = <Widget>[];

    for (final destination in destinations) {
      navItems.add(
        Expanded(
          child: ListTile(
            leading: Icon(destination.icon),
            onTap: () {},
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Travel Dashboard'),
      ),
      body: const DealDashboard(),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: navItems,
        ),
      ),
    );
  }
}

class DesktopLayout extends StatelessWidget {
  final List<Destination> destinations;

  const DesktopLayout({
    super.key,
    required this.destinations,
  });

  @override
  Widget build(BuildContext context) {
    final navItems = <Widget>[];

    for (final destination in destinations) {
      navItems.add(
        ListTile(
          leading: Icon(destination.icon),
          title: Text(destination.name),
          onTap: () {},
        ),
      );
    }

    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: 200,
            child: Column(
              children: navItems,
            ),
          ),
          const Expanded(
            child: DealDashboard(),
          ),
        ],
      ),
    );
  }
}

class DealDashboard extends StatelessWidget {
  const DealDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final deals = [
      TravelDeal(
        'Paris Adventure',
        799,
        'Explore the city of lights.',
        false,
      ),
      TravelDeal(
        'Tokyo Getaway',
        999,
        'Experience Tokyo and its culture.',
        true,
      ),
      TravelDeal(
        'Caribbean Escape',
        699,
        'Relax on beautiful beaches.',
        false,
      ),
      TravelDeal(
        'Swiss Alps',
        899,
        'Explore the mountains of Switzerland.',
        true,
      ),
    ];

    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 400) {
            return GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(16),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                for (final deal in deals)
                  DealCard(deal: deal),
              ],
            );
          }

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              for (final deal in deals)
                DealCard(deal: deal),
            ],
          );
        },
      ),
    );
  }
}

class DealCard extends StatelessWidget {
  final TravelDeal deal;

  const DealCard({
    super.key,
    required this.deal,
  });

  @override
  Widget build(BuildContext context) {
    final card = Card(
      color: Theme.of(context).colorScheme.surfaceContainer,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              deal.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              '\$${deal.price.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 8),
            Text(
              deal.description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );

    if (deal.isPremium) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepOrange,
            brightness: Brightness.light,
          ),
        ),
        child: Card(
          color: Theme.of(context).colorScheme.primaryContainer,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PREMIUM',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  deal.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  '\$${deal.price.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  deal.description,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ),
      );
    }

    return card;
  }

