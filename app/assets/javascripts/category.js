// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

document.addEventListener('click', ev => {
    if(ev.target.matches('[data-behavior=back]')) {
        console.log("matched");
        window.history.back()
    }
})