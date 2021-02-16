import places from 'places.js';

const initPlaces = () => {
  const addressInput = document.getElementById('aloglia_search_address');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initPlaces };
