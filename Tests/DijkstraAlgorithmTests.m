//
//  DijkstraAlgorithmTests.m
//  DataStructuresAndAlgorithms
//
//  Created by Alexey Patosin on 03/03/15.
//  Copyright (c) 2015 TestOrg. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DijkstraAlgorithm.h"

@interface DijkstraAlgorithmSampleTests : XCTestCase

@end

@implementation DijkstraAlgorithmSampleTests

- (void)testExample {
    
    WeightedNode *node1 = [[WeightedNode alloc] initWithName:@"node1"];
    WeightedNode *node2 = [[WeightedNode alloc] initWithName:@"node2"];
    WeightedNode *node3 = [[WeightedNode alloc] initWithName:@"node3"];
    WeightedNode *node4 = [[WeightedNode alloc] initWithName:@"node4"];
    WeightedNode *node5 = [[WeightedNode alloc] initWithName:@"node5"];
    WeightedNode *node6 = [[WeightedNode alloc] initWithName:@"node6"];
    WeightedNode *node7 = [[WeightedNode alloc] initWithName:@"node7"];
    WeightedNode *node8 = [[WeightedNode alloc] initWithName:@"node8"];
    
    [node1 addConnectionToNode:node2 value:3];
    [node1 addConnectionToNode:node6 value:4];
    [node1 addConnectionToNode:node3 value:12];
    [node2 addConnectionToNode:node4 value:7];
    [node4 addConnectionToNode:node3 value:1];
    [node4 addConnectionToNode:node5 value:4];
    [node3 addConnectionToNode:node5 value:6];
    [node3 addConnectionToNode:node7 value:9];
    [node5 addConnectionToNode:node8 value:8];
    [node7 addConnectionToNode:node8 value:4];
    [node6 addConnectionToNode:node7 value:3];
    
    NSUInteger distance = [DijkstraAlgorithm shortestDistanceBetweenNodes:node1 node2:node8];
    
    NSLog(@"%lu", distance);
    
}

@end