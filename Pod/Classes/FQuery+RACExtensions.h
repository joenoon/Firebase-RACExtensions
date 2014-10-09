//
//  FQuery+RACExtensions.h
//
//  Created by Joe Noon on 2014-10-08.
//  Copyright (c) 2014 Joe Noon. All rights reserved.
//

#import <ReactiveCocoa/ReactiveCocoa.h>
#import <Firebase/FQuery.h>

@interface FQuery (RACExtensions)

// type FEventTypeValue
// nexts FDataSnapshot *snapshot or sends error
- (RACSignal *)rac_valueSignal;

// type FEventTypeChildAdded
// nexts RACTuplePack(FDataSnapshot *snapshot, NSString *prevName) or sends error
- (RACSignal *)rac_addedSignal;

// type FEventTypeChildMoved
// nexts RACTuplePack(FDataSnapshot *snapshot, NSString *prevName) or sends error
- (RACSignal *)rac_movedSignal;

// type FEventTypeChildChanged
// nexts RACTuplePack(FDataSnapshot *snapshot, NSString *prevName) or sends error
- (RACSignal *)rac_changedSignal;

// type FEventTypeChildRemoved
// nexts FDataSnapshot *snapshot or sends error
- (RACSignal *)rac_removedSignal;

@end
