class InvoiceModel {
  String description;
  int quantity;
  double price;
  double taxes;
  double totals;
  String clientName;
  String invoiceDate;

  InvoiceModel(
      {required this.description,
      required this.quantity,
      required this.price,
      required this.taxes,
      required this.totals,
      required this.invoiceDate,
      required this.clientName});
}
