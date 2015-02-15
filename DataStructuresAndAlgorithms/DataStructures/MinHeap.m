//
//  MinHeap.m
//  DataStructuresAndAlgorithms
//
//  Created by Alexey Patosin on 15/02/15.
//  Copyright (c) 2015 TestOrg. All rights reserved.
//

#import "MinHeap.h"

@implementation MinHeap

#pragma mark - helpers

- (NSUInteger)minChildIndexForIndex:(NSUInteger)index {
    NSUInteger leftIndex = leftChildForIndex(index);
    NSUInteger rightIndex = rightChildForIndex(index);
    
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
    if (leftChildForIndex(index) < [self.elements count]) {
        return self.elements[[self minChildIndexForIndex:index]] < self.elements[index];
    }
    return NO;
}

#pragma mark - heapify

- (void)heapifyUp {
    NSUInteger curIndex = [self.elements count] - 1;
    
    while (curIndex > 0 && self.elements[curIndex] < self.elements[parentIndexForIndex(curIndex)]) {
        
        swapElementsInArray(curIndex, parentIndexForIndex(curIndex), self.mutableElements);
        curIndex = parentIndexForIndex(curIndex);
        
    }
}

- (void)heapifyDown {
    NSUInteger curIndex = 0;
    
    while (curIndex < [self.elements count]-1 &&
           // for min heap it should be min child
           // for max heap it should be max child
           [self isElementAtIndexLargerThanChildren:curIndex]) {
        
        NSUInteger minIndex = [self minChildIndexForIndex:curIndex];
        
        swapElementsInArray(curIndex, minIndex, self.mutableElements);
        
        curIndex = minIndex;
        
    }
}

@end
