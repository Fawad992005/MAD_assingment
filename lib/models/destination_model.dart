class DestinationModel {
  final String name;
  final String location;
  final String imageUrl;
  final String distanceKm;
  final String durationHrs;
  final String priceUsd;
  final String overviewText;
  final bool isFavourite;

  const DestinationModel({
    required this.name,
    required this.location,
    required this.imageUrl,
    required this.distanceKm,
    required this.durationHrs,
    required this.priceUsd,
    required this.overviewText,
    this.isFavourite = false,
  });
}

const lagoDiBraies = DestinationModel(
  name: 'Lago di Braies',
  location: 'South Tyrol, Italy',
  imageUrl:
      'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?w=900&q=85',
  distanceKm: '120 km',
  durationHrs: '2.5 hrs',
  priceUsd: '\$45.00',
  overviewText:
      'Experience the heart of the Dolomites. Lago di Braies is one of'
      ' the most beautiful lakes in South Tyrol, Italy. Famous for its'
      ' crystal clear emerald waters and the impressive mountain backdrop'
      ' of the Seekofel.',
  isFavourite: false,
);
