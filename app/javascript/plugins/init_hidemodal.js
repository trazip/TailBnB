const hideModal = () => {
  const dismissX = document.querySelector('#dismiss-x');
  const modal = document.querySelector('#login-modal');

  dismissX.addEventListener('click', () => {
    modal.style.display = 'none'
  });
}


export { hideModal };
