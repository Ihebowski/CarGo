class Car {
  late String id;
  late String brandId;
  late String carHighlight;
  //basicInformation
  late String carImage;
  late String carBrand;
  late String carModel;
  late String carMileage;
  late String yearManufacture;
  late String carType;
  late String transmissionType;
  late String fuelType;
  late String carColor;
  //performanceCapacity
  late String horsepower;
  late String fuelEfficiency;
  late String seatingCapacity;
  late String trunkSpace;
  //pricingAvailability
  late bool availability;
  late String rentalPrice;

  Car();

  Car.required({
    required this.id,
    required this.brandId,
    required this.carHighlight,
    required this.carImage,
    required this.carBrand,
    required this.carModel,
    required this.carMileage,
    required this.yearManufacture,
    required this.carType,
    required this.transmissionType,
    required this.fuelType,
    required this.carColor,
    required this.horsepower,
    required this.fuelEfficiency,
    required this.seatingCapacity,
    required this.trunkSpace,
    required this.rentalPrice,
    required this.availability,
  });

  factory Car.fromMap(Map<String, dynamic> data, String id) {
    return Car.required(
      id: id,
      brandId: data['brandId'],
      carHighlight: data['carHighlight'],
      carImage: data['basicInformation']['carImage'],
      carBrand: data['basicInformation']['carBrand'],
      carModel: data['basicInformation']['carModel'],
      carMileage: data['basicInformation']['carMileage'],
      yearManufacture: data['basicInformation']['yearManufacture'],
      carType: data['basicInformation']['carType'],
      transmissionType: data['basicInformation']['transmissionType'],
      fuelType: data['basicInformation']['fuelType'],
      carColor: data['basicInformation']['carColor'],
      horsepower: data['performanceCapacity']['horsepower'],
      fuelEfficiency: data['performanceCapacity']['fuelEfficiency'],
      seatingCapacity: data['performanceCapacity']['seatingCapacity'],
      trunkSpace: data['performanceCapacity']['trunkSpace'],
      rentalPrice: data['pricingAvailability']['rentalPrice'],
      availability: data['pricingAvailability']['availability'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'brandId': brandId,
      'carHighlight': carHighlight,
      'basicInformation': {
        'carImage': carImage,
        'carBrand': carBrand,
        'carModel': carModel,
        'carMileage': carMileage,
        'yearManufacture': yearManufacture,
        'carType': carType,
        'transmissionType': transmissionType,
        'fuelType': fuelType,
        'carColor': carColor,
      },
      'performanceCapacity': {
        'horsepower': horsepower,
        'fuelEfficiency': fuelEfficiency,
        'seatingCapacity': seatingCapacity,
        'trunkSpace': trunkSpace,
      },
      'pricingAvailability': {
        'availability': availability,
        'rentalPrice': rentalPrice,
      },
    };
  }
}
