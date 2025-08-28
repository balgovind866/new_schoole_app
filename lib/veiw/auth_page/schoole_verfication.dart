import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schoole_app/veiw/auth_page/login_screan.dart';
import 'package:schoole_app/veiw/auth_page/schoole_verfication/schoole_code_cubit.dart';

class SchoolVerificationScreen extends StatefulWidget {
  const SchoolVerificationScreen({super.key});

  @override
  State<SchoolVerificationScreen> createState() => _SchoolVerificationScreenState();
}

class _SchoolVerificationScreenState extends State<SchoolVerificationScreen>
    with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _schoolCodeController = TextEditingController();
  final _searchController = TextEditingController();

  bool _isLoading = false;
  bool _isSearching = false;
  bool _showSearchResults = false;
  String _verificationMethod = 'code'; // 'code' or 'search'

  late AnimationController _animationController;
  late AnimationController _shakeController;
  late AnimationController _search2Controller;

  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _shakeAnimation;
  late Animation<double> _searchAnimation;

  // Mock school data
  final List<SchoolData> _mockSchools = [
    SchoolData(
      id: '1',
      name: 'Delhi Public School',
      location: 'New Delhi, India',
      code: 'DPS001',
      type: 'CBSE',
      logo: Icons.school,
    ),
    SchoolData(
      id: '2',
      name: 'Kendriya Vidyalaya',
      location: 'Mumbai, India',
      code: 'KV002',
      type: 'CBSE',
      logo: Icons.account_balance,
    ),
    SchoolData(
      id: '3',
      name: 'DAV Public School',
      location: 'Bangalore, India',
      code: 'DAV003',
      type: 'CBSE',
      logo: Icons.domain,
    ),
    SchoolData(
      id: '4',
      name: 'Ryan International',
      location: 'Chennai, India',
      code: 'RIS004',
      type: 'CBSE',
      logo: Icons.business,
    ),
  ];

  List<SchoolData> _searchResults = [];

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _startAnimations();
  }

  void _initializeAnimations() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _shakeController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _search2Controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.0, 0.6, curve: Curves.easeIn),
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.3, 1.0, curve: Curves.easeOutBack),
    ));

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.0, 0.8, curve: Curves.elasticOut),
    ));

    _shakeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _shakeController,
      curve: Curves.elasticIn,
    ));

    _searchAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _search2Controller,
      curve: Curves.easeInOut,
    ));
  }

  void _startAnimations() {
    _animationController.forward();
  }

  void _shakeForm() {
    _shakeController.reset();
    _shakeController.forward();
  }

  void _searchSchools(String query) {
    if (query.isEmpty) {
      setState(() {
        _searchResults = [];
        _showSearchResults = false;
      });
      return;
    }

    setState(() {
      _isSearching = true;
    });

    // Simulate API call delay
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _searchResults = _mockSchools
            .where((school) =>
        school.name.toLowerCase().contains(query.toLowerCase()) ||
            school.location.toLowerCase().contains(query.toLowerCase()) ||
            school.code.toLowerCase().contains(query.toLowerCase()))
            .toList();
        _showSearchResults = true;
        _isSearching = false;
      });
      _search2Controller.forward();
    });
  }

  Future<void> _verifySchoolCode() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      // Mock verification
      final schoolCode = _schoolCodeController.text.toUpperCase();
      final school = _mockSchools.firstWhere(
            (s) => s.code == schoolCode,
        orElse: () => SchoolData(id: '', name: '', location: '', code: '', type: '', logo: Icons.error),
      );

      if (school.id.isNotEmpty) {
        _navigateToLogin('');
      } else {
        _shakeForm();
        _showErrorSnackBar('Invalid school code. Please try again.');
      }

      setState(() {
        _isLoading = false;
      });
    } else {
      _shakeForm();
    }
  }

  void _selectSchool(SchoolData school) {
   // _navigateToLogin(school);
  }

  void _navigateToLogin(String school) {
    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Connected to ${school}'),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    // Navigate to login screen with school data
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => LoginScreen()
      ));
      print('Navigate to login with school: ${school}');
    });
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _shakeController.dispose();
    _searchController.dispose();
    _schoolCodeController.dispose();
    _searchController.dispose();
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
              colorScheme.primary.withOpacity(0.1),
              colorScheme.secondary.withOpacity(0.05),
              colorScheme.surface,
            ],
          ),
        ),
        child: SafeArea(
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: size.height - MediaQuery.of(context).padding.top,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 40),

                        // Header Section
                        FadeTransition(
                          opacity: _fadeAnimation,
                          child: ScaleTransition(
                            scale: _scaleAnimation,
                            child: _buildHeader(colorScheme, textTheme),
                          ),
                        ),

                        const SizedBox(height: 40),

                        // Method Selection Tabs
                        FadeTransition(
                          opacity: _fadeAnimation,
                          child: _buildMethodTabs(colorScheme, textTheme),
                        ),

                        const SizedBox(height: 30),

                        // Verification Form
                        SlideTransition(
                          position: _slideAnimation,
                          child: FadeTransition(
                            opacity: _fadeAnimation,
                            child: AnimatedBuilder(
                              animation: _shakeAnimation,
                              builder: (context, child) {
                                return Transform.translate(
                                  offset: Offset(_shakeAnimation.value * 10 *
                                      ((_shakeAnimation.value * 10).round() % 2 == 0 ? 1 : -1), 0),
                                  child: _buildVerificationContent(colorScheme, textTheme),
                                );
                              },
                            ),
                          ),
                        ),

                        const SizedBox(height: 40),

                        // Footer
                        FadeTransition(
                          opacity: _fadeAnimation,
                          child: _buildFooter(colorScheme, textTheme),
                        ),

                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(ColorScheme colorScheme, TextTheme textTheme) {
    return Column(
      children: [
        // App Logo
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                colorScheme.primary,
                colorScheme.secondary,
              ],
            ),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: colorScheme.primary.withOpacity(0.3),
                blurRadius: 20,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Icon(
            Icons.domain_verification_rounded,
            size: 50,
            color: colorScheme.onPrimary,
          ),
        ),

        const SizedBox(height: 24),

        // Title
        Text(
          'Find Your School',
          style: textTheme.headlineMedium?.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 8),

        Text(
          'Enter your school code or search for your institution',
          textAlign: TextAlign.center,
          style: textTheme.bodyLarge?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _buildMethodTabs(ColorScheme colorScheme, TextTheme textTheme) {
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surfaceVariant.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _verificationMethod = 'code';
                  _showSearchResults = false;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: _verificationMethod == 'code'
                      ? colorScheme.primary
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.qr_code_rounded,
                      color: _verificationMethod == 'code'
                          ? colorScheme.onPrimary
                          : colorScheme.onSurfaceVariant,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'School Code',
                      style: textTheme.labelLarge?.copyWith(
                        color: _verificationMethod == 'code'
                            ? colorScheme.onPrimary
                            : colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _verificationMethod = 'search';
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: _verificationMethod == 'search'
                      ? colorScheme.primary
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.search_rounded,
                      color: _verificationMethod == 'search'
                          ? colorScheme.onPrimary
                          : colorScheme.onSurfaceVariant,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Search',
                      style: textTheme.labelLarge?.copyWith(
                        color: _verificationMethod == 'search'
                            ? colorScheme.onPrimary
                            : colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w600,
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

  Widget _buildVerificationContent(ColorScheme colorScheme, TextTheme textTheme) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: _verificationMethod == 'code'
          ? _buildCodeVerification(colorScheme, textTheme)
          : _buildSchoolSearch(colorScheme, textTheme),
    );
  }

  Widget _buildCodeVerification(ColorScheme colorScheme, TextTheme textTheme) {
    return Container(
      key: const ValueKey('code'),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withOpacity(0.1),
            blurRadius: 20,
            spreadRadius: 0,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Info Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer.withOpacity(0.3),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: colorScheme.primary.withOpacity(0.2)),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    color: colorScheme.primary,
                    size: 20,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Enter the unique school code provided by your institution',
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // School Code Field
            TextFormField(
              controller: _schoolCodeController,
              textCapitalization: TextCapitalization.characters,
              decoration: InputDecoration(
                labelText: 'School Code',
                hintText: 'e.g., DPS001, KV002',
                prefixIcon: Icon(Icons.qr_code_rounded, color: colorScheme.primary),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: colorScheme.outline.withOpacity(0.3)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: colorScheme.outline.withOpacity(0.3)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: colorScheme.primary, width: 2),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your school code';
                }
                if (value.length < 3) {
                  return 'School code must be at least 3 characters';
                }
                return null;
              },
            ),

            const SizedBox(height: 24),

            // Verify Button
            BlocConsumer<SchooleCodeCubit, SchooleCodeState>(
  listener: (context, state) {
    // TODO: implement listener

    if (state is SchooleCodeError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.message)),
      );
    }
    if (state is SchooleCodeSuccess) {
      print("School Name: ${state.verification.data?.name}");
      _navigateToLogin("${state.verification.data?.name}");
    }
  },
  builder: (context, state) {
    return ElevatedButton(
              onPressed: (){
                context.read<SchooleCodeCubit>().verifySchoolCode(_schoolCodeController.text.toString());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.primary,
                foregroundColor: colorScheme.onPrimary,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 3,
                shadowColor: colorScheme.primary.withOpacity(0.3),
              ),
              child: state is SchooleCodeLoading
                  ? SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(colorScheme.onPrimary),
                ),
              )
                  : Text(
                'Verify School',
                style: textTheme.labelLarge?.copyWith(
                  color: colorScheme.onPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            );
  },
),
          ],
        ),
      ),
    );
  }

  Widget _buildSchoolSearch(ColorScheme colorScheme, TextTheme textTheme) {
    return Container(
      key: const ValueKey('search'),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withOpacity(0.1),
            blurRadius: 20,
            spreadRadius: 0,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Search Field
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              labelText: 'Search Schools',
              hintText: 'Enter school name or location',
              prefixIcon: Icon(Icons.search_rounded, color: colorScheme.primary),
              suffixIcon: _isSearching
                  ? SizedBox(
                width: 20,
                height: 20,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(colorScheme.primary),
                  ),
                ),
              )
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: colorScheme.outline.withOpacity(0.3)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: colorScheme.outline.withOpacity(0.3)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: colorScheme.primary, width: 2),
              ),
            ),
            onChanged: _searchSchools,
          ),

          // Search Results
          if (_showSearchResults) ...[
            const SizedBox(height: 20),
            AnimatedBuilder(
              animation: _searchAnimation,
              builder: (context, child) {
                return FadeTransition(
                  opacity: _searchAnimation,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0, 0.2),
                      end: Offset.zero,
                    ).animate(_searchAnimation),
                    child: _buildSearchResults(colorScheme, textTheme),
                  ),
                );
              },
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSearchResults(ColorScheme colorScheme, TextTheme textTheme) {
    if (_searchResults.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Icon(
              Icons.search_off_rounded,
              size: 48,
              color: colorScheme.onSurfaceVariant.withOpacity(0.5),
            ),
            const SizedBox(height: 16),
            Text(
              'No schools found',
              style: textTheme.titleMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            Text(
              'Try a different search term',
              style: textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant.withOpacity(0.7),
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Search Results (${_searchResults.length})',
          style: textTheme.titleSmall?.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _searchResults.length,
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          itemBuilder: (context, index) {
            final school = _searchResults[index];
            return _buildSchoolCard(school, colorScheme, textTheme);
          },
        ),
      ],
    );
  }

  Widget _buildSchoolCard(SchoolData school, ColorScheme colorScheme, TextTheme textTheme) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: colorScheme.surface,
      child: InkWell(
        onTap: () => _selectSchool(school),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // School Logo
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  school.logo,
                  color: colorScheme.primary,
                  size: 24,
                ),
              ),

              const SizedBox(width: 16),

              // School Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      school.name,
                      style: textTheme.titleMedium?.copyWith(
                        color: colorScheme.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      school.location,
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: colorScheme.secondary.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            school.type,
                            style: textTheme.labelSmall?.copyWith(
                              color: colorScheme.secondary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          school.code,
                          style: textTheme.labelSmall?.copyWith(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Arrow Icon
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: colorScheme.onSurfaceVariant.withOpacity(0.5),
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFooter(ColorScheme colorScheme, TextTheme textTheme) {
    return Column(
      children: [
        // Sample codes
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: colorScheme.surfaceVariant.withOpacity(0.3),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: colorScheme.outline.withOpacity(0.2)),
          ),
          child: Column(
            children: [
              Text(
                'Sample School Codes',
                style: textTheme.labelMedium?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'DPS001 • KV002 • DAV003 • RIS004',
                textAlign: TextAlign.center,
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        // Help Section
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              onPressed: () {
                // Handle help
              },
              icon: Icon(Icons.help_outline, color: colorScheme.primary, size: 18),
              label: Text(
                'Need Help?',
                style: textTheme.labelMedium?.copyWith(
                  color: colorScheme.primary,
                ),
              ),
            ),
            const SizedBox(width: 16),
            TextButton.icon(
              onPressed: () {
                // Handle contact admin
              },
              icon: Icon(Icons.admin_panel_settings, color: colorScheme.primary, size: 18),
              label: Text(
                'Contact Admin',
                style: textTheme.labelMedium?.copyWith(
                  color: colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class SchoolData {
  final String id;
  final String name;
  final String location;
  final String code;
  final String type;
  final IconData logo;

  SchoolData({
    required this.id,
    required this.name,
    required this.location,
    required this.code,
    required this.type,
    required this.logo,
  });
}