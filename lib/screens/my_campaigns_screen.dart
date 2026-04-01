import 'package:flutter/material.dart';
import '../theme.dart';

class MyCampaignsScreen extends StatelessWidget {
  const MyCampaignsScreen({super.key});

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
                SizedBox(height: 64 + MediaQuery.of(context).padding.top), // Header space

                // Spotlight Deal Section
                const _SpotlightDealSection(),

                const SizedBox(height: 48),

                // Active Narratives Section
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: _ActiveNarrativesSection(),
                ),

                const SizedBox(height: 48),

                // Narrative Stats & Next Steps
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: _NarrativeSidebarSection(),
                ),

                const SizedBox(height: 48),

                // Archived Chapters Section
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: _ArchivedChaptersSection(),
                ),

                const SizedBox(height: 120),
              ],
            ),
          ),

          // Sticky Top Navigation
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
      right: 0,
      height: 64 + MediaQuery.of(context).padding.top,
      child: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.8),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF1A1C1C).withValues(alpha: 0.04),
              blurRadius: 40,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ColorFilter.mode(Colors.white.withValues(alpha: 0.8), BlendMode.srcOver),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(Icons.arrow_back, size: 24, color: Color(0xFF1A1C1C)),
                      ),
                      const SizedBox(width: 16),
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
                      border: Border.all(color: const Color(0xFFBC0100).withValues(alpha: 0.1), width: 2),
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

class _SpotlightDealSection extends StatelessWidget {
  const _SpotlightDealSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 530,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/6ba77d14bf237bebf5faba78e861a932cae81681.png'), // vanguard_hero
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              const Color(0xFF1A1C1C).withOpacity(0.8),
            ],
            stops: const [0.5, 1.0],
          ),
        ),
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              color: const Color(0xFFBC0100),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(width: 6, height: 6, decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle)),
                  const SizedBox(width: 8),
                  Text(
                    'SPOTLIGHT DEAL',
                    style: AppTypography.interBold.copyWith(color: Colors.white, fontSize: 10, letterSpacing: 2),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text(
              "VANGUARD\nSUMMER '24",
              style: AppTypography.headlineMedium.copyWith(
                color: Colors.white,
                fontSize: 48,
                fontWeight: FontWeight.w900,
                height: 0.9,
                letterSpacing: -2.4,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                _buildSpotlightMeta('STATUS', 'Active\nShooting'),
                const SizedBox(width: 24),
                Container(width: 0.5, height: 32, color: Colors.white.withOpacity(0.2)),
                const SizedBox(width: 24),
                _buildSpotlightMeta('DEADLINE', 'June\n12th'),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  color: Colors.white,
                  child: Text(
                    'VIEW\nDETAILS',
                    style: AppTypography.interBold.copyWith(color: const Color(0xFF1A1C1C), fontSize: 12, height: 1.2, letterSpacing: 1.2),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSpotlightMeta(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTypography.interBold.copyWith(color: Colors.white.withOpacity(0.6), fontSize: 10, letterSpacing: 1),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: AppTypography.interBold.copyWith(color: Colors.white.withOpacity(0.8), fontSize: 14, height: 1.4),
        ),
      ],
    );
  }
}

class _ActiveNarrativesSection extends StatelessWidget {
  const _ActiveNarrativesSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 12),
          decoration: const BoxDecoration(border: Border(left: BorderSide(color: Color(0xFFBC0100), width: 4))),
          child: Text(
            'Active Narratives',
            style: AppTypography.headlineSmall.copyWith(color: const Color(0xFF1A1C1C), fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
        const SizedBox(height: 16),
        Column(
          children: [
            _buildNarrativeCard(
              title: 'URBAN PULSE X NIKE',
              desc: 'Content delivery for the lifestyle segment. Awaiting brand finalization...',
              image: 'assets/f855ba1ba2784570fc676736add1e7cf670975bd.png', // nike
              status: 'IN REVIEW',
              statusColor: const Color(0xFFBC0100),
            ),
            const SizedBox(height: 24),
            _buildNarrativeCard(
              title: 'TIMELESS HORIZON',
              desc: 'Premium watch product photography. Preparation phase for the high-contrast...',
              image: 'assets/09db9e881e0790921a9587554eb83e09639f3d61.png', // watch
              status: 'SCHEDULED',
              statusColor: const Color(0xFF71717A),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNarrativeCard({
    required String title,
    required String desc,
    required String image,
    required String status,
    required Color statusColor,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: const Color(0xFFBC0100).withOpacity(0.2), style: BorderStyle.none), // Placeholder for dashed border if needed
      ),
      padding: const EdgeInsets.all(4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 417,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
                ),
              ),
              Positioned(
                top: 16,
                right: 16,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  color: Colors.white.withOpacity(0.9),
                  child: Text(
                    status,
                    style: AppTypography.interBold.copyWith(color: statusColor, fontSize: 10, letterSpacing: 1),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTypography.interBold.copyWith(color: const Color(0xFF1A1C1C), fontSize: 20, letterSpacing: -0.5),
                ),
                const SizedBox(height: 8),
                Text(
                  desc,
                  style: AppTypography.interMedium.copyWith(color: const Color(0xFF603E39), fontSize: 14, height: 1.4),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'REVIEW ASSETS',
                      style: AppTypography.interBold.copyWith(color: const Color(0xFFBC0100), fontSize: 12),
                    ),
                    const Icon(Icons.arrow_forward, size: 16, color: Color(0xFFBC0100)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NarrativeSidebarSection extends StatelessWidget {
  const _NarrativeSidebarSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Narrative Stats Card
        Container(
          padding: const EdgeInsets.all(32),
          color: const Color(0xFFF3F3F3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'NARRATIVE STATS',
                style: AppTypography.interBold.copyWith(color: const Color(0xFF603E39), fontSize: 14, letterSpacing: 2.8),
              ),
              const SizedBox(height: 24),
              _buildStatRow('Pending Payouts', '\$4,250.00', isLarge: true),
              const SizedBox(height: 16),
              _buildStatRow('Live Reach', '1.2M', isLarge: false),
              const SizedBox(height: 24),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16),
                color: const Color(0xFF1A1C1C),
                child: Text(
                  'DOWNLOAD REPORT',
                  textAlign: TextAlign.center,
                  style: AppTypography.interBold.copyWith(color: Colors.white, fontSize: 10, letterSpacing: 1),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        // Next Steps
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'NEXT STEPS',
              style: AppTypography.interBold.copyWith(color: const Color(0xFF603E39), fontSize: 14, letterSpacing: 2.8),
            ),
            const SizedBox(height: 16),
            _buildNextStep('Signature Required', "L'Oréal Paris Contract", const Color(0xFFBC0100).withOpacity(0.1), const Color(0xFFBC0100)),
            const SizedBox(height: 12),
            _buildNextStep('Awaiting Assets', 'Tesla Lifestyle Reel', const Color(0xFFFFB4AA).withOpacity(0.2), const Color(0xFFBC000C)),
          ],
        ),
      ],
    );
  }

  Widget _buildStatRow(String label, String value, {required bool isLarge}) {
    return Container(
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: const Color(0xFFEBBBB4).withOpacity(0.3)))),
      padding: const EdgeInsets.only(bottom: 9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(label, style: AppTypography.interMedium.copyWith(color: const Color(0xFF603E39), fontSize: 12)),
          Text(
            value,
            style: AppTypography.headlineSmall.copyWith(
              color: isLarge ? const Color(0xFFBC0100) : const Color(0xFF1A1C1C),
              fontSize: 24,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNextStep(String tag, String title, Color bgColor, Color tagColor) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white.withOpacity(0.8),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            color: bgColor,
            child: Icon(Icons.file_present_outlined, color: tagColor, size: 20),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(tag.toUpperCase(), style: AppTypography.interBold.copyWith(color: tagColor, fontSize: 10, letterSpacing: 1)),
              const SizedBox(height: 2),
              Text(title, style: AppTypography.interBold.copyWith(color: const Color(0xFF1A1C1C), fontSize: 14)),
            ],
          ),
        ],
      ),
    );
  }
}

class _ArchivedChaptersSection extends StatelessWidget {
  const _ArchivedChaptersSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Archived Chapters',
              style: AppTypography.headlineSmall.copyWith(color: const Color(0xFF1A1C1C), fontWeight: FontWeight.bold, fontSize: 24, letterSpacing: -0.6),
            ),
            Text(
              'VIEW HISTORY',
              style: AppTypography.interBold.copyWith(color: const Color(0xFFBC0100), fontSize: 12, letterSpacing: 1.2),
            ),
          ],
        ),
        const SizedBox(height: 24),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1.1,
          children: [
            _buildArchivedTile('assets/1e3cd66c1fec5e4740abe15b293a82f48e27f6aa.png'), // apple
            _buildArchivedTile('assets/79441387661743d452bf45b85bd7c968ed90d0db.png'), // adidas
            _buildArchivedTile('assets/ba3aea2177dff57c6b3339ceffdc03ed2dddbc1f.png'), // blue bottle
            _buildArchivedTile('assets/aecd83de7f12709f8001aa1742e8459140478a34.png'), // leica
          ],
        ),
      ],
    );
  }

  Widget _buildArchivedTile(String image) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFE4E4E7),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.saturation), // Desaturate for archived look
        ),
      ),
    );
  }
}
