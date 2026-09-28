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
      body: const Center(
        child: Text('Mobile Layout'),
      ),
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
            child: Center(
              child: Text('Desktop Layout'),
            ),
          ),
        ],
      ),
    );
  }
}