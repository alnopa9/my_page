function display() {
    var name = document.getElementById("name");
    var bodyPart = document.getElementById("bodyPart");
    var fluid = document.getElementById("fluid");
    var substance = document.getElementById("substance");
    document.getElementById("output").textContent = 
        "To Whom It May Concern " + name.options[name.selectedIndex].text + " is sick with the " +
        bodyPart.options[bodyPart.selectedIndex].text + " flu. Drink more " +
        fluid.options[fluid.selectedIndex].text + " and take " +
        medicine.options[medicine.selectedIndex].text + " as needed.";
}
function init() {
    var button = document.getElementsByTagName('button')[0];
    button.addEventListener('click', display, false);
}
window.onload = init;