$(document).ready(function(){
    $('.required').on('change invalid', function() {
        var textfield = $(this).get(0);

        // 'setCustomValidity not only sets the message, but also marks
        // the field as invalid. In order to see whether the field really is
        // invalid, we have to remove the message first
        textfield.setCustomValidity('');

        if (!textfield.validity.valid) {
            textfield.setCustomValidity('Это поле должно быть заполнено');
        }
    });

    $("button[data-target='#appeal_type']").click(function(){
        $('#appeal_type').modal('toggle');
        return false;
    });

    $("button[data-target='#decision']").click(function(){
        $('#decision').modal('toggle');
        return false;
    });
})