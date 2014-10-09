//
//  Firebase+RACExtensions.h
//
//  Created by Joe Noon on 2014-10-08.
//  Copyright (c) 2014 Joe Noon. All rights reserved.
//

#import <ReactiveCocoa/ReactiveCocoa.h>
#import <Firebase/Firebase.h>
#import <Firebase/FAuthData.h>

@interface Firebase (RACExtensions)

// will sendNext with authData or error
- (RACSignal *)rac_authWithCustomTokenSignal:(NSString *)token;

@end
