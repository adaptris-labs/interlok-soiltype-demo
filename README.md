# interlok-soiltype-demo [![Docker Build Status](https://img.shields.io/docker/cloud/build/adaptrislabs/interlok-soiltype-demo.svg)](https://hub.docker.com/r/adaptrislabs/interlok-soiltype-demo/)

Example docker image that uses Interlok to cache calls to https://rest.soilgrids.org/query, querying the soil composition for a specific lat/lon combination. If the lat/lon combination isn't in the cache, then we issue a query to rest.soilgrids.org and keep the results of the query in our cache.

The output returned to the caller is modified so that a new json tag is emitted that contains whether the call was retrieved fromthe cache or not.

Contains a swagger.yml (for the API call) file and a UI instance, so you can see what's going on under the covers.

This will be built automatically from the latest `adaptris/interlok:latest-alpine` instance in docker hub; overlaying the latest release jars

* Point your browser to http://localhost:8080/interlok for the UI
* Point your browser to http://localhost:8080/swagger to get the swagger definition for the sample interface
    * If your port bindings aren't for `localhost`; the default swagger.json won't be available the first time you goto the swagger app.
    * You can test it via the swagger interface.
* The size of the cache is just 10 items.
