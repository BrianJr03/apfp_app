import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_youtube_player.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExerciseVideoWidget extends StatefulWidget {
  ExerciseVideoWidget({Key key}) : super(key: key);

  @override
  _ExerciseVideoWidgetState createState() => _ExerciseVideoWidgetState();
}

class _ExerciseVideoWidgetState extends State<ExerciseVideoWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15, 25, 15, 0),
              child: InkWell(
                onTap: () async {
                  await Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.leftToRight,
                      duration: Duration(milliseconds: 125),
                      reverseDuration: Duration(milliseconds: 125),
                      child: NavBarPage(initialPage: 'AtHomeExercises'),
                    ),
                  );
                },
                child: Text(
                  '< Back to All Videos',
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Open Sans',
                    color: FlutterFlowTheme.secondaryColor,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 25, 10, 0),
              child: FlutterFlowYoutubePlayer(
                url: 'https://www.youtube.com/watch?v=O4zR9E5R0uQ&t=1s',
                autoPlay: false,
                looping: true,
                mute: false,
                showControls: true,
                showFullScreen: true,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15, 25, 15, 0),
              child: Text(
                'Example Video Title',
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Open Sans',
                  color: FlutterFlowTheme.primaryColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 0),
              child: Text(
                'Video source',
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Open Sans',
                  color: FlutterFlowTheme.primaryColor,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15, 5, 15, 0),
              child: Text(
                'Type of exercise',
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Open Sans',
                  color: FlutterFlowTheme.primaryColor,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15, 5, 15, 0),
              child: Text(
                'Difficulty: example',
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Open Sans',
                  color: FlutterFlowTheme.primaryColor,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 0),
              child: Text(
                'Description',
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Open Sans',
                  color: FlutterFlowTheme.primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15, 5, 15, 0),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam cursus eu arcu vitae mattis. Nullam sed gravida odio, nec ullamcorper justo. Ut ut finibus mauris. ',
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Open Sans',
                  color: FlutterFlowTheme.primaryColor,
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
