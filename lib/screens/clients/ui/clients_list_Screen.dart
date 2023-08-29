import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_flutter/api/Status.dart';
import 'package:my_flutter/models/clients/client_data_response.dart';
import 'package:my_flutter/screens/clients/clients_view_model.dart';
import 'package:my_flutter/screens/clients/widgets/list_Items.dart';

import '../../../widgets/common_text_field.dart';
import '../../splace/viewmodel/input_url_viewmodel.dart';

class ClientsScreen extends StatefulWidget {
  const ClientsScreen({Key? key}) : super(key: key);

  @override
  State<ClientsScreen> createState() => _ClientsScreenState();
}

class _ClientsScreenState extends State<ClientsScreen> {

  final _viewModel  = Get.put(ClientsViewModel());
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _viewModel.initialApi(context);
    isLoading = false;
    _scrollController.addListener(() {
      if (!isLoading && _scrollController.position.pixels == _scrollController.position.maxScrollExtent){
          // Perform event when user reach at the end of list (e.g. do Api call)
          _viewModel.getClients(context);
      }
    });

  }

  TextEditingController searchController = TextEditingController();
  ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    print(" clientbuild");
   return GetBuilder<ClientsViewModel>(
        init: ClientsViewModel(),
    builder: (viewModel){

      return  Container(
        color: Colors.white,
        child: Column(
          children: [
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(child: CommonTextField(controller: searchController,isPassword: false,hint: "Search",label: "",)),
                  Container(
                    width: 1,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    color: Colors.grey[300],
                  ),
                  Icon(Icons.filter_list,size: 32,)
                ],
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              height: 1,
              color: Colors.grey[300],
            ),
            ////Header Ends
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: viewModel.clients.status == Status.COMPLETED ? returnSize(viewModel.clients.data) : 0,
                itemBuilder: (BuildContext context, int index) {
                  return ClientListItems(getData(viewModel.clients.data)![index]);
                },
              ),
            )


          ],
        ),
      );
    });


  }

  int? returnSize(ClientsDataResponse data){
    print("Size : ${data.data?.length}");
   return data.data?.length;
  }

   List<Data>? getData(ClientsDataResponse data){
     return data.data;
   }
}
