//
//  GraphNodeTest.m
//  DataStructuresAndAlgorithms
//
//  Created by Alexey Patosin on 22/02/15.
//  Copyright (c) 2015 TestOrg. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "GraphNode.h"

@interface GraphNodeTests : XCTestCase

@end

@implementation GraphNodeTests

- (void)testNodeShouldStoreConnection {
    GraphNode *nodeA = [GraphNode nodeWithValue:@"A"];
    GraphNode *nodeB = [GraphNode nodeWithValue:@"B"];
    
    [nodeA addConnection:nodeB];
    
    XCTAssert([[nodeA connections] containsObject:nodeB], @"GraphNode should store connection");
}

- (void)testNodeShouldStoreValue {
    NSString *value = @"A";
    GraphNode *nodeA = [GraphNode nodeWithValue:value];

    XCTAssert([[nodeA value] isEqualToString:value], @"GraphNode should store value");
}

- (void)testNodeShouldStoreConnectionToItself {
    GraphNode *nodeA = [GraphNode nodeWithValue:@"A"];
    [nodeA addConnection:nodeA];
    
    XCTAssert([[nodeA connections] containsObject:nodeA], @"GraphNode should store connection to itself");
}

- (void)testNodeShouldRemoveConnection {
    GraphNode *nodeA = [GraphNode nodeWithValue:@"A"];
    GraphNode *nodeB = [GraphNode nodeWithValue:@"B"];
    
    [nodeA addConnection:nodeB];
    [nodeA removeConnection:nodeB];
    
    XCTAssert([[nodeA connections] containsObject:nodeB] == NO, @"GraphNode should remove connection");
}

@end
