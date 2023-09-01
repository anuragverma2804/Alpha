$("#edit_profile").click(function () {
    if (($(this).css("display")) === "block") {
        $("#profile_detail").hide();
        $("#profile_edit").show();
        console.log(user);
    }
});
$("#post_form_submit_btn").click(function (event) {
    event.preventDefault();
    var form = $("#post_form");
    var url = form.attr('action');
    let f = new FormData(document.getElementById("post_form"));
    $.ajax({
        type: "POST",
        url: url,
//                data: form.serialize(),  //Only if file is not there
        data: f,
        success: function (data) {

            // Ajax call completed successfully
            alert("Form Submited Successfully");
        },
        error: function (data) {

            // Some error in ajax call 
            alert("some Error");
        },
        processData: false,
        contentType: false
    });
});
