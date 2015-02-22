//
//  Tests.m
//  Tests
//
//  Created by Alexey Patosin on 15/02/15.
//  Copyright (c) 2015 TestOrg. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "TrieNode.h"

@interface TrieNodeTests : XCTestCase

@end

@implementation TrieNodeTests

- (void)testExampleOfUsage {

    TrieNode *rootNode = [TrieNode new];
    rootNode.letter = @"";
    
    [rootNode addWord:@"bear"];
    [rootNode addWord:@"bell"];
    [rootNode addWord:@"bid"];
    [rootNode addWord:@"bull"];
    [rootNode addWord:@"buy"];
    [rootNode addWord:@"sell"];
    [rootNode addWord:@"stock"];
    [rootNode addWord:@"stop"];
    
    XCTAssert([rootNode containsWord:@"buy"], @"Trie contains 'buy' word");
    XCTAssert([rootNode containsWord:@"bee"] == NO, @"Trie does not contain 'bee' word");
    XCTAssert([rootNode containsWord:@"bea"] == NO, @"Trie does not contain 'bea' word");
    XCTAssert([rootNode containsWord:@"bear"], @"Trie contains 'buy' word");
    
}

@end
