//
//  GraphNodeTests.m
//  DataStructuresAndAlgorithms
//
//  Created by Alexey Patosin on 22/02/15.
//  Copyright (c) 2015 TestOrg. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "GraphNode.h"

@interface GraphNodeSampleTests : XCTestCase

@end

@implementation GraphNodeSampleTests

- (void)testExampleOfUsage {
    GraphNode *nodeA = [GraphNode nodeWithValue:@"A"];
    GraphNode *nodeB = [GraphNode nodeWithValue:@"B"];
    GraphNode *nodeC = [GraphNode nodeWithValue:@"C"];
    GraphNode *nodeD = [GraphNode nodeWithValue:@"D"];
    GraphNode *nodeE = [GraphNode nodeWithValue:@"E"];
    
    [nodeA addConnection:nodeB];
    [nodeB addConnection:nodeC];
    [nodeB addConnection:nodeD];
    [nodeC addConnection:nodeE];
    [nodeD addConnection:nodeE];
}

@end
