import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:edo_app/models/shop.dart';

import 'order.dart';

class OrderList {
  final String id;
  List<Order> order_list;
  Shop shop;
  DateTime validUntilDate;
  int validUntilNumber;
  OrderList({
    this.id,
    this.order_list,
    this.shop,
    this.validUntilDate,
    this.validUntilNumber,
  });

  OrderList copyWith({
    String id,
    List<Order> order_list,
    Shop shop,
    DateTime validUntilDate,
    int validUntilNumber,
  }) {
    return OrderList(
      id: id ?? this.id,
      order_list: order_list ?? this.order_list,
      shop: shop ?? this.shop,
      validUntilDate: validUntilDate ?? this.validUntilDate,
      validUntilNumber: validUntilNumber ?? this.validUntilNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'order_list': order_list?.map((x) => x?.toMap())?.toList(),
      'shop': shop?.toMap(),
      'validUntilDate': validUntilDate?.millisecondsSinceEpoch,
      'validUntilNumber': validUntilNumber,
    };
  }

  factory OrderList.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return OrderList(
      id: map['id'],
      order_list:
          List<Order>.from(map['order_list']?.map((x) => Order.fromMap(x))),
      shop: Shop.fromMap(map['shop']),
      validUntilDate:
          DateTime.fromMillisecondsSinceEpoch(map['validUntilDate']),
      validUntilNumber: map['validUntilNumber'],
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderList.fromJson(String source) =>
      OrderList.fromMap(json.decode(source));

  @override
  String toString() {
    return 'OrderList(id: $id, order_list: $order_list, shop: $shop, validUntilDate: $validUntilDate, validUntilNumber: $validUntilNumber)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is OrderList &&
        o.id == id &&
        listEquals(o.order_list, order_list) &&
        o.shop == shop &&
        o.validUntilDate == validUntilDate &&
        o.validUntilNumber == validUntilNumber;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        order_list.hashCode ^
        shop.hashCode ^
        validUntilDate.hashCode ^
        validUntilNumber.hashCode;
  }
}
