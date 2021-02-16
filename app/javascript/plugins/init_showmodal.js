const showModal = () => {
  const loginLink = document.querySelector('#login-modal-trigger');
  const modal = document.querySelector('#login-modal');

  loginLink.addEventListener('click', () => {
    if (modal.style.display == 'none') {
      modal.style.display = ''
    }
  });
}

export { showModal };
