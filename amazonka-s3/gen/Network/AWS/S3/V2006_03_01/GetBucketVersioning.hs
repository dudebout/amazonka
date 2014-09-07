{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.S3.V2006_03_01.GetBucketVersioning
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Returns the versioning state of a bucket.
module Network.AWS.S3.V2006_03_01.GetBucketVersioning
    (
    -- * Request
      GetBucketVersioning
    -- ** Request constructor
    , mkGetBucketVersioning
    -- ** Request lenses
    , gbvBucket

    -- * Response
    , GetBucketVersioningResponse
    -- ** Response lenses
    , gbvrsStatus
    , gbvrsMfaDelete
    ) where

import Network.AWS.Request.RestS3
import Network.AWS.S3.V2006_03_01.Types
import Network.AWS.Prelude
import Network.AWS.Types (Region)

newtype GetBucketVersioning = GetBucketVersioning
    { _gbvBucket :: BucketName
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'GetBucketVersioning' request.
mkGetBucketVersioning :: BucketName -- ^ 'gbvBucket'
                      -> GetBucketVersioning
mkGetBucketVersioning p1 = GetBucketVersioning
    { _gbvBucket = p1
    }

gbvBucket :: Lens' GetBucketVersioning BucketName
gbvBucket = lens _gbvBucket (\s a -> s { _gbvBucket = a })

instance ToPath GetBucketVersioning where
    toPath GetBucketVersioning{..} = mconcat
        [ "/"
        , toBS _gbvBucket
        ]

instance ToQuery GetBucketVersioning where
    toQuery GetBucketVersioning{..} = mconcat
        [ "versioning"
        ]

instance ToHeaders GetBucketVersioning

instance ToBody GetBucketVersioning

data GetBucketVersioningResponse = GetBucketVersioningResponse
    { _gbvrsStatus :: Maybe (Switch BucketVersioningStatus)
    , _gbvrsMfaDelete :: Maybe (Switch MFADeleteStatus)
    } deriving (Show, Generic)

-- | The versioning state of the bucket.
gbvrsStatus :: Lens' GetBucketVersioningResponse (Maybe (Switch BucketVersioningStatus))
gbvrsStatus = lens _gbvrsStatus (\s a -> s { _gbvrsStatus = a })

-- | Specifies whether MFA delete is enabled in the bucket versioning
-- configuration. This element is only returned if the bucket has been
-- configured with MFA delete. If the bucket has never been so configured,
-- this element is not returned.
gbvrsMfaDelete :: Lens' GetBucketVersioningResponse (Maybe (Switch MFADeleteStatus))
gbvrsMfaDelete = lens _gbvrsMfaDelete (\s a -> s { _gbvrsMfaDelete = a })

instance FromXML GetBucketVersioningResponse where
    fromXMLOptions = xmlOptions

instance AWSRequest GetBucketVersioning where
    type Sv GetBucketVersioning = S3
    type Rs GetBucketVersioning = GetBucketVersioningResponse

    request = get
    response _ = xmlResponse
