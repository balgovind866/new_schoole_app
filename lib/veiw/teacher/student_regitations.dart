import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StudentRegistrationForm extends StatefulWidget {
  const StudentRegistrationForm({super.key});

  @override
  State<StudentRegistrationForm> createState() => _StudentRegistrationFormState();
}

class _StudentRegistrationFormState extends State<StudentRegistrationForm>
    with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _scrollController = ScrollController();

  // Controllers
  final _studentNameController = TextEditingController();
  final _admissionNoController = TextEditingController();
  final _formSrNoController = TextEditingController();
  final _dateOfAdmissionController = TextEditingController();
  final _dateOfBirthController = TextEditingController();
  final _smsContactController = TextEditingController();
  final _aadharController = TextEditingController();
  final _fatherNameController = TextEditingController();
  final _motherNameController = TextEditingController();
  final _motherContactController = TextEditingController();
  final _addressController = TextEditingController();
  final _countryController = TextEditingController();
  final _stateController = TextEditingController();
  final _cityController = TextEditingController();
  final _transportController = TextEditingController();

  // Dropdown values
  String? _selectedClass;
  String? _selectedSession;
  String? _selectedAdmCategory;
  String? _selectedGender;
  String? _selectedCategory;
  String? _selectedHouse;
  String? _selectedBloodGroup;
  String? _selectedFamily;

  bool _isLoading = false;

  // Animation controllers
  late AnimationController _animationController;
  late AnimationController _saveController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _buttonScaleAnimation;

  // Data lists
  final List<String> classes = [
    'Pre-KG', 'LKG', 'UKG', 'Class 1', 'Class 2', 'Class 3', 'Class 4', 'Class 5',
    'Class 6', 'Class 7', 'Class 8', 'Class 9', 'Class 10', 'Class 11', 'Class 12'
  ];

  final List<String> sessions = ['2024-25', '2025-26', '2026-27'];
  final List<String> admissionCategories = ['General', 'SC', 'ST', 'OBC', 'EWS'];
  final List<String> genders = ['Male', 'Female', 'Other'];
  final List<String> categories = ['General', 'SC', 'ST', 'OBC', 'EWS'];
  final List<String> houses = ['Red House', 'Blue House', 'Green House', 'Yellow House'];
  final List<String> bloodGroups = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];
  final List<String> families = ['Nuclear', 'Joint', 'Extended', 'Single Parent'];

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _startAnimations();

    // Set default date for admission
    _dateOfAdmissionController.text = "14-01-2024";
  }

  void _initializeAnimations() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _saveController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutCubic,
    ));

    _buttonScaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _saveController,
      curve: Curves.easeInOut,
    ));
  }

  void _startAnimations() {
    _animationController.forward();
  }

  Future<void> _selectDate(TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme,
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        controller.text = "${picked.day.toString().padLeft(2, '0')}-${picked.month.toString().padLeft(2, '0')}-${picked.year}";
      });
    }
  }

  Future<void> _handleSave() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      _saveController.forward().then((_) {
        _saveController.reverse();
      });

      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      if (mounted) {
        _showSuccessDialog();
      }

      setState(() {
        _isLoading = false;
      });
    } else {
      // Scroll to first error
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final colorScheme = Theme.of(context).colorScheme;
        return AlertDialog(
          icon: Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 48,
          ),
          title: Text('Registration Successful!'),
          content: Text('Student has been registered successfully.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _resetForm();
              },
              child: Text('Register Another'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop(); // Go back to previous screen
              },
              child: Text('Done'),
            ),
          ],
        );
      },
    );
  }

  void _resetForm() {
    _formKey.currentState?.reset();
    // Clear all controllers
    _studentNameController.clear();
    _admissionNoController.clear();
    _formSrNoController.clear();
    _dateOfAdmissionController.text = "14-01-2024";
    _dateOfBirthController.clear();
    _smsContactController.clear();
    _aadharController.clear();
    _fatherNameController.clear();
    _motherNameController.clear();
    _motherContactController.clear();
    _addressController.clear();
    _countryController.clear();
    _stateController.clear();
    _cityController.clear();
    _transportController.clear();

    // Reset dropdown values
    setState(() {
      _selectedClass = null;
      _selectedSession = null;
      _selectedAdmCategory = null;
      _selectedGender = null;
      _selectedCategory = null;
      _selectedHouse = null;
      _selectedBloodGroup = null;
      _selectedFamily = null;
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _saveController.dispose();
    _scrollController.dispose();

    // Dispose controllers
    _studentNameController.dispose();
    _admissionNoController.dispose();
    _formSrNoController.dispose();
    _dateOfAdmissionController.dispose();
    _dateOfBirthController.dispose();
    _smsContactController.dispose();
    _aadharController.dispose();
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
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: Text(
          'Student Registration',
          style: textTheme.titleLarge?.copyWith(
            color: colorScheme.onSurface,
          ),
        ),
        backgroundColor: colorScheme.surface,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: colorScheme.onSurface),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      padding: const EdgeInsets.all(16),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            _buildBasicInfoSection(colorScheme, textTheme),
                            const SizedBox(height: 24),
                            _buildPersonalInfoSection(colorScheme, textTheme),
                            const SizedBox(height: 24),
                            _buildParentInfoSection(colorScheme, textTheme),
                            const SizedBox(height: 24),
                            _buildAddressSection(colorScheme, textTheme),
                            const SizedBox(height: 24),
                            _buildOtherInfoSection(colorScheme, textTheme),
                            const SizedBox(height: 32),
                          ],
                        ),
                      ),
                    ),
                  ),
                  _buildSaveButton(colorScheme, textTheme),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionCard({
    required String title,
    required List<Widget> children,
    required ColorScheme colorScheme,
    required TextTheme textTheme,
  }) {
    return Card(
      elevation: 0,
      color: colorScheme.surfaceContainer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: colorScheme.outline.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: textTheme.titleMedium?.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildBasicInfoSection(ColorScheme colorScheme, TextTheme textTheme) {
    return _buildSectionCard(
      title: 'Basic Information',
      colorScheme: colorScheme,
      textTheme: textTheme,
      children: [
        _buildDropdownField(
          label: 'Class/Course',
          value: _selectedClass,
          items: classes,
          onChanged: (value) => setState(() => _selectedClass = value),
          icon: Icons.class_,
          colorScheme: colorScheme,
        ),
        const SizedBox(height: 16),

        Row(
          children: [
            Expanded(
              child: _buildTextFormField(
                controller: _admissionNoController,
                label: 'Admission No.',
                hint: 'Enter Admission No.',
                icon: Icons.confirmation_number,
                colorScheme: colorScheme,
                validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildTextFormField(
                controller: _formSrNoController,
                label: 'Form/SR No.',
                hint: 'Enter SR No.',
                icon: Icons.numbers,
                colorScheme: colorScheme,
                validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        Row(
          children: [
            Expanded(
              child: _buildDropdownField(
                label: 'Session',
                value: _selectedSession,
                items: sessions,
                onChanged: (value) => setState(() => _selectedSession = value),
                icon: Icons.calendar_today,
                colorScheme: colorScheme,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildDropdownField(
                label: 'Adm. Category',
                value: _selectedAdmCategory,
                items: admissionCategories,
                onChanged: (value) => setState(() => _selectedAdmCategory = value),
                icon: Icons.category,
                colorScheme: colorScheme,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPersonalInfoSection(ColorScheme colorScheme, TextTheme textTheme) {
    return _buildSectionCard(
      title: 'Personal Information',
      colorScheme: colorScheme,
      textTheme: textTheme,
      children: [
        _buildTextFormField(
          controller: _studentNameController,
          label: 'Student Name',
          hint: 'Enter Student Name',
          icon: Icons.person,
          colorScheme: colorScheme,
          validator: (value) => value?.isEmpty ?? true ? 'Student name is required' : null,
        ),
        const SizedBox(height: 16),

        Row(
          children: [
            Expanded(
              child: _buildDateField(
                controller: _dateOfAdmissionController,
                label: 'Date of Admission',
                icon: Icons.event,
                colorScheme: colorScheme,
                readOnly: true,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildDateField(
                controller: _dateOfBirthController,
                label: 'Date of Birth',
                icon: Icons.cake,
                colorScheme: colorScheme,
                validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        Row(
          children: [
            Expanded(
              child: _buildDropdownField(
                label: 'Gender',
                value: _selectedGender,
                items: genders,
                onChanged: (value) => setState(() => _selectedGender = value),
                icon: Icons.wc,
                colorScheme: colorScheme,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildDropdownField(
                label: 'Category',
                value: _selectedCategory,
                items: categories,
                onChanged: (value) => setState(() => _selectedCategory = value),
                icon: Icons.group,
                colorScheme: colorScheme,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        Row(
          children: [
            Expanded(
              child: _buildDropdownField(
                label: 'House',
                value: _selectedHouse,
                items: houses,
                onChanged: (value) => setState(() => _selectedHouse = value),
                icon: Icons.home,
                colorScheme: colorScheme,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildDropdownField(
                label: 'Blood Group',
                value: _selectedBloodGroup,
                items: bloodGroups,
                onChanged: (value) => setState(() => _selectedBloodGroup = value),
                icon: Icons.bloodtype,
                colorScheme: colorScheme,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        Row(
          children: [
            Expanded(
              child: _buildTextFormField(
                controller: _smsContactController,
                label: 'SMS Contact No.',
                hint: 'Enter Contact Number',
                icon: Icons.phone,
                keyboardType: TextInputType.phone,
                colorScheme: colorScheme,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (value) {
                  if (value?.isEmpty ?? true) return 'Required';
                  if (value!.length != 10) return 'Enter valid 10-digit number';
                  return null;
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildTextFormField(
                controller: _aadharController,
                label: 'Aadhar No.',
                hint: 'Enter Aadhar No.',
                icon: Icons.credit_card,
                keyboardType: TextInputType.number,
                colorScheme: colorScheme,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (value) {
                  if (value?.isEmpty ?? true) return 'Required';
                  if (value!.length != 12) return 'Enter valid 12-digit Aadhar';
                  return null;
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildParentInfoSection(ColorScheme colorScheme, TextTheme textTheme) {
    return _buildSectionCard(
      title: 'Parent Information',
      colorScheme: colorScheme,
      textTheme: textTheme,
      children: [
        _buildTextFormField(
          controller: _fatherNameController,
          label: "Father's Name",
          hint: "Enter Father's Name",
          icon: Icons.man,
          colorScheme: colorScheme,
          validator: (value) => value?.isEmpty ?? true ? 'Father name is required' : null,
        ),
        const SizedBox(height: 16),

        _buildTextFormField(
          controller: _motherNameController,
          label: "Mother's Name",
          hint: "Enter Mother's Name",
          icon: Icons.woman,
          colorScheme: colorScheme,
          validator: (value) => value?.isEmpty ?? true ? 'Mother name is required' : null,
        ),
        const SizedBox(height: 16),

        Row(
          children: [
            Expanded(
              child: _buildTextFormField(
                controller: _motherContactController,
                label: 'Mother Contact No.',
                hint: 'Enter Contact No.',
                icon: Icons.phone,
                keyboardType: TextInputType.phone,
                colorScheme: colorScheme,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (value) {
                  if (value?.isEmpty ?? true) return 'Required';
                  if (value!.length != 10) return 'Enter valid 10-digit number';
                  return null;
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildDropdownField(
                label: 'Family Type',
                value: _selectedFamily,
                items: families,
                onChanged: (value) => setState(() => _selectedFamily = value),
                icon: Icons.family_restroom,
                colorScheme: colorScheme,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAddressSection(ColorScheme colorScheme, TextTheme textTheme) {
    return _buildSectionCard(
      title: 'Address Information',
      colorScheme: colorScheme,
      textTheme: textTheme,
      children: [
        _buildTextFormField(
          controller: _addressController,
          label: 'Address',
          hint: 'Enter Address',
          icon: Icons.location_on,
          maxLines: 3,
          colorScheme: colorScheme,
          validator: (value) => value?.isEmpty ?? true ? 'Address is required' : null,
        ),
        const SizedBox(height: 16),

        Row(
          children: [
            Expanded(
              child: _buildTextFormField(
                controller: _countryController,
                label: 'Country',
                hint: 'Enter Country',
                icon: Icons.public,
                colorScheme: colorScheme,
                validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildTextFormField(
                controller: _stateController,
                label: 'State',
                hint: 'Enter State',
                icon: Icons.map,
                colorScheme: colorScheme,
                validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        _buildTextFormField(
          controller: _cityController,
          label: 'City',
          hint: 'Enter City',
          icon: Icons.location_city,
          colorScheme: colorScheme,
          validator: (value) => value?.isEmpty ?? true ? 'City is required' : null,
        ),
      ],
    );
  }

  Widget _buildOtherInfoSection(ColorScheme colorScheme, TextTheme textTheme) {
    return _buildSectionCard(
      title: 'Transport Information',
      colorScheme: colorScheme,
      textTheme: textTheme,
      children: [
        _buildTextFormField(
          controller: _transportController,
          label: 'Transport Route',
          hint: 'Enter Transport Route/List',
          icon: Icons.directions_bus,
          colorScheme: colorScheme,
        ),
      ],
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    required ColorScheme colorScheme,
    String? Function(String?)? validator,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
    int maxLines = 1,
    bool readOnly = false,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      maxLines: maxLines,
      readOnly: readOnly,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon, color: colorScheme.primary),
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
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.error, width: 2),
        ),
        filled: true,
        fillColor: colorScheme.surface,
      ),
    );
  }

  Widget _buildDateField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    required ColorScheme colorScheme,
    String? Function(String?)? validator,
    bool readOnly = false,
  }) {
    return TextFormField(
      controller: controller,
      readOnly: true,
      validator: validator,
      onTap: readOnly ? null : () => _selectDate(controller),
      decoration: InputDecoration(
        labelText: label,
        hintText: 'DD-MM-YYYY',
        prefixIcon: Icon(icon, color: colorScheme.primary),
        suffixIcon: readOnly ? null : Icon(Icons.calendar_today, color: colorScheme.primary),
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
        filled: true,
        fillColor: readOnly ? colorScheme.surfaceVariant.withOpacity(0.3) : colorScheme.surface,
      ),
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
    required IconData icon,
    required ColorScheme colorScheme,
    String? Function(String?)? validator,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      validator: validator ?? (value) => value == null ? 'Please select $label' : null,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: colorScheme.primary),
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
        filled: true,
        fillColor: colorScheme.surface,
      ),
      items: items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }

  Widget _buildSaveButton(ColorScheme colorScheme, TextTheme textTheme) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: ScaleTransition(
        scale: _buttonScaleAnimation,
        child: ElevatedButton(
          onPressed: _isLoading ? null : _handleSave,
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
          child: _isLoading
              ? SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(colorScheme.onPrimary),
            ),
          )
              : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.save, size: 20),
              const SizedBox(width: 8),
              Text(
                'Save Registration',
                style: textTheme.labelLarge?.copyWith(
                  color: colorScheme.onPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}