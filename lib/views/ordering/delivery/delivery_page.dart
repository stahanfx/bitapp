import 'package:bitapp/core/services/api/basket/basket_model.dart';
import 'package:bitapp/core/services/api/file/image_services.dart';
import 'package:bitapp/core/services/api/order/delivery/delivery_model.dart';
import 'package:bitapp/views/ordering/create/order_arguments_models.dart';
import 'package:bitapp/views/ordering/create/order_create_page.dart';
import 'package:bitapp/views/ordering/create/order_create_page_model.dart';
import 'package:bitapp/views/ordering/delivery/delivery_arguments_models.dart';
import 'package:bitapp/views/ordering/delivery/delivery_page_model.dart';
import 'package:bitapp/views/ordering/payment/payment_arguments_models.dart';
import 'package:bitapp/views/ordering/payment/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:bitapp/theme/styles/color_style.dart';
import 'package:bitapp/theme/styles/font_style.dart';

class OrderDeliveryPage extends StatefulWidget {
  final OrderDeliveryArgument? argument;
  const OrderDeliveryPage({Key? key, required this.argument}) : super(key: key);

  @override
  _OrderDeliveryPageState createState() => _OrderDeliveryPageState();
}

class _OrderDeliveryPageState extends State<OrderDeliveryPage> {
  List<DeliveryItem> deliveryListModel = [];

  Future<void> _getDeliveryModel() async {
    final providerModel = context.watch<OrderDeliveryPageModel>();
    OrderDeliveryArgument argument = widget.argument as OrderDeliveryArgument;
    var deliveryListData =
        await providerModel.getDeliveryList(locationCode: argument.code);
    deliveryListModel += deliveryListData;
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
            Icons.clear,
            color: AppColor.black,
            size: 20,
          ),
          onPressed: () => Navigator.pushNamed(context, 'navigation'),
        ),
        title: AppText.b14(
            value: "Выберите вариант доставки", color: AppColor.black),
      ),
      body: FutureBuilder(
        future: _getDeliveryModel(),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(
                  child: Text('Загрузка способов доставки....'));
            default:
              if (snapshot.hasError) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Text('Error: ${snapshot.error}')),
                );
              } else {
                return ListView.builder(
                  itemCount: deliveryListModel.length,
                  itemBuilder: (BuildContext context, int index) {
                    var model = deliveryListModel[index];
                    return GestureDetector(
                      onTap: () {
                        var createProvider =
                            context.read<OrderCreatePageModel>();
                        createProvider.addDeliveryInfo(
                            deliveryData: DeliveryToCreate(
                                deliveryId: model.id,
                                deliveryName: model.name,
                                deliveryCity: model.period,
                                deliveryPrice: model.price));
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OrderCreatePage(),
                          ),
                        );
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
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            AppText.b12(
                                                value: "Срок: ${model.period}",
                                                color: AppColor.black),
                                            _getPrice(model: model),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
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

Widget _getPrice({required DeliveryItem model}) {
  if (model.price == 0.0) {
    return AppText.b12(value: "Бесплатно", color: AppColor.activeButton);
  } else {
    return AppText.b12(
        value: "${model.price} руб", color: AppColor.activeButton);
  }
}
