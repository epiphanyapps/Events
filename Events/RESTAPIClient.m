// AFAppDotNetAPIClient.h
//
// Copyright (c) 2012 Mattt Thompson (http://mattt.me/)
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "RESTAPIClient.h"

NSString *const userNameKey = @"userName";
NSString *const passwordKey = @"password";


@implementation RESTAPIClient

+ (instancetype)sharedClient {
    static RESTAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[RESTAPIClient alloc] initWithBaseURL:[NSURL URLWithString:APIBaseURLString]];
        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
         _sharedClient.requestSerializer = [AFJSONRequestSerializer serializer];
        _sharedClient.requestSerializer.timeoutInterval = 180;
        _sharedClient.responseSerializer = [AFJSONResponseSerializer serializer];
       
    });
   
    return _sharedClient;
}

- (void)URLSession:(NSURLSession *)session didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition, NSURLCredential *))completionHandler{
    
    NSLog(@"Pfizer REST CLIENT AUTHENTICATION CHALLENGE - %@ ",challenge.protectionSpace.authenticationMethod );
        
    if (challenge.previousFailureCount > 1) {
        NSLog(@"CHALLENGED  NSURLSessionAuthChallengeRejectProtectionSpace");

        completionHandler(NSURLSessionAuthChallengeRejectProtectionSpace, nil);
    } else {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSString *userName = [defaults objectForKey:userNameKey];
        NSString *passWord = [defaults objectForKey:passwordKey];
        completionHandler(NSURLSessionAuthChallengeUseCredential, [NSURLCredential credentialWithUser:userName password:passWord persistence:NSURLCredentialPersistenceNone]);
    }
    NSLog(@" didReceiveChallenge CHALLENGED");
    
    NSArray *array;
    
    
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        //
    }];
    NSNumber *number = @10;
    
    array[0];
}


@end
