class RequestBillingAddress {
  final String country;
  final String city;
  final String street;
  final String apartment;
  final String postcode;

  RequestBillingAddress({
    required this.country,
    required this.city,
    required this.street,
    required this.apartment,
    required this.postcode,
  });

  Map<String, dynamic> toApi() => {
        'country': country,
        'city': city,
        'street': street,
        'apartment': apartment,
        'postcode': postcode,
      };
}
