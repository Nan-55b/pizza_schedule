document.addEventListener("click", (event) => {
  const deleteLink = event.target.closest(".btn-danger");
  if (deleteLink && deleteLink.dataset.confirm) {
    if (!confirm(deleteLink.dataset.confirm)) {
      event.preventDefault();
    }
  }
});
