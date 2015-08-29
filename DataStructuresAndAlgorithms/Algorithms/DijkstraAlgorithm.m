//
//  DijkstraAlgorithm.m
//  DataStructuresAndAlgorithms
//
//  Created by Alexey Patosin on 03/03/15.
//  Copyright (c) 2015 TestOrg. All rights reserved.
//

#import "DijkstraAlgorithm.h"

@implementation DijkstraAlgorithm

+ (NSUInteger)shortestDistanceBetweenNodes:(WeightedNode *)node1 node2:(WeightedNode *)node2 {

    NSMutableSet *visitedNodes = [NSMutableSet set];
    NSMutableSet *nodesToVisit = [NSMutableSet set];
    
    [nodesToVisit addObject:node1];
    
    node1.distance = 0;
    
    while ([nodesToVisit count]) {
        
        WeightedNode *node = [nodesToVisit anyObject];
        [nodesToVisit removeObject:node];
        [visitedNodes addObject:node];

        NSLog(@"%@", node.name);
        
        NSUInteger distance = node.distance;
        
        for (WeightedConnection *connection in node.connections) {
            
            for (WeightedNode *nodeToVisit in connection.nodes) {
                if (node != nodeToVisit &&
                    [visitedNodes containsObject:nodeToVisit] == NO &&
                    [nodesToVisit containsObject:nodeToVisit] == NO) {
                    [nodesToVisit addObject:nodeToVisit];
                    
                    NSUInteger curDistance = distance + connection.value;
                    if (nodeToVisit.distance > curDistance) {
                        nodeToVisit.distance = curDistance;
                        NSLog(@"distance to %@ is %lu", nodeToVisit.name, nodeToVisit.distance);
                    }
                    
                }
            }
            
        }
        
    }
    
    return node2.distance;
    
}

@end

@implementation WeightedConnection

- (instancetype)initWithValue:(NSUInteger)value node1:(WeightedNode *)node1 node2:(WeightedNode *)node2 {
    self = [super init];
    if (self) {
        _nodes = [NSMutableSet set];
        [_nodes addObject:node1];
        [_nodes addObject:node2];
        _value = value;
    }
    return self;
}

@end

@implementation WeightedNode

- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        _name = name;
        _connections = [NSMutableSet set];
        _distance = INT_MAX;
    }
    return self;
}

- (void)addConnectionToNode:(WeightedNode *)node value:(NSUInteger)value {
    WeightedConnection *connection = [[WeightedConnection alloc] initWithValue:value node1:self node2:node];
    [self.connections addObject:connection];    
    [node.connections addObject:connection];
}

@end

