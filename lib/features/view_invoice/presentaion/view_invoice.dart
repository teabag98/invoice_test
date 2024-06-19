import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoice/core/size_config.dart';
import 'package:invoice/features/create_invoice/presentaion/create_invoice.dart';
import 'package:invoice/features/view_invoice/data/model.dart';
import 'package:invoice/features/view_invoice/domain/repositor.dart';
import 'package:invoice/features/view_invoice/presentaion/view_invoice_details.dart';

class ViewIncoice extends StatefulWidget {
  const ViewIncoice({super.key});

  @override
  State<ViewIncoice> createState() => _ViewIncoiceState();
}

class _ViewIncoiceState extends State<ViewIncoice> {
  List<InvoiceModel> data = [];

  //injec repo make it accesible in view
  final repo = Get.put(Repository());

  @override
  void initState() {
    // TODO: implement initState
    data.addAll(repo.getInvoice());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = SizeConfig().size(context);

    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          width: size.width * 0.7,
          height: size.height,
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      border: Border.all(color: Colors.grey.shade200)),
                  child: ListTile(
                    onTap: () => Get.to(ViewInvoiceDetails(data: data[index])),
                    title: Text(
                      'Client : ${data[index].clientName.toString()}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Created On : ${data[index].invoiceDate.toString()}',
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: size.width * 0.2,
        child: FloatingActionButton(
          onPressed: () {
            Get.to(const CreateInvoice());
          },
          child: const Text('Create Invoice'),
        ),
      ),
    );
  }
}
