//
//  Generated code. Do not modify.
//  source: helloworld.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'helloworld.pb.dart' as $0;

export 'helloworld.pb.dart';

@$pb.GrpcServiceName('helloworld.Greeter')
class GreeterClient extends $grpc.Client {
  static final _$sayHello = $grpc.ClientMethod<$0.HelloRequest, $0.HelloReply>(
      '/helloworld.Greeter/SayHello',
      ($0.HelloRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.HelloReply.fromBuffer(value));
  static final _$sayHelloAagain = $grpc.ClientMethod<$0.HelloRequest, $0.HelloReply>(
      '/helloworld.Greeter/SayHelloAagain',
      ($0.HelloRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.HelloReply.fromBuffer(value));

  GreeterClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.HelloReply> sayHello($0.HelloRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sayHello, request, options: options);
  }

  $grpc.ResponseFuture<$0.HelloReply> sayHelloAagain($0.HelloRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sayHelloAagain, request, options: options);
  }
}

@$pb.GrpcServiceName('helloworld.Greeter')
abstract class GreeterServiceBase extends $grpc.Service {
  $core.String get $name => 'helloworld.Greeter';

  GreeterServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.HelloRequest, $0.HelloReply>(
        'SayHello',
        sayHello_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.HelloRequest.fromBuffer(value),
        ($0.HelloReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.HelloRequest, $0.HelloReply>(
        'SayHelloAagain',
        sayHelloAagain_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.HelloRequest.fromBuffer(value),
        ($0.HelloReply value) => value.writeToBuffer()));
  }

  $async.Future<$0.HelloReply> sayHello_Pre($grpc.ServiceCall $call, $async.Future<$0.HelloRequest> $request) async {
    return sayHello($call, await $request);
  }

  $async.Future<$0.HelloReply> sayHelloAagain_Pre($grpc.ServiceCall $call, $async.Future<$0.HelloRequest> $request) async {
    return sayHelloAagain($call, await $request);
  }

  $async.Future<$0.HelloReply> sayHello($grpc.ServiceCall call, $0.HelloRequest request);
  $async.Future<$0.HelloReply> sayHelloAagain($grpc.ServiceCall call, $0.HelloRequest request);
}
