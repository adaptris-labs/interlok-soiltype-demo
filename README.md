# interlok-soiltype-demo

Example docker image that uses Interlok to cache calls to https://rest.soilgrids.org/query, querying the soil composition for
a specific lat/lon combination. If the lat/lon combination isn't in the cache, then we issue a query to rest.soilgrids.org and
keep the results of the query in our cache.

The output returned to the caller is modified so that a new json tag is emitted that contains whether the call was retrieved from
the cache or not.

Contains a swagger.yml (for the API call) file and a UI instance, so you can see what's going on under the covers.

This will be built automatically from the latest `adaptris/interlok:snapshot-alpine` instance in docker hub.
