import 'package:flutter/material.dart';
import 'package:schoole_app/veiw/auth_page/login_screan.dart';
import 'package:schoole_app/veiw/home_page/home_page.dart';

import '../auth_page/schoole_verfication.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  PageController _pageController = PageController();
  int currentIndex = 0;

  late AnimationController _animationController;
  late AnimationController _buttonController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;

  final List<OnboardingData> onboardingPages = [
    OnboardingData(
      icon: Icons.school_rounded,
      title: "Welcome to EduManage",
      description: "Your complete school management solution. Streamline administrative tasks, track student progress, and enhance communication between teachers, students, and parents.",
      color: const Color(0xFF4CAF50),
    ),
    OnboardingData(
      icon: Icons.people_rounded,
      title: "Manage Students & Staff",
      description: "Easily manage student enrollments, staff records, attendance tracking, and academic performance. Keep all important information organized in one place.",
      color: const Color(0xFF2196F3),
    ),
    OnboardingData(
      icon: Icons.analytics_rounded,
      title: "Track Progress & Analytics",
      description: "Monitor academic progress with detailed analytics, generate comprehensive reports, and make data-driven decisions for better educational outcomes.",
      color: const Color(0xFFFF9800),
    ),
    OnboardingData(
      icon: Icons.mobile_friendly_rounded,
      title: "Stay Connected",
      description: "Real-time notifications, seamless communication, and mobile-friendly access ensure you're always connected to your school community.",
      color: const Color(0xFF9C27B0),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
  }

  void _initializeAnimations() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _buttonController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutBack,
    ));

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.elasticOut,
    ));

    _animationController.forward();
  }

  void _nextPage() {
    if (currentIndex < onboardingPages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _navigateToMain();
    }
  }

  void _skipOnboarding() {
    _navigateToMain();
  }

  void _navigateToMain() {
    // Navigate to your main screen here
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SchoolVerificationScreen()));
   //  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SchoolHomePage()));
    print("Navigate to main screen");
  }

  @override
  void dispose() {
    _animationController.dispose();
    _buttonController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              onboardingPages[currentIndex].color.withOpacity(0.1),
              onboardingPages[currentIndex].color.withOpacity(0.05),
              colorScheme.surface,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Top navigation
              _buildTopNavigation(colorScheme, textTheme),

              // Page content
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                    _animationController.reset();
                    _animationController.forward();
                  },
                  itemCount: onboardingPages.length,
                  itemBuilder: (context, index) {
                    return AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) {
                        return FadeTransition(
                          opacity: _fadeAnimation,
                          child: SlideTransition(
                            position: _slideAnimation,
                            child: _buildPageContent(
                              context,
                              onboardingPages[index],
                              colorScheme,
                              textTheme,
                              size,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),

              // Bottom navigation
              _buildBottomNavigation(colorScheme, textTheme),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopNavigation(ColorScheme colorScheme, TextTheme textTheme) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: onboardingPages[currentIndex].color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.school_rounded,
              color: onboardingPages[currentIndex].color,
              size: 24,
            ),
          ),

          // Skip button
          TextButton(
            onPressed: _skipOnboarding,
            style: TextButton.styleFrom(
              foregroundColor: colorScheme.onSurfaceVariant,
            ),
            child: Text(
              'Skip',
              style: textTheme.labelLarge?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageContent(
      BuildContext context,
      OnboardingData data,
      ColorScheme colorScheme,
      TextTheme textTheme,
      Size size,
      ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Animated icon
          ScaleTransition(
            scale: _scaleAnimation,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: data.color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                    color: data.color.withOpacity(0.2),
                    blurRadius: 30,
                    spreadRadius: 10,
                  ),
                ],
              ),
              child: Icon(
                data.icon,
                size: 60,
                color: data.color,
              ),
            ),
          ),

          const SizedBox(height: 50),

          // Title
          Text(
            data.title,
            textAlign: TextAlign.center,
            style: textTheme.headlineMedium?.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          // Description
          Text(
            data.description,
            textAlign: TextAlign.center,
            style: textTheme.bodyLarge?.copyWith(
              color: colorScheme.onSurfaceVariant,
              height: 1.6,
            ),
          ),

          const SizedBox(height: 40),

          // Decorative elements
          _buildDecorativeElements(data.color),
        ],
      ),
    );
  }

  Widget _buildDecorativeElements(Color color) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(3, (index) {
          return AnimatedContainer(
            duration: Duration(milliseconds: 500 + (index * 100)),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: 8 + (index * 2),
            height: 8 + (index * 2),
            decoration: BoxDecoration(
              color: color.withOpacity(0.3 + (index * 0.2)),
              shape: BoxShape.circle,
            ),
          );
        }),
      ),
    );
  }

  Widget _buildBottomNavigation(ColorScheme colorScheme, TextTheme textTheme) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          // Page indicators
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              onboardingPages.length,
                  (index) => _buildPageIndicator(index, colorScheme),
            ),
          ),

          const SizedBox(height: 30),

          // Navigation buttons
          Row(
            children: [
              // Previous button
              if (currentIndex > 0)
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      side: BorderSide(
                        color: onboardingPages[currentIndex].color,
                      ),
                    ),
                    child: Text(
                      'Previous',
                      style: textTheme.labelLarge?.copyWith(
                        color: onboardingPages[currentIndex].color,
                      ),
                    ),
                  ),
                )
              else
                const Expanded(child: SizedBox()),

              const SizedBox(width: 16),

              // Next/Get Started button
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  onPressed: _nextPage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: onboardingPages[currentIndex].color,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    elevation: 3,
                    shadowColor: onboardingPages[currentIndex].color.withOpacity(0.3),
                  ),
                  child: Text(
                    currentIndex == onboardingPages.length - 1
                        ? 'Get Started'
                        : 'Next',
                    style: textTheme.labelLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPageIndicator(int index, ColorScheme colorScheme) {
    final isActive = index == currentIndex;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: isActive ? 24 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: isActive
            ? onboardingPages[currentIndex].color
            : onboardingPages[currentIndex].color.withOpacity(0.3),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

class OnboardingData {
  final IconData icon;
  final String title;
  final String description;
  final Color color;

  OnboardingData({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
  });
}