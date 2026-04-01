import 'package:flutter/material.dart';
import 'screens/onboarding_hero_screen.dart';
import 'screens/onboarding_steps_screen.dart';
import 'screens/onboarding_growth_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/otp_screen.dart';
import 'screens/address_setup_screen.dart';
import 'screens/niche_selection_screen.dart';
import 'screens/identity_verification_screen.dart';
import 'screens/youtube_connect_screen.dart';
import 'main_scaffold.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String _currentRoute = 'onboarding';

  void _navigateTo(String route) {
    setState(() {
      _currentRoute = route;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Creator Box',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF9F9F9),
      ),
      home: _buildCurrentScreen(),
    );
  }

  Widget _buildCurrentScreen() {
    switch (_currentRoute) {
      case 'onboarding':
        return OnboardingFlow(
          onFinish: () => _navigateTo('login'),
          onLogin: () => _navigateTo('login'),
        );
      case 'login':
        return LoginScreen(
          onLogin: () => _navigateTo('home'),
          onCreateAccount: () => _navigateTo('signup'),
          onBack: () => _navigateTo('onboarding'),
        );
      case 'signup':
        return SignupScreen(
          onSignup: () => _navigateTo('otp'),
          onBack: () => _navigateTo('login'),
        );
      case 'otp':
        return OtpScreen(
          onVerify: () => _navigateTo('address_setup'),
          onBack: () => _navigateTo('signup'),
        );
      case 'address_setup':
        return AddressSetupScreen(
          onContinue: () => _navigateTo('niche_selection'),
          onBack: () => _navigateTo('otp'),
        );
      case 'niche_selection':
        return NicheSelectionScreen(
          onContinue: () => _navigateTo('identity_verification'),
          onBack: () => _navigateTo('address_setup'),
        );
      case 'identity_verification':
        return IdentityVerificationScreen(
          onContinue: () => _navigateTo('youtube_connect'),
          onBack: () => _navigateTo('niche_selection'),
        );
      case 'youtube_connect':
        return YoutubeConnectScreen(
          onConnect: () => _navigateTo('home'),
          onSkip: () => _navigateTo('home'),
          onBack: () => _navigateTo('identity_verification'),
          onContinue: () => _navigateTo('home'),
        );
      case 'home':
        return const MainScaffold();
      default:
        return OnboardingFlow(
          onFinish: () => _navigateTo('login'),
          onLogin: () => _navigateTo('login'),
        );
    }
  }
}

class OnboardingFlow extends StatefulWidget {
  final VoidCallback onFinish;
  final VoidCallback onLogin;

  const OnboardingFlow({
    super.key,
    required this.onFinish,
    required this.onLogin,
  });

  @override
  State<OnboardingFlow> createState() => _OnboardingFlowState();
}

class _OnboardingFlowState extends State<OnboardingFlow> {
  final PageController _pageController = PageController();

  void _nextPage() {
    if (_pageController.hasClients && _pageController.page == 2) {
      widget.onFinish();
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        OnboardingHeroScreen(
          onContinue: _nextPage,
          onSkip: widget.onFinish,
        ),
        OnboardingStepsScreen(
          onContinue: _nextPage,
          onSkip: widget.onFinish,
          onBack: _previousPage,
        ),
        OnboardingGrowthScreen(
          onGetStarted: widget.onFinish,
          onLogin: widget.onLogin,
          onSkip: widget.onFinish,
          onBack: _previousPage,
        ),
      ],
    );
  }
}

