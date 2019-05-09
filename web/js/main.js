function setIconVisible(evt) {
    if(evt.getAttribute('data-completed') === 'true') return;
    var btn = evt.children.item(1);
    btn.style.display = 'inline-block';
}
function setIconInvisible(evt) {
    if(evt.getAttribute('data-completed') === 'true') return;
    var btn = evt.children.item(1);
    btn.style.display = 'none';
}

function showModal() {
    var modal = document.getElementById('modal');
    modal.style.display = 'flex';
}
function hideModal() {
    var modal = document.getElementById('modal');
    modal.style.display = 'none';
}
function setTaskCompleted(id, completed) {
    window.location.href = "?id=" + id + "&method=comp&completed=" + !completed;
}
function showEditModal(target) {
    var modal = document.getElementById('edit-modal');
    var title = document.getElementById('edit-title');
    var text = document.getElementById('edit-text');
    var completed = document.getElementById('edit-completed');
    var id = document.getElementById('edit-id');
    text.value = target.text;
    id.value = target.id;
    title.innerText = `Edit Task ${target.id + 1}`;
    completed.value = target.completed? 'on' : '';
    completed.checked = target.completed;
    modal.style.display = 'flex';
}
function hideEditModal() {
    var modal = document.getElementById('edit-modal');
    var title = document.getElementById('edit-title');
    var text = document.getElementById('edit-text');
    var completed = document.getElementById('edit-completed');
    var id = document.getElementById('edit-id');
    text.value = '';
    id.value = '';
    title.innerText = 'Edit Task';
    completed.value = '';
    modal.style.display = 'none';
}