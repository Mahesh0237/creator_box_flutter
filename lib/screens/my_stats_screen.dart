import 'package:flutter/material.dart';
import '../theme.dart';

class MyStatsScreen extends StatelessWidget {
  const MyStatsScreen({super.key});

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
                SizedBox(height: 70 + MediaQuery.of(context).padding.top), // Header space

                // Section 1: Header & Platform Toggle
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: _AnalyticsHeader(),
                ),

                const SizedBox(height: 32),

                // Section 2: Bento Grid Metrics
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: _BentoMetricsGrid(),
                ),

                const SizedBox(height: 32),

                // Section 3: Performance Trends Chart
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: _PerformanceTrendsChart(),
                ),

                const SizedBox(height: 32),

                // Section 4: Top Performing Content
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: _TopContentSection(),
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
      height: 64 + MediaQuery.of(context).padding.top,
      child: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.4),
          border: Border(bottom: BorderSide(color: Colors.white.withValues(alpha: 0.3))),
        ),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ColorFilter.mode(Colors.white.withValues(alpha: 0.4), BlendMode.srcOver),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back, size: 24, color: Color(0xFF1A1C1C)),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(Icons.notifications_none, size: 24, color: Color(0xFF1A1C1C)),
                      ),
                      const SizedBox(width: 16),
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(Icons.search, size: 24, color: Color(0xFF1A1C1C)),
                      ),
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

class _AnalyticsHeader extends StatelessWidget {
  const _AnalyticsHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ANALYTICS DASHBOARD',
          style: AppTypography.interBold.copyWith(color: const Color(0xFFBC0100), fontSize: 10, letterSpacing: 1),
        ),
        const SizedBox(height: 8),
        Text(
          "CHANNEL\nPERFORMANCE",
          style: AppTypography.headlineMedium.copyWith(
            color: const Color(0xFF1A1C1C),
            fontSize: 36,
            fontWeight: FontWeight.w900,
            height: 1.1,
            letterSpacing: -0.9,
          ),
        ),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: const Color(0xFFF3F3F3),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            children: [
              Expanded(
                child: _buildToggleButton('YouTube', isSelected: true),
              ),
              Expanded(
                child: _buildToggleButton('Instagram', isSelected: false),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildToggleButton(String label, {required bool isSelected}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(4),
        boxShadow: isSelected
            ? [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 2, offset: const Offset(0, 1))]
            : [],
      ),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: AppTypography.interBold.copyWith(
          color: isSelected ? const Color(0xFFBC0100) : const Color(0xFF603E39),
          fontSize: 14,
        ),
      ),
    );
  }
}

class _BentoMetricsGrid extends StatelessWidget {
  const _BentoMetricsGrid();

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: 1.2,
      children: const [
        _MetricTile(label: 'SUBSCRIBERS', value: '1.2M', trend: '+12.5%', isPositive: true, icon: Icons.people),
        _MetricTile(label: 'TOTAL VIEWS', value: '24.8M', trend: '+8.2%', isPositive: true, icon: Icons.play_arrow),
        _MetricTile(label: 'ENGAGEMENT', value: '4.2%', trend: '-2.4%', isPositive: false, icon: Icons.favorite),
        _MetricTile(label: 'REVENUE', value: '\$8.4K', trend: '+15.8%', isPositive: true, icon: Icons.monetization_on),
      ],
    );
  }
}

class _MetricTile extends StatelessWidget {
  final String label;
  final String value;
  final String trend;
  final bool isPositive;
  final IconData icon;

  const _MetricTile({
    required this.label,
    required this.value,
    required this.trend,
    required this.isPositive,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1A1C1C).withOpacity(0.04),
            blurRadius: 40,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            right: -10,
            top: -10,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(color: const Color(0xFFBC0100).withOpacity(0.05), shape: BoxShape.circle),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(icon, size: 16, color: const Color(0xFF603E39)),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: isPositive ? const Color(0xFFF0FDF4) : const Color(0xFFFEF2F2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      trend,
                      style: AppTypography.interBold.copyWith(
                        color: isPositive ? const Color(0xFF16A34A) : const Color(0xFFDC2626),
                        fontSize: 10,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                label,
                style: AppTypography.interBold.copyWith(color: const Color(0xFF603E39), fontSize: 10, letterSpacing: 1),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: AppTypography.headlineSmall.copyWith(
                  color: const Color(0xFF1A1C1C),
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -0.6,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PerformanceTrendsChart extends StatelessWidget {
  const _PerformanceTrendsChart();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1A1C1C).withOpacity(0.04),
            blurRadius: 40,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'PERFORMANCE\nTRENDS',
                style: AppTypography.interBold.copyWith(color: const Color(0xFF1A1C1C), fontSize: 20, height: 1.1, letterSpacing: -0.5),
              ),
              const _ChartLegend(),
            ],
          ),
          const SizedBox(height: 32),
          SizedBox(
            height: 240,
            child: Stack(
              children: [
                // Grid Lines
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(4, (_) => Container(height: 1, color: const Color(0xFFF3F3F3))),
                ),
                // Bars
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _buildBar(96, 128),
                    _buildBar(144, 160),
                    _buildBar(80, 112),
                    _buildBar(176, 192),
                    _buildBar(208, 224),
                    _buildBar(160, 176),
                    _buildBar(0, 240, isPlaceholder: true),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              _DayLabel('MON'), _DayLabel('TUE'), _DayLabel('WED'), _DayLabel('THU'), _DayLabel('FRI'), _DayLabel('SAT'), _DayLabel('SUN'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBar(double activeHeight, double totalHeight, {bool isPlaceholder = false}) {
    return Container(
      width: 32,
      height: totalHeight,
      color: isPlaceholder ? Colors.transparent : const Color(0xFFF3F3F3),
      child: isPlaceholder ? null : Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: 32,
          height: activeHeight,
          color: const Color(0xFFBC0100),
        ),
      ),
    );
  }
}

class _ChartLegend extends StatelessWidget {
  const _ChartLegend();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _legendItem('This', 'Period', const Color(0xFFBC0100)),
        const SizedBox(width: 16),
        _legendItem('Last', 'Period', const Color(0xFFE2E2E2)),
      ],
    );
  }

  Widget _legendItem(String p1, String p2, Color color) {
    return Row(
      children: [
        Container(width: 8, height: 12, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(12))),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(p1, style: AppTypography.interMedium.copyWith(color: const Color(0xFF603E39), fontSize: 12, height: 1.0)),
            Text(p2, style: AppTypography.interMedium.copyWith(color: const Color(0xFF603E39), fontSize: 12, height: 1.0)),
          ],
        ),
      ],
    );
  }
}

class _DayLabel extends StatelessWidget {
  final String day;
  const _DayLabel(this.day);

  @override
  Widget build(BuildContext context) {
    return Text(day, style: AppTypography.interBold.copyWith(color: const Color(0xFF603E39), fontSize: 10, letterSpacing: 1));
  }
}

class _TopContentSection extends StatelessWidget {
  const _TopContentSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Top Performing Content',
              style: AppTypography.interBold.copyWith(color: const Color(0xFF1A1C1C), fontSize: 20, letterSpacing: -0.5),
            ),
            Text(
              'View All',
              style: AppTypography.interBold.copyWith(color: const Color(0xFFBC0100), fontSize: 14),
            ),
          ],
        ),
        const SizedBox(height: 24),
        _ContentCard(title: '10 Minimalist Se...', time: 'Published 2 days ago', image: 'assets/b06ec3c2102bef207794b161cd38a5700b40b1dd.png'),
        const SizedBox(height: 16),
        _ContentCard(title: 'Why Everyone i...', time: 'Published 5 days ago', image: 'assets/83f8369195d9002230d2746b50e683c68cec7342.png'),
        const SizedBox(height: 16),
        _ContentCard(title: 'The Problem wi...', time: 'Published 1 week ago', image: 'assets/dd6896b8a35f816af7dfc8ead816b7e89b6baaa0.png'),
      ],
    );
  }
}

class _ContentCard extends StatelessWidget {
  final String title;
  final String time;
  final String image;

  const _ContentCard({required this.title, required this.time, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(17),
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
      child: Row(
        children: [
          Container(
            width: 96,
            height: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTypography.interBold.copyWith(color: const Color(0xFF1A1C1C), fontSize: 16)),
                const SizedBox(height: 4),
                Text(time, style: AppTypography.interMedium.copyWith(color: const Color(0xFF603E39), fontSize: 12)),
              ],
            ),
          ),
          const Icon(Icons.more_vert, size: 16, color: Color(0xFF1A1C1C)),
        ],
      ),
    );
  }
}
