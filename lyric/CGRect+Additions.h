//
//  CGRect+Additions.h
//  CMRead-iPhone
//
//  Created by 余林峰 on 14-10-20.
//  Copyright (c) 2014年 CMRead. All rights reserved.
//

#ifndef CMRead_iPhone_CGRect_Additions_h
#define CMRead_iPhone_CGRect_Additions_h

static __inline__ CGRect CGRectFromCGSize( CGSize size ) {
    return CGRectMake( 0, 0, size.width, size.height );
};

static __inline__ CGRect CGRectMakeWithCenterAndSize( CGPoint center, CGSize size ) {
    return CGRectMake( center.x - size.width * 0.5, center.y - size.height * 0.5, size.width, size.height );
};

static __inline__ CGRect CGRectMakeWithOriginAndSize( CGPoint origin, CGSize size ) {
    return CGRectMake( origin.x, origin.y, size.width, size.height );
};

static __inline__ CGPoint CGRectCenter( CGRect rect ) {
    return CGPointMake( CGRectGetMidX( rect ), CGRectGetMidY( rect ) );
};

#endif
