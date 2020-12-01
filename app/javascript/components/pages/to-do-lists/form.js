$(document).on('turbolinks:load', () => {
  $(document).on('click', 'input[type=checkbox]', function checkboxClicked() {
    $(this).parent().find('input[type=text]').toggleClass('task__input-done');
  });

  $('#tasks').sortable({
    tolerance: 'pointer',
    update: () => {
      $("#tasks .task input[id*='position']").each((index, element) => $(element).val(index + 1));
    },
  });

  $('#tasks').on('DOMNodeInserted', (event) => {
    const target = $(event.target);
    if (target.hasClass('task')) {
      target.find('input[type=text]').focus();
    }
  });
});
