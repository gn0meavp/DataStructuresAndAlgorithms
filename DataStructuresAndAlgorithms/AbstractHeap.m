//
//  AbstractHeap.m
//  DataStructuresAndAlgorithms
//
//  Created by Alexey Patosin on 15/02/15.
//  Copyright (c) 2015 TestOrg. All rights reserved.
//

#import "AbstractHeap.h"

void swapElementsInArray(NSUInteger index1, NSUInteger index2, NSMutableArray *array) {
    NSNumber *value2 = array[index2];
    [array replaceObjectAtIndex:index2 withObject:array[index1]];
    [array replaceObjectAtIndex:index1 withObject:value2];
}

NSUInteger parentIndexForIndex(NSUInteger index) {
    return (index-1)/2;
}

NSUInteger leftChildForIndex(NSUInteger index) {
    return index * 2 + 1;
    
}
NSUInteger rightChildForIndex(NSUInteger index) {
    return index * 2 + 2;
}

@implementation AbstractHeap

- (instancetype)init {
    self = [super init];
    if (self) {
        if ([self isMemberOfClass:[AbstractHeap class]]) {
            NSException *exception = [NSException exceptionWithName:@"WrongUsageException" reason:@"AbstractHeap is an abstract heap, use one of its descendants!" userInfo:nil];
            [exception raise];
        }
    
        _mutableElements = [NSMutableArray array];
        
    }
    return self;
}

#pragma mark - basic elements methods

- (NSArray *)elements {
    return [self.mutableElements copy];
}

- (void)addElement:(NSUInteger)value {
    [self.mutableElements addObject:@(value)];
    [self heapifyUp];
    
    //    NSLog(@"%@", self.elements);
}

- (NSUInteger)rootValue {
    if ([self.elements count] == 0) {
        NSException *exception = [NSException exceptionWithName:@"OutOfBoundsException" reason:@"There's no rootValue in empty heap!" userInfo:nil];
        [exception raise];
        
        return UINT_MAX;
    }
    
    return [self.elements[0] integerValue];
}

- (NSUInteger)removeRootElement {
    NSUInteger returnValue = [self.elements[0] integerValue];
    
    [self.mutableElements removeObjectAtIndex:0];
    
    if ([self.elements count] > 0) {
        NSUInteger lastIndex = [self.elements count]-1;
        NSNumber *lastElement = self.elements[lastIndex];
        [self.mutableElements removeObjectAtIndex:lastIndex];
        [self.mutableElements insertObject:lastElement atIndex:0];
        
        [self heapifyDown];
    }
    
    //    NSLog(@"after removing %lu\n%@", returnValue, self.elements);
    
    return returnValue;
}

#pragma mark - heapify methods

- (void)heapifyUp {
    // has to be implemented by descendants
}

- (void)heapifyDown {
    // has to be implemented by descendants
}

@end
