// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

document.addEventListener('click', ev => {
    if(ev.target.matches('[data-behavior=back]')) {
        window.history.back()
    }
})

const newCommentForm = document.getElementById('new_comment')
const commentMessage = newCommentForm.querySelector('textarea')
const comments = document.querySelector('.comments')
const commentsContainer = document.querySelector('.comments-container')
const noCommentsContainer = document.querySelector('.no-comments-container')

newCommentForm.addEventListener('ajax:success', (e, data, status, xhr) => {
    const newComment = document.createElement('div')
    newComment.classList.add('comment')
    newComment.innerHTML = commentMessage.value
    comments.prepend(newComment)
    commentMessage.value = ''

    if(commentsContainer.classList.contains('hidden')) {
        commentsContainer.classList.remove('hidden')
        noCommentsContainer.classList.add('hidden')
    }
})
newCommentForm.addEventListener('ajax:error', (e, data, status, xhr) => {
    console.log("foi naõ")
})