//
//  FQuery+RACExtensions.h
//
//  Created by Joe Noon on 2014-10-08.
//  Copyright (c) 2014 Joe Noon. All rights reserved.
//

#import <ReactiveCocoa/ReactiveCocoa.h>
#import <Firebase/FQuery.h>

@interface FQuery (RACExtensions)

/// type FEventTypeValue
/// nexts FDataSnapshot *snapshot or sends error
/// An FDataSnapshot contains data from a Firebase location. Any time you read Firebase data, you receive the data as an FDataSnapshot.
/// FDataSnapshots are passed to the blocks you attach with observeEventType:withBlock: or observeSingleEvent:withBlock:. They are efficiently-generated immutable copies of the data at a Firebase location. They can’t be modified and will never change. To modify data at a location, use a Firebase reference (e.g. with setValue:).
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
