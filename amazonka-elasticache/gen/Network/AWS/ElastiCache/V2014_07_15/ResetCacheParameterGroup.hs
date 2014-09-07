{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.ElastiCache.V2014_07_15.ResetCacheParameterGroup
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | The ResetCacheParameterGroup operation modifies the parameters of a cache
-- parameter group to the engine or system default value. You can reset
-- specific parameters by submitting a list of parameter names. To reset the
-- entire cache parameter group, specify the ResetAllParameters and
-- CacheParameterGroupName parameters.
-- https://elasticache.us-east-1.amazonaws.com/
-- ?Action=ResetCacheParameterGroup &ResetAllParameters=true
-- &CacheParameterGroupName=mycacheparametergroup1 &Version=2014-03-24
-- &SignatureVersion=4 &SignatureMethod=HmacSHA256 &Timestamp=20140401T192317Z
-- &X-Amz-Credential= mycacheparametergroup1
-- cb7cc855-b9d2-11e3-8a16-7978bb24ffdf.
module Network.AWS.ElastiCache.V2014_07_15.ResetCacheParameterGroup
    (
    -- * Request
      ResetCacheParameterGroup
    -- ** Request constructor
    , mkResetCacheParameterGroup
    -- ** Request lenses
    , rcpgCacheParameterGroupName
    , rcpgResetAllParameters
    , rcpgParameterNameValues

    -- * Response
    , ResetCacheParameterGroupResponse
    -- ** Response lenses
    , rcpgrsCacheParameterGroupName
    ) where

import Network.AWS.Request.Query
import Network.AWS.ElastiCache.V2014_07_15.Types
import Network.AWS.Prelude

-- | Represents the input of a ResetCacheParameterGroup operation.
data ResetCacheParameterGroup = ResetCacheParameterGroup
    { _rcpgCacheParameterGroupName :: Text
    , _rcpgResetAllParameters :: Maybe Bool
    , _rcpgParameterNameValues :: [ParameterNameValue]
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'ResetCacheParameterGroup' request.
mkResetCacheParameterGroup :: Text -- ^ 'rcpgCacheParameterGroupName'
                           -> [ParameterNameValue] -- ^ 'rcpgParameterNameValues'
                           -> ResetCacheParameterGroup
mkResetCacheParameterGroup p1 p3 = ResetCacheParameterGroup
    { _rcpgCacheParameterGroupName = p1
    , _rcpgResetAllParameters = Nothing
    , _rcpgParameterNameValues = p3
    }

-- | The name of the cache parameter group to reset.
rcpgCacheParameterGroupName :: Lens' ResetCacheParameterGroup Text
rcpgCacheParameterGroupName =
    lens _rcpgCacheParameterGroupName
         (\s a -> s { _rcpgCacheParameterGroupName = a })

-- | If true, all parameters in the cache parameter group will be reset to
-- default values. If false, no such action occurs. Valid values: true |
-- false.
rcpgResetAllParameters :: Lens' ResetCacheParameterGroup (Maybe Bool)
rcpgResetAllParameters =
    lens _rcpgResetAllParameters (\s a -> s { _rcpgResetAllParameters = a })

-- | An array of parameter names to be reset. If you are not resetting the
-- entire cache parameter group, you must specify at least one parameter name.
rcpgParameterNameValues :: Lens' ResetCacheParameterGroup [ParameterNameValue]
rcpgParameterNameValues =
    lens _rcpgParameterNameValues
         (\s a -> s { _rcpgParameterNameValues = a })

instance ToQuery ResetCacheParameterGroup where
    toQuery = genericQuery def

-- | Represents the output of one of the following operations:
-- ModifyCacheParameterGroup ResetCacheParameterGroup.
newtype ResetCacheParameterGroupResponse = ResetCacheParameterGroupResponse
    { _rcpgrsCacheParameterGroupName :: Maybe Text
    } deriving (Show, Generic)

-- | The name of the cache parameter group.
rcpgrsCacheParameterGroupName :: Lens' ResetCacheParameterGroupResponse (Maybe Text)
rcpgrsCacheParameterGroupName =
    lens _rcpgrsCacheParameterGroupName
         (\s a -> s { _rcpgrsCacheParameterGroupName = a })

instance FromXML ResetCacheParameterGroupResponse where
    fromXMLOptions = xmlOptions

instance AWSRequest ResetCacheParameterGroup where
    type Sv ResetCacheParameterGroup = ElastiCache
    type Rs ResetCacheParameterGroup = ResetCacheParameterGroupResponse

    request = post "ResetCacheParameterGroup"
    response _ = xmlResponse
