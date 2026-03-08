import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class StatPill extends StatelessWidget {
  final IconData icon;
  final String value;

  const StatPill({super.key, required this.icon, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: AppSpacing.md,
          horizontal: AppSpacing.sm,
        ),
        decoration: BoxDecoration(
          color: AppColors.statCard,
          borderRadius: BorderRadius.circular(AppRadius.md),
          border: Border.all(color: AppColors.border, width: 1),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: AppColors.primaryLight, size: 22),
            const SizedBox(height: AppSpacing.sm),
            Text(value, style: AppTextStyles.statValue),
          ],
        ),
      ),
    );
  }
}

class FavouriteButton extends StatefulWidget {
  final bool initialState;
  const FavouriteButton({super.key, this.initialState = false});

  @override
  State<FavouriteButton> createState() => _FavouriteButtonState();
}

class _FavouriteButtonState extends State<FavouriteButton>
    with SingleTickerProviderStateMixin {
  late bool _isFav;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _isFav = widget.initialState;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      lowerBound: 0.85,
      upperBound: 1.0,
      value: 1.0,
    );
    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _toggle() async {
    await _controller.reverse();
    setState(() => _isFav = !_isFav);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggle,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.18),
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white.withOpacity(0.5),
              width: 1.2,
            ),
          ),
          child: Icon(
            _isFav ? Icons.favorite_rounded : Icons.favorite_border_rounded,
            color: _isFav ? Colors.redAccent : Colors.white,
            size: 20,
          ),
        ),
      ),
    );
  }
}

class SectionHeading extends StatelessWidget {
  final String title;
  const SectionHeading({super.key, required this.title});

  @override
  Widget build(BuildContext context) =>
      Text(title, style: AppTextStyles.sectionHeading);
}

class LocationRow extends StatelessWidget {
  final String location;
  const LocationRow({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.location_on_outlined,
          size: 15,
          color: AppColors.textSecondary,
        ),
        const SizedBox(width: 4),
        Text(location, style: AppTextStyles.locationText),
      ],
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const PrimaryButton({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 0,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.pill),
          ),
        ),
        child: Text(label, style: AppTextStyles.ctaLabel),
      ),
    );
  }
}
