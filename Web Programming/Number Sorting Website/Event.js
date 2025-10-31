let numBoxArea = document.querySelector("#numBoxArea");
let inText = document.querySelector("#inText");
let addButton = document.querySelector("#addButton");
let clrButton = document.querySelector("#clrButton");
let defButton = document.querySelector("#defButton");
let sortButton = document.querySelector("#sortButton");
let sortMode = document.querySelector("#sortMode");
let processBool = document.querySelector("#processBool");

let defaultNumBox = [10, 8, 2, 1, 3, 4, 7, 9]; // Default Example List

// Create new number box.
let numBoxCreate = function (num) {
    let newBox = document.createElement("div");
    newBox.innerText = num;
    newBox.className = "numBox";

    numBoxArea.appendChild(newBox);

    newBox.onclick = function () {
        numBoxArea.removeChild(newBox);
    }
}

// Default example generate initially.
defaultNumBox.forEach(function (data) {
    numBoxCreate(data)
});

// Add number box to "numBoxArea".
addButton.onclick = function () {
    if(/^[+-]?\d+(\.\d+)?$/g.test(inText.value)) 
        numBoxCreate(inText.value);
    else 
        alert("The input should be a finite number.");
};

// Clear screen.
clrButton.onclick = function () {
    numBoxArea.innerHTML = ""; 
};

// Default example generate.
defButton.onclick = function () {
    numBoxArea.innerHTML = "";

    defaultNumBox.forEach(function (data) {
        numBoxCreate(data)
    });
};

// Start sorting.
sortButton.onclick = function () {
    let index = sortMode.selectedIndex;
    sort(sortMode[index].value, numBoxArea, processBool.checked);
};