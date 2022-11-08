import 'dart:async';
import 'dart:io';
import 'dart:math' as math;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:nusacation/bloc/blocs.dart';
import 'package:nusacation/services/services.dart';
import 'package:nusacation/shared/shared.dart';
import 'package:nusacation/widgets/monitor_card.dart';



import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';


import 'package:path/path.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:nusacation/models/models.dart';

part 'get_started_page.dart';
part 'splash_page.dart';
part 'account_confirmation_page.dart';

part 'sign_in_page.dart';
part 'sign_up_page.dart';

part 'menu_page.dart';
part 'main_page.dart';

part 'edit_profile.dart';
part 'profile_page.dart';





part 'wrapper.dart';

