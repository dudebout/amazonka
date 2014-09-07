{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.OpsWorks.V2013_02_18.DescribePermissions
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Describes the permissions for a specified stack. Required Permissions: To
-- use this action, an IAM user must have a Manage permissions level for the
-- stack, or an attached policy that explicitly grants permissions. For more
-- information on user permissions, see Managing User Permissions.
module Network.AWS.OpsWorks.V2013_02_18.DescribePermissions
    (
    -- * Request
      DescribePermissions
    -- ** Request constructor
    , mkDescribePermissions
    -- ** Request lenses
    , dpIamUserArn
    , dpStackId

    -- * Response
    , DescribePermissionsResponse
    -- ** Response lenses
    , dprsPermissions
    ) where

import           Network.AWS.OpsWorks.V2013_02_18.Types
import           Network.AWS.Prelude
import           Network.AWS.Request.JSON
import qualified Network.AWS.Types.Map    as Map

data DescribePermissions = DescribePermissions
    { _dpIamUserArn :: Maybe Text
    , _dpStackId :: Maybe Text
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'DescribePermissions' request.
mkDescribePermissions :: DescribePermissions
mkDescribePermissions = DescribePermissions
    { _dpIamUserArn = Nothing
    , _dpStackId = Nothing
    }

-- | The user's IAM ARN. For more information about IAM ARNs, see Using
-- Identifiers.
dpIamUserArn :: Lens' DescribePermissions (Maybe Text)
dpIamUserArn = lens _dpIamUserArn (\s a -> s { _dpIamUserArn = a })

-- | The stack ID.
dpStackId :: Lens' DescribePermissions (Maybe Text)
dpStackId = lens _dpStackId (\s a -> s { _dpStackId = a })

instance ToPath DescribePermissions

instance ToQuery DescribePermissions

instance ToHeaders DescribePermissions

instance ToJSON DescribePermissions

-- | Contains the response to a DescribePermissions request.
newtype DescribePermissionsResponse = DescribePermissionsResponse
    { _dprsPermissions :: [Permission]
    } deriving (Show, Generic)

-- | An array of Permission objects that describe the stack permissions. If the
-- request object contains only a stack ID, the array contains a Permission
-- object with permissions for each of the stack IAM ARNs. If the request
-- object contains only an IAM ARN, the array contains a Permission object
-- with permissions for each of the user's stack IDs. If the request contains
-- a stack ID and an IAM ARN, the array contains a single Permission object
-- with permissions for the specified stack and IAM ARN.
dprsPermissions :: Lens' DescribePermissionsResponse [Permission]
dprsPermissions = lens _dprsPermissions (\s a -> s { _dprsPermissions = a })

instance FromJSON DescribePermissionsResponse

instance AWSRequest DescribePermissions where
    type Sv DescribePermissions = OpsWorks
    type Rs DescribePermissions = DescribePermissionsResponse

    request = get
    response _ = jsonResponse
