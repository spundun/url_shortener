
URL Shortner using Rails 4
--------------------------

* This is a [URL Shortener](https://en.wikipedia.org/wiki/URL_shortening) written in [Rails 4](http://rubyonrails.org/).
* The Rails app is nested in the app directory because I plan to make it multi-module (client/server etc)
* Main Gems used outside of the Rails framework are [twitter-bootstrap-rails](https://github.com/seyhunak/twitter-bootstrap-rails/tree/bootstrap3) and [rspec-rails](https://github.com/rspec/rspec-rails).
* Currently it is deployed on https://safe-retreat-2771.herokuapp.com , feel free to check it out.

Shorteners like [Bitly](https://bitly.com/a/bitlinks) use Base62(checkout [Base64](https://en.wikipedia.org/wiki/Base64)) encoding for shortened URLs(62 characters A-Za-z0-9). This one doesn't use the Base62 encoding. Since ActiveRecord gives each object a uniqe id (1, 2, ...), I decided it was simpler and more elegant to just use that, even if that meant slightly longer URLs once the traffic exceeds, let's say 10000 URLs(!). So the shortend URLs are of the format ...com/1, etc.

===Future Improvements===
* I'm excited about [Docker](https://www.docker.com/) so I am going to try to deploy this using Docker, maybe even [Kubernetes](https://github.com/GoogleCloudPlatform/kubernetes) if I have time for that.
* To use Base62 encoded short keys, I'd want to port to persistent [Redis](http://redis.io/) or Mongo backend.
* Make it a microservice with a separate (may be [EmberJS](http://emberjs.com/)) frontend.