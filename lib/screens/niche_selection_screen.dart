import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme.dart';

class NicheSelectionScreen extends StatefulWidget {
  final VoidCallback onContinue;
  final VoidCallback onBack;

  const NicheSelectionScreen({
    super.key,
    required this.onContinue,
    required this.onBack,
  });

  @override
  State<NicheSelectionScreen> createState() => _NicheSelectionScreenState();
}

class _NicheSelectionScreenState extends State<NicheSelectionScreen> {
  final Set<String> _selectedNiches = {};

  final List<Map<String, String>> _niches = [
    {'name': 'Vlog', 'icon': 'assets/niche_vlog.svg'},
    {'name': 'Tech', 'icon': 'assets/niche_tech.svg'},
    {'name': 'Beauty', 'icon': 'assets/niche_beauty.svg'},
    {'name': 'Travel', 'icon': 'assets/niche_travel.svg'},
    {'name': 'Food', 'icon': 'assets/niche_food.svg'},
    {'name': 'Fashion', 'icon': 'assets/niche_fashion.svg'},
    {'name': 'Gaming', 'icon': 'assets/niche_gaming.svg'},
    {'name': 'Fitness', 'icon': 'assets/niche_fitness.svg'},
    {'name': 'Art', 'icon': 'assets/niche_art.svg'},
    {'name': 'Music', 'icon': 'assets/niche_music.svg'},
    {'name': 'Education', 'icon': 'assets/niche_education.svg'},
    {'name': 'Business', 'icon': 'assets/niche_business.svg'},
  ];

  void _toggleNiche(String name) {
    setState(() {
      if (_selectedNiches.contains(name)) {
        _selectedNiches.remove(name);
      } else {
        _selectedNiches.add(name);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: Stack(
        children: [
          // Background Decorative Element
          Positioned(
            top: 340,
            left: 0,
            child: Opacity(
              opacity: 0.4,
              child: Container(
                width: 390,
                height: 390,
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [
                      AppColors.primaryRed.withOpacity(0.1),
                      AppColors.primaryRed.withOpacity(0),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Main Content
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  const SizedBox(height: 140),
                  // Tag
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      'PREFERENCE PROFILE',
                      style: AppTypography.interBold.copyWith(
                        color: AppColors.primaryRed,
                        fontSize: 12,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Title
                  Text(
                    'What\'s your\nniche?',
                    style: AppTypography.beVietnamProBold.copyWith(
                      color: AppColors.textDark,
                      fontSize: 36,
                      height: 1.1,
                      letterSpacing: -0.9,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Select 3 or more topics that best describe your content.',
                    style: AppTypography.interRegular.copyWith(
                      color: AppColors.textBrown,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 48),

                  // Niche Grid
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 1,
                    ),
                    itemCount: _niches.length,
                    itemBuilder: (context, index) {
                      final niche = _niches[index];
                      final isSelected = _selectedNiches.contains(niche['name']);
                      return GestureDetector(
                        onTap: () => _toggleNiche(niche['name']!),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          decoration: BoxDecoration(
                            color: isSelected ? AppColors.primaryRed : Colors.white.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color: isSelected ? AppColors.primaryRed : Colors.white.withOpacity(0.4),
                              width: isSelected ? 1 : 0.5,
                            ),
                            boxShadow: isSelected
                                ? [
                                    BoxShadow(
                                      color: AppColors.primaryRed.withOpacity(0.3),
                                      blurRadius: 16,
                                      offset: const Offset(0, 8),
                                      spreadRadius: -4,
                                    )
                                  ]
                                : [
                                    BoxShadow(
                                      color: AppColors.textDark.withOpacity(0.04),
                                      blurRadius: 16,
                                      offset: const Offset(0, 4),
                                    )
                                  ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // For now using icons if they exist, otherwise text
                              Icon(
                                Icons.category_outlined,
                                color: isSelected ? Colors.white : AppColors.textDark,
                                size: 24,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                niche['name']!,
                                style: AppTypography.interSemiBold.copyWith(
                                  color: isSelected ? Colors.white : AppColors.textDark,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 160),
                ],
              ),
            ),
          ),

          // Top App Bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(bottom: 2),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                border: const Border(
                  bottom: BorderSide(color: Color(0xFFF5F5F4), width: 2),
                ),
              ),
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ColorFilter.mode(
                    Colors.white.withOpacity(0.9),
                    BlendMode.srcIn,
                  ),
                  child: SafeArea(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: widget.onBack,
                                child: SvgPicture.asset('assets/back_arrow.svg', width: 16),
                              ),
                              const SizedBox(width: 16),
                              Text(
                                'Creator Box',
                                style: AppTypography.beVietnamProBlackItalic.copyWith(
                                  color: const Color(0xFFDC2626),
                                  fontSize: 20,
                                  letterSpacing: -1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Progress Bar Overlay
                        Stack(
                          children: [
                            Container(
                              height: 2,
                              width: double.infinity,
                              color: const Color(0xFFF5F5F4),
                            ),
                            Container(
                              height: 2,
                              width: MediaQuery.of(context).size.width * 0.5, // Step 2 of 4
                              color: AppColors.primaryRed,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Bottom Bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 40),
              decoration: BoxDecoration(
                color: Colors.white,
                border: const Border(
                  top: BorderSide(color: Color(0xFFF5F5F4)),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.textDark.withOpacity(0.04),
                    blurRadius: 40,
                    offset: const Offset(0, -12),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: widget.onBack,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/back_arrow.svg',
                              width: 12,
                              colorFilter: const ColorFilter.mode(AppColors.textDark, BlendMode.srcIn),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'BACK',
                              style: AppTypography.interSemiBold.copyWith(
                                color: AppColors.textDark,
                                fontSize: 14,
                                letterSpacing: 1.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: GestureDetector(
                      onTap: _selectedNiches.length >= 3 ? widget.onContinue : null,
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 200),
                        opacity: _selectedNiches.length >= 3 ? 1.0 : 0.5,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFFBC0100), Color(0xFFBC000C)],
                              begin: Alignment(-1, -1),
                              end: Alignment(1, 1),
                            ),
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'CONTINUE',
                                style: AppTypography.interSemiBold.copyWith(
                                  color: Colors.white,
                                  fontSize: 14,
                                  letterSpacing: 1.4,
                                ),
                              ),
                              const SizedBox(width: 8),
                              SvgPicture.asset(
                                'assets/forward_arrow.svg',
                                width: 12,
                                height: 12,
                                colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
