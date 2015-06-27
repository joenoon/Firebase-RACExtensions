//
//  FQuery+RACExtensions.m
//
//  Created by Joe Noon on 2014-10-08.
//  Copyright (c) 2014 Joe Noon. All rights reserved.
//

#import "FQuery+RACExtensions.h"

@implementation FQuery (RACExtensions)

- (RACSignal *)rac_valueSignal {
  return [[RACSignal createSignal:^(id<RACSubscriber> subscriber) {
    FirebaseHandle handle = [self observeEventType:FEventTypeValue withBlock:^(FDataSnapshot *snapshot) {
      [subscriber sendNext:snapshot];
    } withCancelBlock:^(NSError *error) {
      [subscriber sendError:error];
    }];
    return [RACDisposable disposableWithBlock:^{
      [self removeObserverWithHandle:handle];
    }];
  }] setNameWithFormat:@"rac_valueSignal"];
}

- (RACSignal *)rac_addedSignal {
  return [[RACSignal createSignal:^(id<RACSubscriber> subscriber) {
    FirebaseHandle handle = [self observeEventType:FEventTypeChildAdded andPreviousSiblingKeyWithBlock:^(FDataSnapshot *snapshot, NSString *prevName) {
      [subscriber sendNext:RACTuplePack(snapshot, prevName)];
    } withCancelBlock:^(NSError *error) {
      [subscriber sendError:error];
    }];
    return [RACDisposable disposableWithBlock:^{
      [self removeObserverWithHandle:handle];
    }];
  }] setNameWithFormat:@"rac_addedSignal"];
}


- (RACSignal *)rac_movedSignal {
  return [[RACSignal createSignal:^(id<RACSubscriber> subscriber) {
    FirebaseHandle handle = [self observeEventType:FEventTypeChildMoved andPreviousSiblingKeyWithBlock:^(FDataSnapshot *snapshot, NSString *prevName) {
      [subscriber sendNext:RACTuplePack(snapshot, prevName)];
    } withCancelBlock:^(NSError *error) {
      [subscriber sendError:error];
    }];
    return [RACDisposable disposableWithBlock:^{
      [self removeObserverWithHandle:handle];
    }];
  }] setNameWithFormat:@"rac_movedSignal"];
}

- (RACSignal *)rac_changedSignal {
  return
    
    [[RACSignal createSignal:^(id<RACSubscriber> subscriber) {
        FirebaseHandle handle = [self observeEventType:FEventTypeChildChanged andPreviousSiblingKeyWithBlock:^(FDataSnapshot *snapshot, NSString *prevName) {
              [subscriber sendNext:RACTuplePack(snapshot, prevName)];
        }
                                       withCancelBlock:^(NSError *error) {
                                          [subscriber sendError:error];
                                        }];
        
        return [RACDisposable disposableWithBlock:^{
          [self removeObserverWithHandle:handle];
        }];
        
      }] setNameWithFormat:@"rac_changedSignal"];
}

- (RACSignal *)rac_removedSignal {
  return [[RACSignal createSignal:^(id<RACSubscriber> subscriber) {
    FirebaseHandle handle = [self observeEventType:FEventTypeChildRemoved withBlock:^(FDataSnapshot *snapshot) {
      [subscriber sendNext:snapshot];
    } withCancelBlock:^(NSError *error) {
      [subscriber sendError:error];
    }];
    return [RACDisposable disposableWithBlock:^{
      [self removeObserverWithHandle:handle];
    }];
  }] setNameWithFormat:@"rac_removedSignal"];
}

@end
