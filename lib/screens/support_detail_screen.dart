import 'package:flutter/material.dart';
import '../theme.dart';

class SupportDetailScreen extends StatelessWidget {
  final String title;
  const SupportDetailScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 70), // Header space

                // Category Header
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'HELP ARTICLES',
                        style: AppTypography.interBold.copyWith(color: const Color(0xFFBC0100), fontSize: 10, letterSpacing: 1),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        title.toUpperCase(),
                        style: AppTypography.headlineMedium.copyWith(
                          color: const Color(0xFF1A1C1C),
                          fontSize: 32,
                          fontWeight: FontWeight.w900,
                          height: 1.1,
                          letterSpacing: -0.8,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // Search Bar (Minor)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: const Color(0xFFF3F3F3)),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.search, color: Color(0xFF603E39), size: 18),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Search in this category...',
                            style: AppTypography.interMedium.copyWith(color: const Color(0xFF603E39).withOpacity(0.5), fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 48),

                // Articles List
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'FEATURED ARTICLES',
                        style: AppTypography.interBold.copyWith(color: const Color(0xFF603E39), fontSize: 12, letterSpacing: 2.4),
                      ),
                      const SizedBox(height: 24),
                      _ArticleListItem(
                        title: 'How to update your payment narrative?',
                        description: 'Step-by-step guide on connecting your financial details to ensure seamless payouts...',
                      ),
                      _ArticleListItem(
                        title: 'Managing campaign deliverables',
                        description: 'Learn how to utilize the Spotlight platform to showcase your creative process...',
                      ),
                      _ArticleListItem(
                        title: 'Understanding tax narratives',
                        description: 'A comprehensive overview of your financial responsibilities in the digital age...',
                      ),
                      _ArticleListItem(
                        title: 'Spotlight Policy Update 2024',
                        description: 'Important changes to our collaboration terms and conditions...',
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 120),
              ],
            ),
          ),

          // Sticky Top Navigation
          const _StickyTopAppBar(),
        ],
      ),
    );
  }
}

class _StickyTopAppBar extends StatelessWidget {
  const _StickyTopAppBar();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 64,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.4),
          border: Border(bottom: BorderSide(color: Colors.white.withOpacity(0.3))),
        ),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ColorFilter.mode(Colors.white.withOpacity(0.4), BlendMode.srcOver),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, size: 16, color: Color(0xFF1A1C1C)),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Row(
                    children: [
                      IconButton(icon: const Icon(Icons.share_outlined, size: 24, color: Color(0xFF1A1C1C)), onPressed: () {}),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ArticleListItem extends StatelessWidget {
  final String title;
  final String description;

  const _ArticleListItem({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: const Color(0xFFF3F3F3)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1A1C1C).withOpacity(0.02),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTypography.interBold.copyWith(color: const Color(0xFF1A1C1C), fontSize: 18, letterSpacing: -0.4),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: AppTypography.interMedium.copyWith(color: const Color(0xFF603E39), fontSize: 13, height: 1.5),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Text(
                'READ FULL ARTICLE',
                style: AppTypography.interBold.copyWith(color: const Color(0xFFBC0100), fontSize: 11, letterSpacing: 1.1),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.arrow_right_alt, color: Color(0xFFBC0100), size: 16),
            ],
          ),
        ],
      ),
    );
  }
}
