{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.OpsWorks.V2013_02_18.DescribeTimeBasedAutoScaling
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Describes time-based auto scaling configurations for specified instances.
-- You must specify at least one of the parameters. Required Permissions: To
-- use this action, an IAM user must have a Show, Deploy, or Manage
-- permissions level for the stack, or an attached policy that explicitly
-- grants permissions. For more information on user permissions, see Managing
-- User Permissions.
module Network.AWS.OpsWorks.V2013_02_18.DescribeTimeBasedAutoScaling
    (
    -- * Request
      DescribeTimeBasedAutoScaling
    -- ** Request constructor
    , mkDescribeTimeBasedAutoScaling
    -- ** Request lenses
    , dtbasInstanceIds

    -- * Response
    , DescribeTimeBasedAutoScalingResponse
    -- ** Response lenses
    , dtbasrsTimeBasedAutoScalingConfigurations
    ) where

import           Network.AWS.OpsWorks.V2013_02_18.Types
import           Network.AWS.Prelude
import           Network.AWS.Request.JSON
import qualified Network.AWS.Types.Map    as Map

newtype DescribeTimeBasedAutoScaling = DescribeTimeBasedAutoScaling
    { _dtbasInstanceIds :: [Text]
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'DescribeTimeBasedAutoScaling' request.
mkDescribeTimeBasedAutoScaling :: [Text] -- ^ 'dtbasInstanceIds'
                               -> DescribeTimeBasedAutoScaling
mkDescribeTimeBasedAutoScaling p1 = DescribeTimeBasedAutoScaling
    { _dtbasInstanceIds = p1
    }

-- | An array of instance IDs.
dtbasInstanceIds :: Lens' DescribeTimeBasedAutoScaling [Text]
dtbasInstanceIds =
    lens _dtbasInstanceIds (\s a -> s { _dtbasInstanceIds = a })

instance ToPath DescribeTimeBasedAutoScaling

instance ToQuery DescribeTimeBasedAutoScaling

instance ToHeaders DescribeTimeBasedAutoScaling

instance ToJSON DescribeTimeBasedAutoScaling

-- | Contains the response to a DescribeTimeBasedAutoScaling request.
newtype DescribeTimeBasedAutoScalingResponse = DescribeTimeBasedAutoScalingResponse
    { _dtbasrsTimeBasedAutoScalingConfigurations :: [TimeBasedAutoScalingConfiguration]
    } deriving (Show, Generic)

-- | An array of TimeBasedAutoScalingConfiguration objects that describe the
-- configuration for the specified instances.
dtbasrsTimeBasedAutoScalingConfigurations :: Lens' DescribeTimeBasedAutoScalingResponse [TimeBasedAutoScalingConfiguration]
dtbasrsTimeBasedAutoScalingConfigurations =
    lens _dtbasrsTimeBasedAutoScalingConfigurations
         (\s a -> s { _dtbasrsTimeBasedAutoScalingConfigurations = a })

instance FromJSON DescribeTimeBasedAutoScalingResponse

instance AWSRequest DescribeTimeBasedAutoScaling where
    type Sv DescribeTimeBasedAutoScaling = OpsWorks
    type Rs DescribeTimeBasedAutoScaling = DescribeTimeBasedAutoScalingResponse

    request = get
    response _ = jsonResponse
