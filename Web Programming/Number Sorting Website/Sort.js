// Function use to delay the process.
const sleep = ms => new Promise(resolve => setTimeout(resolve, ms));

/**
 * Determine the sorting mode and process mode.
 * @param {String} sortType Sorting Mode.
 * @param {Element} numBoxArea The element of the area where the number box stay.
 * @param {Boolean} processBool Process mode.
 */
let sort = function (sortType, numBoxArea, processBool) {
    let arrNum = [];

    if(processBool === false) {
        [].forEach.call(numBoxArea.children, function (data) {
            arrNum.push(Number.parseFloat(data.innerText));
        }); // Read number and store to "arrNum".
    }

    else    
        arrNum = numBoxArea.children; 
        // Read all <div> inside "numBoxArea".

    switch(sortType) {
        case "1": bubbleSort(arrNum, processBool); break;
        case "2": selectionSort(arrNum, processBool); break;
    }
};

/**
 * Switch two number box when display the sorting process.
 * @param {Element} box1 The element of 1st box for exchange.
 * @param {Element} box2 The element of 2nd box for exchange.
 */
let switchBox = async function (box1, box2) {
    box1.classList.toggle("numBoxExchange");
    box2.classList.toggle("numBoxExchange");
    // Change the color of number box which involve in switching process.

    let temp = box1.innerText;
    box1.innerText = box2.innerText;
    box2.innerText = temp;
    // Exchange the value of both number box.

    await sleep(1000);
    // Wait for 1 second before going to the next step.
    
    box1.classList.toggle("numBoxExchange");
    box2.classList.toggle("numBoxExchange");
    // Change back the color of number box which involve in switching process.
}

/**
 * Switch two value inside an array.
 * @param {Array} arrNum The array of two value located.
 * @param {Number} index1 The index of 1st value.
 * @param {Number} index2 The index of 2nd value.
 */
let switchValue = function (arrNum, index1, index2) {
    let temp = arrNum[index1];
    arrNum[index1] = arrNum[index2];
    arrNum[index2] = temp;
};