class Customer {
  final String password;
  final String mail;

  Customer({required this.mail, required this.password});

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      password: json['password'] ?? '',
      mail: json['mail'] ?? '',
    );
  }
}

class AllDataCustomer {
  final String customerId;
  final String firstName;
  final String lastName;
  final String userName;
  final String password;
  final String mail;
  final String addressId;
  final String orderId;
  final String addressIdFromAddress;
  final String customerIdFromAddress;
  final String district;
  final String neighbourhood;
  final String street;
  final String posCode;
  final String numberOfHome;
  final String address;

  AllDataCustomer({
    required this.customerId,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.password,
    required this.mail,
    required this.addressId,
    required this.orderId,
    required this.addressIdFromAddress,
    required this.customerIdFromAddress,
    required this.district,
    required this.neighbourhood,
    required this.street,
    required this.posCode,
    required this.numberOfHome,
    required this.address,
  });

  factory AllDataCustomer.fromJson(Map<String, dynamic> json) {
    return AllDataCustomer(
      customerId: json['customerId'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      userName: json['userName'] ?? '',
      password: json['password'] ?? '',
      mail: json['mail'] ?? '',
      addressId: json['addressId'] ?? '',
      orderId: json['orderId'] ?? '',
      addressIdFromAddress: json['addressIdFromAddress'] ?? '',
      customerIdFromAddress: json['customerIdFromAddress'] ?? '',
      district: json['district'] ?? '',
      neighbourhood: json['neighbourhood'] ?? '',
      street: json['street'] ?? '',
      posCode: json['posCode'] ?? '',
      numberOfHome: json['numberOfHome'] ?? '',
      address: json['address'] ?? '',
    );
  }
}