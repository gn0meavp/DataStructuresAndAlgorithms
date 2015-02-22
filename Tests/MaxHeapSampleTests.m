//
//  MaxHeapTests.m
//  DataStructuresAndAlgorithms
//
//  Created by Alexey Patosin on 15/02/15.
//  Copyright (c) 2015 TestOrg. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "MaxHeap.h"

@interface MaxHeapTests : XCTestCase

@end

@implementation MaxHeapTests

- (void)testExample {
    
    MaxHeap *heap = [MaxHeap new];
    [heap addElement:10];
    [heap addElement:12];
    [heap addElement:17];
    XCTAssert([heap removeRootElement] == 17, @"MinHeap should return 17 for 17,10,12");
    [heap addElement:4];
    [heap addElement:14];
    [heap addElement:5];
    XCTAssert([heap removeRootElement] == 14, @"MinHeap should return 14 for 14,12,4,10,5");
    XCTAssert([heap removeRootElement] == 12, @"MinHeap should return 12 for 5,14,12,17");
    [heap addElement:3];
    [heap addElement:1];
    XCTAssert([heap removeRootElement] == 10, @"MinHeap should return 10 for 10,5,4,3,1");
    XCTAssert([heap removeRootElement] == 5, @"MinHeap should return 5 for 5,3,4,1");
    XCTAssert([heap removeRootElement] == 4, @"MinHeap should return 4 for 4,3,1");

}

- (void)testNthLargestElementInArray {
    
    NSUInteger size = 100;
    
    // testing nth largest element
    NSUInteger n = 10;
    MaxHeap *heap = [MaxHeap new];
    for (int i=0;i<size;i++) {
        [heap addElement:arc4random()%1000];
    }
    
    // for verifing later by sorting
    NSMutableArray *numbers = [heap.elements mutableCopy];
    
    NSUInteger heapResult = [heap removeRootElement];
    
    for (int i=1;i<n;i++) {
        heapResult = [heap removeRootElement];
    }
    
    [numbers sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return obj1 < obj2;
    }];
    
    NSUInteger sortResult = [numbers[n-1] integerValue];
    
    XCTAssert(sortResult == heapResult, @"%luth largest element in array should be %lu instead of %lu", n, sortResult, heapResult);
    
}

@end
