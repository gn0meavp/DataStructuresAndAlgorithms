//
//  RunningMedian.m
//  DataStructuresAndAlgorithms
//
//  Created by Alexey Patosin on 17/02/15.
//  Copyright (c) 2015 TestOrg. All rights reserved.
//

#import "RunningMedian.h"
#import "MinHeap.h"
#import "MaxHeap.h"

@interface RunningMedian ()
@property (nonatomic, strong) MinHeap *minHeap;
@property (nonatomic, strong) MaxHeap *maxHeap;
@end

@implementation RunningMedian

- (instancetype)init {
    self = [super init];
    if (self) {
        _minHeap = [MinHeap new];
        _maxHeap = [MaxHeap new];
    }
    return self;
}

- (void)addNumber:(NSUInteger)number {
    if ([self.minHeap.elements count] == 0) {
        // first element goes to minHeap
        [self.minHeap addElement:number];
    }
    else if ([self.minHeap rootValue] > number) {
        [self.maxHeap addElement:number];
    }
    else {
        [self.minHeap addElement:number];
    }
    
    [self balanceHeaps];
    
}

- (void)balanceHeaps {
    
    while ([self.minHeap.elements count] > [self.maxHeap.elements count]+1) {
        NSUInteger value = [self.minHeap removeRootElement];
        [self.maxHeap addElement:value];
    }

    while ([self.maxHeap.elements count] > [self.minHeap.elements count]+1) {
        NSUInteger value = [self.maxHeap removeRootElement];
        [self.minHeap addElement:value];
    }
    
}

- (NSUInteger)medianNumber {
    if ([self.minHeap.elements count] == [self.maxHeap.elements count]) {
        return (self.minHeap.rootValue + self.maxHeap.rootValue) / 2;
    }
    else {
        return [self.minHeap.elements count] > [self.maxHeap.elements count] ? self.minHeap.rootValue : self.maxHeap.rootValue;
    }
}

@end
