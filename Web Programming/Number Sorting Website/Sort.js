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
        console.log(arrNum); // Checking.
    }

    else {
        arrNum = numBoxArea.children; // Read all <div> inside "numBoxArea".
        console.log(arrNum); // Checking.
    }

    switch(sortType) {
        case "1": bubbleSort(arrNum, processBool); break;
        case "2": selectionSort(arrNum, processBool); break;
        case "3": insertionSort(arrNum, processBool); break;
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
};

/**
 * Copy one number box and replace another number box when display the sorting process.
 * @param {Element} fromBox The element of source box that will copy.
 * @param {Element} toBox The element of target box that will become copy of source box.
 */
let copyBoxToBox = async function (fromBox, toBox) {
    fromBox.classList.toggle("numBoxExchange");
    toBox.classList.toggle("numBoxReplace");
    // Change the color of number box which involve in copy process.

    toBox.innerText = fromBox.innerText;
    // Copy the value of a number box to another number box.

    await sleep(1000);
    // Wait for 1 second before going to the next step.
    
    fromBox.classList.toggle("numBoxExchange");
    toBox.classList.toggle("numBoxReplace");
    // Change back the color of number box which involve in copy process.
};

/**
 * Copy one value and replace the value in a number box when display the sorting process.
 * @param {String} fromValue The source value that will copy. 
 * @param {Element} toBox The element of target box that its value will become replace by source value.
 */
let copyValueToBox = async function (fromValue, toBox) {
    toBox.classList.toggle("numBoxReplace");
    // Change the color of number box which involve in copy process.

    toBox.innerText = fromValue;
    // Copy the value of a number box to another number box.

    await sleep(1000);
    // Wait for 1 second before going to the next step.
    
    toBox.classList.toggle("numBoxReplace");
    // Change back the color of number box which involve in copy process.
};

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