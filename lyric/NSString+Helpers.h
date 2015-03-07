//
//  NSString+Helpers.h
//  HXStockAccount
//
//  Created by apple on 14-11-5.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCryptor.h>

/*
 字符串扩展类
 */
@interface NSString (Helpers)

- (NSString *) stringByUrlEncoding;

- (NSString *) md5;

- (NSString*)sha1;

+ (NSString *)doCipher:(NSString*)plainText operation:(CCOperation)encryptOrDecrypt;

- (NSMutableDictionary *)dictionaryFromQueryString;

+ (BOOL)checkStringIsEmpty:(NSString *)string;

@end
