

// School Management Feature Model
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SchoolFeature {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final String route;

  SchoolFeature({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.route,
  });
}

// Animated Home Page
class SchoolHomePage extends StatefulWidget {
  @override
  _SchoolHomePageState createState() => _SchoolHomePageState();
}

class _SchoolHomePageState extends State<SchoolHomePage>
    with TickerProviderStateMixin {
  late AnimationController _headerController;
  late AnimationController _cardController;
  late Animation<double> _headerFadeAnimation;
  late Animation<Offset> _headerSlideAnimation;
  late Animation<double> _cardScaleAnimation;

  final List<SchoolFeature> features = [
    SchoolFeature(
      title: 'Students',
      subtitle: 'Manage student records',
      icon: Icons.school,
      color: const Color(0xff006876),
      route: '/students',
    ),
    SchoolFeature(
      title: 'Teachers',
      subtitle: 'Faculty management',
      icon: Icons.person_outline,
      color: const Color(0xff4a6268),
      route: '/teachers',
    ),
    SchoolFeature(
      title: 'Classes',
      subtitle: 'Class schedules & rooms',
      icon: Icons.class_,
      color: const Color(0xff545d7e),
      route: '/classes',
    ),
    SchoolFeature(
      title: 'Attendance',
      subtitle: 'Track daily attendance',
      icon: Icons.check_circle_outline,
      color: const Color(0xff006876),
      route: '/attendance',
    ),
    SchoolFeature(
      title: 'Grades',
      subtitle: 'Academic performance',
      icon: Icons.grade,
      color: const Color(0xff4a6268),
      route: '/grades',
    ),
    SchoolFeature(
      title: 'Events',
      subtitle: 'School calendar & events',
      icon: Icons.event,
      color: const Color(0xff545d7e),
      route: '/events',
    ),
    SchoolFeature(
      title: 'Library',
      subtitle: 'Book management',
      icon: Icons.library_books,
      color: const Color(0xff006876),
      route: '/library',
    ),
    SchoolFeature(
      title: 'Reports',
      subtitle: 'Analytics & insights',
      icon: Icons.analytics,
      color: const Color(0xff4a6268),
      route: '/reports',
    ),
  ];

  @override
  void initState() {
    super.initState();

    _headerController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _cardController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _headerFadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _headerController,
      curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
    ));

    _headerSlideAnimation = Tween<Offset>(
      begin: const Offset(0, -0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _headerController,
      curve: const Interval(0.0, 0.8, curve: Curves.elasticOut),
    ));

    _cardScaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _cardController,
      curve: Curves.elasticOut,
    ));

    // Start animations
    _headerController.forward();
    Future.delayed(const Duration(milliseconds: 400), () {
      _cardController.forward();
    });
  }

  @override
  void dispose() {
    _headerController.dispose();
    _cardController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Animated Header
            SliverToBoxAdapter(
              child: AnimatedBuilder(
                animation: _headerController,
                builder: (context, child) {
                  return FadeTransition(
                    opacity: _headerFadeAnimation,
                    child: SlideTransition(
                      position: _headerSlideAnimation,
                      child: _buildHeader(theme, colorScheme),
                    ),
                  );
                },
              ),
            ),

            // Quick Stats Section
            SliverToBoxAdapter(
              child: AnimatedBuilder(
                animation: _cardController,
                builder: (context, child) {
                  return ScaleTransition(
                    scale: _cardScaleAnimation,
                    child: _buildQuickStats(theme, colorScheme),
                  );
                },
              ),
            ),

            // Features Grid
            SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.1,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    return AnimatedBuilder(
                      animation: _cardController,
                      builder: (context, child) {
                        final delay = index * 0.1;
                        final animation = Tween<double>(
                          begin: 0.0,
                          end: 1.0,
                        ).animate(
                          CurvedAnimation(
                            parent: _cardController,
                            curve: Interval(
                              delay,
                              0.8 + delay,
                              curve: Curves.elasticOut,
                            ),
                          ),
                        );

                        return ScaleTransition(
                          scale: animation,
                          child: _buildFeatureCard(features[index], theme),
                        );
                      },
                    );
                  },
                  childCount: features.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(ThemeData theme, ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colorScheme.primary,
            colorScheme.primary.withOpacity(0.8),
          ],
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: colorScheme.primary.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.school,
                color: colorScheme.onPrimary,
                size: 32,
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: colorScheme.onPrimary.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.notifications_outlined,
                  color: colorScheme.onPrimary,
                  size: 24,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'Welcome Back!',
            style: theme.textTheme.headlineMedium?.copyWith(
              color: colorScheme.onPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Greenwood International School',
            style: theme.textTheme.titleMedium?.copyWith(
              color: colorScheme.onPrimary.withOpacity(0.9),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Dashboard Overview',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onPrimary.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickStats(ThemeData theme, ColorScheme colorScheme) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Today\'s Overview',
            style: theme.textTheme.titleLarge?.copyWith(
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildStatItem(
                  '1,247',
                  'Total Students',
                  Icons.group,
                  colorScheme.primary,
                  theme,
                ),
              ),
              Expanded(
                child: _buildStatItem(
                  '89',
                  'Teachers',
                  Icons.person,
                  colorScheme.secondary,
                  theme,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildStatItem(
                  '94.2%',
                  'Attendance',
                  Icons.check_circle,
                  colorScheme.tertiary,
                  theme,
                ),
              ),
              Expanded(
                child: _buildStatItem(
                  '12',
                  'Events Today',
                  Icons.event,
                  colorScheme.primary,
                  theme,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(
      String value,
      String label,
      IconData icon,
      Color color,
      ThemeData theme,
      ) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: color,
            size: 20,
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: theme.textTheme.titleMedium?.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            label,
            style: theme.textTheme.bodySmall?.copyWith(
              color: color.withOpacity(0.8),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(SchoolFeature feature, ThemeData theme) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: theme.colorScheme.outline.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: InkWell(
        onTap: () {
          HapticFeedback.lightImpact();
          // Navigation logic here
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Opening ${feature.title}...'),
              behavior: SnackBarBehavior.floating,
            ),
          );
        },
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                feature.color.withOpacity(0.05),
                feature.color.withOpacity(0.02),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: feature.color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  feature.icon,
                  color: feature.color,
                  size: 32,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                feature.title,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                feature.subtitle,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Main function to run the app