import 'package:flutter/material.dart';
import 'dart:ui';
import '../theme.dart';

class LandscapePlayerScreen extends StatelessWidget {
  const LandscapePlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // For this demo, we'll build it to be cross-platform but optimized for landscape.
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // 1. Cinematic Background
          _buildBackground(),
          
          // 2. Subtle Vignette Overlay
          _buildVignette(),
          
          // 3. Player Overlays Layer
          _buildPlayerOverlays(context),
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return Positioned.fill(
      child: Opacity(
        opacity: 0.6,
        child: Image.asset(
          'assets/landscape_cinematic_bg.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildVignette() {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 1.0,
            colors: [
              Colors.transparent,
              Colors.black.withValues(alpha: 0.8),
            ],
            stops: const [0.4, 1.0],
          ),
        ),
      ),
    );
  }

  Widget _buildPlayerOverlays(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Top Controls
            _buildTopControls(context),
            
            // Center Controls
            _buildCenterControls(),
            
            // Bottom Controls
            _buildBottomControls(),
          ],
        ),
      ),
    );
  }

  Widget _buildTopControls(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
              onPressed: () => Navigator.pop(context),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "NOW PLAYING",
                  style: AppTypography.manropeBold.copyWith(
                    fontSize: 10,
                    color: const Color(0xFFE50914),
                    letterSpacing: 2,
                  ),
                ),
                Text(
                  "Evolution of AI in Design",
                  style: AppTypography.manropeBold.copyWith(
                    fontSize: 14,
                    color: Colors.white.withValues(alpha: 0.8),
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            Icon(Icons.cast, color: Colors.white.withValues(alpha: 0.8), size: 20),
            const SizedBox(width: 24),
            Icon(Icons.closed_caption_outlined, color: Colors.white.withValues(alpha: 0.8), size: 20),
            const SizedBox(width: 24),
            Icon(Icons.more_vert, color: Colors.white.withValues(alpha: 0.8), size: 20),
          ],
        ),
      ],
    );
  }

  Widget _buildCenterControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.replay_10, color: Colors.white.withValues(alpha: 0.8), size: 32),
        const SizedBox(width: 64),
        // Play Button with Glassmorphism
        ClipOval(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.1),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
              ),
              child: const Icon(Icons.play_arrow, color: Colors.white, size: 40),
            ),
          ),
        ),
        const SizedBox(width: 64),
        Icon(Icons.forward_10, color: Colors.white.withValues(alpha: 0.8), size: 32),
      ],
    );
  }

  Widget _buildBottomControls() {
    return Column(
      children: [
        // Time Info
        Row(
          children: [
            RichText(
              text: TextSpan(
                style: AppTypography.interMedium.copyWith(
                  fontSize: 11,
                  color: Colors.white.withValues(alpha: 0.6),
                  letterSpacing: 0.55,
                ),
                children: const [
                  TextSpan(text: "15:30 "),
                  TextSpan(text: "/"),
                  TextSpan(text: " 1:05:10"),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Custom Seekbar
        Stack(
          alignment: Alignment.centerLeft,
          children: [
            Container(
              height: 4,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Container(
              height: 4,
              width: 150, // 34% as per Figma 34.16%
              decoration: BoxDecoration(
                color: const Color(0xFFE50914),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            // Thumb
            Positioned(
              left: 140,
              child: Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  color: const Color(0xFFE50914),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFE50914).withValues(alpha: 0.2),
                      blurRadius: 4,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Action Bar
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.subtitles_outlined, color: Colors.white.withValues(alpha: 0.8), size: 20),
                const SizedBox(width: 24),
                Icon(Icons.speed, color: Colors.white.withValues(alpha: 0.8), size: 20),
                const SizedBox(width: 24),
                Icon(Icons.lock_outline, color: Colors.white.withValues(alpha: 0.8), size: 20),
                const SizedBox(width: 24),
                Icon(Icons.video_library_outlined, color: Colors.white.withValues(alpha: 0.8), size: 20),
              ],
            ),
            Row(
              children: [
                Icon(Icons.aspect_ratio, color: Colors.white.withValues(alpha: 0.8), size: 20),
                const SizedBox(width: 24),
                Icon(Icons.fullscreen, color: Colors.white.withValues(alpha: 0.8), size: 20),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
