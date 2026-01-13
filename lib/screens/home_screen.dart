import 'package:flutter/material.dart';
import 'dart:ui';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedTab = 0; // 0 = Discover, 1 = My tickets
  int _selectedBottomNav = 0;

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
              // StatusBar - 390x44
              _buildStatusBar(),
              // Frame 79 - 346x1437, VERTICAL, positioned with left: 22px
              Padding(
                padding: const EdgeInsets.only(left: 22, right: 22),
                child: SizedBox(
                  width: 346,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 25), // Gap from status bar
                      // Frame 82 - 346x103, VERTICAL
                      _buildFrame82(),
                      const SizedBox(height: 34),
                      // Frame 75 - 346x1300, VERTICAL - Event cards
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

  /// StatusBar / iPhone 13 & 13 Pro - 390x44
  Widget _buildStatusBar() {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 60, sigmaY: 60),
        child: Container(
          width: 390,
          height: 44,
          color: const Color(0xFF000000).withOpacity(0.01),
          padding: const EdgeInsets.symmetric(horizontal: 21),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left Side - Time - 54x21
              const Text(
                '9:41',
                style: TextStyle(
                  fontFamily: 'SF Pro Text',
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  height: 20 / 15,
                  letterSpacing: -0.5,
                  color: Color(0xFFFFFFFF),
                ),
              ),
              // Right Side - 67x11
              Row(
                children: [
                  // Mobile Signal - 17x11
                  const Icon(
                    Icons.signal_cellular_4_bar,
                    color: Colors.white,
                    size: 17,
                  ),
                  const SizedBox(width: 5),
                  // Wifi - 15x11
                  const Icon(Icons.wifi, color: Colors.white, size: 15),
                  const SizedBox(width: 5),
                  // Battery - 24x11
                  const Icon(Icons.battery_full, color: Colors.white, size: 24),
                ],
              ),
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
          _buildLocation(),
          const SizedBox(height: 16),
          // Frame 74 - Tab bar - 346x45
          _buildTabBar(),
        ],
      ),
    );
  }

  /// location - 346x42, HORIZONTAL
  Widget _buildLocation() {
    return SizedBox(
      width: 346,
      height: 42,
      child: Row(
        children: [
          // Frame 81 - 40x40, padding: 8, #FFFFFF 10%, blur: 100
          ClipRRect(
            borderRadius: BorderRadius.circular(99),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
              child: Container(
                width: 40,
                height: 40,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF).withOpacity(0.10),
                  borderRadius: BorderRadius.circular(99),
                ),
                child: const Icon(
                  Icons.location_on_outlined,
                  color: Color(0xFFFFFFFF),
                  size: 24,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Frame 80 - 88x42, VERTICAL
          SizedBox(
            width: 88,
            height: 42,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                // Pick your scene - Nomixa, 12px, 400, line-height: 21
                Text(
                  'Pick your scene',
                  style: TextStyle(
                    fontFamily: 'Nomixa',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 21 / 12,
                    letterSpacing: 0,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
                // Bengaluru - Nomixa, 14px, 500, line-height: 21
                Text(
                  'Bengaluru',
                  style: TextStyle(
                    fontFamily: 'Nomixa',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    height: 21 / 14,
                    letterSpacing: 0,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Tab bar v2 - 255x45
  Widget _buildTabBar() {
    return SizedBox(
      width: 255,
      height: 45,
      child: Row(
        children: [
          // your invites (Discover) - 113x45, padding: 16 horizontal, 12 vertical
          _buildTabButton(
            label: 'Discover',
            isSelected: _selectedTab == 0,
            width: 113,
            onTap: () => setState(() => _selectedTab = 0),
          ),
          const SizedBox(width: 10),
          // Your requests (My tickets) - 132x45
          _buildTabButton(
            label: 'My tickets',
            isSelected: _selectedTab == 1,
            width: 132,
            onTap: () => setState(() => _selectedTab = 1),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton({
    required String label,
    required bool isSelected,
    required double width,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: 45,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(21),
          border: Border.all(
            color: const Color(0xFFFFFFFF).withOpacity(0.07),
            width: 1,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            height: 21 / 14,
            letterSpacing: 0,
            color: isSelected ? Colors.black : const Color(0xFFAEAEAE),
          ),
        ),
      ),
    );
  }

  /// Frame 75 - Event cards container (only 3 cards as per UI)
  Widget _buildFrame75() {
    return Column(
      children: [
        // Card 1 - Holi party with orange header and View ticket button
        _buildEventCardHoli(),
        const SizedBox(height: 34),
        // Card 2 - SunSet Sip with "Event Has Ended" overlay
        _buildEventCardEnded(
          title: 'SunSet Sip',
          date: '7 Jun 25, Bastian garden city',
          host: 'Hosted by Senan',
        ),
        const SizedBox(height: 34),
        // Card 3 - Nirvaan with "Deadline Has Passed" badge
        _buildEventCardDeadline(
          title: 'Nirvaan',
          date: '22 Sep 25, Bastian garden city',
          host: 'Hosted by Anya',
        ),
      ],
    );
  }

  /// Holi Party Event Card with orange header and View ticket button
  Widget _buildEventCardHoli() {
    return SizedBox(
      width: 346,
      height: 470,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Orange header with "You're Going!"
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              width: 346,
              height: 55,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(28),
                  topRight: Radius.circular(28),
                ),
                gradient: const RadialGradient(
                  center: Alignment.center,
                  radius: 1.0,
                  colors: [Color(0xFFFF9028), Color(0xFFFF5E00)],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Fire icon with glow
                  Container(
                    width: 19,
                    height: 19,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.5),
                          blurRadius: 16,
                        ),
                        BoxShadow(
                          color: Colors.white.withOpacity(0.5),
                          blurRadius: 14,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.local_fire_department,
                      color: Colors.white,
                      size: 19,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "You're Going!",
                    style: TextStyle(
                      fontFamily: 'Bricolage Grotesque',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      letterSpacing: -0.16,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Main image card
          Positioned(
            top: 35,
            left: 0,
            right: 0,
            child: Container(
              height: 430,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                border: Border.all(
                  color: const Color(0xFFFFFFFF).withOpacity(0.40),
                  width: 2,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(26),
                child: Stack(
                  children: [
                    // Holi party image from assets
                    Positioned.fill(
                      child: Image.asset(
                        'assets/images/holi_party.jpg',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFF87CEEB),
                                  Color(0xFFFFD700),
                                  Color(0xFFFF69B4),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    // Gradient overlay at bottom
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 280,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              const Color(0xFF000000).withOpacity(0.7),
                              const Color(0xFF000000).withOpacity(0.4),
                              const Color(0xFF000000).withOpacity(0.0),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Content - Title, date, host, button
                    Positioned(
                      bottom: 20,
                      left: 24,
                      right: 24,
                      child: Column(
                        children: [
                          const Text(
                            'Holi party',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Bricolage Grotesque',
                              fontWeight: FontWeight.w700,
                              fontSize: 34,
                              height: 51 / 34,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                          const Text(
                            '7 Jun 25, Bastian garden city',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Bricolage Grotesque',
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              height: 24 / 14,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                          const Text(
                            'Hosted by Anya',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Bricolage Grotesque',
                              fontWeight: FontWeight.w500,
                              fontSize: 11.34,
                              height: 17.02 / 11.34,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                          const SizedBox(height: 16),
                          // View ticket button - purple #B78EF5
                          Container(
                            width: 298,
                            height: 56,
                            decoration: BoxDecoration(
                              color: const Color(0xFFB78EF5),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: const Color(
                                  0xFFFFFFFF,
                                ).withOpacity(0.30),
                                width: 0.5,
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                'View ticket',
                                style: TextStyle(
                                  fontFamily: 'Bricolage Grotesque',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  letterSpacing: 0.18,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Event Card - "Event Has Ended" (SunSet Sip style)
  Widget _buildEventCardEnded({
    required String title,
    required String date,
    required String host,
  }) {
    return SizedBox(
      width: 346,
      height: 401,
      child: Container(
        width: 346,
        height: 401,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          border: Border.all(
            color: const Color(0xFFFFFFFF).withOpacity(0.40),
            width: 2,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(26),
          child: Stack(
            children: [
              // Background image - stays sharp above overlay
              Positioned.fill(
                child: Image.asset(
                  'assets/images/loop2.jpg',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(color: Colors.grey[800]);
                  },
                ),
              ),
              // Ellipse blur at bottom - exact Figma specs
              Positioned(
                bottom: -70,
                left: -78.5,
                right: -78.5,
                child: ClipPath(
                  clipper: EllipseClipper(),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.00, sigmaY: 10.00),
                    child: Container(
                      width: 483,
                      height: 335,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.05),
                      ),
                    ),
                  ),
                ),
              ),
              // "Event Has Ended" badge at TOP CENTER
              Positioned(
                top: 16,
                left: 0,
                right: 0,
                child: Center(child: _buildEndedBadge()),
              ),
              // Content at bottom - text above the overlay (never blurred)
              Positioned(
                bottom: 20,
                left: 24,
                right: 24,
                child: Column(
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'Bricolage Grotesque',
                        fontWeight: FontWeight.w700,
                        fontSize: 34,
                        height: 51 / 34,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    Text(
                      date,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'Bricolage Grotesque',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        height: 24 / 14,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    Text(
                      host,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'Bricolage Grotesque',
                        fontWeight: FontWeight.w500,
                        fontSize: 11.34,
                        height: 17.02 / 11.34,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Scroll indicators
                    _buildScrollIndicators(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Event Has Ended badge - 211x44, padding 10/12, border-radius 10px, icon gradient #D7D7D7 to #5E5E5E
  Widget _buildEndedBadge() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: const Color(0xFF000000).withOpacity(0.10),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: const Color(0xFFFFFFFF).withOpacity(0.21),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 24x24 icon with gradient #D7D7D7 to #5E5E5E
              Container(
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFFD7D7D7), Color(0xFF5E5E5E)],
                  ),
                ),
                child: const Center(
                  child: Icon(Icons.access_time, color: Colors.white, size: 14),
                ),
              ),
              const SizedBox(width: 6),
              const Text(
                'Event Has Ended',
                style: TextStyle(
                  fontFamily: 'Nomixa',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  height: 21 / 16,
                  letterSpacing: 0,
                  color: Color(0xFFFFFFFF),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Scroll indicators - 28x4
  Widget _buildScrollIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 10,
          height: 4,
          decoration: BoxDecoration(
            color: const Color(0xFFD9D9D9),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 2),
        Container(
          width: 7,
          height: 4,
          decoration: BoxDecoration(
            color: const Color(0xFFD9D9D9).withOpacity(0.4),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 2),
        Container(
          width: 7,
          height: 4,
          decoration: BoxDecoration(
            color: const Color(0xFFD9D9D9).withOpacity(0.4),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }

  /// Event Card - "Deadline Has Passed" (Nirvaan style)
  Widget _buildEventCardDeadline({
    required String title,
    required String date,
    required String host,
  }) {
    return SizedBox(
      width: 346,
      height: 401,
      child: Container(
        width: 346,
        height: 401,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          border: Border.all(
            color: const Color(0xFFFFFFFF).withOpacity(0.40),
            width: 2,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(26),
          child: Stack(
            children: [
              // Background image - stays sharp above overlay
              Positioned.fill(
                child: Image.asset(
                  'assets/images/loop3.jpg',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(color: Colors.grey[800]);
                  },
                ),
              ),
              // Ellipse blur at bottom - exact Figma specs
              Positioned(
                bottom: -70,
                left: -78.5,
                right: -78.5,
                child: ClipPath(
                  clipper: EllipseClipper(),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.00, sigmaY: 10.00),
                    child: Container(
                      width: 483,
                      height: 335,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.05),
                      ),
                    ),
                  ),
                ),
              ),
              // "Deadline Has Passed" badge at TOP CENTER
              Positioned(
                top: 16,
                left: 0,
                right: 0,
                child: Center(child: _buildDeadlineBadge()),
              ),
              // Content at bottom - text above the overlay (never blurred)
              Positioned(
                bottom: 20,
                left: 24,
                right: 24,
                child: Column(
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'Bricolage Grotesque',
                        fontWeight: FontWeight.w700,
                        fontSize: 34,
                        height: 51 / 34,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    Text(
                      date,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'Bricolage Grotesque',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        height: 24 / 14,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    Text(
                      host,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'Bricolage Grotesque',
                        fontWeight: FontWeight.w500,
                        fontSize: 11.34,
                        height: 17.02 / 11.34,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Scroll indicators
                    _buildScrollIndicators(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Deadline Has Passed badge - 211x44, padding 10/12, border-radius 10px, icon gradient #F593A8 to #D91D2A
  Widget _buildDeadlineBadge() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: const Color(0xFF000000).withOpacity(0.10),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: const Color(0xFFFFFFFF).withOpacity(0.21),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 24x24 icon with gradient #F593A8 to #D91D2A (pink to red)
              Container(
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFFF593A8), Color(0xFFD91D2A)],
                  ),
                ),
                child: const Center(
                  child: Icon(Icons.history, color: Colors.white, size: 14),
                ),
              ),
              const SizedBox(width: 6),
              const Text(
                'Deadline Has Passed',
                style: TextStyle(
                  fontFamily: 'Nomixa',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  height: 21 / 16,
                  letterSpacing: 0,
                  color: Color(0xFFFFFFFF),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EllipseClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.addOval(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height * 0.8),
        width: size.width * 1.2,
        height: size.height * 0.9,
      ),
    );
    return path;
  }

  @override
  bool shouldReclip(EllipseClipper oldClipper) => false;
}
