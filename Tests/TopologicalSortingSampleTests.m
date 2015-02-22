//
//  TopologicalSortingSampleTests.m
//  DataStructuresAndAlgorithms
//
//  Created by Alexey Patosin on 22/02/15.
//  Copyright (c) 2015 TestOrg. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TopologicalSorting.h"
#import "GraphNode.h"

@interface TopologicalSortingSampleTests : XCTestCase

@end

@implementation TopologicalSortingSampleTests

- (void)testExampleOfUsage {
    GraphNode *node7 = [GraphNode nodeWithValue:@"7"];
    GraphNode *node5 = [GraphNode nodeWithValue:@"5"];
    GraphNode *node3 = [GraphNode nodeWithValue:@"3"];
    GraphNode *node11 = [GraphNode nodeWithValue:@"11"];
    GraphNode *node8 = [GraphNode nodeWithValue:@"8"];
    GraphNode *node2 = [GraphNode nodeWithValue:@"2"];
    GraphNode *node9 = [GraphNode nodeWithValue:@"9"];
    GraphNode *node10 = [GraphNode nodeWithValue:@"10"];
    
    [node3 addConnection:node8];
    [node3 addConnection:node10];
    [node5 addConnection:node11];
    [node7 addConnection:node11];
    [node7 addConnection:node8];
    [node8 addConnection:node9];
    [node11 addConnection:node2];
    [node11 addConnection:node9];
    [node11 addConnection:node10];
    [node7 addConnection:node5];
    [node5 addConnection:node3];
    
    NSArray *path = [TopologicalSorting sortWithRootNode:node7];
    NSLog(@"%@", path);
    
}

@end
