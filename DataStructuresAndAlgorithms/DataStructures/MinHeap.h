//
//  MinHeap.h
//  DataStructuresAndAlgorithms
//
//  Created by Alexey Patosin on 15/02/15.
//  Copyright (c) 2015 TestOrg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MinHeap : NSObject

@property (nonatomic, strong) NSMutableArray *elements;

- (void)addElement:(NSUInteger)value;
- (NSUInteger)removeRootElement;

@end

