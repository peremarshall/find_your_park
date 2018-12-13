# Find Your Park
Inspired by the National Park Service's "Find Your Park" campaign, this API draws from the [NPS API](https://www.nps.gov/subjects/developer/api-documentation.htm) and enhances the functionality by adding support for...

* advanced searches
* result caching
* sorting by distance

### Searching/Sorting

Searching and sorting are powered by [Ransack](https://github.com/activerecord-hackery/ransack) and can be used on all model attributes. Their documentation provides a [full mapping](https://github.com/activerecord-hackery/ransack/blob/master/lib/ransack/locale/en.yml#L15) of the matchers that are available.

### Geolocation

Distance search uses the `near` query parameter and is supported by [Geocoder](https://github.com/alexreisner/geocoder), and can accept inputs such as city names (i.e. Omaha, NE) or coordinates (i.e. [40.71, -100.23]). 

### Examples

##### #index
ex. https://find-your-park.herokuapp.com/parks.json?q[description_cont]=prairie&near=Omaha,%20NE&radius=500

##### #show
ex. https://find-your-park.herokuapp.com/parks/484.json
