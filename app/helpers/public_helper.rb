module PublicHelper

  require 'rest_client'

  def feed_json
    test = User.sorted

    return test

  end


  def get_rest(photoset)
    api_key = "879f6aceb64749f5ae13ed3f7b8e73c7"
    method = "flickr.photosets.getPhotos"
    format = "json"
    user_id = "120283968@N08"
    photoset_id = "72157642276492534"


    # full_url = "https://api.flickr.com/services/rest/?method=flickr.photosets.getList&api_key=a7dcdb28e9cb87048277628899ec34cd&format=json&nojsoncallback=1&user_id=120283968@N08"
    # response = RestClient.get full_url

    base_url = "https://api.flickr.com/services/rest/"

    response = RestClient.get base_url, {:params => {'api_key' => api_key,
                                                     'photoset_id' => photoset,
                                                     'method' => method,
                                                     'format' => format,
                                                     'nojsoncallback' => 1
    }
    }

    return response


  end


end


