import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'selected_transport_category_bottom_sheet_view_model.dart';
export 'selected_transport_category_bottom_sheet_view_model.dart';

class SelectedTransportCategoryBottomSheetViewWidget extends StatefulWidget {
  const SelectedTransportCategoryBottomSheetViewWidget({Key? key})
      : super(key: key);

  @override
  _SelectedTransportCategoryBottomSheetViewWidgetState createState() =>
      _SelectedTransportCategoryBottomSheetViewWidgetState();
}

class _SelectedTransportCategoryBottomSheetViewWidgetState
    extends State<SelectedTransportCategoryBottomSheetViewWidget> {
  late SelectedTransportCategoryBottomSheetViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(
        context, () => SelectedTransportCategoryBottomSheetViewModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Builder(
        builder: (context) {
          final categoryList = FFAppState().transportationCategoryList.toList();
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: List.generate(categoryList.length, (categoryListIndex) {
                final categoryListItem = categoryList[categoryListIndex];
                return Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 32.0, 16.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      Navigator.pop(context);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(0.0),
                          child: Image.asset(
                            'assets/images/Transport-bus.png',
                            height: 42.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            getJsonField(
                              categoryListItem,
                              r'''$.name''',
                            ).toString(),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).addToEnd(SizedBox(height: 16.0)),
            ),
          );
        },
      ),
    );
  }
}
