ngsi-context.jsonld

Downloaded from: https://smartdatamodels.org/context.jsonld
=================================================================================================
alternate-context.jsonld
json-context.jsonld
user-context.jsonld

Downloaded from: https://github.com/FIWARE/tutorials.IoT-Agent/tree/NGSI-LD/data-models
=================================================================================================
context.jsonld

Downloaded from: https://github.com/smart-data-models/dataModel.Device/blob/master/context.jsonld
-------------------------------------------------------------------------------------------------
Entity: DeviceMeasurement

Specifications: https://github.com/smart-data-models/dataModel.Device/blob/master/DeviceMeasurement/doc/spec.md

Global description: Description of a generic measurement entity coming from a device or other data source.

version: 0.1.0

List of properties:

address[object]: The mailing address . Model: https://schema.org/address
addressCountry[string]: The country. For example, Spain . Model: https://schema.org/addressCountry
addressLocality[string]: The locality in which the street address is, and which is in the region . Model: https://schema.org/addressLocality
addressRegion[string]: The region in which the locality is, and which is in the country . Model: https://schema.org/addressRegion
district[string]: A district is a type of administrative division that, in some countries, is managed by the local government
postOfficeBoxNumber[string]: The post office box number for PO box addresses. For example, 03578 . Model: https://schema.org/postOfficeBoxNumber
postalCode[string]: The postal code. For example, 24004 . Model: https://schema.org/https://schema.org/postalCode
streetAddress[string]: The street address . Model: https://schema.org/streetAddress
alternateName[string]: An alternative name for this item
areaServed[string]: The geographic area where a service or offered item is provided . Model: https://schema.org/Text
controlledProperty[string]: Property being measured by the device . Model: https://schema.org/Text
dataProvider[string]: A sequence of characters identifying the provider of the harmonised data entity
dateCreated[date-time]: Entity creation timestamp. This will usually be allocated by the storage platform
dateModified[date-time]: Timestamp of the last modification of the entity. This will usually be allocated by the storage platform
dateObserved[date-time]: The date and time of this observation in ISO8601 UTC format . Model: https://schema.org/Text
description[string]: A description of this item
deviceType[string]: Type of device taking the measurement . Model: https://schema.org/Text
id[*]: Unique identifier of the entity
location[*]: Geojson reference to the item. It can be Point, LineString, Polygon, MultiPoint, MultiLineString or MultiPolygon
measurementType[string]: The type of measurement to be taken
name[string]: The name of this item
numValue[number]: Numerical value of the measurement . Model: https://schema.org/Number
outlier[boolean]: Value for marking the measurement to be specially processed . Model: https://schema.org/Boolean
owner[array]: A List containing a JSON encoded sequence of characters referencing the unique Ids of the owner(s)
refDevice[*]: Device taking the measurement
seeAlso[*]: list of uri pointing to additional resources about the item
source[string]: A sequence of characters giving the original source of the entity data as a URL. Recommended to be the fully qualified domain name of the source provider, or the URL to the source object
textValue[string]: Textual value of the measurement . Model: https://schema.org/Text
type[string]: NGSI Entity type. It has to be Measurement
unit[string]: Units of the measurement. In case of use of an acronym use units accepted in CEFACT code

Required properties:

id
type

NGSIv2 and NGSI-LD standards have ways of including units in every property. However there is a proeprty call 'Unit' for compatibility reasons. It is optional.

[*] If there is not a type in an attribute is because it could have several types or different formats/patterns
