//
//  MinHeapTests.m
//  DataStructuresAndAlgorithms
//
//  Created by Alexey Patosin on 15/02/15.
//  Copyright (c) 2015 TestOrg. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "MinHeap.h"

@interface MinHeapTests : XCTestCase

@end

@implementation MinHeapTests

- (void)testExampleOfUsage {

    MinHeap *heap = [MinHeap new];
    [heap addElement:10];
    [heap addElement:12];
    [heap addElement:17];
    XCTAssert([heap removeRootElement] == 10, @"MinHeap has to return 10 for 10,12,17");
    [heap addElement:4];
    [heap addElement:14];
    [heap addElement:5];
    XCTAssert([heap removeRootElement] == 4, @"MinHeap has to return 4 for 4,5,12,17,14");
    XCTAssert([heap removeRootElement] == 5, @"MinHeap has to return 5 for 5,14,12,17");
    [heap addElement:3];
    [heap addElement:1];
    XCTAssert([heap removeRootElement] == 1, @"MinHeap has to return 1 for 1,3,17,14,12");
    XCTAssert([heap removeRootElement] == 3, @"MinHeap has to return 3 for 3,12,17,14");
    XCTAssert([heap removeRootElement] == 12, @"MinHeap has to return 12 for 12,14,17");
}

@end
