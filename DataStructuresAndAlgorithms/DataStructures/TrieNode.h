//
//  Trie.h
//  DataStructuresAndAlgorithms
//
//  Created by Alexey Patosin on 15/02/15.
//  Copyright (c) 2015 TestOrg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TrieNode : NSObject
@property (nonatomic, strong) NSString *letter;
@property (nonatomic, strong) NSMutableDictionary *children;
@property (nonatomic) BOOL isEnd;

- (void)addWord:(NSString *)word;
- (BOOL)containsWord:(NSString *)word;

@end

