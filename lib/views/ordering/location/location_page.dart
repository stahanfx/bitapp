import 'package:bitapp/theme/widgets/elements/text_field_widget.dart';
import 'package:bitapp/views/ordering/delivery/delivery_arguments_models.dart';
import 'package:bitapp/views/ordering/delivery/delivery_page.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:bitapp/theme/styles/color_style.dart';
import 'package:bitapp/theme/styles/font_style.dart';
import 'package:bitapp/views/ordering/location/location_page_model.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  _BasketPageState createState() => _BasketPageState();
}

class _BasketPageState extends State<LocationPage> {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = context.read<LocationPageModel>();
    provider.getLocationList('');

    // final provider = context.watch<LocationPageModel>();
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
          onPressed: () => Navigator.pushNamed(context, 'loader'),
        ),
        title: AppText.b14(
            value: "Выберите город доставки", color: AppColor.black),
      ),
      body: Column(
        children: [
          SizedBox(
            // color: AppColor.black,
            height: 80,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppTextField(
                  controllerValue: textController,
                  hintString: 'Введите город для поиска',
                  onChanged: (text) async {
                    EasyDebounce.debounce(
                        'getLocationList', const Duration(seconds: 1), () {
                      provider.getLocationList(textController.text);
                    });
                  },
                )),
          ),
          Expanded(
            child:
                Consumer<LocationPageModel>(builder: (context, model, child) {
              return ListView.builder(
                padding: const EdgeInsets.all(0),
                itemCount: model.locationModel.length,
                itemBuilder: (BuildContext context, int index) {
                  var location = model.locationModel[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrderDeliveryPage(
                              argument: OrderDeliveryArgument(
                            address: location.address,
                            code: location.code,
                            name: location.name,
                            sort: location.sort,
                          )),
                        ),
                      );
                      // Navigator.pushNamed(context, 'order/delivery',
                      //     arguments: OrderDeliveryArgument(
                      //       address: location.address,
                      //       code: location.code,
                      //       name: location.name,
                      //       sort: location.sort,
                      //     ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 1),
                      child: Container(
                        color: AppColor.white,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText.b12(
                                  value: location.name, color: AppColor.black),
                              AppText.t12(
                                  value: location.address,
                                  color: AppColor.black),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          )
        ],
      ),
    );
  }
}
