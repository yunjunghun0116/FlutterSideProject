class Book {
  final String title;
  final String contents;
  final String url;
  final String isbn;
  final String datetime;
  final List authors;
  final String publisher;
  final int price;
  final int salePrice;
  final String thumbnail;
  final String status;

  Book({
    required this.title,
    required this.contents,
    required this.url,
    required this.isbn,
    required this.datetime,
    required this.authors,
    required this.publisher,
    required this.price,
    required this.salePrice,
    required this.thumbnail,
    required this.status,
  });

  factory Book.fromJson(json) => Book(
        title: json['title'],
        contents: json['contents'],
        url: json['url'],
        isbn: json['isbn'].length>14?json['isbn'].split(' ')[1]:json['isbn'],
        datetime: json['datetime'],
        authors: json['authors'],
        publisher: json['publisher'],
        price: json['price'],
        salePrice: json['sale_price'],
        thumbnail: json['thumbnail'],
        status: json['status'],
      );
}
