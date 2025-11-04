// Function use to delay the process.
const sleep = ms => new Promise(resolve => setTimeout(resolve, ms));

/**
 * Determine the sorting mode and process mode.
 * @param {String} sortMethod Sorting method.
 * @param {String} sortMode Sorting mode (Ascending / Descending).
 * @param {Element} numBoxArea The element of the area where the number box stay.
 * @param {Boolean} processBool Process mode.
 */
let sort = function (sortMethod, sortMode, numBoxArea, processBool) {
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

    switch(sortMethod) {
        case "1": bubbleSort(sortMode, arrNum, processBool); break;
        case "2": selectionSort(sortMode, arrNum, processBool); break;
        case "3": insertionSort(sortMode, arrNum, processBool); break;
    }
};

/**
 * Control the ascending or descending sorting mode of different sort method.
 * @param {String} sortMode Sorting mode (Ascending / Descending).
 * @param {Number} num1 Number 1.
 * @param {Number} num2 Number 2.
 * @returns {Boolean} Comparison result.
 */
let sortJudge = function (sortMode, num1, num2) {
    if(sortMode === "1") 
        return num1 > num2; // Ascending
    else 
        return num1 < num2; // Descending
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

/** 
 * Replace all box with new box in correct arrangement without showing the process.
 *  
 */
let replaceAllBox = function (arrNum) {
    numBoxArea.innerHTML = "";
        
    for(let i = 0; i < arrNum.length; i++)
        numBoxCreate(arrNum[i]);
};