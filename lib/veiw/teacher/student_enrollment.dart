import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math' as math;

class StudentRegistrationPage extends StatefulWidget {
  const StudentRegistrationPage({super.key});

  @override
  State<StudentRegistrationPage> createState() => _StudentRegistrationPageState();
}

class _StudentRegistrationPageState extends State<StudentRegistrationPage>
    with TickerProviderStateMixin {
  late AnimationController _primaryAnimationController;
  late AnimationController _floatingController;
  late AnimationController _particleController;
  late AnimationController _pulseController;
  late AnimationController _morphController;

  late Animation<double> _headerAnimation;
  late Animation<double> _cardStaggerAnimation;
  late Animation<double> _floatingAnimation;
  late Animation<double> _particleAnimation;
  late Animation<double> _pulseAnimation;
  late Animation<double> _morphAnimation;

  // Form Controllers
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _studentNameController = TextEditingController();
  final TextEditingController _admissionNoController = TextEditingController();
  final TextEditingController _formNoController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _smsContactController = TextEditingController();
  final TextEditingController _aadhaarController = TextEditingController();
  final TextEditingController _fatherNameController = TextEditingController();
  final TextEditingController _motherNameController = TextEditingController();
  final TextEditingController _motherContactController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _transportController = TextEditingController();

  // Dropdown values
  String? selectedClass;
  String? selectedSession;
  String? selectedCategory;
  String? selectedGender;
  String? selectedHouse;
  String? selectedBloodGroup;
  String? selectedFamily;

  // Dropdown options
  final List<String> classes = ['Class 1', 'Class 2', 'Class 3', 'Class 4', 'Class 5', 'Class 6', 'Class 7', 'Class 8', 'Class 9', 'Class 10'];
  final List<String> sessions = ['2024-25', '2025-26', '2026-27'];
  final List<String> categories = ['General', 'OBC', 'SC', 'ST', 'EWS'];
  final List<String> genders = ['Male', 'Female', 'Other'];
  final List<String> houses = ['Red House', 'Blue House', 'Green House', 'Yellow House'];
  final List<String> bloodGroups = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];
  final List<String> families = ['Nuclear', 'Joint', 'Extended', 'Single Parent'];

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _startAnimations();
  }

  void _initializeAnimations() {
    _primaryAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _floatingController = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );

    _particleController = AnimationController(
      duration: const Duration(milliseconds: 4000),
      vsync: this,
    );

    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _morphController = AnimationController(
      duration: const Duration(milliseconds: 2500),
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

    _particleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _particleController, curve: Curves.linear),
    );

    _pulseAnimation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _morphAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _morphController, curve: Curves.easeInOut),
    );
  }

  void _startAnimations() {
    _primaryAnimationController.forward();
    _floatingController.repeat(reverse: true);
    _particleController.repeat();
    _pulseController.repeat(reverse: true);
    _morphController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _primaryAnimationController.dispose();
    _floatingController.dispose();
    _particleController.dispose();
    _pulseController.dispose();
    _morphController.dispose();

    // Dispose controllers
    _studentNameController.dispose();
    _admissionNoController.dispose();
    _formNoController.dispose();
    _dateOfBirthController.dispose();
    _smsContactController.dispose();
    _aadhaarController.dispose();
    _fatherNameController.dispose();
    _motherNameController.dispose();
    _motherContactController.dispose();
    _addressController.dispose();
    _countryController.dispose();
    _stateController.dispose();
    _cityController.dispose();
    _transportController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colorScheme.primary.withOpacity(.3),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Animated background
          _buildAnimatedBackground(size, colorScheme),

          // Main content
          CustomScrollView(
            slivers: [
              _buildGlassmorphicAppBar(colorScheme, size, textTheme),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.h),
                        _buildRegistrationHeader(textTheme),
                        SizedBox(height: 30.h),
                        _buildFormSection("Basic Information", [
                          _buildRow([
                            _buildGlassmorphicDropdown(
                              "Class/Course",
                              selectedClass,
                              classes,
                                  (value) => setState(() => selectedClass = value),
                              Icons.school,
                            ),
                            _buildGlassmorphicTextField(
                              "Admission No.",
                              _admissionNoController,
                              Icons.badge,
                            ),
                          ]),
                          _buildRow([
                            _buildGlassmorphicTextField(
                              "Form/SR No.",
                              _formNoController,
                              Icons.description,
                            ),
                            _buildGlassmorphicDropdown(
                              "Session",
                              selectedSession,
                              sessions,
                                  (value) => setState(() => selectedSession = value),
                              Icons.calendar_today,
                            ),
                          ]),
                          _buildRow([
                            _buildGlassmorphicDropdown(
                              "Adm. Category",
                              selectedCategory,
                              categories,
                                  (value) => setState(() => selectedCategory = value),
                              Icons.category,
                            ),
                            _buildGlassmorphicTextField(
                              "Student Name",
                              _studentNameController,
                              Icons.person,
                              isFullWidth: true,
                            ),
                          ]),
                        ]),

                        SizedBox(height: 25.h),
                        _buildFormSection("Personal Details", [
                          _buildRow([
                            _buildGlassmorphicDateField(
                              "Date of Adm.",
                              "14-01-2024",
                              Icons.event,
                            ),
                            _buildGlassmorphicDateField(
                              "Date of Birth",
                              "Enter DOB",
                              Icons.cake,
                              controller: _dateOfBirthController,
                            ),
                          ]),
                          _buildRow([
                            _buildGlassmorphicDropdown(
                              "Gender",
                              selectedGender,
                              genders,
                                  (value) => setState(() => selectedGender = value),
                              Icons.person_outline,
                            ),
                            _buildGlassmorphicDropdown(
                              "Category",
                              selectedCategory,
                              categories,
                                  (value) => setState(() => selectedCategory = value),
                              Icons.group,
                            ),
                          ]),
                          _buildRow([
                            _buildGlassmorphicDropdown(
                              "House",
                              selectedHouse,
                              houses,
                                  (value) => setState(() => selectedHouse = value),
                              Icons.home,
                            ),
                            _buildGlassmorphicDropdown(
                              "Blood Group",
                              selectedBloodGroup,
                              bloodGroups,
                                  (value) => setState(() => selectedBloodGroup = value),
                              Icons.bloodtype,
                            ),
                          ]),
                        ]),

                        SizedBox(height: 25.h),
                        _buildFormSection("Contact Information", [
                          _buildGlassmorphicTextField(
                            "SMS Contact No.",
                            _smsContactController,
                            Icons.phone,
                            isFullWidth: true,
                          ),
                          _buildGlassmorphicTextField(
                            "Student Aadhar No.",
                            _aadhaarController,
                            Icons.credit_card,
                            isFullWidth: true,
                          ),
                        ]),

                        SizedBox(height: 25.h),
                        _buildFormSection("Family Details", [
                          _buildGlassmorphicTextField(
                            "Father's Name",
                            _fatherNameController,
                            Icons.man,
                            isFullWidth: true,
                          ),
                          _buildGlassmorphicTextField(
                            "Mother's Name",
                            _motherNameController,
                            Icons.woman,
                            isFullWidth: true,
                          ),
                          _buildGlassmorphicTextField(
                            "Mother Contact No.",
                            _motherContactController,
                            Icons.phone,
                            isFullWidth: true,
                          ),
                        ]),

                        SizedBox(height: 25.h),
                        _buildFormSection("Address Details", [
                          _buildGlassmorphicTextField(
                            "Address",
                            _addressController,
                            Icons.location_on,
                            isFullWidth: true,
                            maxLines: 3,
                          ),
                          _buildRow([
                            _buildGlassmorphicTextField(
                              "Country",
                              _countryController,
                              Icons.flag,
                            ),
                            _buildGlassmorphicTextField(
                              "State",
                              _stateController,
                              Icons.map,
                            ),
                          ]),
                          _buildRow([
                            _buildGlassmorphicTextField(
                              "City",
                              _cityController,
                              Icons.location_city,
                            ),
                            _buildGlassmorphicDropdown(
                              "Family",
                              selectedFamily,
                              families,
                                  (value) => setState(() => selectedFamily = value),
                              Icons.family_restroom,
                            ),
                          ]),
                        ]),

                        SizedBox(height: 25.h),
                        _buildFormSection("Transport", [
                          _buildGlassmorphicTextField(
                            "Transport Route",
                            _transportController,
                            Icons.directions_bus,
                            isFullWidth: true,
                          ),
                        ]),

                        SizedBox(height: 40.h),
                        _buildMagicSaveButton(colorScheme),
                        SizedBox(height: 30.h),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Floating particles overlay
          _buildFloatingParticles(size),
        ],
      ),
    );
  }

  Widget _buildAnimatedBackground(Size size, ColorScheme colorScheme) {
    return AnimatedBuilder(
      animation: _particleAnimation,
      builder: (context, child) {
        return Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                colorScheme.primary.withOpacity(0.3),
                colorScheme.primary.withOpacity(0.1),
                colorScheme.primary.withOpacity(0.2),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildGlassmorphicAppBar(ColorScheme colorScheme, Size size, TextTheme textTheme) {
    return SliverAppBar(
      expandedHeight: 80.h,
      floating: true,
      pinned: true,
      backgroundColor: colorScheme.primary.withOpacity(0.3),
      elevation: 0,
      leading: AnimatedBuilder(
        animation: _pulseAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _pulseAnimation.value * 0.1 + 0.9,
            child: IconButton(
              icon: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.3),
                      Colors.white.withOpacity(0.1),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Icon(Icons.arrow_back, color: Colors.white),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          );
        },
      ),
      flexibleSpace: AnimatedBuilder(
        animation: _headerAnimation,
        builder: (context, child) {
          return FlexibleSpaceBar(
            centerTitle: true,
            title: Transform.scale(
              scale: _headerAnimation.value,
              child: ShaderMask(
                shaderCallback: (bounds) => LinearGradient(
                  colors: [Colors.white, Colors.white.withOpacity(0.8)],
                ).createShader(bounds),
                child: Text(
                  'Student Registration',
                  style: textTheme.titleMedium?.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildRegistrationHeader(TextTheme textTheme) {
    return AnimatedBuilder(
      animation: _cardStaggerAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _cardStaggerAnimation.value,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(25),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFF667eea),
                  const Color(0xFF764ba2),
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
            child: Row(
              children: [
                AnimatedBuilder(
                  animation: _floatingAnimation,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: math.sin(_floatingAnimation.value * 2 * math.pi) * 0.1,
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Icon(
                          Icons.person_add,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'New Student Enrollment',
                        style: textTheme.titleLarge?.copyWith(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Fill in the details to register a new student',
                        style: textTheme.bodyMedium?.copyWith(
                          fontSize: 14.sp,
                          color: Colors.white.withOpacity(0.9),
                        ),
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

  Widget _buildFormSection(String title, List<Widget> fields) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: 800),
      curve: Curves.easeOutBack,
      builder: (context, scale, child) {
        return Transform.scale(
          scale: scale,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 15.h),
                child: ShaderMask(
                  shaderCallback: (bounds) => LinearGradient(
                    colors: [Colors.white, Colors.white.withOpacity(0.8)],
                  ).createShader(bounds),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              ...fields,
            ],
          ),
        );
      },
    );
  }

  Widget _buildRow(List<Widget> children) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h),
      child: Row(
        children: children.map((child) {
          int index = children.indexOf(child);
          return index == 0
              ? Expanded(child: child)
              : Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: child,
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildGlassmorphicTextField(
      String label,
      TextEditingController controller,
      IconData icon, {
        bool isFullWidth = false,
        int maxLines = 1,
      }) {
    return AnimatedBuilder(
      animation: _floatingAnimation,
      builder: (context, child) {
        return Container(
          width: isFullWidth ? double.infinity : null,
          margin: EdgeInsets.only(bottom: isFullWidth ? 15.h : 0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.15),
                Colors.white.withOpacity(0.05),
              ],
            ),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.white.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: TextFormField(
            controller: controller,
            maxLines: maxLines,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: label,
              labelStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
              prefixIcon: Icon(icon, color: Colors.white.withOpacity(0.7)),
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(20),
            ),
          ),
        );
      },
    );
  }

  Widget _buildGlassmorphicDropdown(
      String label,
      String? value,
      List<String> items,
      Function(String?) onChanged,
      IconData icon,
      ) {
    return AnimatedBuilder(
      animation: _morphAnimation,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.15),
                Colors.white.withOpacity(0.05),
              ],
            ),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.white.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: DropdownButtonFormField<String>(
            value: value,
            onChanged: onChanged,
            dropdownColor: Theme.of(context).colorScheme.primary,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: label,
              labelStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
              prefixIcon: Icon(icon, color: Colors.white.withOpacity(0.7)),
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(20),
            ),
            items: items.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: TextStyle(color: Colors.white),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }

  Widget _buildGlassmorphicDateField(
      String label,
      String hint,
      IconData icon, {
        TextEditingController? controller,
      }) {
    return AnimatedBuilder(
      animation: _floatingAnimation,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.15),
                Colors.white.withOpacity(0.05),
              ],
            ),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.white.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: TextFormField(
            controller: controller,
            style: TextStyle(color: Colors.white),
            readOnly: true,
            decoration: InputDecoration(
              labelText: label,
              hintText: hint,
              labelStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
              hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
              prefixIcon: Icon(icon, color: Colors.white.withOpacity(0.7)),
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(20),
            ),
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2030),
              );
              if (date != null && controller != null) {
                controller.text = "${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year}";
              }
            },
          ),
        );
      },
    );
  }

  Widget _buildMagicSaveButton(ColorScheme colorScheme) {
    return AnimatedBuilder(
      animation: _pulseAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _pulseAnimation.value * 0.05 + 0.95,
          child: Container(
            width: double.infinity,
            height: 60.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  colorScheme.primary,
                  colorScheme.primary.withOpacity(0.8),
                ],
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: colorScheme.primary.withOpacity(0.4),
                  blurRadius: 20,
                  spreadRadius: 0,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    // Handle form submission
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Student registered successfully!'),
                        backgroundColor: colorScheme.primary,
                      ),
                    );
                  }
                },
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedBuilder(
                        animation: _morphAnimation,
                        builder: (context, child) {
                          return Transform.rotate(
                            angle: _morphAnimation.value * 0.1,
                            child: Icon(
                              Icons.save,
                              color: Colors.white,
                              size: 24,
                            ),
                          );
                        },
                      ),
                      SizedBox(width: 12),
                      Text(
                        'Save Student',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
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

  Widget _buildFloatingParticles(Size size) {
    return AnimatedBuilder(
      animation: _particleAnimation,
      builder: (context, child) {
        return IgnorePointer(
          child: Container(
            width: size.width,
            height: size.height,
            child: CustomPaint(
              painter: RegistrationParticlesPainter(_particleAnimation.value),
            ),
          ),
        );
      },
    );
  }
}

// Custom Painter for floating particles effect
class RegistrationParticlesPainter extends CustomPainter {
  final double animationValue;

  RegistrationParticlesPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill;

    // Create floating particles
    for (int i = 0; i < 20; i++) {
      final progress = (animationValue + (i * 0.1)) % 1.0;
      final opacity = (math.sin(progress * math.pi) * 0.3).clamp(0.0, 0.3);

      paint.color = Colors.white.withOpacity(opacity);

      final x = (size.width * 0.1) +
          (size.width * 0.8 * ((i * 0.23) % 1.0)) +
          (math.sin(progress * 2 * math.pi + i) * 30);
      final y = size.height * (1 - progress) +
          (math.cos(progress * 2 * math.pi + i) * 20);

      final radius = 2 + (math.sin(progress * math.pi) * 3);

      canvas.drawCircle(Offset(x, y), radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}