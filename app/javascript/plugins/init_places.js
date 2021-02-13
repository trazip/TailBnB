const initPlaces = () => {
  const placesAutocomplete = places({
    appId: ENV['ALGOLIA_PLACES_APP_ID'],
    apiKey: ENV['ALGOLIA_PLACES_API_KEY'],
    container: document.querySelector('#search_address')
  });
}

export { initPlaces };
