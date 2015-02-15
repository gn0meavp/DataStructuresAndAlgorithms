//
//  AbstractHeap.h
//  DataStructuresAndAlgorithms
//
//  Created by Alexey Patosin on 15/02/15.
//  Copyright (c) 2015 TestOrg. All rights reserved.
//

#import <Foundation/Foundation.h>

void swapElementsInArray(NSUInteger index1, NSUInteger index2, NSMutableArray *array);
NSUInteger parentIndexForIndex(NSUInteger index);
NSUInteger leftChildForIndex(NSUInteger index);
NSUInteger rightChildForIndex(NSUInteger index);

// basic logic for min and max heaps
@interface AbstractHeap : NSObject

@property (nonatomic, strong) NSMutableArray *mutableElements;

- (NSArray *)elements;

- (void)addElement:(NSUInteger)value;
- (NSUInteger)removeRootElement;

@end
