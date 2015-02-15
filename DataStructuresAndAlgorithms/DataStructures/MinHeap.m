//
//  MinHeap.m
//  DataStructuresAndAlgorithms
//
//  Created by Alexey Patosin on 15/02/15.
//  Copyright (c) 2015 TestOrg. All rights reserved.
//

#import "MinHeap.h"

@implementation MinHeap

- (instancetype)init {
    self = [super init];
    if (self) {
        _elements = [NSMutableArray array];
    }
    return self;
}

- (void)addElement:(NSUInteger)value {
    [self.elements addObject:@(value)];
    [self heapifyUp];
    
//    NSLog(@"%@", self.elements);
}

- (void)swap:(NSUInteger)index1 index2:(NSUInteger)index2 {
    NSNumber *value2 = self.elements[index2];
    [self.elements replaceObjectAtIndex:index2 withObject:self.elements[index1]];
    [self.elements replaceObjectAtIndex:index1 withObject:value2];
}

- (NSUInteger)removeRootElement {
    NSUInteger returnValue = [self.elements[0] integerValue];
    
    [self.elements removeObjectAtIndex:0];
    
    if ([self.elements count] > 0) {
        NSUInteger lastIndex = [self.elements count]-1;
        NSNumber *lastElement = self.elements[lastIndex];
        [self.elements removeObjectAtIndex:lastIndex];
        [self.elements insertObject:lastElement atIndex:0];
        
        [self heapifyDown];
    }
    
//    NSLog(@"%@", self.elements);
    
    return returnValue;
}

#pragma mark - helpers

- (NSUInteger)parentIndexForIndex:(NSUInteger)index {
    return (index-1)/2;
}

- (NSUInteger)leftChildForIndex:(NSUInteger)index {
    return index * 2 + 1;
}

- (NSUInteger)rightChildForIndex:(NSUInteger)index {
    return index * 2 + 2;
}

- (NSUInteger)minChildIndexForIndex:(NSUInteger)index {
    NSUInteger leftIndex = [self leftChildForIndex:index];
    NSUInteger rightIndex = [self rightChildForIndex:index];
    
    if (rightIndex < [self.elements count]) {
        return [self.elements[leftIndex] integerValue] < [self.elements[rightIndex] integerValue] ? leftIndex : rightIndex;
    }
    if (leftIndex < [self.elements count]) {
        return leftIndex;
    }
    
    NSException *exception = [NSException exceptionWithName:@"OutOfBoundsException"
                                                     reason:[NSString stringWithFormat:@"called minChildIndexForIndex: \
                                                             out of bounds (index %lu for array %lu", index, [self.elements count]]
                                                   userInfo:nil];
    [exception raise];
    
    return -1;
}

- (BOOL)isElementAtIndexLargerThanChildren:(NSUInteger)index {
    if ([self leftChildForIndex:index] < [self.elements count]) {
        return self.elements[[self minChildIndexForIndex:index]] < self.elements[index];
    }
    return NO;
}

#pragma mark - heapify

- (void)heapifyUp {
    NSUInteger curIndex = [self.elements count] - 1;
    
    while (curIndex > 0 && self.elements[curIndex] < self.elements[[self parentIndexForIndex:curIndex]]) {
        
        [self swap:curIndex index2:[self parentIndexForIndex:curIndex]];
        curIndex = [self parentIndexForIndex:curIndex];
        
    }
}

- (void)heapifyDown {
    NSUInteger curIndex = 0;
    
    while (curIndex < [self.elements count]-1 &&
           // for min heap it should be min child
           // for max heap it should be max child
           [self isElementAtIndexLargerThanChildren:curIndex]) {
        
        NSUInteger minIndex = [self minChildIndexForIndex:curIndex];
        
        [self swap:curIndex index2:minIndex];
        curIndex = minIndex;
        
    }
}

@end
