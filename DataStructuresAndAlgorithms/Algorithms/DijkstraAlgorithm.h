//
//  DijkstraAlgorithm.h
//  DataStructuresAndAlgorithms
//
//  Created by Alexey Patosin on 03/03/15.
//  Copyright (c) 2015 TestOrg. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface WeightedNode : NSObject
@property (nonatomic) NSUInteger distance;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSMutableSet *connections;

- (instancetype)initWithName:(NSString *)name;
- (void)addConnectionToNode:(WeightedNode *)node value:(NSUInteger)value;
@end

@interface WeightedConnection : NSObject
@property (nonatomic, strong) NSMutableSet *nodes;
@property (nonatomic) NSUInteger value;     // cannot be less than zero for Dijkstra's Algorithm

- (instancetype)initWithValue:(NSUInteger)value node1:(WeightedNode *)node1 node2:(WeightedNode *)node2;
@end

@interface DijkstraAlgorithm : NSObject

+ (NSUInteger)shortestDistanceBetweenNodes:(WeightedNode *)node1 node2:(WeightedNode *)node2;

@end
