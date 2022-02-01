import 'package:bitapp/core/services/api/file/image_services.dart';
import 'package:bitapp/core/services/api/order/payment/payment_model.dart';
import 'package:bitapp/views/ordering/create/order_arguments_models.dart';
import 'package:bitapp/views/ordering/create/order_create_page_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:bitapp/theme/styles/color_style.dart';
import 'package:bitapp/theme/styles/font_style.dart';

import 'payment_arguments_models.dart';
import 'payment_page_model.dart';

class OrderPaymentPage extends StatefulWidget {
  final OrderPaymentArgument? argument;
  const OrderPaymentPage({Key? key, required this.argument}) : super(key: key);

  @override
  _OrderPaymentPageState createState() => _OrderPaymentPageState();
}

class _OrderPaymentPageState extends State<OrderPaymentPage> {
  List<PaymentItem> paymentListModel = [];

  Future<void> _getPaymentModel() async {
    final providerModel = context.watch<OrderPaymentPageModel>();
    OrderPaymentArgument argument = widget.argument as OrderPaymentArgument;
    var paymentListData =
        await providerModel.getPaymentList(deliveryId: argument.deliveryCode);
    paymentListModel += paymentListData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.backgroun,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(FontAwesomeIcons.question)),
        ],
        leading: IconButton(
          icon: Icon(
            FontAwesomeIcons.arrowLeft,
            color: AppColor.black,
            size: 20,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: AppText.b14(
            value: "Выберите вариант оплаты", color: AppColor.black),
      ),
      body: FutureBuilder(
        future: _getPaymentModel(),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: Text('Загрузка способов оплаты...'));
            default:
              if (snapshot.hasError) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Text('Error: ${snapshot.error}')),
                );
              } else {
                //
                return ListView.builder(
                  itemCount: paymentListModel.length,
                  itemBuilder: (BuildContext context, int index) {
                    var model = paymentListModel[index];
                    return GestureDetector(
                      onTap: () {
                        var providerOrderCreate =
                            context.read<OrderCreatePageModel>();
                        providerOrderCreate.addPaymentInfo(
                            paymentData: PaymentToCreate(
                          paymentId: model.id,
                          paymentName: model.name,
                          paymentDescription: model.description,
                          paymentLogo: model.logo,
                        ));
                        Navigator.pushNamed(context, 'order');
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 2),
                        child: Container(
                          color: AppColor.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: 80,
                                    height: 50,
                                    child: GetImageApi(image: model.logo),
                                  ),
                                ),
                                SizedBox(
                                  width: 250,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppText.b12(
                                          value: model.name,
                                          color: AppColor.black),
                                      AppText.t12(
                                          value: model.description,
                                          color: AppColor.black),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
          }
        },
      ),
    );
  }
}
