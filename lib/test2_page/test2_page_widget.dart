import '/components/loading_view_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'test2_page_model.dart';
export 'test2_page_model.dart';

class Test2PageWidget extends StatefulWidget {
  const Test2PageWidget({Key? key}) : super(key: key);

  @override
  _Test2PageWidgetState createState() => _Test2PageWidgetState();
}

class _Test2PageWidgetState extends State<Test2PageWidget> {
  late Test2PageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Test2PageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 3000));
      setState(() {
        _model.isLoading = false;
      });
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.chevron_left_rounded,
                color: FlutterFlowTheme.of(context).primary,
                size: 30.0,
              ),
              onPressed: () async {
                context.pop();
              },
            ),
            title: Text(
              'Test2Page',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Kanit',
                    color: FlutterFlowTheme.of(context).primary,
                    fontSize: 22.0,
                  ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 3.0,
          ),
          body: SafeArea(
            top: true,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FlutterFlowDropDown<String>(
                        controller: _model.dropDownValueController ??=
                            FormFieldController<String>(
                          _model.dropDownValue ??= 'Option 2',
                        ),
                        options: ['Option 1', 'Option 2', 'Option 3'],
                        onChanged: (val) =>
                            setState(() => _model.dropDownValue = val),
                        width: 300.0,
                        height: 50.0,
                        textStyle: FlutterFlowTheme.of(context).bodyMedium,
                        hintText: 'Please select...',
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        elevation: 2.0,
                        borderColor: FlutterFlowTheme.of(context).alternate,
                        borderWidth: 2.0,
                        borderRadius: 8.0,
                        margin: EdgeInsetsDirectional.fromSTEB(
                            16.0, 4.0, 16.0, 4.0),
                        hidesUnderline: true,
                        isSearchable: false,
                      ),
                      Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            visualDensity: VisualDensity.compact,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                          unselectedWidgetColor:
                              FlutterFlowTheme.of(context).secondaryText,
                        ),
                        child: Checkbox(
                          value: _model.checkboxValue ??= true,
                          onChanged: (newValue) async {
                            setState(() => _model.checkboxValue = newValue!);

                            if (!newValue!) {
                              setState(() {
                                _model.dropDownValueController?.value =
                                    'Option 1';
                              });
                            }
                          },
                          activeColor: FlutterFlowTheme.of(context).primary,
                          checkColor: FlutterFlowTheme.of(context).info,
                        ),
                      ),
                    ],
                  ),
                ),
                if (_model.isLoading)
                  wrapWithModel(
                    model: _model.loadingViewModel,
                    updateCallback: () => setState(() {}),
                    child: LoadingViewWidget(),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
