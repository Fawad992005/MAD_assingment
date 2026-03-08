import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/app_constants.dart';
import '../models/destination_model.dart';
import '../widgets/destination_widgets.dart';

class DestinationProfileScreen extends StatelessWidget {
  final DestinationModel destination;

  const DestinationProfileScreen({super.key, this.destination = lagoDiBraies});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left_rounded, size: 28),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: Text('Destination Profile', style: AppTextStyles.appBarTitle),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.share_rounded, size: 22),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: AppColors.background,
      body: _DestinationBody(destination: destination),
    );
  }
}

class _DestinationBody extends StatelessWidget {
  final DestinationModel destination;
  const _DestinationBody({required this.destination});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _HeroBlock(destination: destination),

          _ContentSection(destination: destination),
        ],
      ),
    );
  }
}

class _HeroBlock extends StatelessWidget {
  final DestinationModel destination;
  const _HeroBlock({required this.destination});

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.42,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          _HeroImage(imageUrl: destination.imageUrl),

          const _HeroGradientOverlay(),

          // Positioned(
          //   top: topPadding + AppSpacing.sm,
          //   left: 0,
          //   right: 0,
          //   child: _TopBar(),
          // ),
          Positioned(
            left: AppSpacing.md,
            right: AppSpacing.md,
            bottom: AppSpacing.lg,
            child: Text(
              destination.name,
              style: AppTextStyles.destinationTitle,
            ),
          ),
          Positioned(
            top: topPadding + AppSpacing.sm + 8,
            right: AppSpacing.md,
            child: FavouriteButton(initialState: destination.isFavourite),
          ),
        ],
      ),
    );
  }
}

class _HeroImage extends StatelessWidget {
  final String imageUrl;
  const _HeroImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      fit: BoxFit.cover,

      frameBuilder: (context, child, frame, wasSync) {
        if (wasSync) return child;
        return AnimatedOpacity(
          opacity: frame == null ? 0 : 1,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeOut,
          child: child,
        );
      },

      errorBuilder: (_, __, ___) => Container(
        color: AppColors.surface,
        child: const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.image_not_supported_outlined,
                color: AppColors.textHint,
                size: 48,
              ),
              SizedBox(height: AppSpacing.sm),
              Text(
                'Image unavailable',
                style: TextStyle(color: AppColors.textHint, fontSize: 13),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeroGradientOverlay extends StatelessWidget {
  const _HeroGradientOverlay();

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.45, 1.0],
            colors: [AppColors.heroOverlayStart, AppColors.heroOverlayEnd],
          ),
        ),
      ),
    );
  }
}

class _ContentSection extends StatelessWidget {
  final DestinationModel destination;
  const _ContentSection({required this.destination});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.md,
        AppSpacing.lg,
        AppSpacing.md,
        AppSpacing.lg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _StatsRow(destination: destination),

          const SizedBox(height: AppSpacing.xl),

          const SectionHeading(title: 'Overview'),
          const SizedBox(height: AppSpacing.md),
          Text(destination.overviewText, style: AppTextStyles.body),

          const SizedBox(height: AppSpacing.md),

          LocationRow(location: destination.location),

          const SizedBox(height: AppSpacing.xl + AppSpacing.sm),

          PrimaryButton(label: 'Book Now', onTap: () {}),

          const SizedBox(height: AppSpacing.md),

          Center(
            child: GestureDetector(
              onTap: () {},
              child: const Text(
                'View Terms and Conditions',
                style: AppTextStyles.termsLink,
              ),
            ),
          ),

          SizedBox(
            height: MediaQuery.of(context).padding.bottom + AppSpacing.md,
          ),
        ],
      ),
    );
  }
}

class _StatsRow extends StatelessWidget {
  final DestinationModel destination;
  const _StatsRow({required this.destination});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        StatPill(
          icon: Icons.location_on_outlined,
          value: destination.distanceKm,
        ),
        const SizedBox(width: AppSpacing.sm),
        StatPill(
          icon: Icons.access_time_rounded,
          value: destination.durationHrs,
        ),
        const SizedBox(width: AppSpacing.sm),
        StatPill(
          icon: Icons.account_balance_wallet_outlined,
          value: destination.priceUsd,
        ),
      ],
    );
  }
}
