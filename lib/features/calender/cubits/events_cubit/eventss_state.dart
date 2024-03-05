import 'package:flutter/material.dart';

@immutable
sealed class EventsState {}

final class EventsInitial extends EventsState {}

final class EventsSuccess extends EventsState {}
