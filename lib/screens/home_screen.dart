import 'package:flutter/material.dart';
import 'dart:ui';
import 'widgets/event_widgets.dart';
import 'widgets/location_widget.dart';
import 'widgets/tab_widgets.dart';
import 'widgets/holi_card.dart';

// Home screen UI
// - Uses lightweight helper widgets from `widgets/event_widgets.dart`
// - Keeps page layout clear and focused; repeated event card UIs live in the widgets file

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    // Home page - 390x1575, #101010
    return Scaffold(
      backgroundColor: const Color(0xFF101010),
      body: SingleChildScrollView(
        child: SizedBox(
          width: 390,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 22, right: 22),
                child: SizedBox(
                  width: 346,
                  child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 34),
                              _buildFrame82(),
                      const SizedBox(height: 34),
                      _buildFrame75(),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
  /// Frame 82 - 346x103, VERTICAL
  Widget _buildFrame82() {
    return SizedBox(
      width: 346,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // location - 346x42, HORIZONTAL
          const LocationWidget(),
          const SizedBox(height: 16),
          // Frame 74 - Tab bar - 346x45
          const TabsRow(),
        ],
      ),
    );
  }

  /// location - 346x42, HORIZONTAL
  // LocationWidget extracted to widgets/location_widget.dart

  /// Tab bar v2 - 255x45
  // TabsRow extracted to widgets/tab_widgets.dart

  // TabButton extracted to widgets/tab_widgets.dart

  /// Frame 75 - Event cards container (only 3 cards as per UI)
  Widget _buildFrame75() {
    return Column(
      children: [
        // Card 1 - Holi party with orange header and View ticket button
        const HoliEventCard(),
        const SizedBox(height: 34),
        // Card 2 - SunSet Sip with "Event Has Ended" overlay
        EventCard(
          imageAsset: 'assets/images/loop2.jpg',
          badge: const StatusBadge(
            text: 'Event Has Ended',
            icon: Icons.access_time,
            iconGradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFD7D7D7), Color(0xFF5E5E5E)],
            ),
          ),
          title: 'SunSet Sip',
          date: '7 Jun 25, Bastian garden city',
          host: 'Hosted by Senan',
        ),
        const SizedBox(height: 34),
        // Card 3 - Nirvaan with "Deadline Has Passed" badge
        EventCard(
          imageAsset: 'assets/images/loop3.jpg',
          badge: const StatusBadge(
            text: 'Deadline Has Passed',
            icon: Icons.history,
            iconGradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFF593A8), Color(0xFFD91D2A)],
            ),
          ),
          title: 'Nirvaan',
          date: '22 Sep 25, Bastian garden city',
          host: 'Hosted by Anya',
        ),
      ],
    );
  }

  /// Holi Party Event Card with orange header and View ticket button
  // HoliEventCard extracted to widgets/holi_card.dart

  // All event card widgets have been moved to widgets/event_widgets.dart
}

