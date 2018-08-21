'use strict'

var serverApiAddr = "http://localhost:8080/myjangter";

$(() => {
    $('footer').load(`${serverApiAddr}/html/footer.html`)
});
