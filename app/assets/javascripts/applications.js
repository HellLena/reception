$(document).ready(function(){

    $("button[data-target='#appeal_type']").click(function(){
        $('#appeal_type').modal('toggle');
        return false;
    });

    $("button[data-target='#decision']").click(function(){
        $('#decision').modal('toggle');
        return false;
    });
})