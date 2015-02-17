//
//  RunningMedianTests.m
//  DataStructuresAndAlgorithms
//
//  Created by Alexey Patosin on 17/02/15.
//  Copyright (c) 2015 TestOrg. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "RunningMedian.h"

@interface RunningMedianTests : XCTestCase

@end

@implementation RunningMedianTests

- (void)testExampleOfUsage {
    RunningMedian *median = [RunningMedian new];
    
    NSArray *elements = @[@2,@7,@4,@9,@1,@5,@8,@3,@6];

    [elements enumerateObjectsUsingBlock:^(NSNumber *number, NSUInteger idx, BOOL *stop) {
        [median addNumber:[number integerValue]];
    }];
    
    XCTAssert([median medianNumber] == 5, @"Running median for %@ should be 5", elements);
}

@end
