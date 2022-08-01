window.SetContent = function(data) {
    try {
        document.getElementById('controlAddIn').outerHTML = data;
        console.log(data);
    } catch (err) {
        console.log(err);
    }
};