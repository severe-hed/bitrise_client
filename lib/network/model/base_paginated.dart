
import 'dart:convert';

class Paginated<T> {
  List<T> data;
  Paging paging;

  Paginated({
    this.data,
    this.paging,
  });
}

class Paging {
  int totalItemCount;
  int pageItemLimit;
  String next;

  Paging({
    this.totalItemCount,
    this.pageItemLimit,
    this.next,
  });

  factory Paging.fromRawJson(String str) => Paging.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Paging.fromJson(Map<String, dynamic> json) => Paging(
    totalItemCount: json["total_item_count"],
    pageItemLimit: json["page_item_limit"],
    next: json["next"],
  );

  Map<String, dynamic> toJson() => {
    "total_item_count": totalItemCount,
    "page_item_limit": pageItemLimit,
    "next": next,
  };
}