import 'package:flutter/material.dart';
import '../theme.dart';
import 'support_detail_screen.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

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
                const SizedBox(height: 64), // Header space

                // Cinematic Search Hero
                const _HelpSearchHero(),

                const SizedBox(height: 48),

                // Help Categories Bento Grid
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: _HelpCategoriesGrid(),
                ),

                const SizedBox(height: 48),

                // Live Support Hub
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: _LiveSupportHub(),
                ),

                const SizedBox(height: 48),

                // Trending Questions
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: _TrendingQuestions(),
                ),

                const SizedBox(height: 120),
              ],
            ),
          ),

          // Sticky Top Header
          const _StickyHeader(),
        ],
      ),
    );
  }
}

class _StickyHeader extends StatelessWidget {
  const _StickyHeader();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      width: 390,
      height: 64,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF1A1C1C).withOpacity(0.04),
              blurRadius: 40,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ColorFilter.mode(Colors.white.withOpacity(0.8), BlendMode.srcOver),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, size: 16, color: Color(0xFF1A1C1C)),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'CREATOR BOX',
                        style: AppTypography.interBold.copyWith(
                          color: const Color(0xFFDC2626),
                          fontSize: 20,
                          letterSpacing: -1,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFFBC0100).withOpacity(0.1), width: 2),
                      image: const DecorationImage(
                        image: AssetImage('assets/fd4162f032b84a3830c4a4221db338640c777fc5.png'), // user_avatar_header
                        fit: BoxFit.cover,
                      ),
                    ),
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

class _HelpSearchHero extends StatelessWidget {
  const _HelpSearchHero();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF1A1C1C),
      padding: const EdgeInsets.fromLTRB(24, 48, 24, 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'HELP CENTER',
            style: AppTypography.interBold.copyWith(color: const Color(0xFFBC0100), fontSize: 10, letterSpacing: 1),
          ),
          const SizedBox(height: 16),
          Text(
            "HOW CAN WE\nSTEER YOUR STORY?",
            style: AppTypography.headlineMedium.copyWith(
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.w900,
              height: 1.0,
              letterSpacing: -1.0,
            ),
          ),
          const SizedBox(height: 32),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              children: [
                const Icon(Icons.search, color: Color(0xFF603E39), size: 20),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search for tags, topics, narratives...',
                      hintStyle: AppTypography.interMedium.copyWith(color: const Color(0xFF603E39).withOpacity(0.5), fontSize: 14),
                      border: InputBorder.none,
                      isDense: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HelpCategoriesGrid extends StatelessWidget {
  const _HelpCategoriesGrid();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'CATEGORIES',
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
            fontSize: 12,
            color: Color(0xFF603E39),
            letterSpacing: 2.4,
          ),
        ),
        const SizedBox(height: 16),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1.0,
          children: const [
            _CategoryCard(title: 'PAYMENTS', icon: Icons.payments_outlined, count: '12 topics'),
            _CategoryCard(title: 'CAMPAIGNS', icon: Icons.movie_outlined, count: '24 topics'),
            _CategoryCard(title: 'TECHNICAL', icon: Icons.settings_outlined, count: '8 topics'),
            _CategoryCard(title: 'COLLAB', icon: Icons.handshake_outlined, count: '15 topics'),
          ],
        ),
      ],
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String count;

  const _CategoryCard({required this.title, required this.icon, required this.count});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SupportDetailScreen(title: 'Support Articles')),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: const Color(0xFFF3F3F3)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: const Color(0xFFBC0100), size: 24),
            const Spacer(),
            Text(title, style: AppTypography.interBold.copyWith(color: const Color(0xFF1A1C1C), fontSize: 14)),
            const SizedBox(height: 4),
            Text(count, style: AppTypography.interMedium.copyWith(color: const Color(0xFF603E39).withOpacity(0.6), fontSize: 10)),
          ],
        ),
      ),
    );
  }
}

class _LiveSupportHub extends StatelessWidget {
  const _LiveSupportHub();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: const BoxDecoration(
        color: Color(0xFFF3F3F3),
        border: Border(left: BorderSide(color: Color(0xFFBC0100), width: 4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'LIVE SUPPORT HUB',
                style: AppTypography.interBold.copyWith(color: const Color(0xFF1A1C1C), fontSize: 14, letterSpacing: 2.8),
              ),
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(color: Color(0xFF16A34A), shape: BoxShape.circle),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            "Need direct guidance for your campaign? Our narrative consultants are online now.",
            style: AppTypography.interMedium.copyWith(color: const Color(0xFF603E39), fontSize: 14, height: 1.4),
          ),
          const SizedBox(height: 32),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16),
            color: const Color(0xFF1A1C1C),
            child: Text(
              'START LIVE CHAT',
              textAlign: TextAlign.center,
              style: AppTypography.interBold.copyWith(color: Colors.white, fontSize: 12, letterSpacing: 1.2),
            ),
          ),
        ],
      ),
    );
  }
}

class _TrendingQuestions extends StatelessWidget {
  const _TrendingQuestions();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'TRENDING QUESTIONS',
          style: AppTypography.interBold.copyWith(color: const Color(0xFF603E39), fontSize: 12, letterSpacing: 2.4),
        ),
        const SizedBox(height: 16),
        _QuestionTile(text: 'How do I submit my deliverables for review?'),
        _QuestionTile(text: 'When should I expect my narrative payout?'),
        _QuestionTile(text: 'Can I edit a campaign narrative after it starts?'),
      ],
    );
  }
}

class _QuestionTile extends StatelessWidget {
  final String text;
  const _QuestionTile({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: const Color(0xFFF3F3F3)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              text,
              style: AppTypography.interMedium.copyWith(color: const Color(0xFF1A1C1C), fontSize: 14),
            ),
          ),
          const Icon(Icons.chevron_right, size: 16, color: Color(0xFFBC0100)),
        ],
      ),
    );
  }
}
