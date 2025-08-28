import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:schoole_app/veiw/home_page/widget/event_card_painter.dart';
import 'package:schoole_app/veiw/home_page/widget/floating_particle_painter.dart';
import 'package:schoole_app/veiw/home_page/widget/here_card_painter.dart';
import 'dart:math' as math;

import 'package:schoole_app/veiw/home_page/widget/modern_quick_action.dart';
import 'package:schoole_app/veiw/home_page/widget/particle_background_painter.dart';

class SchoolHomePage extends StatefulWidget {
  const SchoolHomePage({super.key});

  @override
  State<SchoolHomePage> createState() => _SchoolHomePageState();
}

class _SchoolHomePageState extends State<SchoolHomePage>
    with TickerProviderStateMixin {
  late AnimationController _primaryAnimationController;
  late AnimationController _floatingController;
  late AnimationController _rippleController;
  late AnimationController _particleController;
  late AnimationController _morphController;
  late AnimationController _pulseController;
  late AnimationController _waveController;

  late Animation<double> _headerAnimation;
  late Animation<double> _cardStaggerAnimation;
  late Animation<double> _floatingAnimation;
  late Animation<double> _rippleAnimation;
  late Animation<double> _particleAnimation;
  late Animation<double> _morphAnimation;
  late Animation<double> _pulseAnimation;
  late Animation<double> _waveAnimation;

  int _selectedIndex = 0;
  bool _isSearchExpanded = false;
  final TextEditingController _searchController = TextEditingController();

  // Enhanced mock data with more visual elements
  final List<ModernQuickAction> quickActions = [
    ModernQuickAction('Attendance', Icons.verified_user,
        [Color(0xff006876), Color(0xff006876)], '95%'),
    ModernQuickAction('Assignments', Icons.edit_note,
  [Color(0xff006876), Color(0xff006876)], '8 Due'),
    ModernQuickAction('Grades', Icons.emoji_events,
  [Color(0xff006876), Color(0xff006876)], 'A- Avg'),
    ModernQuickAction('Schedule', Icons.access_time,
        [Color(0xff006876), Color(0xff006876)], 'Today'),
    ModernQuickAction('Library', Icons.menu_book,
        [Color(0xff006876), Color(0xff006876)], '3 Books'),
    ModernQuickAction('Events', Icons.celebration,
        [Color(0xff006876), Color(0xff006876)], '2 Coming'),
    ModernQuickAction('Fees', Icons.payment,
        [Color(0xff006876), Color(0xff006876)], 'Pending'),
    ModernQuickAction('Profile', Icons.person,
        [Color(0xff006876), Color(0xff006876)], 'View'),
  ];

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _startAnimations();
  }

  void _initializeAnimations() {
    _primaryAnimationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _floatingController = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );

    _rippleController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _particleController = AnimationController(
      duration: const Duration(milliseconds: 4000),
      vsync: this,
    );

    _morphController = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    );

    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _waveController = AnimationController(
      duration: const Duration(milliseconds: 3500),
      vsync: this,
    );

    _headerAnimation = CurvedAnimation(
      parent: _primaryAnimationController,
      curve: Curves.elasticOut,
    );

    _cardStaggerAnimation = CurvedAnimation(
      parent: _primaryAnimationController,
      curve: Curves.easeOutBack,
    );

    _floatingAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _floatingController, curve: Curves.easeInOut),
    );

    _rippleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _rippleController, curve: Curves.easeOut),
    );

    _particleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _particleController, curve: Curves.linear),
    );

    _morphAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _morphController, curve: Curves.easeInOut),
    );

    _pulseAnimation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _waveAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _waveController, curve: Curves.linear),
    );
  }

  void _startAnimations() {
    _primaryAnimationController.forward();
    _floatingController.repeat(reverse: true);
    _particleController.repeat();
    _morphController.repeat(reverse: true);
    _pulseController.repeat(reverse: true);
    _waveController.repeat();

    // Delayed ripple effects
    Future.delayed(const Duration(milliseconds: 800), () {
      _rippleController.forward();
    });
  }

  @override
  void dispose() {
    _primaryAnimationController.dispose();
    _floatingController.dispose();
    _rippleController.dispose();
    _particleController.dispose();
    _morphController.dispose();
    _pulseController.dispose();
    _waveController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    final texttheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: colorScheme.primary.withOpacity(.3),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Animated background with particles
          _buildAnimatedBackground(size,colorScheme),

          // Main content
          CustomScrollView(
            slivers: [
              _buildGlassmorphicAppBar(colorScheme, size),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      SizedBox(height: 20.h),
                      _buildHeroWelcomeCard(colorScheme, size),
                       SizedBox(height: 20.h),
                      _buildFloatingStatsRow(colorScheme),
                       SizedBox(height: 25.h),
                      _buildMorphingQuickActions(colorScheme,size),
                       SizedBox(height: 25.h),
                      _buildNeuomorphicAnnouncements(colorScheme),
                      const SizedBox(height: 35),
                      _buildHolographicEvents(colorScheme),
                      const SizedBox(height: 120),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Floating particles overlay
          _buildFloatingParticles(size),
        ],
      ),
      floatingActionButton: _buildMagicFAB(colorScheme),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: _buildGlassmorphicNavBar(colorScheme),
    );
  }

  Widget _buildAnimatedBackground(Size size,colorSchema) {
    return AnimatedBuilder(
      animation: _particleAnimation,
      builder: (context, child) {
        return Container(
          width: size.width,
          height: size.height,
          child: CustomPaint(
            painter: ParticleBackgroundPainter(_particleAnimation.value,colorSchema),
          ),
        );
      },
    );
  }

  Widget _buildGlassmorphicAppBar(ColorScheme colorScheme, Size size) {
    final texttheme = Theme.of(context).textTheme;
    final isMobile = size.width < 600;

    return SliverAppBar(
      expandedHeight: isMobile ? 80 : 100,
      floating: true,
      pinned: true,
      backgroundColor: colorScheme.primary.withOpacity(0.3),
      elevation: 0,
      flexibleSpace: AnimatedBuilder(
        animation: _headerAnimation,
        builder: (context, child) {
          return ClipRRect(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.white.withOpacity(0.1),
                    width: 1,
                  ),
                ),
              ),
              child: Stack(
                children: [
                  // Blur effect
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.05),
                      ),
                    ),
                  ),
                  SafeArea(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: isMobile ? 16 : 32,
                        vertical: isMobile ? 12 : 20,
                      ),
                      child: Transform.scale(
                        scale: _headerAnimation.value,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Pulsing logo
                            AnimatedBuilder(
                              animation: _pulseAnimation,
                              builder: (context, child) {
                                return Transform.scale(
                                  scale: _pulseAnimation.value,
                                  child: Container(
                                    width: isMobile ? 45 : 55,
                                    height: isMobile ? 45 : 55,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [colorScheme.primary, colorScheme.primary],
                                      ),
                                      borderRadius: BorderRadius.circular(16),
                                      boxShadow: [
                                        BoxShadow(
                                          color: colorScheme.primary.withOpacity(0.4),
                                          blurRadius: 20,
                                          spreadRadius: 0,
                                        ),
                                      ],
                                    ),
                                    child: Icon(
                                      Icons.school,
                                      color: Colors.white,
                                      size: isMobile ? 18 : 20,
                                    ),
                                  ),
                                );
                              },
                            ),

                            SizedBox(width: isMobile ? 12 : 20),

                            // Title and greeting
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ShaderMask(
                                    shaderCallback: (bounds) => LinearGradient(
                                      colors: [
                                        Colors.white,
                                        Colors.white.withOpacity(0.8),
                                      ],
                                    ).createShader(bounds),
                                    child: Text(
                                      'EduManage Pro',
                                      style: texttheme.titleMedium?.copyWith(
                                        fontSize: isMobile ? 16 : 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Welcome back, Alex! ✨',
                                    style: texttheme.titleSmall?.copyWith(
                                      fontSize: isMobile ? 12 : 14,
                                      color: Colors.white,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),

                            if (!isMobile) ...[
                              _buildMorphingSearchButton(),
                              const SizedBox(width: 12),
                            ],
                            _buildNotificationBell(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }


  Widget _buildMorphingSearchButton() {
    return AnimatedBuilder(
      animation: _morphAnimation,
      builder: (context, child) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          width: _isSearchExpanded ? 180 : 45,
          height: 45,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.2),
                Colors.white.withOpacity(0.1),
              ],
            ),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: Colors.white.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: _isSearchExpanded
              ? TextField(
            controller: _searchController,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Search magic...',
              hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
              suffixIcon: IconButton(
                icon: Icon(Icons.close, color: Colors.white),
                onPressed: () {
                  setState(() {
                    _isSearchExpanded = false;
                    _searchController.clear();
                  });
                },
              ),
            ),
          )
              : IconButton(
            icon: Transform.rotate(
              angle: _morphAnimation.value * 2 * math.pi,
              child: Icon(Icons.search, color: Colors.white),
            ),
            onPressed: () {
              setState(() {
                _isSearchExpanded = true;
              });
            },
          ),
        );
      },
    );
  }

  Widget _buildNotificationBell() {
    return AnimatedBuilder(
      animation: _floatingAnimation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, math.sin(_floatingAnimation.value * 2 * math.pi) * 3),
          child: Stack(
            children: [
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.2),
                      Colors.white.withOpacity(0.1),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Icon(Icons.notifications_outlined, color: Colors.white),
              ),
              Positioned(
                right: 8,
                top: 8,
                child: AnimatedBuilder(
                  animation: _pulseAnimation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _pulseAnimation.value,
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFFff6b6b), Color(0xFFee5a24)],
                          ),
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFff6b6b).withOpacity(0.6),
                              blurRadius: 8,
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeroWelcomeCard(ColorScheme colorScheme, Size size) {
    final textTheme = Theme.of(context).textTheme;
    final isMobile = size.width < 600;

    return AnimatedBuilder(
      animation: _cardStaggerAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _cardStaggerAnimation.value,
          child: Container(
            width: double.infinity,
            height: isMobile ? 200 : 260,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFF667eea),
                  const Color(0xFF764ba2),
                  const Color(0xFF667eea).withOpacity(0.8),
                ],
              ),
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF667eea).withOpacity(0.4),
                  blurRadius: 30,
                  spreadRadius: 0,
                  offset: const Offset(0, 15),
                ),
              ],
            ),
            child: Stack(
              children: [
                CustomPaint(
                  size: Size(size.width, isMobile ? 220 : 260),
                  painter: HeroCardPainter(_floatingAnimation.value),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          AnimatedBuilder(
                            animation: _floatingAnimation,
                            builder: (context, child) {
                              return Transform.rotate(
                                angle: math.sin(_floatingAnimation.value * 2 * math.pi) * 0.1,
                                child: const Icon(
                                  Icons.auto_awesome,
                                  color: Colors.white,
                                  size: 26,
                                ),
                              );
                            },
                          ),
                          const SizedBox(width: 10),
                          Flexible(
                            child: Text(
                              'Good Morning, Superstar!',
                              style: textTheme.titleMedium?.copyWith(
                                fontSize: isMobile ? 18 : 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 15),

                      Text(
                        'You\'re crushing it! 🚀\n3 assignments completed, 2 events coming up.',
                        style: textTheme.bodySmall?.copyWith(
                          fontSize: isMobile ? 13 : 15,
                          color: Colors.white.withOpacity(0.9),
                          height: 1.4,
                        ),
                      ),

                      const Spacer(),

                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: isMobile ? 45 : 50,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.3),
                                  width: 1,
                                ),
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(15),
                                  onTap: () {},
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.calendar_today,
                                            color: Colors.white, size: 20),
                                        const SizedBox(width: 8),
                                        Text(
                                          'View Schedule',
                                          style: textTheme.bodySmall?.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Container(
                            width: isMobile ? 45 : 50,
                            height: isMobile ? 45 : 50,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.3),
                                width: 1,
                              ),
                            ),
                            child: AnimatedBuilder(
                              animation: _pulseAnimation,
                              builder: (context, child) {
                                return Transform.scale(
                                  scale: _pulseAnimation.value * 0.1 + 0.9,
                                  child: const Icon(Icons.favorite, color: Colors.white),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }


  Widget _buildFloatingStatsRow(ColorScheme colorScheme) {
    return AnimatedBuilder(
      animation: _cardStaggerAnimation,
      builder: (context, child) {
        return Row(
          children: [
            Expanded(
              child: TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.0, end: 1.0),
                duration: Duration(milliseconds: 800),
                curve: Curves.elasticOut,
                builder: (context, value, child) {
                  return Transform.scale(
                    scale: value,
                    child: _buildGlowingStatCard(
                      'Attendance',
                      '95%',
                      Icons.verified_user,
                      [colorScheme.primary, colorScheme.primary],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.0, end: 1.0),
                duration: Duration(milliseconds: 1000),
                curve: Curves.elasticOut,
                builder: (context, value, child) {
                  return Transform.scale(
                    scale: value,
                    child: _buildGlowingStatCard(
                      'Grade',
                      'A-',
                      Icons.emoji_events,
                      [colorScheme.primary, colorScheme.primary],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.0, end: 1.0),
                duration: Duration(milliseconds: 1200),
                curve: Curves.elasticOut,
                builder: (context, value, child) {
                  return Transform.scale(
                    scale: value,
                    child: _buildGlowingStatCard(
                      'Tasks',
                      '12',
                      Icons.task_alt,
                      [colorScheme.primary, colorScheme.primary],
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildGlowingStatCard(String title, String value, IconData icon, List<Color> colors) {
    return AnimatedBuilder(
      animation: _floatingAnimation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, math.sin(_floatingAnimation.value * 2 * math.pi + title.hashCode) * 2),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: colors),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: colors.first.withOpacity(0.4),
                  blurRadius: 20,
                  spreadRadius: 0,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              children: [
                AnimatedBuilder(
                  animation: _pulseAnimation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _pulseAnimation.value * 0.1 + 0.9,
                      child: Icon(icon, color: Colors.white, size: 30),
                    );
                  },
                ),
                const SizedBox(height: 12),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildMorphingQuickActions(ColorScheme colorScheme, Size size) {
    final textTheme = Theme.of(context).textTheme;
    final isMobile = size.width < 600;
    final crossAxisCount = isMobile ? 2 : size.width < 900 ? 3 : 4;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: [Colors.white, Colors.white.withOpacity(0.8)],
          ).createShader(bounds),
          child: Text(
            '⚡ Quick Actions',
            style: textTheme.titleMedium?.copyWith(
              fontSize: isMobile ? 20 : 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),

        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 20,
            childAspectRatio: isMobile ? 0.8 : 1.0,
          ),
          itemCount: quickActions.length,
          itemBuilder: (context, index) {
            return TweenAnimationBuilder<double>(
              tween: Tween(begin: 0.0, end: 1.0),
              duration: Duration(milliseconds: 600 + (index * 100)),
              curve: Curves.elasticOut,
              builder: (context, scale, child) {
                return Transform.scale(
                  scale: scale,
                  child: _buildMorphingActionCard(
                    quickActions[index],
                    index,
                    textTheme,
                    isMobile,
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }


  Widget _buildMorphingActionCard(
      ModernQuickAction action,
      int index,
      TextTheme textTheme,
      bool isMobile,
      ) {
    return AnimatedBuilder(
      animation: _morphAnimation,
      builder: (context, child) {
        return Transform.rotate(
          angle: math.sin(_morphAnimation.value * 2 * math.pi + index) * 0.02,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: action.gradientColors,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: action.gradientColors.first.withOpacity(0.3),
                  blurRadius: 15,
                  spreadRadius: 0,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  _rippleController.reset();
                  _rippleController.forward();
                },
                child: Padding(
                  padding: EdgeInsets.all(isMobile ? 10 : 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedBuilder(
                        animation: _floatingAnimation,
                        builder: (context, child) {
                          return Transform.translate(
                            offset: Offset(
                              0,
                              math.sin(_floatingAnimation.value * 2 * math.pi + index) * 3,
                            ),
                            child: Icon(
                              action.icon,
                              color: Colors.white,
                              size: isMobile ? 28 : 32,
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      Text(
                        action.title,
                        style: textTheme.titleSmall?.copyWith(
                          fontSize: isMobile ? 10 : 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }


  Widget _buildNeuomorphicAnnouncements(ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: [Colors.white, Colors.white.withOpacity(0.8)],
              ).createShader(bounds),
              child: Text(
                '📢 Announcements',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF667eea), Color(0xFF764ba2)],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'View All',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        ...List.generate(3, (index) {
          return TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: Duration(milliseconds: 800 + (index * 200)),
            curve: Curves.easeOutBack,
            builder: (context, slide, child) {
              return Transform.translate(
                offset: Offset((1 - slide) * 100, 0),
                child: Opacity(
                  opacity: slide,
                  child: _buildGlassmorphicAnnouncementCard(index),
                ),
              );
            },
          );
        }),
      ],
    );
  }

  Widget _buildGlassmorphicAnnouncementCard(int index) {
    final announcements = [
      {'title': 'Parent-Teacher Meet', 'desc': 'Join us this Friday at 3 PM', 'icon': Icons.people},
      {'title': 'Science Fair 2024', 'desc': 'Registration closes next week', 'icon': Icons.science},
      {'title': 'Holiday Notice', 'desc': 'School closed on Monday', 'icon': Icons.celebration},
    ];

    return AnimatedBuilder(
      animation: _floatingAnimation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, math.sin(_floatingAnimation.value * 2 * math.pi + index) * 1),
          child: Container(
            margin: EdgeInsets.only(bottom: 15),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.1),
                  Colors.white.withOpacity(0.05),
                ],
              ),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.white.withOpacity(0.2),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                AnimatedBuilder(
                  animation: _pulseAnimation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _pulseAnimation.value * 0.1 + 0.9,
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF667eea), Color(0xFF764ba2)],
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(
                          announcements[index]['icon'] as IconData,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        announcements[index]['title'] as String,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        announcements[index]['desc'] as String,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white.withOpacity(0.5),
                  size: 16,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildHolographicEvents(ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: [Colors.white, Colors.white.withOpacity(0.8)],
              ).createShader(bounds),
              child: Text(
                '🎉 Upcoming Events',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            AnimatedBuilder(
              animation: _morphAnimation,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _morphAnimation.value * 0.1,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFFf093fb), Color(0xFFf5576c)],
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Icon(Icons.calendar_month, color: Colors.white, size: 20),
                  ),
                );
              },
            ),
          ],
        ),
        const SizedBox(height: 20),
        Container(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
              return TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.0, end: 1.0),
                duration: Duration(milliseconds: 1000 + (index * 150)),
                curve: Curves.easeOutBack,
                builder: (context, scale, child) {
                  return Transform.scale(
                    scale: scale,
                    child: _buildHolographicEventCard(index),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildHolographicEventCard(int index) {
    final events = [
      {'title': 'Science Fair', 'date': 'Dec 15', 'time': '10:00 AM', 'color': [Color(0xFF4facfe), Color(0xFF00f2fe)]},
      {'title': 'Sports Day', 'date': 'Dec 20', 'time': '9:00 AM', 'color': [Color(0xFFf093fb), Color(0xFFf5576c)]},
      {'title': 'Annual Day', 'date': 'Dec 25', 'time': '6:00 PM', 'color': [Color(0xFF43e97b), Color(0xFF38f9d7)]},
      {'title': 'Field Trip', 'date': 'Dec 30', 'time': '8:00 AM', 'color': [Color(0xFFfa709a), Color(0xFFfee140)]},
    ];

    return AnimatedBuilder(
      animation: _waveAnimation,
      builder: (context, child) {
        return Container(
          width: 160,
          margin: EdgeInsets.only(right: 15),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: events[index]['color'] as List<Color>,
            ),
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: (events[index]['color'] as List<Color>).first.withOpacity(0.3),
                blurRadius: 20,
                spreadRadius: 0,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Stack(
            children: [
              CustomPaint(
                size: Size(160, 180),
                painter: EventCardPainter(_waveAnimation.value + index * 0.25),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedBuilder(
                      animation: _floatingAnimation,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(0, math.sin(_floatingAnimation.value * 2 * math.pi + index) * 2),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              events[index]['date'] as String,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    const Spacer(),
                    Text(
                      events[index]['title'] as String,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.access_time, color: Colors.white, size: 16),
                        const SizedBox(width: 5),
                        Text(
                          events[index]['time'] as String,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFloatingParticles(Size size) {
    return AnimatedBuilder(
      animation: _particleAnimation,
      builder: (context, child) {
        return IgnorePointer(
          child: Container(
            width: size.width,
            height: size.height,
            child: CustomPaint(
              painter: FloatingParticlesPainter(_particleAnimation.value),
            ),
          ),
        );
      },
    );
  }

  Widget _buildMagicFAB(ColorScheme colorScheme) {
    return AnimatedBuilder(
      animation: _pulseAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _pulseAnimation.value * 0.1 + 0.9,
          child: Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF667eea), Color(0xFF764ba2)],
              ),
              borderRadius: BorderRadius.circular(32.5),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF667eea).withOpacity(0.4),
                  blurRadius: 20,
                  spreadRadius: 0,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(32.5),
                onTap: () {},
                child: AnimatedBuilder(
                  animation: _morphAnimation,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: _morphAnimation.value * 2 * math.pi,
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 30,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildGlassmorphicNavBar(ColorScheme colorScheme) {
    return Container(
      height: 70.h,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colorScheme.primary.withOpacity(0.1),
            colorScheme.primary.withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: colorScheme.primary.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(Icons.home, 0,colorScheme),
          _buildNavItem(Icons.book, 1,colorScheme),
          _buildNavItem(Icons.assignment, 2,colorScheme),
          _buildNavItem(Icons.person, 3,colorScheme),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index,colorSchema) {
    final isSelected = _selectedIndex == index;

    return AnimatedBuilder(
      animation: _floatingAnimation,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedIndex = index;
            });
          },
          child: Transform.translate(
            offset: Offset(0, isSelected ? math.sin(_floatingAnimation.value * 2 * math.pi) * 2 : 0),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              padding: EdgeInsets.all(isSelected ? 15 : 12),
              decoration: BoxDecoration(
                gradient: isSelected
                    ? LinearGradient(colors: [colorSchema.primary, colorSchema.primary])
                    : null,
                color: isSelected ? null : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                boxShadow: isSelected
                    ? [
                  BoxShadow(
                    color: colorSchema.primary.withOpacity(0.3),
                    blurRadius: 15,
                    spreadRadius: 0,
                  ),
                ]
                    : null,
              ),
              child: Icon(
                icon,
                color: isSelected ? Colors.white : Colors.white.withOpacity(0.6),
                size: isSelected ? 28 : 24,
              ),
            ),
          ),
        );
      },
    );
  }
}

// Custom Painters for Enhanced Visual Effects








// Data Models
