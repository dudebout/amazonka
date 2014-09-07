{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.CloudSearch.V2013_01_01.DeleteDomain
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Permanently deletes a search domain and all of its data. Once a domain has
-- been deleted, it cannot be recovered. For more information, see Deleting a
-- Search Domain in the Amazon CloudSearch Developer Guide.
module Network.AWS.CloudSearch.V2013_01_01.DeleteDomain
    (
    -- * Request
      DeleteDomain
    -- ** Request constructor
    , mkDeleteDomain
    -- ** Request lenses
    , ddDomainName

    -- * Response
    , DeleteDomainResponse
    -- ** Response lenses
    , ddrsDomainStatus
    ) where

import Network.AWS.Request.Query
import Network.AWS.CloudSearch.V2013_01_01.Types
import Network.AWS.Prelude

-- | Container for the parameters to the DeleteDomain operation. Specifies the
-- name of the domain you want to delete.
newtype DeleteDomain = DeleteDomain
    { _ddDomainName :: Text
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'DeleteDomain' request.
mkDeleteDomain :: Text -- ^ 'ddDomainName'
               -> DeleteDomain
mkDeleteDomain p1 = DeleteDomain
    { _ddDomainName = p1
    }

-- | The name of the domain you want to permanently delete.
ddDomainName :: Lens' DeleteDomain Text
ddDomainName = lens _ddDomainName (\s a -> s { _ddDomainName = a })

instance ToQuery DeleteDomain where
    toQuery = genericQuery def

-- | The result of a DeleteDomain request. Contains the status of a newly
-- deleted domain, or no status if the domain has already been completely
-- deleted.
newtype DeleteDomainResponse = DeleteDomainResponse
    { _ddrsDomainStatus :: Maybe DomainStatus
    } deriving (Show, Generic)

-- | The current status of the search domain.
ddrsDomainStatus :: Lens' DeleteDomainResponse (Maybe DomainStatus)
ddrsDomainStatus =
    lens _ddrsDomainStatus (\s a -> s { _ddrsDomainStatus = a })

instance FromXML DeleteDomainResponse where
    fromXMLOptions = xmlOptions

instance AWSRequest DeleteDomain where
    type Sv DeleteDomain = CloudSearch
    type Rs DeleteDomain = DeleteDomainResponse

    request = post "DeleteDomain"
    response _ = xmlResponse
