// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

document.addEventListener('click', ev => {
    if(ev.target.matches('[data-behavior=back]')) {
        window.history.back()
    }
})

document.addEventListener('click', ev => {
    const element = ev.target
    const id = element.dataset.id
    const bookmarked = element.classList.contains('bi-star-fill')
    const csrf_token = document.querySelector('meta[name="csrf-token"]').content
    if(element.matches('[data-behavior=bookmark]')) {
        element.classList.toggle('bi-star-fill')
        element.classList.toggle('bi-star')

        fetch(`/categories/${id}/bookmark`, {method: 'PATCH', headers: {
            'X-CSRF-TOKEN': csrf_token,
            'Content-Type': 'application/json',
        }, credentials: 'include',
            body: JSON.stringify({bookmark: !bookmarked})
        }).then(response => {
            if(response.ok) {
                console.log("foi")
            } else {
                console.log("Foi não")
            }
        })
    }
})