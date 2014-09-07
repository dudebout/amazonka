{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.OpsWorks.V2013_02_18.DescribeUserProfiles
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Describe specified users. Required Permissions: To use this action, an IAM
-- user must have an attached policy that explicitly grants permissions. For
-- more information on user permissions, see Managing User Permissions.
module Network.AWS.OpsWorks.V2013_02_18.DescribeUserProfiles
    (
    -- * Request
      DescribeUserProfiles
    -- ** Request constructor
    , mkDescribeUserProfiles
    -- ** Request lenses
    , dup1IamUserArns

    -- * Response
    , DescribeUserProfilesResponse
    -- ** Response lenses
    , duprsUserProfiles
    ) where

import           Network.AWS.OpsWorks.V2013_02_18.Types
import           Network.AWS.Prelude
import           Network.AWS.Request.JSON
import qualified Network.AWS.Types.Map    as Map

newtype DescribeUserProfiles = DescribeUserProfiles
    { _dup1IamUserArns :: [Text]
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'DescribeUserProfiles' request.
mkDescribeUserProfiles :: DescribeUserProfiles
mkDescribeUserProfiles = DescribeUserProfiles
    { _dup1IamUserArns = mempty
    }

-- | An array of IAM user ARNs that identify the users to be described.
dup1IamUserArns :: Lens' DescribeUserProfiles [Text]
dup1IamUserArns = lens _dup1IamUserArns (\s a -> s { _dup1IamUserArns = a })

instance ToPath DescribeUserProfiles

instance ToQuery DescribeUserProfiles

instance ToHeaders DescribeUserProfiles

instance ToJSON DescribeUserProfiles

-- | Contains the response to a DescribeUserProfiles request.
newtype DescribeUserProfilesResponse = DescribeUserProfilesResponse
    { _duprsUserProfiles :: [UserProfile]
    } deriving (Show, Generic)

-- | A Users object that describes the specified users.
duprsUserProfiles :: Lens' DescribeUserProfilesResponse [UserProfile]
duprsUserProfiles =
    lens _duprsUserProfiles (\s a -> s { _duprsUserProfiles = a })

instance FromJSON DescribeUserProfilesResponse

instance AWSRequest DescribeUserProfiles where
    type Sv DescribeUserProfiles = OpsWorks
    type Rs DescribeUserProfiles = DescribeUserProfilesResponse

    request = get
    response _ = jsonResponse
