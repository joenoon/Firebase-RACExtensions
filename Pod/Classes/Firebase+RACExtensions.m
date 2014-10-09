//
//  Firebase+RACExtensions.m
//
//  Created by Joe Noon on 2014-10-08.
//  Copyright (c) 2014 Joe Noon. All rights reserved.
//

#import "Firebase+RACExtensions.h"

@implementation Firebase (RACExtensions)

- (RACSignal *)rac_authWithCustomTokenSignal:(NSString *)token {
  return [[RACSignal createSignal:^(id<RACSubscriber> subscriber) {
    __block FirebaseHandle handle;
    __block BOOL disposed = NO;
    NSError *noAuthDataError = [NSError errorWithDomain:@"noAuthDataError" code:0 userInfo:nil];
    [self authWithCustomToken:token withCompletionBlock:^(NSError *error, FAuthData *authData) {
      if (error) {
        [subscriber sendError:error];
      }
      if (!disposed) {
        handle = [self observeAuthEventWithBlock:^(FAuthData *authData) {
          if (authData) {
            [subscriber sendNext:authData];
          } else {
            [subscriber sendError:noAuthDataError];
          }
        }];
      }
    }];
    return [RACDisposable disposableWithBlock:^{
      disposed = YES;
      if (handle) {
        [self removeAuthEventObserverWithHandle:handle];
      }
    }];
  }] setNameWithFormat:@"rac_authWithCustomTokenSignal"];
}

@end
